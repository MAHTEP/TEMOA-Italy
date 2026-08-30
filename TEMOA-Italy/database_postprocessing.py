import pandas as pd
import sqlite3
import multiprocessing
from tqdm import tqdm

# Input parameters to control the use of multiprocessing and set the algorithm outputs

processes = 1
print_set = True
toexcel_set = True
excel_name = "database_postprocessing"

# Input parameters to define the set of output to be postprocessed and their aggregation level

file = []

regions_list = []
tech_list = []
input_comm_list = []
output_comm_list = []
construction_input_comm_list = []
emissions_comm_list = []
periods_list = []

tech_dummies = ['CCUS_SNK_BCKSTP', 'DMY_IMP_TECH']

result_set = {
    "output_net_capacity": False,
    "output_built_capacity": False,
    "output_retired_capacity": False,
    "output_cost_invest": False,
    "output_cost_fixed": False,
    "output_cost_variable": False,
    "output_flow_in": False,
    "output_flow_out": False,
    "output_construction_input": False,
    "output_emission": False
}

disaggregation = {
    "regions": False,
    "net_capacity_tech": False,
    "built_capacity_tech": False,
    "retired_capacity_tech": False,
    "cost_tech": False,
    "input_tech": False,
    "input_comm": False,
    "output_tech": False,
    "output_comm": False,
    "construction_input_tech": False,
    "construction_input_comm": False,
    "emissions_tech": False,
    "emissions_comm": False
}

# Assigning scenarios to the different processes

process_list = list()
file_list = list()
scenario_list = list()

scenario_number = 0

for i_file in range(0, len(file)):

    conn = sqlite3.connect(file[i_file])
    Output_Objective = pd.read_sql("select * from output_objective", conn)
    conn.close()

    scenario = list(Output_Objective.scenario)
    scenario = list(dict.fromkeys(scenario))  # To remove duplicates

    scenario_number = scenario_number + len(scenario)

    for i_scenario in range(0, len(scenario)):
        file_list.append(file[i_file])
        scenario_list.append(scenario[i_scenario])

# file, scenario, regions_list, tech_list, input_comm_list, output_comm_list, construction_input_comm_list, emissions_comm_list, periods_list, tech_dummies, result_set, disaggregation

def function(args):
    file, scenario = args
    
    output_net_capacity_merge = pd.DataFrame()
    output_built_capacity_merge = pd.DataFrame()
    output_retired_capacity_merge = pd.DataFrame()
    output_cost_invest_merge = pd.DataFrame()
    output_cost_fixed_merge = pd.DataFrame()
    output_cost_variable_merge = pd.DataFrame()
    output_flow_in_merge = pd.DataFrame()
    output_flow_out_merge = pd.DataFrame()
    output_construction_input_merge = pd.DataFrame()
    output_emission_merge = pd.DataFrame()
    check_dummies_merge = pd.DataFrame()

    periods = periods_list
    
    if not periods:  # Extraction of all the periods belonging to time_optimize if no time periods have been specified
        conn = sqlite3.connect(file)
        time_periods_future = pd.read_sql("select * from time_period where flag='f'", conn)
        conn.close()
        time_periods_optimize = time_periods_future.drop(len(time_periods_future)-1)
        periods = time_periods_optimize.period

    # output_net_capacity

    if result_set["output_net_capacity"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_net_capacity found.")
            result_set["output_net_capacity"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_net_capacity = pd.read_sql("select * from output_net_capacity where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_net_capacity = pd.read_sql("select * from output_net_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_net_capacity = pd.read_sql("select * from output_net_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()


            regions = list(output_net_capacity.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_net_capacity.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["net_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_net_capacity_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_net_capacity_dict.update(dict.fromkeys(periods, 0))

                output_net_capacity_df = pd.DataFrame(columns=columns_labels)
                
                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_net_capacity_dict['file'] = file
                        output_net_capacity_dict['scenario'] = scenario
                        output_net_capacity_dict['region'] = regions[i_regions]
                        output_net_capacity_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (output_net_capacity[(output_net_capacity['scenario'] == scenario) &
                                                                        (output_net_capacity['region'] == regions[i_regions]) &
                                                                        (output_net_capacity['tech'] == tech[i_tech]) &
                                                                        (output_net_capacity['period'] == periods[i_periods])])
                            output_net_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_net_capacity_df = output_net_capacity_df.append(output_net_capacity_dict, ignore_index=True)

                output_net_capacity_df = output_net_capacity_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)
                
            elif disaggregation["regions"] and not disaggregation["net_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_net_capacity_dict = {'file': '', 'scenario': '', 'region': ''}
                output_net_capacity_dict.update(dict.fromkeys(periods, 0))

                output_net_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_net_capacity_dict['file'] = file
                    output_net_capacity_dict['scenario'] = scenario
                    output_net_capacity_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_net_capacity[(output_net_capacity['scenario'] == scenario) &
                                                                        (output_net_capacity['region'] == regions[i_regions]) &
                                                                        (output_net_capacity['period'] == periods[i_periods])])
                        output_net_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_net_capacity_df = output_net_capacity_df.append(output_net_capacity_dict, ignore_index=True)

                output_net_capacity_df = output_net_capacity_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["net_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_net_capacity_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_net_capacity_dict.update(dict.fromkeys(periods, 0))

                output_net_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_net_capacity_dict['file'] = file
                    output_net_capacity_dict['scenario'] = scenario
                    output_net_capacity_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_net_capacity[(output_net_capacity['scenario'] == scenario) &
                                                                        (output_net_capacity['tech'] == tech[i_tech]) &
                                                                        (output_net_capacity['period'] == periods[i_periods])])
                        output_net_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_net_capacity_df = output_net_capacity_df.append(output_net_capacity_dict, ignore_index=True)

                output_net_capacity_df = output_net_capacity_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_net_capacity_dict = {'file': '', 'scenario': ''}
                output_net_capacity_dict.update(dict.fromkeys(periods, 0))

                output_net_capacity_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_net_capacity_dict['file'] = file
                output_net_capacity_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    capacity_period = (output_net_capacity[(output_net_capacity['scenario'] == scenario) &
                                                                    (output_net_capacity['period'] == periods[i_periods])])
                    output_net_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                    if float(sum(capacity_period.capacity)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_net_capacity_df = output_net_capacity_df.append(output_net_capacity_dict, ignore_index=True)
                
                output_net_capacity_df = output_net_capacity_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_net_capacity_df = output_net_capacity_df.loc[:, (output_net_capacity_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_net_capacity_merge = pd.concat([output_net_capacity_merge, output_net_capacity_df])

    # output_built_capacity

    if result_set["output_built_capacity"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_built_capacity found.")
            result_set["output_built_capacity"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_built_capacity = pd.read_sql("select * from output_built_capacity where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_built_capacity = pd.read_sql("select * from output_built_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_built_capacity = pd.read_sql("select * from output_built_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            regions = list(output_built_capacity.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_built_capacity.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["built_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_built_capacity_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_built_capacity_dict.update(dict.fromkeys(periods, 0))

                output_built_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_built_capacity_dict['file'] = file
                        output_built_capacity_dict['scenario'] = scenario
                        output_built_capacity_dict['region'] = regions[i_regions]
                        output_built_capacity_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (output_built_capacity[(output_built_capacity['scenario'] == scenario) &
                                                                        (output_built_capacity['region'] == regions[i_regions]) &
                                                                        (output_built_capacity['tech'] == tech[i_tech]) &
                                                                        (output_built_capacity['vintage'] == periods[i_periods])])
                            output_built_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_built_capacity_df = output_built_capacity_df.append(output_built_capacity_dict, ignore_index=True)

                output_built_capacity_df = output_built_capacity_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["built_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_built_capacity_dict = {'file': '', 'scenario': '', 'region': ''}
                output_built_capacity_dict.update(dict.fromkeys(periods, 0))

                output_built_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_built_capacity_dict['file'] = file
                    output_built_capacity_dict['scenario'] = scenario
                    output_built_capacity_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_built_capacity[(output_built_capacity['scenario'] == scenario) &
                                                                        (output_built_capacity['region'] == regions[i_regions]) &
                                                                        (output_built_capacity['vintage'] == periods[i_periods])])
                        output_built_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_built_capacity_df = output_built_capacity_df.append(output_built_capacity_dict, ignore_index=True)

                output_built_capacity_df = output_built_capacity_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["built_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_built_capacity_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_built_capacity_dict.update(dict.fromkeys(periods, 0))

                output_built_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_built_capacity_dict['file'] = file
                    output_built_capacity_dict['scenario'] = scenario
                    output_built_capacity_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_built_capacity[(output_built_capacity['scenario'] == scenario) &
                                                                        (output_built_capacity['tech'] == tech[i_tech]) &
                                                                        (output_built_capacity['vintage'] == periods[i_periods])])
                        output_built_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_built_capacity_df = output_built_capacity_df.append(output_built_capacity_dict, ignore_index=True)

                output_built_capacity_df = output_built_capacity_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_built_capacity_dict = {'file': '', 'scenario': ''}
                output_built_capacity_dict.update(dict.fromkeys(periods, 0))

                output_built_capacity_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_built_capacity_dict['file'] = file
                output_built_capacity_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    capacity_period = (output_built_capacity[(output_built_capacity['scenario'] == scenario) &
                                                                    (output_built_capacity['vintage'] == periods[i_periods])])
                    output_built_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                    if float(sum(capacity_period.capacity)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_built_capacity_df = output_built_capacity_df.append(output_built_capacity_dict, ignore_index=True)
                
                output_built_capacity_df = output_built_capacity_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_built_capacity_df = output_built_capacity_df.loc[:, (output_built_capacity_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_built_capacity_merge = pd.concat([output_built_capacity_merge, output_built_capacity_df])

    # output_retired_capacity

    if result_set["output_retired_capacity"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_retired_capacity found.")
            result_set["output_retired_capacity"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_retired_capacity = pd.read_sql("select * from output_retired_capacity where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_retired_capacity = pd.read_sql("select * from output_retired_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_retired_capacity = pd.read_sql("select * from output_retired_capacity where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            output_retired_capacity['capacity'] = (output_retired_capacity['cap_eol'].fillna(0) + output_retired_capacity['cap_early'].fillna(0))
            
            regions = list(output_retired_capacity.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_retired_capacity.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["retired_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_retired_capacity_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_retired_capacity_dict.update(dict.fromkeys(periods, 0))

                output_retired_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_retired_capacity_dict['file'] = file
                        output_retired_capacity_dict['scenario'] = scenario
                        output_retired_capacity_dict['region'] = regions[i_regions]
                        output_retired_capacity_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (output_retired_capacity[(output_retired_capacity['scenario'] == scenario) &
                                                                        (output_retired_capacity['region'] == regions[i_regions]) &
                                                                        (output_retired_capacity['tech'] == tech[i_tech]) &
                                                                        (output_retired_capacity['period'] == periods[i_periods])])
                            output_retired_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_retired_capacity_df = output_retired_capacity_df.append(output_retired_capacity_dict, ignore_index=True)

                output_retired_capacity_df = output_retired_capacity_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["retired_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_retired_capacity_dict = {'file': '', 'scenario': '', 'region': ''}
                output_retired_capacity_dict.update(dict.fromkeys(periods, 0))

                output_retired_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_retired_capacity_dict['file'] = file
                    output_retired_capacity_dict['scenario'] = scenario
                    output_retired_capacity_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_retired_capacity[(output_retired_capacity['scenario'] == scenario) &
                                                                        (output_retired_capacity['region'] == regions[i_regions]) &
                                                                        (output_retired_capacity['period'] == periods[i_periods])])
                        output_retired_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_retired_capacity_df = output_retired_capacity_df.append(output_retired_capacity_dict, ignore_index=True)

                output_retired_capacity_df = output_retired_capacity_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["retired_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_retired_capacity_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_retired_capacity_dict.update(dict.fromkeys(periods, 0))

                output_retired_capacity_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_retired_capacity_dict['file'] = file
                    output_retired_capacity_dict['scenario'] = scenario
                    output_retired_capacity_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (output_retired_capacity[(output_retired_capacity['scenario'] == scenario) &
                                                                        (output_retired_capacity['tech'] == tech[i_tech]) &
                                                                        (output_retired_capacity['period'] == periods[i_periods])])
                        output_retired_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_retired_capacity_df = output_retired_capacity_df.append(output_retired_capacity_dict, ignore_index=True)

                output_retired_capacity_df = output_retired_capacity_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_retired_capacity_dict = {'file': '', 'scenario': ''}
                output_retired_capacity_dict.update(dict.fromkeys(periods, 0))

                output_retired_capacity_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_retired_capacity_dict['file'] = file
                output_retired_capacity_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    capacity_period = (output_retired_capacity[(output_retired_capacity['scenario'] == scenario) &
                                                                    (output_retired_capacity['period'] == periods[i_periods])])
                    output_retired_capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                    if float(sum(capacity_period.capacity)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_retired_capacity_df = output_retired_capacity_df.append(output_retired_capacity_dict, ignore_index=True)
                
                output_retired_capacity_df = output_retired_capacity_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_retired_capacity_df = output_retired_capacity_df.loc[:, (output_retired_capacity_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_retired_capacity_merge = pd.concat([output_retired_capacity_merge, output_retired_capacity_df])

    # output_cost_invest

    if result_set["output_cost_invest"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_cost_invest found.")
            result_set["output_cost_invest"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_cost_invest = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_invest = output_cost_invest[output_cost_invest['d_invest'].notna()]

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_cost_invest = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                output_cost_invest = output_cost_invest[output_cost_invest['d_invest'].notna()]

            else:
                conn = sqlite3.connect(file)
                output_cost_invest = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_invest = output_cost_invest[output_cost_invest['d_invest'].notna()]

            regions = list(output_cost_invest.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_cost_invest.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_invest_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_cost_invest_dict.update(dict.fromkeys(periods, 0))

                output_cost_invest_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_cost_invest_dict['file'] = file
                        output_cost_invest_dict['scenario'] = scenario
                        output_cost_invest_dict['region'] = regions[i_regions]
                        output_cost_invest_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (output_cost_invest[(output_cost_invest['scenario'] == scenario) &
                                                                        (output_cost_invest['region'] == regions[i_regions]) &
                                                                        (output_cost_invest['tech'] == tech[i_tech]) &
                                                                        (output_cost_invest['vintage'] == periods[i_periods])])
                            output_cost_invest_dict[periods[i_periods]] = float(sum(output_cost_period.d_invest))
                            if float(sum(output_cost_period.d_invest)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_cost_invest_df = output_cost_invest_df.append(output_cost_invest_dict, ignore_index=True)

                output_cost_invest_df = output_cost_invest_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_invest_dict = {'file': '', 'scenario': '', 'region': ''}
                output_cost_invest_dict.update(dict.fromkeys(periods, 0))

                output_cost_invest_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_cost_invest_dict['file'] = file
                    output_cost_invest_dict['scenario'] = scenario
                    output_cost_invest_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_invest[(output_cost_invest['scenario'] == scenario) &
                                                                        (output_cost_invest['region'] == regions[i_regions]) &
                                                                        (output_cost_invest['vintage'] == periods[i_periods])])
                        output_cost_invest_dict[periods[i_periods]] = float(sum(output_cost_period.d_invest))
                        if float(sum(output_cost_period.d_invest)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_invest_df = output_cost_invest_df.append(output_cost_invest_dict, ignore_index=True)

                output_cost_invest_df = output_cost_invest_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_invest_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_cost_invest_dict.update(dict.fromkeys(periods, 0))

                output_cost_invest_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_cost_invest_dict['file'] = file
                    output_cost_invest_dict['scenario'] = scenario
                    output_cost_invest_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_invest[(output_cost_invest['scenario'] == scenario) &
                                                                    (output_cost_invest['tech'] == tech[i_tech]) &
                                                                    (output_cost_invest['vintage'] == periods[i_periods])])
                        output_cost_invest_dict[periods[i_periods]] = float(sum(output_cost_period.d_invest))
                        if float(sum(output_cost_period.d_invest)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_invest_df = output_cost_invest_df.append(output_cost_invest_dict, ignore_index=True)

                output_cost_invest_df = output_cost_invest_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_invest_dict = {'file': '', 'scenario': ''}
                output_cost_invest_dict.update(dict.fromkeys(periods, 0))

                output_cost_invest_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_cost_invest_dict['file'] = file
                output_cost_invest_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    output_cost_period = (output_cost_invest[(output_cost_invest['scenario'] == scenario) &
                                                                    (output_cost_invest['vintage'] == periods[i_periods])])
                    output_cost_invest_dict[periods[i_periods]] = float(sum(output_cost_period.d_invest))
                    if float(sum(output_cost_period.d_invest)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_cost_invest_df = output_cost_invest_df.append(output_cost_invest_dict, ignore_index=True)
                
                output_cost_invest_df = output_cost_invest_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_cost_invest_df = output_cost_invest_df.loc[:, (output_cost_invest_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_cost_invest_merge = pd.concat([output_cost_invest_merge, output_cost_invest_df])

    # output_cost_fixed

    if result_set["output_cost_fixed"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_cost_fixed found.")
            result_set["output_cost_fixed"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_cost_fixed = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_fixed = output_cost_fixed[output_cost_fixed['d_fixed'].notna()]

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_cost_fixed = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                output_cost_fixed = output_cost_fixed[output_cost_fixed['d_fixed'].notna()]

            else:
                conn = sqlite3.connect(file)
                output_cost_fixed = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_fixed = output_cost_fixed[output_cost_fixed['d_fixed'].notna()]

            regions = list(output_cost_fixed.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_cost_fixed.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_fixed_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_cost_fixed_dict.update(dict.fromkeys(periods, 0))

                output_cost_fixed_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_cost_fixed_dict['file'] = file
                        output_cost_fixed_dict['scenario'] = scenario
                        output_cost_fixed_dict['region'] = regions[i_regions]
                        output_cost_fixed_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (output_cost_fixed[(output_cost_fixed['scenario'] == scenario) &
                                                                        (output_cost_fixed['region'] == regions[i_regions]) &
                                                                        (output_cost_fixed['tech'] == tech[i_tech]) &
                                                                        (output_cost_fixed['period'] == periods[i_periods])])
                            output_cost_fixed_dict[periods[i_periods]] = float(sum(output_cost_period.d_fixed))
                            if float(sum(output_cost_period.d_fixed)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_cost_fixed_df = output_cost_fixed_df.append(output_cost_fixed_dict, ignore_index=True)

                output_cost_fixed_df = output_cost_fixed_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_fixed_dict = {'file': '', 'scenario': '', 'region': ''}
                output_cost_fixed_dict.update(dict.fromkeys(periods, 0))

                output_cost_fixed_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_cost_fixed_dict['file'] = file
                    output_cost_fixed_dict['scenario'] = scenario
                    output_cost_fixed_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_fixed[(output_cost_fixed['scenario'] == scenario) &
                                                                    (output_cost_fixed['region'] == regions[i_regions]) &
                                                                    (output_cost_fixed['period'] == periods[i_periods])])
                        output_cost_fixed_dict[periods[i_periods]] = float(sum(output_cost_period.d_fixed))
                        if float(sum(output_cost_period.d_fixed)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_fixed_df = output_cost_fixed_df.append(output_cost_fixed_dict, ignore_index=True)

                output_cost_fixed_df = output_cost_fixed_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_fixed_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_cost_fixed_dict.update(dict.fromkeys(periods, 0))

                output_cost_fixed_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_cost_fixed_dict['file'] = file
                    output_cost_fixed_dict['scenario'] = scenario
                    output_cost_fixed_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_fixed[(output_cost_fixed['scenario'] == scenario) &
                                                                    (output_cost_fixed['tech'] == tech[i_tech]) &
                                                                    (output_cost_fixed['period'] == periods[i_periods])])
                        output_cost_fixed_dict[periods[i_periods]] = float(sum(output_cost_period.d_fixed))
                        if float(sum(output_cost_period.d_fixed)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_fixed_df = output_cost_fixed_df.append(output_cost_fixed_dict, ignore_index=True)

                output_cost_fixed_df = output_cost_fixed_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_fixed_dict = {'file': '', 'scenario': ''}
                output_cost_fixed_dict.update(dict.fromkeys(periods, 0))

                output_cost_fixed_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_cost_fixed_dict['file'] = file
                output_cost_fixed_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    output_cost_period = (output_cost_fixed[(output_cost_fixed['scenario'] == scenario) &
                                                                    (output_cost_fixed['period'] == periods[i_periods])])
                    output_cost_fixed_dict[periods[i_periods]] = float(sum(output_cost_period.d_fixed))
                    if float(sum(output_cost_period.d_fixed)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_cost_fixed_df = output_cost_fixed_df.append(output_cost_fixed_dict, ignore_index=True)
                
                output_cost_fixed_df = output_cost_fixed_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_cost_fixed_df = output_cost_fixed_df.loc[:, (output_cost_fixed_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_cost_fixed_merge = pd.concat([output_cost_fixed_merge, output_cost_fixed_df])


    # output_cost_variable

    if result_set["output_cost_variable"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("WARNING: No output_cost_variable found.")
            result_set["output_cost_variable"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file)
                output_cost_variable = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_variable = output_cost_variable[output_cost_variable['d_var'].notna()]

            elif regions and not tech:
                conn = sqlite3.connect(file)
                output_cost_variable = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                output_cost_variable = output_cost_variable[output_cost_variable['d_var'].notna()]

            else:
                conn = sqlite3.connect(file)
                output_cost_variable = pd.read_sql("select * from output_cost where (" +
                                                " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                output_cost_variable = output_cost_variable[output_cost_variable['d_var'].notna()]

            regions = list(output_cost_variable.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_cost_variable.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_variable_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_cost_variable_dict.update(dict.fromkeys(periods, 0))

                output_cost_variable_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_cost_variable_dict['file'] = file
                        output_cost_variable_dict['scenario'] = scenario
                        output_cost_variable_dict['region'] = regions[i_regions]
                        output_cost_variable_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (output_cost_variable[(output_cost_variable['scenario'] == scenario) &
                                                                        (output_cost_variable['region'] == regions[i_regions]) &
                                                                        (output_cost_variable['tech'] == tech[i_tech]) &
                                                                        (output_cost_variable['period'] == periods[i_periods])])
                            output_cost_variable_dict[periods[i_periods]] = float(sum(output_cost_period.d_var))
                            if float(sum(output_cost_period.d_var)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_cost_variable_df = output_cost_variable_df.append(output_cost_variable_dict, ignore_index=True)

                output_cost_variable_df = output_cost_variable_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_variable_dict = {'file': '', 'scenario': '', 'region': ''}
                output_cost_variable_dict.update(dict.fromkeys(periods, 0))

                output_cost_variable_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_cost_variable_dict['file'] = file
                    output_cost_variable_dict['scenario'] = scenario
                    output_cost_variable_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_variable[(output_cost_variable['scenario'] == scenario) &
                                                                    (output_cost_variable['region'] == regions[i_regions]) &
                                                                    (output_cost_variable['period'] == periods[i_periods])])
                        output_cost_variable_dict[periods[i_periods]] = float(sum(output_cost_period.d_var))
                        if float(sum(output_cost_period.d_var)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_variable_df = output_cost_variable_df.append(output_cost_variable_dict, ignore_index=True)

                output_cost_variable_df = output_cost_variable_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_variable_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_cost_variable_dict.update(dict.fromkeys(periods, 0))

                output_cost_variable_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_cost_variable_dict['file'] = file
                    output_cost_variable_dict['scenario'] = scenario
                    output_cost_variable_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (output_cost_variable[(output_cost_variable['scenario'] == scenario) &
                                                                    (output_cost_variable['tech'] == tech[i_tech]) &
                                                                    (output_cost_variable['period'] == periods[i_periods])])
                        output_cost_variable_dict[periods[i_periods]] = float(sum(output_cost_period.d_var))
                        if float(sum(output_cost_period.d_var)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_cost_variable_df = output_cost_variable_df.append(output_cost_variable_dict, ignore_index=True)

                output_cost_variable_df = output_cost_variable_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_cost_variable_dict = {'file': '', 'scenario': ''}
                output_cost_variable_dict.update(dict.fromkeys(periods, 0))

                output_cost_variable_df = pd.DataFrame(columns=columns_labels)

                check_zeros = True

                output_cost_variable_dict['file'] = file
                output_cost_variable_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    output_cost_period = (output_cost_variable[(output_cost_variable['scenario'] == scenario) &
                                                                    (output_cost_variable['period'] == periods[i_periods])])
                    output_cost_variable_dict[periods[i_periods]] = float(sum(output_cost_period.d_var))
                    if float(sum(output_cost_period.d_var)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_cost_variable_df = output_cost_variable_df.append(output_cost_variable_dict, ignore_index=True)
                
                output_cost_variable_df = output_cost_variable_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_cost_variable_df = output_cost_variable_df.loc[:, (output_cost_variable_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_cost_variable_merge = pd.concat([output_cost_variable_merge, output_cost_variable_df])

    # output_flow_in

    if result_set["output_flow_in"]:
        regions = regions_list
        tech = tech_list
        input_comm = input_comm_list
        if not tech and not input_comm:
            print("WARNING: No output_flow_in found.")
            result_set["output_flow_in"] = False
        
        else:
            # Data reading
            if not regions and tech and not input_comm:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and input_comm:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and input_comm:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not input_comm:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and input_comm:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_flow_in = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            # Excluding rows with empty output_comm (construction inputs)
            output_flow_in = output_flow_in[output_flow_in['output_comm'].notna()].reset_index(drop=True)

            regions = list(output_flow_in.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_flow_in.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            input_comm = list(output_flow_in.input_comm)
            input_comm = list(dict.fromkeys(input_comm))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'region': '', 'tech': '', 'input_comm': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        for i_input_comm in range(0, len(input_comm)):
                            output_flow_in_dict['file'] = file
                            output_flow_in_dict['scenario'] = scenario
                            output_flow_in_dict['region'] = regions[i_regions]
                            output_flow_in_dict['tech'] = tech[i_tech]
                            output_flow_in_dict['input_comm'] = input_comm[i_input_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                                (output_flow_in['region'] == regions[i_regions]) &
                                                                (output_flow_in['tech'] == tech[i_tech]) &
                                                                (output_flow_in['input_comm'] == input_comm[i_input_comm]) &
                                                                (output_flow_in['period'] == periods[i_periods])]
                                output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                                if float(sum(vflow_in_period.flow)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'region', 'tech', 'input_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_flow_in_dict['file'] = file
                        output_flow_in_dict['scenario'] = scenario
                        output_flow_in_dict['region'] = regions[i_regions]
                        output_flow_in_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                            (output_flow_in['region'] == regions[i_regions]) &
                                                            (output_flow_in['tech'] == tech[i_tech]) &
                                                            (output_flow_in['period'] == periods[i_periods])]
                            output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                            if float(sum(vflow_in_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'region': '', 'input_comm': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_input_comm in range(0, len(input_comm)):
                        output_flow_in_dict['file'] = file
                        output_flow_in_dict['scenario'] = scenario
                        output_flow_in_dict['region'] = regions[i_regions]
                        output_flow_in_dict['input_comm'] = input_comm[i_input_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                            (output_flow_in['region'] == regions[i_regions]) &
                                                            (output_flow_in['input_comm'] == input_comm[i_input_comm]) &
                                                            (output_flow_in['period'] == periods[i_periods])]
                            output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                            if float(sum(vflow_in_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'region', 'input_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'tech': '', 'input_comm': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    for i_input_comm in range(0, len(input_comm)):
                        output_flow_in_dict['file'] = file
                        output_flow_in_dict['scenario'] = scenario
                        output_flow_in_dict['tech'] = tech[i_tech]
                        output_flow_in_dict['input_comm'] = input_comm[i_input_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                            (output_flow_in['tech'] == tech[i_tech]) &
                                                            (output_flow_in['input_comm'] == input_comm[i_input_comm]) &
                                                            (output_flow_in['period'] == periods[i_periods])]
                            output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                            if float(sum(vflow_in_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'tech', 'input_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'region': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_flow_in_dict['file'] = file
                    output_flow_in_dict['scenario'] = scenario
                    output_flow_in_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                        (output_flow_in['region'] == tech[i_regions]) &
                                                        (output_flow_in['period'] == periods[i_periods])]
                        output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                        if float(sum(vflow_in_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'region'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_flow_in_dict['file'] = file
                    output_flow_in_dict['scenario'] = scenario
                    output_flow_in_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                        (output_flow_in['tech'] == tech[i_tech]) &
                                                        (output_flow_in['period'] == periods[i_periods])]
                        output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                        if float(sum(vflow_in_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)

                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': '', 'input_comm': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                for i_input_comm in range(0, len(input_comm)):
                    output_flow_in_dict['file'] = file
                    output_flow_in_dict['scenario'] = scenario
                    output_flow_in_dict['input_comm'] = input_comm[i_input_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                        (output_flow_in['input_comm'] == input_comm[i_input_comm]) &
                                                        (output_flow_in['period'] == periods[i_periods])]
                        output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                        if float(sum(vflow_in_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario', 'input_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_in_dict = {'file': '', 'scenario': ''}
                output_flow_in_dict.update(dict.fromkeys(periods, 0))

                output_flow_in_df = pd.DataFrame(columns=columns_labels)

                output_flow_in_dict['file'] = file
                output_flow_in_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = output_flow_in[(output_flow_in['scenario'] == scenario) &
                                                    (output_flow_in['period'] == periods[i_periods])]
                    output_flow_in_dict[periods[i_periods]] = float(sum(vflow_in_period.flow))
                    if float(sum(vflow_in_period.flow)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_flow_in_df = output_flow_in_df.append(output_flow_in_dict, ignore_index=True)
                
                output_flow_in_df = output_flow_in_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_flow_in_df = output_flow_in_df.loc[:, (output_flow_in_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_flow_in_merge = pd.concat([output_flow_in_merge, output_flow_in_df])

    # output_flow_out

    if result_set["output_flow_out"]:
        regions = regions_list
        tech = tech_list
        output_comm = output_comm_list
        if not tech and not output_comm:
            print("WARNING: No output_flow_out found.")
            result_set["output_flow_out"] = False
        
        else:
            # Data reading
            if not regions and tech and not output_comm:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and output_comm:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and output_comm:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not output_comm:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and output_comm:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_flow_out = pd.read_sql("select * from output_flow_out where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            regions = list(output_flow_out.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_flow_out.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            output_comm = list(output_flow_out.output_comm)
            output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates
            
            # Data aggregation
            if disaggregation["regions"] and disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'region': '', 'tech': '', 'output_comm': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        for i_output_comm in range(0, len(output_comm)):
                            output_flow_out_dict['file'] = file
                            output_flow_out_dict['scenario'] = scenario
                            output_flow_out_dict['region'] = regions[i_regions]
                            output_flow_out_dict['tech'] = tech[i_tech]
                            output_flow_out_dict['output_comm'] = output_comm[i_output_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                                (output_flow_out['region'] == regions[i_regions]) &
                                                                (output_flow_out['tech'] == tech[i_tech]) &
                                                                (output_flow_out['output_comm'] == output_comm[i_output_comm]) &
                                                                (output_flow_out['period'] == periods[i_periods])]
                                output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                                if float(sum(vflow_out_period.flow)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'region', 'tech', 'output_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_flow_out_dict['file'] = file
                        output_flow_out_dict['scenario'] = scenario
                        output_flow_out_dict['region'] = regions[i_regions]
                        output_flow_out_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                            (output_flow_out['region'] == regions[i_regions]) &
                                                            (output_flow_out['tech'] == tech[i_tech]) &
                                                            (output_flow_out['period'] == periods[i_periods])]
                            output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                            if float(sum(vflow_out_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'region': '', 'output_comm': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_output_comm in range(0, len(output_comm)):
                        output_flow_out_dict['file'] = file
                        output_flow_out_dict['scenario'] = scenario
                        output_flow_out_dict['region'] = regions[i_regions]
                        output_flow_out_dict['output_comm'] = output_comm[i_output_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                            (output_flow_out['region'] == regions[i_regions]) &
                                                            (output_flow_out['output_comm'] == output_comm[i_output_comm]) &
                                                            (output_flow_out['period'] == periods[i_periods])]
                            output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                            if float(sum(vflow_out_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'region', 'output_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'tech': '', 'output_comm': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    for i_output_comm in range(0, len(output_comm)):
                        output_flow_out_dict['file'] = file
                        output_flow_out_dict['scenario'] = scenario
                        output_flow_out_dict['tech'] = tech[i_tech]
                        output_flow_out_dict['output_comm'] = output_comm[i_output_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                            (output_flow_out['tech'] == tech[i_tech]) &
                                                            (output_flow_out['output_comm'] == output_comm[i_output_comm]) &
                                                            (output_flow_out['period'] == periods[i_periods])]
                            output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                            if float(sum(vflow_out_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'tech', 'output_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'region': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_flow_out_dict['file'] = file
                    output_flow_out_dict['scenario'] = scenario
                    output_flow_out_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                        (output_flow_out['region'] == regions[i_regions]) &
                                                        (output_flow_out['period'] == periods[i_periods])]
                        output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                        if float(sum(vflow_out_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_flow_out_dict['file'] = file
                    output_flow_out_dict['scenario'] = scenario
                    output_flow_out_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                        (output_flow_out['tech'] == tech[i_tech]) &
                                                        (output_flow_out['period'] == periods[i_periods])]
                        output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                        if float(sum(vflow_out_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)

                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': '', 'output_comm': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                for i_output_comm in range(0, len(output_comm)):
                    output_flow_out_dict['file'] = file
                    output_flow_out_dict['scenario'] = scenario
                    output_flow_out_dict['output_comm'] = output_comm[i_output_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                        (output_flow_out['output_comm'] == output_comm[i_output_comm]) &
                                                        (output_flow_out['period'] == periods[i_periods])]
                        output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                        if float(sum(vflow_out_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario', 'output_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_flow_out_dict = {'file': '', 'scenario': ''}
                output_flow_out_dict.update(dict.fromkeys(periods, 0))

                output_flow_out_df = pd.DataFrame(columns=columns_labels)

                output_flow_out_dict['file'] = file
                output_flow_out_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = output_flow_out[(output_flow_out['scenario'] == scenario) &
                                                        (output_flow_out['period'] == periods[i_periods])]
                    output_flow_out_dict[periods[i_periods]] = float(sum(vflow_out_period.flow))
                    if float(sum(vflow_out_period.flow)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_flow_out_df = output_flow_out_df.append(output_flow_out_dict, ignore_index=True)
                
                output_flow_out_df = output_flow_out_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_flow_out_df = output_flow_out_df.loc[:, (output_flow_out_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_flow_out_merge = pd.concat([output_flow_out_merge, output_flow_out_df])

    # output_construction_input

    if result_set["output_construction_input"]:
        regions = regions_list
        tech = tech_list
        construction_input_comm = construction_input_comm_list
        if not tech and not construction_input_comm:
            print("WARNING: No output_construction_input found.")
            result_set["output_construction_input"] = False
        
        else:
            # Data reading
            if not regions and tech and not construction_input_comm:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and construction_input_comm:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in construction_input_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and construction_input_comm:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in construction_input_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not construction_input_comm:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and construction_input_comm:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in construction_input_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_construction_input = pd.read_sql("select * from output_flow_in where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" input_comm = '" + str(n) + "'" for n in construction_input_comm)) + ")", conn)
                conn.close()

            # Filtering out rows where output_comm is not null, as we are only interested in construction input flows
            output_construction_input = output_construction_input[output_construction_input['output_comm'].isna()].reset_index(drop=True)

            regions = list(output_construction_input.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_construction_input.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            construction_input_comm = list(output_construction_input.input_comm)
            construction_input_comm = list(dict.fromkeys(construction_input_comm))  # To remove duplicates
            
            # Data aggregation
            if disaggregation["regions"] and disaggregation["construction_input_tech"] and disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech', 'construction_input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'region': '', 'tech': '', 'construction_input_comm': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        for i_construction_input_comm in range(0, len(construction_input_comm)):
                            output_construction_input_dict['file'] = file
                            output_construction_input_dict['scenario'] = scenario
                            output_construction_input_dict['region'] = regions[i_regions]
                            output_construction_input_dict['tech'] = tech[i_tech]
                            output_construction_input_dict['construction_input_comm'] = construction_input_comm[i_construction_input_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                                (output_construction_input['region'] == regions[i_regions]) &
                                                                (output_construction_input['tech'] == tech[i_tech]) &
                                                                (output_construction_input['input_comm'] == construction_input_comm[i_construction_input_comm]) &
                                                                (output_construction_input['vintage'] == periods[i_periods])]
                                output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                                if float(sum(VMat_Cons_period.flow)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'region', 'tech', 'construction_input_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["construction_input_tech"] and not disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_construction_input_dict['file'] = file
                        output_construction_input_dict['scenario'] = scenario
                        output_construction_input_dict['region'] = regions[i_regions]
                        output_construction_input_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                            (output_construction_input['region'] == regions[i_regions]) &
                                                            (output_construction_input['tech'] == tech[i_tech]) &
                                                            (output_construction_input['vintage'] == periods[i_periods])]
                            output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                            if float(sum(VMat_Cons_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["construction_input_tech"] and disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'construction_input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'region': '', 'construction_input_comm': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_construction_input_comm in range(0, len(construction_input_comm)):
                        output_construction_input_dict['file'] = file
                        output_construction_input_dict['scenario'] = scenario
                        output_construction_input_dict['region'] = regions[i_regions]
                        output_construction_input_dict['construction_input_comm'] = construction_input_comm[i_construction_input_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                            (output_construction_input['region'] == regions[i_regions]) &
                                                            (output_construction_input['input_comm'] == construction_input_comm[i_construction_input_comm]) &
                                                            (output_construction_input['vintage'] == periods[i_periods])]
                            output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                            if float(sum(VMat_Cons_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'region', 'construction_input_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["construction_input_tech"] and disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'construction_input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'tech': '', 'construction_input_comm': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    for i_construction_input_comm in range(0, len(construction_input_comm)):
                        output_construction_input_dict['file'] = file
                        output_construction_input_dict['scenario'] = scenario
                        output_construction_input_dict['tech'] = tech[i_tech]
                        output_construction_input_dict['construction_input_comm'] = construction_input_comm[i_construction_input_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                            (output_construction_input['tech'] == tech[i_tech]) &
                                                            (output_construction_input['input_comm'] == construction_input_comm[i_construction_input_comm]) &
                                                            (output_construction_input['vintage'] == periods[i_periods])]
                            output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                            if float(sum(VMat_Cons_period.flow)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'tech', 'construction_input_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["construction_input_tech"] and not disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'region': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_construction_input_dict['file'] = file
                    output_construction_input_dict['scenario'] = scenario
                    output_construction_input_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                        (output_construction_input['region'] == regions[i_regions]) &
                                                        (output_construction_input['vintage'] == periods[i_periods])]
                        output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                        if float(sum(VMat_Cons_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["construction_input_tech"] and not disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_construction_input_dict['file'] = file
                    output_construction_input_dict['scenario'] = scenario
                    output_construction_input_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                        (output_construction_input['tech'] == tech[i_tech]) &
                                                        (output_construction_input['vintage'] == periods[i_periods])]
                        output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                        if float(sum(VMat_Cons_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)

                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["construction_input_tech"] and disaggregation["construction_input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'construction_input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': '', 'construction_input_comm': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                for i_construction_input_comm in range(0, len(construction_input_comm)):
                    output_construction_input_dict['file'] = file
                    output_construction_input_dict['scenario'] = scenario
                    output_construction_input_dict['construction_input_comm'] = construction_input_comm[i_construction_input_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                        (output_construction_input['input_comm'] == construction_input_comm[i_construction_input_comm]) &
                                                        (output_construction_input['vintage'] == periods[i_periods])]
                        output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                        if float(sum(VMat_Cons_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario', 'construction_input_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_construction_input_dict = {'file': '', 'scenario': ''}
                output_construction_input_dict.update(dict.fromkeys(periods, 0))

                output_construction_input_df = pd.DataFrame(columns=columns_labels)

                output_construction_input_dict['file'] = file
                output_construction_input_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    VMat_Cons_period = output_construction_input[(output_construction_input['scenario'] == scenario) &
                                                        (output_construction_input['vintage'] == periods[i_periods])]
                    output_construction_input_dict[periods[i_periods]] = float(sum(VMat_Cons_period.flow))
                    if float(sum(VMat_Cons_period.flow)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_construction_input_df = output_construction_input_df.append(output_construction_input_dict, ignore_index=True)
                
                output_construction_input_df = output_construction_input_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_construction_input_df = output_construction_input_df.loc[:, (output_construction_input_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_construction_input_merge = pd.concat([output_construction_input_merge, output_construction_input_df])

    # output_emission

    if result_set["output_emission"]:
        regions = regions_list
        tech = tech_list
        emissions_comm = emissions_comm_list
        if not tech and not emissions_comm:
            print("WARNING: No output_emission found.")
            result_set["output_emission"] = False
        
        else:
            # Data reading
            if not regions and tech and not emissions_comm:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and emissions_comm:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" emis_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and emissions_comm:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" emis_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not emissions_comm:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and emissions_comm:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" emis_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file)
                output_emission = pd.read_sql("select * from output_emission where (" +
                                            " or ".join((" region = '" + str(n) + "'" for n in regions)) + ") and (" +
                                            " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                            " or ".join((" emis_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            regions = list(output_emission.region)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(output_emission.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            emissions_comm = list(output_emission.emis_comm)
            emissions_comm = list(dict.fromkeys(emissions_comm))  # To remove duplicates
            
            # Data aggregation
            if disaggregation["regions"] and disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'region': '', 'tech': '', 'emissions_comm': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        for i_emissions_comm in range(0, len(emissions_comm)):
                            output_emission_dict['file'] = file
                            output_emission_dict['scenario'] = scenario
                            output_emission_dict['region'] = regions[i_regions]
                            output_emission_dict['tech'] = tech[i_tech]
                            output_emission_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                                (output_emission['region'] == regions[i_regions]) &
                                                                (output_emission['tech'] == tech[i_tech]) &
                                                                (output_emission['emis_comm'] == emissions_comm[i_emissions_comm]) &
                                                                (output_emission['period'] == periods[i_periods])]
                                output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                                if float(sum(emissions_period.emission)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'region', 'tech', 'emissions_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'region': '', 'tech': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_tech in range(0, len(tech)):
                        output_emission_dict['file'] = file
                        output_emission_dict['scenario'] = scenario
                        output_emission_dict['region'] = regions[i_regions]
                        output_emission_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                            (output_emission['region'] == regions[i_regions]) &
                                                            (output_emission['tech'] == tech[i_tech]) &
                                                            (output_emission['period'] == periods[i_periods])]
                            output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                            if float(sum(emissions_period.emission)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'region', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'region': '', 'emissions_comm': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    for i_emissions_comm in range(0, len(emissions_comm)):
                        output_emission_dict['file'] = file
                        output_emission_dict['scenario'] = scenario
                        output_emission_dict['region'] = regions[i_regions]
                        output_emission_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                            (output_emission['region'] == regions[i_regions]) &
                                                            (output_emission['emis_comm'] == emissions_comm[i_emissions_comm]) &
                                                            (output_emission['period'] == periods[i_periods])]
                            output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                            if float(sum(emissions_period.emission)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'region', 'emissions_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'tech': '', 'emissions_comm': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    for i_emissions_comm in range(0, len(emissions_comm)):
                        output_emission_dict['file'] = file
                        output_emission_dict['scenario'] = scenario
                        output_emission_dict['tech'] = tech[i_tech]
                        output_emission_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                            (output_emission['tech'] == tech[i_tech]) &
                                                            (output_emission['emis_comm'] == emissions_comm[i_emissions_comm]) &
                                                            (output_emission['period'] == periods[i_periods])]
                            output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                            if float(sum(emissions_period.emission)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'tech', 'emissions_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'region'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'region': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_regions in range(0, len(regions)):
                    output_emission_dict['file'] = file
                    output_emission_dict['scenario'] = scenario
                    output_emission_dict['region'] = regions[i_regions]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                        (output_emission['region'] == regions[i_regions]) &
                                                        (output_emission['period'] == periods[i_periods])]
                        output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                        if float(sum(emissions_period.emission)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'tech': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_tech in range(0, len(tech)):
                    output_emission_dict['file'] = file
                    output_emission_dict['scenario'] = scenario
                    output_emission_dict['tech'] = tech[i_tech]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                        (output_emission['tech'] == tech[i_tech]) &
                                                        (output_emission['period'] == periods[i_periods])]
                        output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                        if float(sum(emissions_period.emission)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)

                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': '', 'emissions_comm': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                for i_emissions_comm in range(0, len(emissions_comm)):
                    output_emission_dict['file'] = file
                    output_emission_dict['scenario'] = scenario
                    output_emission_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                        (output_emission['emis_comm'] == emissions_comm[i_emissions_comm]) &
                                                        (output_emission['period'] == periods[i_periods])]
                        output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                        if float(sum(emissions_period.emission)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario', 'emissions_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                output_emission_dict = {'file': '', 'scenario': ''}
                output_emission_dict.update(dict.fromkeys(periods, 0))

                output_emission_df = pd.DataFrame(columns=columns_labels)

                output_emission_dict['file'] = file
                output_emission_dict['scenario'] = scenario
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = output_emission[(output_emission['scenario'] == scenario) &
                                                        (output_emission['period'] == periods[i_periods])]
                    output_emission_dict[periods[i_periods]] = float(sum(emissions_period.emission))
                    if float(sum(emissions_period.emission)) != 0:
                        check_zeros = False
                if not check_zeros:
                    output_emission_df = output_emission_df.append(output_emission_dict, ignore_index=True)
                
                output_emission_df = output_emission_df.sort_values(by=['file', 'scenario'], ignore_index=True)

            output_emission_df = output_emission_df.loc[:, (output_emission_df != 0).any(axis=0)]  # To remove columns with only zeros
            output_emission_merge = pd.concat([output_emission_merge, output_emission_df])

    # Check dummies

    if tech_dummies:
        tech = tech_dummies

        conn = sqlite3.connect(file)
        check_dummies = pd.read_sql("select * from output_flow_out where (" +
                                    " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        regions = list(check_dummies.region)
        regions = list(dict.fromkeys(regions))  # To remove duplicates

        output_comm = list(check_dummies.output_comm)
        output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates

        columns_labels = pd.Series(['file', 'scenario', 'region', 'tech', 'output_comm'])
        columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

        check_dummies_dict = {'file': '', 'scenario': '', 'region': '', 'tech': '', 'output_comm': ''}
        check_dummies_dict.update(dict.fromkeys(periods, 0))

        check_dummies_df = pd.DataFrame(columns=columns_labels)

        for i_regions in range(0, len(regions)):
            for i_tech in range(0, len(tech)):
                for i_output_comm in range(0, len(output_comm)):
                    check_dummies_dict['file'] = file
                    check_dummies_dict['scenario'] = scenario
                    check_dummies_dict['region'] = regions[i_regions]
                    check_dummies_dict['tech'] = tech[i_tech]
                    check_dummies_dict['output_comm'] = output_comm[i_output_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        check_dummies_period = check_dummies[(check_dummies['scenario'] == scenario) &
                                                            (check_dummies['region'] == regions[i_regions]) &
                                                            (check_dummies['tech'] == tech[i_tech]) &
                                                            (check_dummies['output_comm'] == output_comm[i_output_comm]) &
                                                            (check_dummies['period'] == periods[i_periods])]
                        check_dummies_dict[periods[i_periods]] = float(sum(check_dummies_period.flow))
                        if float(sum(check_dummies_period.flow)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        check_dummies_df = check_dummies_df.append(check_dummies_dict, ignore_index=True)

        check_dummies_df = check_dummies_df.sort_values(by=['file', 'scenario', 'region', 'tech', 'output_comm'], ignore_index=True)
        check_dummies_df = check_dummies_df.loc[:, (check_dummies_df != 0).any(axis=0)]  # To remove columns with only zeros
        check_dummies_merge = pd.concat([check_dummies_merge, check_dummies_df])

    return [output_net_capacity_merge, output_built_capacity_merge, output_retired_capacity_merge, output_cost_invest_merge, output_cost_fixed_merge, output_cost_variable_merge, output_flow_in_merge, output_flow_out_merge, output_construction_input_merge, output_emission_merge, check_dummies_merge]

if __name__ ==  '__main__':
    inputs = list(zip(file_list, scenario_list))
    
    with multiprocessing.Pool(processes=processes) as pool:
        results = list(tqdm(pool.imap(function, inputs), total=len(inputs)))

    output_net_capacity_list = [res[0] for res in results]
    output_built_capacity_list = [res[1] for res in results]
    output_retired_capacity_list = [res[2] for res in results]
    output_cost_invest_list = [res[3] for res in results]
    output_cost_fixed_list = [res[4] for res in results]
    output_cost_variable_list = [res[5] for res in results]
    output_flow_in_list = [res[6] for res in results]
    output_flow_out_list = [res[7] for res in results]
    output_construction_input_list = [res[8] for res in results]
    output_emission_list = [res[9] for res in results]
    check_dummies_list = [res[10] for res in results]

    output_net_capacity = pd.concat(output_net_capacity_list, ignore_index=True)
    output_built_capacity = pd.concat(output_built_capacity_list, ignore_index=True)
    output_retired_capacity = pd.concat(output_retired_capacity_list, ignore_index=True)
    output_cost_invest = pd.concat(output_cost_invest_list, ignore_index=True)
    output_cost_fixed = pd.concat(output_cost_fixed_list, ignore_index=True)
    output_cost_variable = pd.concat(output_cost_variable_list, ignore_index=True)
    output_flow_in = pd.concat(output_flow_in_list, ignore_index=True)
    output_flow_out = pd.concat(output_flow_out_list, ignore_index=True)
    output_construction_input = pd.concat(output_construction_input_list, ignore_index=True)
    output_emission = pd.concat(output_emission_list, ignore_index=True)
    check_dummies = pd.concat(check_dummies_list, ignore_index=True)

    # Printing output

    if print_set:
        if result_set["output_net_capacity"]:
            print("\noutput_net_capacity\n\n", output_net_capacity.to_string(index=False, float_format='%.2f'))
        if result_set["output_built_capacity"]:
            print("\noutput_built_capacity\n\n", output_built_capacity.to_string(index=False, float_format='%.2f'))
        if result_set["output_retired_capacity"]:
            print("\noutput_retired_capacity\n\n", output_retired_capacity.to_string(index=False, float_format='%.2f'))
        if result_set["output_cost_invest"]:
            print("\noutput_cost_invest\n\n", output_cost_invest.to_string(index=False, float_format='%.2f'))
        if result_set["output_cost_fixed"]:
            print("\noutput_cost_fixed\n\n", output_cost_fixed.to_string(index=False, float_format='%.2f'))
        if result_set["output_cost_variable"]:
            print("\noutput_cost_variable\n\n", output_cost_variable.to_string(index=False, float_format='%.2f'))
        if result_set["output_flow_in"]:
            print("\noutput_flow_in\n\n", output_flow_in.to_string(index=False, float_format='%.2f'))
        if result_set["output_flow_out"]:
            print("\noutput_flow_out\n\n", output_flow_out.to_string(index=False, float_format='%.2f'))
        if result_set["output_construction_input"]:
            print("\noutput_construction_input\n\n", output_construction_input.to_string(index=False, float_format='%.2f'))
        if result_set["output_emission"]:
            print("\noutput_emission\n\n", output_emission.to_string(index=False, float_format='%.2f'))
    
    if len(check_dummies) != 0:
        print("\nWARNING: Dummy imports detected.\n\n", check_dummies.to_string(index=False, float_format='%.2f'))

    # Export to Excel

    if toexcel_set:
        writer = pd.ExcelWriter(excel_name + '.xlsx', engine='xlsxwriter')
        if len(check_dummies) != 0:
            check_dummies.to_excel(writer, sheet_name='check_dummies', index=False)
        if result_set["output_net_capacity"]:
            output_net_capacity.to_excel(writer, sheet_name='output_net_capacity', index=False)
        if result_set["output_built_capacity"]:
            output_built_capacity.to_excel(writer, sheet_name='output_built_capacity', index=False)
        if result_set["output_retired_capacity"]:
            output_retired_capacity.to_excel(writer, sheet_name='output_retired_capacity', index=False)
        if result_set["output_cost_invest"]:
            output_cost_invest.to_excel(writer, sheet_name='output_cost_invest', index=False)
        if result_set["output_cost_fixed"]:
            output_cost_fixed.to_excel(writer, sheet_name='output_cost_fixed', index=False)
        if result_set["output_cost_variable"]:
            output_cost_variable.to_excel(writer, sheet_name='output_cost_variable', index=False)
        if result_set["output_flow_in"]:
            output_flow_in.to_excel(writer, sheet_name='output_flow_in', index=False)
        if result_set["output_flow_out"]:
            output_flow_out.to_excel(writer, sheet_name='output_flow_out', index=False)
        if result_set["output_construction_input"]:
            output_construction_input.to_excel(writer, sheet_name='output_construction_input', index=False)
        if result_set["output_emission"]:
            output_emission.to_excel(writer, sheet_name='output_emission', index=False)
        writer.save()
