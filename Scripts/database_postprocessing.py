import pandas as pd
import sqlite3

file = []  # List of names of databases to be postprocessed

regions_list = []
tech_list = []
input_comm_list = []
output_comm_list = []
emissions_comm_list = []
periods_list = []

tech_dummies = ['CCUS_SNK_BCKSTP', 'DMY_DEM_ANNUAL', 'DMY_PHY_ANNUAL', 'DMY_PHY_NON_ANNUAL']

excel_name = "database_postprocessing"

print_set = True
toexcel_set = True
result_set = {
    "Output_CapacityByPeriodAndTech": False,
    "Output_V_Capacity": False,
    "Output_CostInvest": False,
    "Output_CostFixed": False,
    "Output_CostVariable": False,
    "Output_VFlow_In": False,
    "Output_VFlow_Out": False,
    "Output_Emissions": False
}
disaggregation = {
    "regions": False,
    "capacity_tech": False,
    "new_capacity_tech": False,
    "cost_tech": False,
    "input_tech": False,
    "input_comm": False,
    "output_tech": False,
    "output_comm": False,
    "emissions_tech": False,
    "emissions_comm": False
}

Output_CapacityByPeriodAndTech_MERGE = pd.DataFrame()
Output_V_Capacity_MERGE = pd.DataFrame()
Output_CostInvest_MERGE = pd.DataFrame()
Output_CostFixed_MERGE = pd.DataFrame()
Output_CostVariable_MERGE = pd.DataFrame()
Output_VFlow_In_MERGE = pd.DataFrame()
Output_VFlow_Out_MERGE = pd.DataFrame()
Output_Emissions_MERGE = pd.DataFrame()
Check_Dummies_MERGE = pd.DataFrame()

for i_file in range(0, len(file)):

    periods = periods_list

    if not periods:  # Extraction of all the periods belonging to time_optimize if no time periods have been specifies
        conn = sqlite3.connect(file[i_file])
        time_periods_future = pd.read_sql("select * from time_periods where flag='f'", conn)
        conn.close()
        time_periods_optimize = time_periods_future.drop(len(time_periods_future)-1)
        periods = time_periods_optimize.t_periods

    # Output_CapacityByPeriodAndTech

    if result_set["Output_CapacityByPeriodAndTech"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("Warning: No Output_CapacityByPeriodAndTech found.")
            result_set["Output_CapacityByPeriodAndTech"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file[i_file])
                Output_CapacityByPeriodAndTech = pd.read_sql("select * from Output_CapacityByPeriodAndTech where (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech:
                conn = sqlite3.connect(file[i_file])
                Output_CapacityByPeriodAndTech = pd.read_sql("select * from Output_CapacityByPeriodAndTech where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file[i_file])
                Output_CapacityByPeriodAndTech = pd.read_sql("select * from Output_CapacityByPeriodAndTech where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            scenario = list(Output_CapacityByPeriodAndTech.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_CapacityByPeriodAndTech.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_CapacityByPeriodAndTech.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CapacityByPeriodAndTech_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

                Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)
                
                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_CapacityByPeriodAndTech_dict['file'] = file[i_file]
                            Output_CapacityByPeriodAndTech_dict['scenario'] = scenario[i_scenario]
                            Output_CapacityByPeriodAndTech_dict['regions'] = regions[i_regions]
                            Output_CapacityByPeriodAndTech_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['scenario'] == scenario[i_scenario]) &
                                                                              (Output_CapacityByPeriodAndTech['regions'] == regions[i_regions]) &
                                                                              (Output_CapacityByPeriodAndTech['tech'] == tech[i_tech]) &
                                                                              (Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                                Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                                if float(sum(capacity_period.capacity)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)

                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)
                
            elif disaggregation["regions"] and not disaggregation["capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CapacityByPeriodAndTech_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

                Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_CapacityByPeriodAndTech_dict['file'] = file[i_file]
                        Output_CapacityByPeriodAndTech_dict['scenario'] = scenario[i_scenario]
                        Output_CapacityByPeriodAndTech_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['scenario'] == scenario[i_scenario]) &
                                                                            (Output_CapacityByPeriodAndTech['regions'] == regions[i_regions]) &
                                                                            (Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                            Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)

                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CapacityByPeriodAndTech_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

                Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_CapacityByPeriodAndTech_dict['file'] = file[i_file]
                        Output_CapacityByPeriodAndTech_dict['scenario'] = scenario[i_scenario]
                        Output_CapacityByPeriodAndTech_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['scenario'] == scenario[i_scenario]) &
                                                                            (Output_CapacityByPeriodAndTech['tech'] == tech[i_tech]) &
                                                                            (Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                            Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)

                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CapacityByPeriodAndTech_dict = {'file': '', 'scenario': ''}
                Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

                Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)

                check_zeros = True
                for i_scenario in range(0, len(scenario)):
                    Output_CapacityByPeriodAndTech_dict['file'] = file[i_file]
                    Output_CapacityByPeriodAndTech_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['scenario'] == scenario[i_scenario]) &
                                                                        (Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                        Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)
                
                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.loc[:, (Output_CapacityByPeriodAndTech_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_CapacityByPeriodAndTech_MERGE = pd.concat([Output_CapacityByPeriodAndTech_MERGE, Output_CapacityByPeriodAndTech_DF])
  
    # Output_V_Capacity

    if result_set["Output_V_Capacity"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("Warning: No Output_V_Capacity found.")
            result_set["Output_V_Capacity"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file[i_file])
                Output_V_Capacity = pd.read_sql("select * from Output_V_Capacity where (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech:
                conn = sqlite3.connect(file[i_file])
                Output_V_Capacity = pd.read_sql("select * from Output_V_Capacity where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file[i_file])
                Output_V_Capacity = pd.read_sql("select * from Output_V_Capacity where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            scenario = list(Output_V_Capacity.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_V_Capacity.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_V_Capacity.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["new_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_V_Capacity_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

                Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_V_Capacity_dict['file'] = file[i_file]
                            Output_V_Capacity_dict['scenario'] = scenario[i_scenario]
                            Output_V_Capacity_dict['regions'] = regions[i_regions]
                            Output_V_Capacity_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                capacity_period = (Output_V_Capacity[(Output_V_Capacity['scenario'] == scenario[i_scenario]) &
                                                                              (Output_V_Capacity['regions'] == regions[i_regions]) &
                                                                              (Output_V_Capacity['tech'] == tech[i_tech]) &
                                                                              (Output_V_Capacity['vintage'] == periods[i_periods])])
                                Output_V_Capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                                if float(sum(capacity_period.capacity)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)

                Output_V_Capacity_DF = Output_V_Capacity_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["new_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_V_Capacity_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

                Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_V_Capacity_dict['file'] = file[i_file]
                        Output_V_Capacity_dict['scenario'] = scenario[i_scenario]
                        Output_V_Capacity_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (Output_V_Capacity[(Output_V_Capacity['scenario'] == scenario[i_scenario]) &
                                                                            (Output_V_Capacity['regions'] == regions[i_regions]) &
                                                                            (Output_V_Capacity['vintage'] == periods[i_periods])])
                            Output_V_Capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)

                Output_V_Capacity_DF = Output_V_Capacity_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["new_capacity_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_V_Capacity_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

                Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_V_Capacity_dict['file'] = file[i_file]
                        Output_V_Capacity_dict['scenario'] = scenario[i_scenario]
                        Output_V_Capacity_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            capacity_period = (Output_V_Capacity[(Output_V_Capacity['scenario'] == scenario[i_scenario]) &
                                                                            (Output_V_Capacity['tech'] == tech[i_tech]) &
                                                                            (Output_V_Capacity['vintage'] == periods[i_periods])])
                            Output_V_Capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                            if float(sum(capacity_period.capacity)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)

                Output_V_Capacity_DF = Output_V_Capacity_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_V_Capacity_dict = {'file': '', 'scenario': ''}
                Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

                Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

                check_zeros = True
                for i_scenario in range(0, len(scenario)):
                    Output_V_Capacity_dict['file'] = file[i_file]
                    Output_V_Capacity_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        capacity_period = (Output_V_Capacity[(Output_V_Capacity['scenario'] == scenario[i_scenario]) &
                                                                        (Output_V_Capacity['vintage'] == periods[i_periods])])
                        Output_V_Capacity_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                        if float(sum(capacity_period.capacity)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)
                
                Output_V_Capacity_DF = Output_V_Capacity_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_V_Capacity_DF = Output_V_Capacity_DF.loc[:, (Output_V_Capacity_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_V_Capacity_MERGE = pd.concat([Output_V_Capacity_MERGE, Output_V_Capacity_DF])

    # Output_CostInvest

    if result_set["Output_CostInvest"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("Warning: No Output_CostInvest found.")
            result_set["Output_CostInvest"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostInvest = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostInvest = Output_CostInvest[(Output_CostInvest['output_name'] == 'V_DiscountedInvestmentByProcess')]

            elif regions and not tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostInvest = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                Output_CostInvest = Output_CostInvest[(Output_CostInvest['output_name'] == 'V_DiscountedInvestmentByProcess')]

            else:
                conn = sqlite3.connect(file[i_file])
                Output_CostInvest = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostInvest = Output_CostInvest[(Output_CostInvest['output_name'] == 'V_DiscountedInvestmentByProcess')]

            scenario = list(Output_CostInvest.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_CostInvest.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_CostInvest.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostInvest_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_CostInvest_dict.update(dict.fromkeys(periods, 0))

                Output_CostInvest_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_CostInvest_dict['file'] = file[i_file]
                            Output_CostInvest_dict['scenario'] = scenario[i_scenario]
                            Output_CostInvest_dict['regions'] = regions[i_regions]
                            Output_CostInvest_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                output_cost_period = (Output_CostInvest[(Output_CostInvest['scenario'] == scenario[i_scenario]) &
                                                                              (Output_CostInvest['regions'] == regions[i_regions]) &
                                                                              (Output_CostInvest['tech'] == tech[i_tech]) &
                                                                              (Output_CostInvest['vintage'] == periods[i_periods])])
                                Output_CostInvest_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                                if float(sum(output_cost_period.output_cost)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_CostInvest_DF = Output_CostInvest_DF.append(Output_CostInvest_dict, ignore_index=True)

                Output_CostInvest_DF = Output_CostInvest_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostInvest_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_CostInvest_dict.update(dict.fromkeys(periods, 0))

                Output_CostInvest_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_CostInvest_dict['file'] = file[i_file]
                        Output_CostInvest_dict['scenario'] = scenario[i_scenario]
                        Output_CostInvest_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostInvest[(Output_CostInvest['scenario'] == scenario[i_scenario]) &
                                                                            (Output_CostInvest['regions'] == regions[i_regions]) &
                                                                            (Output_CostInvest['vintage'] == periods[i_periods])])
                            Output_CostInvest_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostInvest_DF = Output_CostInvest_DF.append(Output_CostInvest_dict, ignore_index=True)

                Output_CostInvest_DF = Output_CostInvest_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostInvest_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_CostInvest_dict.update(dict.fromkeys(periods, 0))

                Output_CostInvest_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_CostInvest_dict['file'] = file[i_file]
                        Output_CostInvest_dict['scenario'] = scenario[i_scenario]
                        Output_CostInvest_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostInvest[(Output_CostInvest['scenario'] == scenario[i_scenario]) &
                                                                          (Output_CostInvest['tech'] == tech[i_tech]) &
                                                                          (Output_CostInvest['vintage'] == periods[i_periods])])
                            Output_CostInvest_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostInvest_DF = Output_CostInvest_DF.append(Output_CostInvest_dict, ignore_index=True)

                Output_CostInvest_DF = Output_CostInvest_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostInvest_dict = {'file': '', 'scenario': ''}
                Output_CostInvest_dict.update(dict.fromkeys(periods, 0))

                Output_CostInvest_DF = pd.DataFrame(columns=columns_labels)

                check_zeros = True
                for i_scenario in range(0, len(scenario)):
                    Output_CostInvest_dict['file'] = file[i_file]
                    Output_CostInvest_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (Output_CostInvest[(Output_CostInvest['scenario'] == scenario[i_scenario]) &
                                                                        (Output_CostInvest['vintage'] == periods[i_periods])])
                        Output_CostInvest_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                        if float(sum(output_cost_period.output_cost)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_CostInvest_DF = Output_CostInvest_DF.append(Output_CostInvest_dict, ignore_index=True)
                
                Output_CostInvest_DF = Output_CostInvest_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_CostInvest_DF = Output_CostInvest_DF.loc[:, (Output_CostInvest_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_CostInvest_MERGE = pd.concat([Output_CostInvest_MERGE, Output_CostInvest_DF])

    # Output_CostFixed

    if result_set["Output_CostFixed"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("Warning: No Output_CostFixed found.")
            result_set["Output_CostFixed"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostFixed = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostFixed = Output_CostFixed[(Output_CostFixed['output_name'] == 'V_DiscountedFixedCostsByProcess')]

            elif regions and not tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostFixed = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                Output_CostFixed = Output_CostFixed[(Output_CostFixed['output_name'] == 'V_DiscountedFixedCostsByProcess')]

            else:
                conn = sqlite3.connect(file[i_file])
                Output_CostFixed = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostFixed = Output_CostFixed[(Output_CostFixed['output_name'] == 'V_DiscountedFixedCostsByProcess')]

            scenario = list(Output_CostFixed.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_CostFixed.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_CostFixed.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostFixed_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_CostFixed_dict.update(dict.fromkeys(periods, 0))

                Output_CostFixed_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_CostFixed_dict['file'] = file[i_file]
                            Output_CostFixed_dict['scenario'] = scenario[i_scenario]
                            Output_CostFixed_dict['regions'] = regions[i_regions]
                            Output_CostFixed_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                output_cost_period = (Output_CostFixed[(Output_CostFixed['scenario'] == scenario[i_scenario]) &
                                                                              (Output_CostFixed['regions'] == regions[i_regions]) &
                                                                              (Output_CostFixed['tech'] == tech[i_tech]) &
                                                                              (Output_CostFixed['vintage'] == periods[i_periods])])
                                Output_CostFixed_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                                if float(sum(output_cost_period.output_cost)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_CostFixed_DF = Output_CostFixed_DF.append(Output_CostFixed_dict, ignore_index=True)

                Output_CostFixed_DF = Output_CostFixed_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostFixed_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_CostFixed_dict.update(dict.fromkeys(periods, 0))

                Output_CostFixed_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_CostFixed_dict['file'] = file[i_file]
                        Output_CostFixed_dict['scenario'] = scenario[i_scenario]
                        Output_CostFixed_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostFixed[(Output_CostFixed['scenario'] == scenario[i_scenario]) &
                                                                          (Output_CostFixed['regions'] == regions[i_regions]) &
                                                                          (Output_CostFixed['vintage'] == periods[i_periods])])
                            Output_CostFixed_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostFixed_DF = Output_CostFixed_DF.append(Output_CostFixed_dict, ignore_index=True)

                Output_CostFixed_DF = Output_CostFixed_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostFixed_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_CostFixed_dict.update(dict.fromkeys(periods, 0))

                Output_CostFixed_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_CostFixed_dict['file'] = file[i_file]
                        Output_CostFixed_dict['scenario'] = scenario[i_scenario]
                        Output_CostFixed_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostFixed[(Output_CostFixed['scenario'] == scenario[i_scenario]) &
                                                                          (Output_CostFixed['tech'] == tech[i_tech]) &
                                                                          (Output_CostFixed['vintage'] == periods[i_periods])])
                            Output_CostFixed_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostFixed_DF = Output_CostFixed_DF.append(Output_CostFixed_dict, ignore_index=True)

                Output_CostFixed_DF = Output_CostFixed_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostFixed_dict = {'file': '', 'scenario': ''}
                Output_CostFixed_dict.update(dict.fromkeys(periods, 0))

                Output_CostFixed_DF = pd.DataFrame(columns=columns_labels)

                check_zeros = True
                for i_scenario in range(0, len(scenario)):
                    Output_CostFixed_dict['file'] = file[i_file]
                    Output_CostFixed_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (Output_CostFixed[(Output_CostFixed['scenario'] == scenario[i_scenario]) &
                                                                        (Output_CostFixed['vintage'] == periods[i_periods])])
                        Output_CostFixed_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                        if float(sum(output_cost_period.output_cost)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_CostFixed_DF = Output_CostFixed_DF.append(Output_CostFixed_dict, ignore_index=True)
                
                Output_CostFixed_DF = Output_CostFixed_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_CostFixed_DF = Output_CostFixed_DF.loc[:, (Output_CostFixed_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_CostFixed_MERGE = pd.concat([Output_CostFixed_MERGE, Output_CostFixed_DF])


    # Output_CostVariable

    if result_set["Output_CostVariable"]:
        regions = regions_list
        tech = tech_list
        if not tech:
            print("Warning: No Output_CostVariable found.")
            result_set["Output_CostVariable"] = False

        else:
            # Data reading
            if not regions and tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostVariable = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostVariable = Output_CostVariable[(Output_CostVariable['output_name'] == 'V_DiscountedVariableCostsByProcess')]

            elif regions and not tech:
                conn = sqlite3.connect(file[i_file])
                Output_CostVariable = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ")", conn)
                conn.close()
                Output_CostVariable = Output_CostVariable[(Output_CostVariable['output_name'] == 'V_DiscountedVariableCostsByProcess')]

            else:
                conn = sqlite3.connect(file[i_file])
                Output_CostVariable = pd.read_sql("select * from Output_Costs where (" +
                                                  " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                                  " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
                Output_CostVariable = Output_CostVariable[(Output_CostVariable['output_name'] == 'V_DiscountedVariableCostsByProcess')]

            scenario = list(Output_CostVariable.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_CostVariable.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_CostVariable.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostVariable_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_CostVariable_dict.update(dict.fromkeys(periods, 0))

                Output_CostVariable_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_CostVariable_dict['file'] = file[i_file]
                            Output_CostVariable_dict['scenario'] = scenario[i_scenario]
                            Output_CostVariable_dict['regions'] = regions[i_regions]
                            Output_CostVariable_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                output_cost_period = (Output_CostVariable[(Output_CostVariable['scenario'] == scenario[i_scenario]) &
                                                                              (Output_CostVariable['regions'] == regions[i_regions]) &
                                                                              (Output_CostVariable['tech'] == tech[i_tech]) &
                                                                              (Output_CostVariable['vintage'] == periods[i_periods])])
                                Output_CostVariable_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                                if float(sum(output_cost_period.output_cost)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_CostVariable_DF = Output_CostVariable_DF.append(Output_CostVariable_dict, ignore_index=True)

                Output_CostVariable_DF = Output_CostVariable_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostVariable_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_CostVariable_dict.update(dict.fromkeys(periods, 0))

                Output_CostVariable_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_CostVariable_dict['file'] = file[i_file]
                        Output_CostVariable_dict['scenario'] = scenario[i_scenario]
                        Output_CostVariable_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostVariable[(Output_CostVariable['scenario'] == scenario[i_scenario]) &
                                                                          (Output_CostVariable['regions'] == regions[i_regions]) &
                                                                          (Output_CostVariable['vintage'] == periods[i_periods])])
                            Output_CostVariable_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostVariable_DF = Output_CostVariable_DF.append(Output_CostVariable_dict, ignore_index=True)

                Output_CostVariable_DF = Output_CostVariable_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["cost_tech"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostVariable_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_CostVariable_dict.update(dict.fromkeys(periods, 0))

                Output_CostVariable_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_CostVariable_dict['file'] = file[i_file]
                        Output_CostVariable_dict['scenario'] = scenario[i_scenario]
                        Output_CostVariable_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            output_cost_period = (Output_CostVariable[(Output_CostVariable['scenario'] == scenario[i_scenario]) &
                                                                          (Output_CostVariable['tech'] == tech[i_tech]) &
                                                                          (Output_CostVariable['vintage'] == periods[i_periods])])
                            Output_CostVariable_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                            if float(sum(output_cost_period.output_cost)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_CostVariable_DF = Output_CostVariable_DF.append(Output_CostVariable_dict, ignore_index=True)

                Output_CostVariable_DF = Output_CostVariable_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_CostVariable_dict = {'file': '', 'scenario': ''}
                Output_CostVariable_dict.update(dict.fromkeys(periods, 0))

                Output_CostVariable_DF = pd.DataFrame(columns=columns_labels)

                check_zeros = True
                for i_scenario in range(0, len(scenario)):
                    Output_CostVariable_dict['file'] = file[i_file]
                    Output_CostVariable_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        output_cost_period = (Output_CostVariable[(Output_CostVariable['scenario'] == scenario[i_scenario]) &
                                                                        (Output_CostVariable['vintage'] == periods[i_periods])])
                        Output_CostVariable_dict[periods[i_periods]] = float(sum(output_cost_period.output_cost))
                        if float(sum(output_cost_period.output_cost)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_CostVariable_DF = Output_CostVariable_DF.append(Output_CostVariable_dict, ignore_index=True)
                
                Output_CostVariable_DF = Output_CostVariable_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_CostVariable_DF = Output_CostVariable_DF.loc[:, (Output_CostVariable_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_CostVariable_MERGE = pd.concat([Output_CostVariable_MERGE, Output_CostVariable_DF])

    # Output_VFlow_In

    if result_set["Output_VFlow_In"]:
        regions = regions_list
        tech = tech_list
        input_comm = input_comm_list
        if not tech and not input_comm:
            print("Warning: No Output_VFlow_In found.")
            result_set["Output_VFlow_In"] = False
        
        else:
            # Data reading
            if not regions and tech and not input_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and input_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and input_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not input_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and input_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
                conn.close()
            
            scenario = list(Output_VFlow_In.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_VFlow_In.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_VFlow_In.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            input_comm = list(Output_VFlow_In.input_comm)
            input_comm = list(dict.fromkeys(input_comm))  # To remove duplicates

            # Data aggregation
            if disaggregation["regions"] and disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': '', 'input_comm': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            for i_input_comm in range(0, len(input_comm)):
                                Output_VFlow_In_dict['file'] = file[i_file]
                                Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                                Output_VFlow_In_dict['regions'] = regions[i_regions]
                                Output_VFlow_In_dict['tech'] = tech[i_tech]
                                Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                                check_zeros = True
                                for i_periods in range(0, len(periods)):
                                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                                    (Output_VFlow_In['regions'] == regions[i_regions]) &
                                                                    (Output_VFlow_In['tech'] == tech[i_tech]) &
                                                                    (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                                    (Output_VFlow_In['t_periods'] == periods[i_periods])]
                                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                                    if float(sum(vflow_in_period.vflow_in)) != 0:
                                        check_zeros = False
                                if not check_zeros:
                                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'regions', 'tech', 'input_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_VFlow_In_dict['file'] = file[i_file]
                            Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_In_dict['regions'] = regions[i_regions]
                            Output_VFlow_In_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_In['regions'] == regions[i_regions]) &
                                                                (Output_VFlow_In['tech'] == tech[i_tech]) &
                                                                (Output_VFlow_In['t_periods'] == periods[i_periods])]
                                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                                if float(sum(vflow_in_period.vflow_in)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'regins': '', 'input_comm': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_input_comm in range(0, len(input_comm)):
                            Output_VFlow_In_dict['file'] = file[i_file]
                            Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_In_dict['regions'] = regions[i_regions]
                            Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_In['regions'] == regions[i_regions]) &
                                                                (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                                (Output_VFlow_In['t_periods'] == periods[i_periods])]
                                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                                if float(sum(vflow_in_period.vflow_in)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'regions', 'input_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'tech': '', 'input_comm': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        for i_input_comm in range(0, len(input_comm)):
                            Output_VFlow_In_dict['file'] = file[i_file]
                            Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_In_dict['tech'] = tech[i_tech]
                            Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_In['tech'] == tech[i_tech]) &
                                                                (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                                (Output_VFlow_In['t_periods'] == periods[i_periods])]
                                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                                if float(sum(vflow_in_period.vflow_in)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'tech', 'input_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_VFlow_In_dict['file'] = file[i_file]
                        Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_In_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_In['regions'] == tech[i_regions]) &
                                                              (Output_VFlow_In['t_periods'] == periods[i_periods])]
                            Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                            if float(sum(vflow_in_period.vflow_in)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["input_tech"] and not disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_VFlow_In_dict['file'] = file[i_file]
                        Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_In_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_In['tech'] == tech[i_tech]) &
                                                              (Output_VFlow_In['t_periods'] == periods[i_periods])]
                            Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                            if float(sum(vflow_in_period.vflow_in)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["input_tech"] and disaggregation["input_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'input_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': '', 'input_comm': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_input_comm in range(0, len(input_comm)):
                        Output_VFlow_In_dict['file'] = file[i_file]
                        Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                              (Output_VFlow_In['t_periods'] == periods[i_periods])]
                            Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                            if float(sum(vflow_in_period.vflow_in)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario', 'input_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_In_dict = {'file': '', 'scenario': ''}
                Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    Output_VFlow_In_dict['file'] = file[i_file]
                    Output_VFlow_In_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = Output_VFlow_In[(Output_VFlow_In['scenario'] == scenario[i_scenario]) &
                                                          (Output_VFlow_In['t_periods'] == periods[i_periods])]
                        Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                        if float(sum(vflow_in_period.vflow_in)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)
                
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_VFlow_In_DF = Output_VFlow_In_DF.loc[:, (Output_VFlow_In_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_VFlow_In_MERGE = pd.concat([Output_VFlow_In_MERGE, Output_VFlow_In_DF])

    # Output_VFlow_Out

    if result_set["Output_VFlow_Out"]:
        regions = regions_list
        tech = tech_list
        output_comm = output_comm_list
        if not tech and not output_comm:
            print("Warning: No Output_VFlow_Out found.")
            result_set["Output_VFlow_Out"] = False
        
        else:
            # Data reading
            if not regions and tech and not output_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and output_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and output_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not output_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and output_comm:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file[i_file])
                Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
                conn.close()

            scenario = list(Output_VFlow_Out.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_VFlow_Out.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_VFlow_Out.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            output_comm = list(Output_VFlow_Out.output_comm)
            output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates
            
            # Data aggregation
            if disaggregation["regions"] and disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': '', 'output_comm': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            for i_output_comm in range(0, len(output_comm)):
                                Output_VFlow_Out_dict['file'] = file[i_file]
                                Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                                Output_VFlow_Out_dict['regions'] = regions[i_regions]
                                Output_VFlow_Out_dict['tech'] = tech[i_tech]
                                Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                                check_zeros = True
                                for i_periods in range(0, len(periods)):
                                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                                    (Output_VFlow_Out['regions'] == regions[i_regions]) &
                                                                    (Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                                    (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                                    (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                                    if float(sum(vflow_out_period.vflow_out)) != 0:
                                        check_zeros = False
                                if not check_zeros:
                                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'regions', 'tech', 'output_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_VFlow_Out_dict['file'] = file[i_file]
                            Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_Out_dict['regions'] = regions[i_regions]
                            Output_VFlow_Out_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_Out['regions'] == regions[i_regions]) &
                                                                (Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                                (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                                if float(sum(vflow_out_period.vflow_out)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'regions': '', 'output_comm': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_output_comm in range(0, len(output_comm)):
                            Output_VFlow_Out_dict['file'] = file[i_file]
                            Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_Out_dict['regions'] = regions[i_regions]
                            Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_Out['regions'] == regions[i_regions]) &
                                                                (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                                (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                                if float(sum(vflow_out_period.vflow_out)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'regions', 'output_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'tech': '', 'output_comm': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        for i_output_comm in range(0, len(output_comm)):
                            Output_VFlow_Out_dict['file'] = file[i_file]
                            Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                            Output_VFlow_Out_dict['tech'] = tech[i_tech]
                            Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                                (Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                                (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                                (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                                if float(sum(vflow_out_period.vflow_out)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'tech', 'output_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_VFlow_Out_dict['file'] = file[i_file]
                        Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_Out_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_Out['regions'] == regions[i_regions]) &
                                                              (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                            Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                            if float(sum(vflow_out_period.vflow_out)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["output_tech"] and not disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_VFlow_Out_dict['file'] = file[i_file]
                        Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_Out_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                              (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                            Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                            if float(sum(vflow_out_period.vflow_out)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'tech'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["output_tech"] and disaggregation["output_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'output_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': '', 'output_comm': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_output_comm in range(0, len(output_comm)):
                        Output_VFlow_Out_dict['file'] = file[i_file]
                        Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                        Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                              (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                              (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                            Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                            if float(sum(vflow_out_period.vflow_out)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario', 'output_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_VFlow_Out_dict = {'file': '', 'scenario': ''}
                Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

                Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    Output_VFlow_Out_dict['file'] = file[i_file]
                    Output_VFlow_Out_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['scenario'] == scenario[i_scenario]) &
                                                            (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                        Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                        if float(sum(vflow_out_period.vflow_out)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)
                
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_VFlow_Out_DF = Output_VFlow_Out_DF.loc[:, (Output_VFlow_Out_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_VFlow_Out_MERGE = pd.concat([Output_VFlow_Out_MERGE, Output_VFlow_Out_DF])

    # Output_Emissions

    if result_set["Output_Emissions"]:
        regions = regions_list
        tech = tech_list
        emissions_comm = emissions_comm_list
        if not tech and not emissions_comm:
            print("Warning: No Output_Emissions found.")
            result_set["Output_Emissions"] = False
        
        else:
            # Data reading
            if not regions and tech and not emissions_comm:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()
            
            elif not regions and not tech and emissions_comm:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            elif not regions and tech and emissions_comm:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            elif regions and tech and not emissions_comm:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
                conn.close()

            elif regions and not tech and emissions_comm:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            else:
                conn = sqlite3.connect(file[i_file])
                Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                              " or ".join((" regions = '" + str(n) + "'" for n in regions)) + ") and (" +
                                              " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                              " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
                conn.close()

            scenario = list(Output_Emissions.scenario)
            scenario = list(dict.fromkeys(scenario))  # To remove duplicates
            regions = list(Output_Emissions.regions)
            regions = list(dict.fromkeys(regions))  # To remove duplicates
            tech = list(Output_Emissions.tech)
            tech = list(dict.fromkeys(tech))  # To remove duplicates
            emissions_comm = list(Output_Emissions.emissions_comm)
            emissions_comm = list(dict.fromkeys(emissions_comm))  # To remove duplicates
            
            # Data aggregation
            if disaggregation["regions"] and disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': '', 'emissions_comm': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            for i_emissions_comm in range(0, len(emissions_comm)):
                                Output_Emissions_dict['file'] = file[i_file]
                                Output_Emissions_dict['scenario'] = scenario[i_scenario]
                                Output_Emissions_dict['regions'] = regions[i_regions]
                                Output_Emissions_dict['tech'] = tech[i_tech]
                                Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                                check_zeros = True
                                for i_periods in range(0, len(periods)):
                                    emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                                    (Output_Emissions['regions'] == regions[i_regions]) &
                                                                    (Output_Emissions['tech'] == tech[i_tech]) &
                                                                    (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                                    (Output_Emissions['t_periods'] == periods[i_periods])]
                                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                                    if float(sum(emissions_period.emissions)) != 0:
                                        check_zeros = False
                                if not check_zeros:
                                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'regions', 'tech', 'emissions_comm'], ignore_index=True)

            elif disaggregation["regions"] and disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_tech in range(0, len(tech)):
                            Output_Emissions_dict['file'] = file[i_file]
                            Output_Emissions_dict['scenario'] = scenario[i_scenario]
                            Output_Emissions_dict['regions'] = regions[i_regions]
                            Output_Emissions_dict['tech'] = tech[i_tech]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                                (Output_Emissions['regions'] == regions[i_regions]) &
                                                                (Output_Emissions['tech'] == tech[i_tech]) &
                                                                (Output_Emissions['t_periods'] == periods[i_periods])]
                                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                                if float(sum(emissions_period.emissions)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'regions', 'tech'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'regions': '', 'emissions_comm': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        for i_emissions_comm in range(0, len(emissions_comm)):
                            Output_Emissions_dict['file'] = file[i_file]
                            Output_Emissions_dict['scenario'] = scenario[i_scenario]
                            Output_Emissions_dict['regions'] = regions[i_regions]
                            Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                                (Output_Emissions['regions'] == regions[i_regions]) &
                                                                (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                                (Output_Emissions['t_periods'] == periods[i_periods])]
                                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                                if float(sum(emissions_period.emissions)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'regions', 'emissions_comm'], ignore_index=True)
            
            elif not disaggregation["regions"] and disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'tech': '', 'emissions_comm': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        for i_emissions_comm in range(0, len(emissions_comm)):
                            Output_Emissions_dict['file'] = file[i_file]
                            Output_Emissions_dict['scenario'] = scenario[i_scenario]
                            Output_Emissions_dict['tech'] = tech[i_tech]
                            Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                            check_zeros = True
                            for i_periods in range(0, len(periods)):
                                emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                                (Output_Emissions['tech'] == tech[i_tech]) &
                                                                (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                                (Output_Emissions['t_periods'] == periods[i_periods])]
                                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                                if float(sum(emissions_period.emissions)) != 0:
                                    check_zeros = False
                            if not check_zeros:
                                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'tech', 'emissions_comm'], ignore_index=True)

            elif disaggregation["regions"] and not disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'regions'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'regions': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_regions in range(0, len(regions)):
                        Output_Emissions_dict['file'] = file[i_file]
                        Output_Emissions_dict['scenario'] = scenario[i_scenario]
                        Output_Emissions_dict['regions'] = regions[i_regions]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                              (Output_Emissions['regions'] == regions[i_regions]) &
                                                              (Output_Emissions['t_periods'] == periods[i_periods])]
                            Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                            if float(sum(emissions_period.emissions)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

            elif not disaggregation["regions"] and disaggregation["emissions_tech"] and not disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'tech'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'tech': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_tech in range(0, len(tech)):
                        Output_Emissions_dict['file'] = file[i_file]
                        Output_Emissions_dict['scenario'] = scenario[i_scenario]
                        Output_Emissions_dict['tech'] = tech[i_tech]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                              (Output_Emissions['tech'] == tech[i_tech]) &
                                                              (Output_Emissions['t_periods'] == periods[i_periods])]
                            Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                            if float(sum(emissions_period.emissions)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'regions'], ignore_index=True)

            elif not disaggregation["regions"] and not disaggregation["emissions_tech"] and disaggregation["emissions_comm"]:

                columns_labels = pd.Series(['file', 'scenario', 'emissions_comm'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': '', 'emissions_comm': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    for i_emissions_comm in range(0, len(emissions_comm)):
                        Output_Emissions_dict['file'] = file[i_file]
                        Output_Emissions_dict['scenario'] = scenario[i_scenario]
                        Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                              (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                              (Output_Emissions['t_periods'] == periods[i_periods])]
                            Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                            if float(sum(emissions_period.emissions)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario', 'emissions_comm'], ignore_index=True)

            else:

                columns_labels = pd.Series(['file', 'scenario'])
                columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

                Output_Emissions_dict = {'file': '', 'scenario': ''}
                Output_Emissions_dict.update(dict.fromkeys(periods, 0))

                Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

                for i_scenario in range(0, len(scenario)):
                    Output_Emissions_dict['file'] = file[i_file]
                    Output_Emissions_dict['scenario'] = scenario[i_scenario]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = Output_Emissions[(Output_Emissions['scenario'] == scenario[i_scenario]) &
                                                            (Output_Emissions['t_periods'] == periods[i_periods])]
                        Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                        if float(sum(emissions_period.emissions)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)
                
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['file', 'scenario'], ignore_index=True)

            Output_Emissions_DF = Output_Emissions_DF.loc[:, (Output_Emissions_DF != 0).any(axis=0)]  # To remove columns with only zeros
            Output_Emissions_MERGE = pd.concat([Output_Emissions_MERGE, Output_Emissions_DF])

    # Check dummies

    if tech_dummies:
        regions = regions_list
        tech = tech_dummies

        conn = sqlite3.connect(file[i_file])
        time_periods_future = pd.read_sql("select * from time_periods where flag='f'", conn)
        conn.close()
        time_periods_optimize = time_periods_future.drop(len(time_periods_future) - 1)
        periods = time_periods_optimize.t_periods

        conn = sqlite3.connect(file[i_file])
        Check_Dummies = pd.read_sql("select * from Output_VFlow_Out where (" +
                                    " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        scenario = list(Check_Dummies.scenario)
        scenario = list(dict.fromkeys(scenario))  # To remove duplicates
        output_comm = list(Check_Dummies.output_comm)
        output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates

        columns_labels = pd.Series(['file', 'scenario', 'regions', 'tech', 'output_comm'])
        columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

        Check_Dummies_dict = {'file': '', 'scenario': '', 'regions': '', 'tech': '', 'output_comm': ''}
        Check_Dummies_dict.update(dict.fromkeys(periods, 0))

        Check_Dummies_DF = pd.DataFrame(columns=columns_labels)

        for i_scenario in range(0, len(scenario)):
            for i_regions in range(0, len(regions)):
                for i_tech in range(0, len(tech)):
                    for i_output_comm in range(0, len(output_comm)):
                        Check_Dummies_dict['file'] = file[i_file]
                        Check_Dummies_dict['scenario'] = scenario[i_scenario]
                        Check_Dummies_dict['regions'] = regions[i_regions]
                        Check_Dummies_dict['tech'] = tech[i_tech]
                        Check_Dummies_dict['output_comm'] = output_comm[i_output_comm]
                        check_zeros = True
                        for i_periods in range(0, len(periods)):
                            check_dummies_period = Check_Dummies[(Check_Dummies['scenario'] == scenario[i_scenario]) &
                                                                 (Check_Dummies['regions'] == regions[i_regions]) &
                                                                 (Check_Dummies['tech'] == tech[i_tech]) &
                                                                 (Check_Dummies['output_comm'] == output_comm[i_output_comm]) &
                                                                 (Check_Dummies['t_periods'] == periods[i_periods])]
                            Check_Dummies_dict[periods[i_periods]] = float(sum(check_dummies_period.vflow_out))
                            if float(sum(check_dummies_period.vflow_out)) != 0:
                                check_zeros = False
                        if not check_zeros:
                            Check_Dummies_DF = Check_Dummies_DF.append(Check_Dummies_dict, ignore_index=True)

        Check_Dummies_DF = Check_Dummies_DF.sort_values(by=['file', 'scenario', 'regions', 'tech', 'output_comm'], ignore_index=True)

        Check_Dummies_DF = Check_Dummies_DF.loc[:, (Check_Dummies_DF != 0).any(axis=0)]  # To remove columns with only zeros
        Check_Dummies_MERGE = pd.concat([Check_Dummies_MERGE, Check_Dummies_DF])

# Printing output

if print_set:
    if result_set["Output_CapacityByPeriodAndTech"]:
        print("\nOutput_CapacityByPeriodAndTech\n\n", Output_CapacityByPeriodAndTech_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_V_Capacity"]:
        print("\nOutput_V_Capacity\n\n", Output_V_Capacity_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_CostInvest"]:
        print("\nOutput_CostInvest\n\n", Output_CostInvest_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_CostFixed"]:
        print("\nOutput_CostFixed\n\n", Output_CostFixed_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_CostVariable"]:
        print("\nOutput_CostVariable\n\n", Output_CostVariable_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_VFlow_In"]:
        print("\nOutput_VFlow_In\n\n", Output_VFlow_In_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_VFlow_Out"]:
        print("\nOutput_VFlow_Out\n\n", Output_VFlow_Out_MERGE.to_string(index=False, float_format='%.2f'))
    if result_set["Output_Emissions"]:
        print("\nOutput_Emissions\n\n", Output_Emissions_MERGE.to_string(index=False, float_format='%.2f'))

if len(Check_Dummies_MERGE) != 0:
    print("\nWarning: Dummy imports detected.\n\n", Check_Dummies_MERGE.to_string(index=False, float_format='%.2f'))

# Export to Excel

if toexcel_set:
    writer = pd.ExcelWriter(excel_name + '.xlsx', engine='xlsxwriter')
    if len(Check_Dummies_MERGE) != 0:
        Check_Dummies_MERGE.to_excel(writer, sheet_name='Check_Dummies', index=False)
    if result_set["Output_CapacityByPeriodAndTech"]:
        Output_CapacityByPeriodAndTech_MERGE.to_excel(writer, sheet_name='Output_CapacityByPeriodAndTech', index=False)
    if result_set["Output_V_Capacity"]:
        Output_V_Capacity_MERGE.to_excel(writer, sheet_name='Output_V_Capacity', index=False)
    if result_set["Output_CostInvest"]:
        Output_CostInvest_MERGE.to_excel(writer, sheet_name='Output_CostInvest', index=False)
    if result_set["Output_CostFixed"]:
        Output_CostFixed_MERGE.to_excel(writer, sheet_name='Output_CostFixed', index=False)
    if result_set["Output_CostVariable"]:
        Output_CostVariable_MERGE.to_excel(writer, sheet_name='Output_CostVariable', index=False)
    if result_set["Output_VFlow_In"]:
        Output_VFlow_In_MERGE.to_excel(writer, sheet_name='Output_VFlow_In', index=False)
    if result_set["Output_VFlow_Out"]:
        Output_VFlow_Out_MERGE.to_excel(writer, sheet_name='Output_VFlow_Out', index=False)
    if result_set["Output_Emissions"]:
        Output_Emissions_MERGE.to_excel(writer, sheet_name='Output_Emissions', index=False)
    writer.save()
