import pandas as pd
import numpy as np
import sqlite3

database_name = "TEMOA_Italy.sqlite"
excel_name = "database_postprocessing"

print_set = True
toexcel_set = True
result_set = {
    "Output_CapacityByPeriodAndTech": True,
    "Output_V_Capacity": True,
    "Output_VFlow_In": True,
    "Output_VFlow_Out": True,
    "Output_Emissions": True
}
aggregation = {
    "capacity_tech": True,
    "new_capacity_tech": True,
    "input_tech": True,
    "input_comm": True,
    "output_tech": True,
    "output_comm": True,
    "emissions_tech": True,
    "emissions_comm": True
}

tech = [
]
input_comm = [
]
output_comm = [
]
emissions_comm = [
]
periods = [
]

tech_dummies = ['DMY_DEM_ANNUAL', 'DMY_PHY_ANNUAL', 'DMY_PHY_NON_ANNUAL']

tech_save = tech  # Used to store the selected technologies and to reset the list at the beginning of each tabel postprocessing

if not periods:  # Extraction of all the periods belonging to time_optimize if no time periods have been specifies
    conn = sqlite3.connect(database_name)
    time_periods_future = pd.read_sql("select * from time_periods where flag='f'", conn)
    conn.close()
    time_periods_optimize = time_periods_future.drop(len(time_periods_future)-1)
    periods = time_periods_optimize.t_periods

# Output_CapacityByPeriodAndTech

if result_set["Output_CapacityByPeriodAndTech"]:
    tech = tech_save
    if not tech:
        print("Warning: No Output_CapacityByPeriodAndTech found.")
        result_set["Output_CapacityByPeriodAndTech"] = False

    else:
        conn = sqlite3.connect(database_name)
        Output_CapacityByPeriodAndTech = pd.read_sql("select * from Output_CapacityByPeriodAndTech where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        if aggregation["capacity_tech"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_CapacityByPeriodAndTech_dict = {'tech': ''}
            Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

            Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_CapacityByPeriodAndTech_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['tech'] == tech[i_tech]) &
                                                                      (Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                    Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                    if float(sum(capacity_period.capacity)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)

        elif not aggregation["capacity_tech"]:

            columns_labels = pd.Series(periods)

            Output_CapacityByPeriodAndTech_dict = {}
            Output_CapacityByPeriodAndTech_dict.update(dict.fromkeys(periods, 0))

            Output_CapacityByPeriodAndTech_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                capacity_period = (Output_CapacityByPeriodAndTech[(Output_CapacityByPeriodAndTech['t_periods'] == periods[i_periods])])
                Output_CapacityByPeriodAndTech_dict[periods[i_periods]] = float(sum(capacity_period.capacity))
                if float(sum(capacity_period.capacity)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.append(Output_CapacityByPeriodAndTech_dict, ignore_index=True)

    if result_set["Output_CapacityByPeriodAndTech"]:
        if aggregation["capacity_tech"]:
            Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.sort_values(by=['tech'], ignore_index=True)
        Output_CapacityByPeriodAndTech_DF = Output_CapacityByPeriodAndTech_DF.loc[:, (Output_CapacityByPeriodAndTech_DF != 0).any(axis=0)]  # To remove columns with only zeros
            
# Output_V_Capacity

if result_set["Output_V_Capacity"]:
    tech = tech_save
    if not tech:
        print("Warning: No Output_V_Capacity found.")
        result_set["Output_V_Capacity"] = False

    else:
        conn = sqlite3.connect(database_name)
        Output_V_Capacity = pd.read_sql("select * from Output_V_Capacity where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        if aggregation["new_capacity_tech"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_V_Capacity_dict = {'tech': ''}
            Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

            Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_V_Capacity_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    new_capacity_period = (Output_V_Capacity[(Output_V_Capacity['tech'] == tech[i_tech]) &
                                                             (Output_V_Capacity['vintage'] == periods[i_periods])])
                    Output_V_Capacity_dict[periods[i_periods]] = float(sum(new_capacity_period.capacity))
                    if float(sum(new_capacity_period.capacity)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)

        elif not aggregation["new_capacity_tech"]:

            columns_labels = pd.Series(periods)

            Output_V_Capacity_dict = {}
            Output_V_Capacity_dict.update(dict.fromkeys(periods, 0))

            Output_V_Capacity_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                new_capacity_period = (Output_V_Capacity[(Output_V_Capacity['vintage'] == periods[i_periods])])
                Output_V_Capacity_dict[periods[i_periods]] = float(sum(new_capacity_period.capacity))
                if float(sum(new_capacity_period.capacity)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_V_Capacity_DF = Output_V_Capacity_DF.append(Output_V_Capacity_dict, ignore_index=True)

    if result_set["Output_V_Capacity"]:
        if aggregation["new_capacity_tech"]:
            Output_V_Capacity_DF = Output_V_Capacity_DF.sort_values(by=['tech'], ignore_index=True)
        Output_V_Capacity_DF = Output_V_Capacity_DF.loc[:, (Output_V_Capacity_DF != 0).any(axis=0)]  # To remove columns with only zeros

# Output_VFlow_In

if result_set["Output_VFlow_In"]:
    tech = tech_save
    if not tech and not input_comm:
        print("Warning: No Output_VFlow_In found.")
        result_set["Output_VFlow_In"] = False

    elif tech and not input_comm:
        conn = sqlite3.connect(database_name)
        Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        input_comm = list(Output_VFlow_In.input_comm)
        input_comm = list(dict.fromkeys(input_comm))  # To remove duplicates

        if aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['tech', 'input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': '', 'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_input_comm in range(0, len(input_comm)):
                    Output_VFlow_In_dict['tech'] = tech[i_tech]
                    Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                          (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                          (Output_VFlow_In['t_periods'] == periods[i_periods])]
                        Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                        if float(sum(vflow_in_period.vflow_in)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_In_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_input_comm in range(0, len(input_comm)):
                Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_In_dict = {}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['t_periods'] == periods[i_periods])]
                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                if float(sum(vflow_in_period.vflow_in)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

    elif not tech and input_comm:
        conn = sqlite3.connect(database_name)
        Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                      " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
        conn.close()

        tech = list(Output_VFlow_In.tech)
        tech = list(dict.fromkeys(tech))  # To remove duplicates

        if aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['tech', 'input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': '', 'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_input_comm in range(0, len(input_comm)):
                    Output_VFlow_In_dict['tech'] = tech[i_tech]
                    Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                          (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                          (Output_VFlow_In['t_periods'] == periods[i_periods])]
                        Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                        if float(sum(vflow_in_period.vflow_in)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_In_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_input_comm in range(0, len(input_comm)):
                Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_In_dict = {}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['t_periods'] == periods[i_periods])]
                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                if float(sum(vflow_in_period.vflow_in)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

    else:
        conn = sqlite3.connect(database_name)
        Output_VFlow_In = pd.read_sql("select * from Output_VFlow_In where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                      " or ".join((" input_comm = '" + str(n) + "'" for n in input_comm)) + ")", conn)
        conn.close()

        if aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['tech', 'input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': '', 'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_input_comm in range(0, len(input_comm)):
                    Output_VFlow_In_dict['tech'] = tech[i_tech]
                    Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                          (Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                          (Output_VFlow_In['t_periods'] == periods[i_periods])]
                        Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                        if float(sum(vflow_in_period.vflow_in)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'tech': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_In_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and aggregation["input_comm"]:

            columns_labels = pd.Series(['input_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_In_dict = {'input_comm': ''}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            for i_input_comm in range(0, len(input_comm)):
                Output_VFlow_In_dict['input_comm'] = input_comm[i_input_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_in_period = Output_VFlow_In[(Output_VFlow_In['input_comm'] == input_comm[i_input_comm]) &
                                                      (Output_VFlow_In['t_periods'] == periods[i_periods])]
                    Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                    if float(sum(vflow_in_period.vflow_in)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

        elif not aggregation["input_tech"] and not aggregation["input_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_In_dict = {}
            Output_VFlow_In_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_In_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_in_period = Output_VFlow_In[(Output_VFlow_In['t_periods'] == periods[i_periods])]
                Output_VFlow_In_dict[periods[i_periods]] = float(sum(vflow_in_period.vflow_in))
                if float(sum(vflow_in_period.vflow_in)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_In_DF = Output_VFlow_In_DF.append(Output_VFlow_In_dict, ignore_index=True)

    if result_set["Output_VFlow_In"]:
        if aggregation["input_tech"]:
            if aggregation["input_comm"]:
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['tech', 'input_comm'], ignore_index=True)
            if not aggregation["input_comm"]:
                Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['tech'], ignore_index=True)
        elif aggregation["input_comm"]:
            Output_VFlow_In_DF = Output_VFlow_In_DF.sort_values(by=['input_comm'], ignore_index=True)
        Output_VFlow_In_DF = Output_VFlow_In_DF.loc[:, (Output_VFlow_In_DF != 0).any(axis=0)]  # To remove columns with only zeros

# Output_VFlow_Out

if result_set["Output_VFlow_Out"]:
    tech = tech_save
    if not tech and not output_comm:
        print("Warning: No Output_VFlow_Out found.")
        result_set["Output_VFlow_Out"] = False

    elif tech and not output_comm:
        conn = sqlite3.connect(database_name)
        Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        output_comm = list(Output_VFlow_Out.output_comm)
        output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates

        if aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['tech', 'output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': '', 'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_output_comm in range(0, len(output_comm)):
                    Output_VFlow_Out_dict['tech'] = tech[i_tech]
                    Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                            (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                            (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                        Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                        if float(sum(vflow_out_period.vflow_out)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_Out_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_output_comm in range(0, len(output_comm)):
                Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_Out_dict = {}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['t_periods'] == periods[i_periods])]
                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                if float(sum(vflow_out_period.vflow_out)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

    elif not tech and output_comm:
        conn = sqlite3.connect(database_name)
        Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                      " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
        conn.close()

        tech = list(Output_VFlow_Out.tech)
        tech = list(dict.fromkeys(tech))  # To remove duplicates

        if aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['tech', 'output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': '', 'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_output_comm in range(0, len(output_comm)):
                    Output_VFlow_Out_dict['tech'] = tech[i_tech]
                    Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                          (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                          (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                        Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                        if float(sum(vflow_out_period.vflow_out)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_Out_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_output_comm in range(0, len(output_comm)):
                Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_Out_dict = {}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['t_periods'] == periods[i_periods])]
                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                if float(sum(vflow_out_period.vflow_out)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

    else:
        conn = sqlite3.connect(database_name)
        Output_VFlow_Out = pd.read_sql("select * from Output_VFlow_Out where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                      " or ".join((" output_comm = '" + str(n) + "'" for n in output_comm)) + ")", conn)
        conn.close()

        if aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['tech', 'output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': '', 'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_output_comm in range(0, len(output_comm)):
                    Output_VFlow_Out_dict['tech'] = tech[i_tech]
                    Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                          (Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                          (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                        Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                        if float(sum(vflow_out_period.vflow_out)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'tech': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_VFlow_Out_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['tech'] == tech[i_tech]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and aggregation["output_comm"]:

            columns_labels = pd.Series(['output_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_VFlow_Out_dict = {'output_comm': ''}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            for i_output_comm in range(0, len(output_comm)):
                Output_VFlow_Out_dict['output_comm'] = output_comm[i_output_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['output_comm'] == output_comm[i_output_comm]) &
                                                      (Output_VFlow_Out['t_periods'] == periods[i_periods])]
                    Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                    if float(sum(vflow_out_period.vflow_out)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

        elif not aggregation["output_tech"] and not aggregation["output_comm"]:

            columns_labels = pd.Series(periods)

            Output_VFlow_Out_dict = {}
            Output_VFlow_Out_dict.update(dict.fromkeys(periods, 0))

            Output_VFlow_Out_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                vflow_out_period = Output_VFlow_Out[(Output_VFlow_Out['t_periods'] == periods[i_periods])]
                Output_VFlow_Out_dict[periods[i_periods]] = float(sum(vflow_out_period.vflow_out))
                if float(sum(vflow_out_period.vflow_out)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.append(Output_VFlow_Out_dict, ignore_index=True)

    if result_set["Output_VFlow_Out"]:
        if aggregation["output_tech"]:
            if aggregation["output_comm"]:
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['tech', 'output_comm'], ignore_index=True)
            if not aggregation["output_comm"]:
                Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['tech'], ignore_index=True)
        elif aggregation["output_comm"]:
            Output_VFlow_Out_DF = Output_VFlow_Out_DF.sort_values(by=['output_comm'], ignore_index=True)
        Output_VFlow_Out_DF = Output_VFlow_Out_DF.loc[:, (Output_VFlow_Out_DF != 0).any(axis=0)]  # To remove columns with only zeros

# Output_Emissions

if result_set["Output_Emissions"]:
    tech = tech_save
    if not tech and not emissions_comm:
        print("Warning: No Output_Emissions found.")
        result_set["Output_Emissions"] = False

    elif tech and not emissions_comm:
        conn = sqlite3.connect(database_name)
        Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
        conn.close()

        emissions_comm = list(Output_Emissions.emissions_comm)
        emissions_comm = list(dict.fromkeys(emissions_comm))  # To remove duplicates

        if aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech', 'emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': '', 'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_emissions_comm in range(0, len(emissions_comm)):
                    Output_Emissions_dict['tech'] = tech[i_tech]
                    Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                          (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                          (Output_Emissions['t_periods'] == periods[i_periods])]
                        Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                        if float(sum(emissions_period.emissions)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_Emissions_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_emissions_comm in range(0, len(emissions_comm)):
                Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(periods)

            Output_Emissions_dict = {}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                emissions_period = Output_Emissions[(Output_Emissions['t_periods'] == periods[i_periods])]
                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                if float(sum(emissions_period.emissions)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

    elif not tech and emissions_comm:
        conn = sqlite3.connect(database_name)
        Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                      " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
        conn.close()

        tech = list(Output_Emissions.tech)
        tech = list(dict.fromkeys(tech))  # To remove duplicates

        if aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech', 'emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': '', 'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_emissions_comm in range(0, len(emissions_comm)):
                    Output_Emissions_dict['tech'] = tech[i_tech]
                    Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                          (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                          (Output_Emissions['t_periods'] == periods[i_periods])]
                        Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                        if float(sum(emissions_period.emissions)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_Emissions_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_emissions_comm in range(0, len(emissions_comm)):
                Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(periods)

            Output_Emissions_dict = {}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                emissions_period = Output_Emissions[(Output_Emissions['t_periods'] == periods[i_periods])]
                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                if float(sum(emissions_period.emissions)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

    else:
        conn = sqlite3.connect(database_name)
        Output_Emissions = pd.read_sql("select * from Output_Emissions where (" +
                                      " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ") and (" +
                                      " or ".join((" emissions_comm = '" + str(n) + "'" for n in emissions_comm)) + ")", conn)
        conn.close()

        if aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech', 'emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': '', 'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                for i_emissions_comm in range(0, len(emissions_comm)):
                    Output_Emissions_dict['tech'] = tech[i_tech]
                    Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                    check_zeros = True
                    for i_periods in range(0, len(periods)):
                        emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                          (Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                          (Output_Emissions['t_periods'] == periods[i_periods])]
                        Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                        if float(sum(emissions_period.emissions)) != 0:
                            check_zeros = False
                    if not check_zeros:
                        Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(['tech'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'tech': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_tech in range(0, len(tech)):
                Output_Emissions_dict['tech'] = tech[i_tech]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['tech'] == tech[i_tech]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and aggregation["emissions_comm"]:

            columns_labels = pd.Series(['emissions_comm'])
            columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

            Output_Emissions_dict = {'emissions_comm': ''}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            for i_emissions_comm in range(0, len(emissions_comm)):
                Output_Emissions_dict['emissions_comm'] = emissions_comm[i_emissions_comm]
                check_zeros = True
                for i_periods in range(0, len(periods)):
                    emissions_period = Output_Emissions[(Output_Emissions['emissions_comm'] == emissions_comm[i_emissions_comm]) &
                                                      (Output_Emissions['t_periods'] == periods[i_periods])]
                    Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                    if float(sum(emissions_period.emissions)) != 0:
                        check_zeros = False
                if not check_zeros:
                    Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

        elif not aggregation["emissions_tech"] and not aggregation["emissions_comm"]:

            columns_labels = pd.Series(periods)

            Output_Emissions_dict = {}
            Output_Emissions_dict.update(dict.fromkeys(periods, 0))

            Output_Emissions_DF = pd.DataFrame(columns=columns_labels)

            check_zeros = True
            for i_periods in range(0, len(periods)):
                emissions_period = Output_Emissions[(Output_Emissions['t_periods'] == periods[i_periods])]
                Output_Emissions_dict[periods[i_periods]] = float(sum(emissions_period.emissions))
                if float(sum(emissions_period.emissions)) != 0:
                    check_zeros = False
            if not check_zeros:
                Output_Emissions_DF = Output_Emissions_DF.append(Output_Emissions_dict, ignore_index=True)

    if result_set["Output_Emissions"]:
        if aggregation["emissions_tech"]:
            if aggregation["emissions_comm"]:
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['tech', 'emissions_comm'], ignore_index=True)
            if not aggregation["emissions_comm"]:
                Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['tech'], ignore_index=True)
        elif aggregation["emissions_comm"]:
            Output_Emissions_DF = Output_Emissions_DF.sort_values(by=['emissions_comm'], ignore_index=True)
        Output_Emissions_DF = Output_Emissions_DF.loc[:, (Output_Emissions_DF != 0).any(axis=0)]  # To remove columns with only zeros

# Check dummies

if tech_dummies:
    tech = tech_dummies

    conn = sqlite3.connect(database_name)
    time_periods_future = pd.read_sql("select * from time_periods where flag='f'", conn)
    conn.close()
    time_periods_optimize = time_periods_future.drop(len(time_periods_future) - 1)
    periods = time_periods_optimize.t_periods

    conn = sqlite3.connect(database_name)
    Check_Dummies = pd.read_sql("select * from Output_VFlow_Out where (" +
                                " or ".join((" tech = '" + str(n) + "'" for n in tech)) + ")", conn)
    conn.close()

    output_comm = list(Check_Dummies.output_comm)
    output_comm = list(dict.fromkeys(output_comm))  # To remove duplicates

    columns_labels = pd.Series(['tech', 'output_comm'])
    columns_labels = columns_labels.append(pd.Series(periods), ignore_index=True)

    Check_Dummies_dict = {'tech': '', 'output_comm': ''}
    Check_Dummies_dict.update(dict.fromkeys(periods, 0))

    Check_Dummies_DF = pd.DataFrame(columns=columns_labels)

    for i_tech in range(0, len(tech)):
        for i_output_comm in range(0, len(output_comm)):
            Check_Dummies_dict['tech'] = tech[i_tech]
            Check_Dummies_dict['output_comm'] = output_comm[i_output_comm]
            check_zeros = True
            for i_periods in range(0, len(periods)):
                check_dummies_period = Check_Dummies[(Check_Dummies['tech'] == tech[i_tech]) &
                                                     (Check_Dummies['output_comm'] == output_comm[i_output_comm]) &
                                                     (Check_Dummies['t_periods'] == periods[i_periods])]
                Check_Dummies_dict[periods[i_periods]] = float(sum(check_dummies_period.vflow_out))
                if float(sum(check_dummies_period.vflow_out)) != 0:
                    check_zeros = False
            if not check_zeros:
                Check_Dummies_DF = Check_Dummies_DF.append(Check_Dummies_dict, ignore_index=True)

    Check_Dummies_DF = Check_Dummies_DF.sort_values(by=['tech', 'output_comm'], ignore_index=True)

    Check_Dummies_DF = Check_Dummies_DF.loc[:, (Check_Dummies_DF != 0).any(axis=0)]  # To remove columns with only zeros

# Printing output

if print_set:
    if result_set["Output_CapacityByPeriodAndTech"]:
        print("\nOutput_CapacityByPeriodAndTech_DF\n\n", Output_CapacityByPeriodAndTech_DF.to_string(index=False, float_format='%.2f'))
    if result_set["Output_V_Capacity"]:
        print("\nOutput_V_Capacity_DF\n\n", Output_V_Capacity_DF.to_string(index=False, float_format='%.2f'))
    if result_set["Output_VFlow_In"]:
        print("\nOutput_VFlow_In_DF\n\n", Output_VFlow_In_DF.to_string(index=False, float_format='%.2f'))
    if result_set["Output_VFlow_Out"]:
        print("\nOutput_VFlow_Out_DF\n\n", Output_VFlow_Out_DF.to_string(index=False, float_format='%.2f'))
    if result_set["Output_Emissions"]:
        print("\nOutput_Emissions\n\n", Output_Emissions_DF.to_string(index=False, float_format='%.2f'))

if len(Check_Dummies_DF) != 0:
    print("\nWarning: Dummy imports detected.\n\n", Check_Dummies_DF.to_string(index=False, float_format='%.2f'))

# Export to Excel

if toexcel_set:
    writer = pd.ExcelWriter(excel_name + '.xlsx', engine='xlsxwriter')
    if len(Check_Dummies_DF) != 0:
        Check_Dummies_DF.to_excel(writer, sheet_name='Check_Dummies', index=False)
    if result_set["Output_CapacityByPeriodAndTech"]:
        Output_CapacityByPeriodAndTech_DF.to_excel(writer, sheet_name='Output_CapacityByPeriodAndTech', index=False)
    if result_set["Output_V_Capacity"]:
        Output_V_Capacity_DF.to_excel(writer, sheet_name='Output_V_Capacity', index=False)
    if result_set["Output_VFlow_In"]:
        Output_VFlow_In_DF.to_excel(writer, sheet_name='Output_VFlow_In', index=False)
    if result_set["Output_VFlow_Out"]:
        Output_VFlow_Out_DF.to_excel(writer, sheet_name='Output_VFlow_Out', index=False)
    if result_set["Output_Emissions"]:
        Output_Emissions_DF.to_excel(writer, sheet_name='Output_Emissions', index=False)
    writer.save()