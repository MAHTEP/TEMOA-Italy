import pandas as pd
import numpy as np
import sqlite3

database_name = "TEMOA_Italy.sqlite"
lifetime_default = 40
base_year = 2006
print_i = 0

print_set = {'LifetimeProcess':         False,
             'Efficiency':              False,
             'TechInputSplit':          False,
             'TechOutputSplit':         False,
             'EmissionActivity':        False,
             'CostInvest':              False,
             'CostFixed':               False,
             'CostVariable':            False,
             'DiscountRate':            False,
             'MinCapacity':             False,
             'MinActivity':             False,
             'MaxCapacity':             False,
             'MaxActivity':             False,
             'MinInputGroup':           False,
             'MaxInputGroup':           False,
             'MaxOutputGroup':          False,
             'MinGenGroupTarget':       False,
             'MaxGenGroupLimit':        False,
             'Demand':                  False,
             'CapacityFactor':          False,
             'CapacityFactorProcess':   False,
             'CapacityCredit':          False}

tosql_set = {'LifetimeProcess':         True,
             'Efficiency':              True,
             'TechInputSplit':          True,
             'TechOutputSplit':         True,
             'EmissionActivity':        True,
             'CostInvest':              True,
             'CostFixed':               True,
             'CostVariable':            True,
             'DiscountRate':            True,
             'MinCapacity':             True,
             'MinActivity':             True,
             'MaxCapacity':             True,
             'MaxActivity':             True,
             'MinInputGroup':           True,
             'MaxInputGroup':           True,
             'MaxOutputGroup':          True,
             'MinGenGroupTarget':       True,
             'MaxGenGroupLimit':        True,
             'Demand':                  True,
             'CapacityFactor':          True,
             'CapacityFactorProcess':   True,
             'CapacityCredit':          True}

# LifetimeProcess

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
LifetimeProcess = pd.read_sql("select * from LifetimeProcess", conn)

regions = list()
tech = list()
vintage = list()
life_process = list()
life_process_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(LifetimeProcess.tech)):
    tech_i = LifetimeProcess.tech[i_tech]

    flag_check = 0
    for check in range(0, len(tech_already_considered)):
        if tech_i == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(LifetimeProcess.tech)):
            if LifetimeProcess.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values

            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= LifetimeProcess.vintage[i_tech] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(LifetimeProcess.regions[i_tech])
                    tech.append(LifetimeProcess.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    life_process.append(int(LifetimeProcess.life_process[i_tech]))
                    life_process_notes.append(LifetimeProcess.life_process_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = LifetimeProcess.vintage[location[i_location]]
                year2 = LifetimeProcess.vintage[location[i_location + 1]]
                life1 = LifetimeProcess.life_process[location[i_location]]
                life2 = LifetimeProcess.life_process[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(LifetimeProcess.regions[i_tech])
                        tech.append(LifetimeProcess.tech[i_tech])
                        vintage.append(int(year))
                        life_process.append(
                            life1)  # For linear interpolation with integer results: int(life1 + (year-year1)/(year2-year1)*(life2-life1))
                        life_process_notes.append(LifetimeProcess.life_process_notes[i_tech])

            year_last = LifetimeProcess.vintage[location[i_location + 1]]
            cost = LifetimeProcess.life_process[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(LifetimeProcess.regions[i_tech])
                        tech.append(LifetimeProcess.tech[i_tech])
                        vintage.append(int(year))
                        life_process.append(int(LifetimeProcess.life_process[location[i_location + 1]]))
                        life_process_notes.append(LifetimeProcess.life_process_notes[i_tech])
            else:
                regions.append(LifetimeProcess.regions[i_tech])
                vintage.append(int(year_last))
                tech.append(LifetimeProcess.tech[i_tech])
                life_process.append(int(LifetimeProcess.life_process[location[i_location + 1]]))
                life_process_notes.append(LifetimeProcess.life_process_notes[i_tech])

LifetimeProcess_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "life_process": pd.Series(life_process, dtype='int'),
        "life_process_notes": pd.Series(life_process_notes, dtype='str')
    }
)

if tosql_set['LifetimeProcess']:
    LifetimeProcess_DF.to_sql("LifetimeProcess", conn, index=False, if_exists='replace')

if print_set['LifetimeProcess']:
    pd.set_option('display.max_rows', len(LifetimeProcess_DF))
    pd.set_option('display.max_columns', len(LifetimeProcess_DF))
    print("\nLifetimeProcess DataFrame\n\n", LifetimeProcess_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     LifetimeProcess updated...')
else:
    print('[', print_i, '/', len(print_set), ']     LifetimeProcess updated...')

# Efficiency

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
Efficiency = pd.read_sql("select * from Efficiency", conn)

regions = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
efficiency = list()
eff_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(Efficiency.tech)):
    tech_i = Efficiency.tech[i_tech]

    flag_check = 0
    tech_i_check = Efficiency.input_comm[i_tech] + tech_i + Efficiency.output_comm[i_tech]
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(Efficiency.tech)):
            tech_j_check = Efficiency.input_comm[j_tech] + Efficiency.tech[j_tech] + Efficiency.output_comm[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= Efficiency.vintage[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(Efficiency.regions[i_tech])
                    input_comm.append(Efficiency.input_comm[i_tech])
                    tech.append(Efficiency.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    output_comm.append(Efficiency.output_comm[i_tech])
                    efficiency.append(float(np.format_float_scientific(Efficiency.efficiency[i_tech], 2)))
                    eff_notes.append(Efficiency.eff_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = Efficiency.vintage[location[i_location]]
                year2 = Efficiency.vintage[location[i_location + 1]]
                eff1 = Efficiency.efficiency[location[i_location]]
                eff2 = Efficiency.efficiency[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(Efficiency.regions[i_tech])
                        input_comm.append(Efficiency.input_comm[i_tech])
                        tech.append(Efficiency.tech[i_tech])
                        vintage.append(int(year))
                        output_comm.append(Efficiency.output_comm[i_tech])
                        efficiency.append(float(np.format_float_scientific(eff1 + (year - year1) / (year2 - year1) * (eff2 - eff1), 2)))
                        eff_notes.append(Efficiency.eff_notes[i_tech])

            year_last = Efficiency.vintage[location[i_location + 1]]
            eff = Efficiency.efficiency[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(Efficiency.regions[i_tech])
                        input_comm.append(Efficiency.input_comm[i_tech])
                        tech.append(Efficiency.tech[i_tech])
                        vintage.append(int(year))
                        output_comm.append(Efficiency.output_comm[i_tech])
                        efficiency.append(float(np.format_float_scientific(Efficiency.efficiency[location[i_location + 1]], 2)))
                        eff_notes.append(Efficiency.eff_notes[i_tech])
            else:
                regions.append(Efficiency.regions[i_tech])
                input_comm.append(Efficiency.input_comm[i_tech])
                tech.append(Efficiency.tech[i_tech])
                vintage.append(int(year_last))
                output_comm.append(Efficiency.output_comm[i_tech])
                efficiency.append(float(np.format_float_scientific(Efficiency.efficiency[location[i_location + 1]], 2)))
                eff_notes.append(Efficiency.eff_notes[i_tech])

Efficiency_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "efficiency": pd.Series(efficiency, dtype='float'),
        "eff_notes": pd.Series(eff_notes, dtype='str')
    }
)

if tosql_set['Efficiency']:
    Efficiency_DF.to_sql("Efficiency", conn, index=False, if_exists='replace')

if print_set['Efficiency']:
    pd.set_option('display.max_rows', len(Efficiency_DF))
    pd.set_option('display.max_columns', len(Efficiency_DF))
    print("\nEfficiency DataFrame\n\n", Efficiency_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     Efficiency updated...')
else:
    print('[', print_i, '/', len(print_set), ']     Efficiency updated...')

# TechInputSplit

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
TechInputSplit = pd.read_sql("select * from TechInputSplit", conn)

regions = list()
periods = list()
input_comm = list()
tech = list()
ti_split = list()
ti_split_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(TechInputSplit.tech)):
    tech_i = TechInputSplit.tech[i_tech]

    flag_check = 0
    tech_i_check = TechInputSplit.input_comm[i_tech] + tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(TechInputSplit.tech)):
            tech_j_check = TechInputSplit.input_comm[j_tech] + TechInputSplit.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= TechInputSplit.periods[i_tech] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(TechInputSplit.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    input_comm.append(TechInputSplit.input_comm[i_tech])
                    tech.append(TechInputSplit.tech[i_tech])
                    ti_split.append(float(np.format_float_positional(TechInputSplit.ti_split[i_tech], 4)))
                    ti_split_notes.append(TechInputSplit.ti_split_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = TechInputSplit.periods[location[i_location]]
                year2 = TechInputSplit.periods[location[i_location + 1]]
                ti1 = TechInputSplit.ti_split[location[i_location]]
                ti2 = TechInputSplit.ti_split[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(TechInputSplit.regions[i_tech])
                        periods.append(int(year))
                        input_comm.append(TechInputSplit.input_comm[i_tech])
                        tech.append(TechInputSplit.tech[i_tech])
                        ti_split.append(
                            float(np.format_float_positional(ti1 + (year - year1) / (year2 - year1) * (ti2 - ti1), 4)))
                        ti_split_notes.append(TechInputSplit.ti_split_notes[i_tech])

            year_last = TechInputSplit.periods[location[i_location + 1]]
            eff = TechInputSplit.ti_split[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(TechInputSplit.regions[i_tech])
                        periods.append(int(year))
                        input_comm.append(TechInputSplit.input_comm[i_tech])
                        tech.append(TechInputSplit.tech[i_tech])
                        ti_split.append(
                            float(np.format_float_positional(TechInputSplit.ti_split[location[i_location + 1]], 4)))
                        ti_split_notes.append(TechInputSplit.ti_split_notes[i_tech])
            else:
                regions.append(TechInputSplit.regions[i_tech])
                periods.append(int(year_last))
                input_comm.append(TechInputSplit.input_comm[i_tech])
                tech.append(TechInputSplit.tech[i_tech])
                ti_split.append(float(np.format_float_positional(TechInputSplit.ti_split[location[i_location + 1]], 4)))
                ti_split_notes.append(TechInputSplit.ti_split_notes[i_tech])

TechInputSplit_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "ti_split": pd.Series(ti_split, dtype='float'),
        "ti_split_notes": pd.Series(ti_split_notes, dtype='str')
    }
)

if tosql_set['TechInputSplit']:
    TechInputSplit_DF.to_sql("TechInputSplit", conn, index=False, if_exists='replace')

if print_set['TechInputSplit']:
    pd.set_option('display.max_rows', len(TechInputSplit_DF))
    pd.set_option('display.max_columns', len(TechInputSplit_DF))
    print("\nTechInputSplit DataFrame\n\n", TechInputSplit_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     TechInputSplit updated...')
else:
    print('[', print_i, '/', len(print_set), ']     TechInputSplit updated...')

# TechOutputSplit

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
TechOutputSplit = pd.read_sql("select * from TechOutputSplit", conn)

regions = list()
periods = list()
output_comm = list()
tech = list()
to_split = list()
to_split_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(TechOutputSplit.tech)):
    tech_i = TechOutputSplit.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i + TechOutputSplit.output_comm[i_tech]
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(TechOutputSplit.tech)):
            tech_j_check = TechOutputSplit.tech[j_tech] + TechOutputSplit.output_comm[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= TechOutputSplit.periods[i_tech] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(TechOutputSplit.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    tech.append(TechOutputSplit.tech[i_tech])
                    output_comm.append(TechOutputSplit.output_comm[i_tech])
                    to_split.append(float(np.format_float_positional(TechOutputSplit.to_split[i_tech], 4)))
                    to_split_notes.append(TechOutputSplit.to_split_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = TechOutputSplit.periods[location[i_location]]
                year2 = TechOutputSplit.periods[location[i_location + 1]]
                to1 = TechOutputSplit.to_split[location[i_location]]
                to2 = TechOutputSplit.to_split[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(TechOutputSplit.regions[i_tech])
                        periods.append(int(year))
                        tech.append(TechOutputSplit.tech[i_tech])
                        output_comm.append(TechOutputSplit.output_comm[i_tech])
                        to_split.append(
                            float(np.format_float_positional(to1 + (year - year1) / (year2 - year1) * (to2 - to1), 4)))
                        to_split_notes.append(TechOutputSplit.to_split_notes[i_tech])

            year_last = TechOutputSplit.periods[location[i_location + 1]]
            eff = TechOutputSplit.to_split[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(TechOutputSplit.regions[i_tech])
                        periods.append(int(year))
                        tech.append(TechOutputSplit.tech[i_tech])
                        output_comm.append(TechOutputSplit.output_comm[i_tech])
                        to_split.append(
                            float(np.format_float_positional(TechOutputSplit.to_split[location[i_location + 1]], 4)))
                        to_split_notes.append(TechOutputSplit.to_split_notes[i_tech])
            else:
                regions.append(TechOutputSplit.regions[i_tech])
                periods.append(int(year_last))
                tech.append(TechOutputSplit.tech[i_tech])
                output_comm.append(TechOutputSplit.output_comm[i_tech])
                to_split.append(
                    float(np.format_float_positional(TechOutputSplit.to_split[location[i_location + 1]], 4)))
                to_split_notes.append(TechOutputSplit.to_split_notes[i_tech])

TechOutputSplit_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "to_split": pd.Series(to_split, dtype='float'),
        "to_split_notes": pd.Series(to_split_notes, dtype='str')
    }
)

if tosql_set['TechOutputSplit']:
    TechOutputSplit_DF.to_sql("TechOutputSplit", conn, index=False, if_exists='replace')

if print_set['TechOutputSplit']:
    pd.set_option('display.max_rows', len(TechOutputSplit_DF))
    pd.set_option('display.max_columns', len(TechOutputSplit_DF))
    print("\nTechOutputSplit DataFrame\n\n", TechOutputSplit_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     TechOutputSplit updated...')
else:
    print('[', print_i, '/', len(print_set), ']     TechOutputSplit updated...')

# EmissionActivity

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
Efficiency = pd.read_sql("select * from Efficiency", conn)
EmissionActivity = pd.read_sql("select * from EmissionActivity", conn)
CommodityEmissionFactor = pd.read_sql("select * from CommodityEmissionFactor", conn)

# EmissionActivity interpolation

regions = list()
emis_comm = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
emis_act = list()
emis_act_units = list()
emis_act_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(EmissionActivity.tech)):
    tech_i = EmissionActivity.tech[i_tech]

    flag_check = 0
    tech_i_check = EmissionActivity.emis_comm[i_tech] + EmissionActivity.input_comm[i_tech] + tech_i + EmissionActivity.output_comm[i_tech]
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(EmissionActivity.tech)):
            tech_j_check = EmissionActivity.emis_comm[i_tech] + EmissionActivity.input_comm[j_tech] + EmissionActivity.tech[j_tech] + EmissionActivity.output_comm[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= EmissionActivity.vintage[i_tech] and time_periods.t_periods[i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(EmissionActivity.regions[i_tech])
                    emis_comm.append(EmissionActivity.emis_comm[i_tech])
                    input_comm.append(EmissionActivity.input_comm[i_tech])
                    tech.append(EmissionActivity.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    output_comm.append(EmissionActivity.output_comm[i_tech])
                    emis_act.append(float(np.format_float_positional(EmissionActivity.emis_act[i_tech], 2)))
                    emis_act_units.append(EmissionActivity.emis_act_units[i_tech])
                    emis_act_notes.append(EmissionActivity.emis_act_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = EmissionActivity.vintage[location[i_location]]
                year2 = EmissionActivity.vintage[location[i_location + 1]]
                ea1 = EmissionActivity.emis_act[location[i_location]]
                ea2 = EmissionActivity.emis_act[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(EmissionActivity.regions[i_tech])
                        emis_comm.append(EmissionActivity.emis_comm[i_tech])
                        input_comm.append(EmissionActivity.input_comm[i_tech])
                        tech.append(EmissionActivity.tech[i_tech])
                        vintage.append(int(year))
                        output_comm.append(EmissionActivity.output_comm[i_tech])
                        emis_act.append(float(np.format_float_positional(ea1 + (year - year1) / (year2 - year1) * (ea2 - ea1), 2)))
                        emis_act_units.append(EmissionActivity.emis_act_units[i_tech])
                        emis_act_notes.append(EmissionActivity.emis_act_notes[i_tech])

            year_last = EmissionActivity.vintage[location[i_location + 1]]
            eff = EmissionActivity.emis_act[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(EmissionActivity.regions[i_tech])
                        emis_comm.append(EmissionActivity.emis_comm[i_tech])
                        input_comm.append(EmissionActivity.input_comm[i_tech])
                        tech.append(EmissionActivity.tech[i_tech])
                        vintage.append(int(year))
                        output_comm.append(EmissionActivity.output_comm[i_tech])
                        emis_act.append(float(np.format_float_positional(EmissionActivity.emis_act[location[i_location + 1]], 2)))
                        emis_act_units.append(EmissionActivity.emis_act_units[i_tech])
                        emis_act_notes.append(EmissionActivity.emis_act_notes[i_tech])
            else:
                regions.append(EmissionActivity.regions[i_tech])
                emis_comm.append(EmissionActivity.emis_comm[i_tech])
                input_comm.append(EmissionActivity.input_comm[i_tech])
                tech.append(EmissionActivity.tech[i_tech])
                vintage.append(int(year_last))
                output_comm.append(EmissionActivity.output_comm[i_tech])
                emis_act.append(float(np.format_float_positional(EmissionActivity.emis_act[location[i_location + 1]], 2)))
                emis_act_units.append(EmissionActivity.emis_act_units[i_tech])
                emis_act_notes.append(EmissionActivity.emis_act_notes[i_tech])

EmissionActivity_DF_1 = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "emis_comm": pd.Series(emis_comm, dtype='str'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "emis_act": pd.Series(emis_act, dtype='float'),
        "emis_act_units": pd.Series(emis_act_units, dtype='str'),
        "emis_act_notes": pd.Series(emis_act_notes, dtype='str')
    }
)

# CommodityEmissionFactor

regions = list()
emis_comm = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
emis_act = list()
emis_act_units = list()
emis_act_notes = list()

for i_tech in range(0, len(Efficiency.tech)):
    for i_comm in range(0, len(CommodityEmissionFactor.input_comm)):
        if Efficiency.input_comm[i_tech] == CommodityEmissionFactor.input_comm[i_comm]:
            regions.append(Efficiency.regions[i_tech])
            emis_comm.append(CommodityEmissionFactor.emis_comm[i_comm])
            input_comm.append(CommodityEmissionFactor.input_comm[i_comm])
            tech.append(Efficiency.tech[i_tech])
            vintage.append(Efficiency.vintage[i_tech])
            output_comm.append(Efficiency.output_comm[i_tech])
            emis_act.append(float(np.format_float_positional(CommodityEmissionFactor.ef[i_comm] / Efficiency.efficiency[i_tech], 2)))
            emis_act_units.append('[kt/act]')
            emis_act_notes.append('')

EmissionActivity_DF_2 = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "emis_comm": pd.Series(emis_comm, dtype='str'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "emis_act": pd.Series(emis_act, dtype='float'),
        "emis_act_units": pd.Series(emis_act_units, dtype='str'),
        "emis_act_notes": pd.Series(emis_act_notes, dtype='str')
    }
)

# Combining the results

regions = list()
emis_comm = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
emis_act = list()
emis_act_units = list()
emis_act_notes = list()

index1_list = list()
index1_flag = list()
index2_list = list()
index2_flag = list()

for i1 in range(0, len(EmissionActivity_DF_1.tech)):
    index1 = EmissionActivity_DF_1.emis_comm[i1] + EmissionActivity_DF_1.input_comm[i1] + EmissionActivity_DF_1.tech[i1] + str(EmissionActivity_DF_1.vintage[i1]) + EmissionActivity_DF_1.output_comm[i1]
    index1_list.append(index1)

for i2 in range(0, len(EmissionActivity_DF_2.tech)):
    index2 = EmissionActivity_DF_2.emis_comm[i2] + EmissionActivity_DF_2.input_comm[i2] + EmissionActivity_DF_2.tech[i2] + str(EmissionActivity_DF_2.vintage[i2]) + EmissionActivity_DF_2.output_comm[i2]
    index2_list.append(index2)

for i1 in range(0, len(EmissionActivity_DF_1.tech)):
    if index1_list[i1] in index2_list:
        index1_flag.append(1)
    else:
        index1_flag.append(0)

for i2 in range(0, len(EmissionActivity_DF_2.tech)):
    if index2_list[i2] in index1_list:
        index2_flag.append(1)
    else:
        index2_flag.append(0)

flag_delete_1 = list()
for i1 in range(0, len(EmissionActivity_DF_1.tech)):
    if index1_flag[i1] == 0:
        regions.append(EmissionActivity_DF_1.regions[i1])
        emis_comm.append(EmissionActivity_DF_1.emis_comm[i1])
        input_comm.append(EmissionActivity_DF_1.input_comm[i1])
        tech.append(EmissionActivity_DF_1.tech[i1])
        vintage.append(EmissionActivity_DF_1.vintage[i1])
        output_comm.append(EmissionActivity_DF_1.output_comm[i1])
        emis_act.append(float(np.format_float_positional(EmissionActivity_DF_1.emis_act[i1], 2)))
        emis_act_units.append(EmissionActivity_DF_1.emis_act_units[i1])
        emis_act_notes.append(EmissionActivity_DF_1.emis_act_notes[i1])

        flag_delete_1.append(i1)
EmissionActivity_DF_1 = EmissionActivity_DF_1.drop(flag_delete_1)
EmissionActivity_DF_1 = EmissionActivity_DF_1.reset_index(drop=True)

flag_delete_2 = list()
for i2 in range(0, len(EmissionActivity_DF_2.tech)):
    if index2_flag[i2] == 0:
        regions.append(EmissionActivity_DF_2.regions[i2])
        emis_comm.append(EmissionActivity_DF_2.emis_comm[i2])
        input_comm.append(EmissionActivity_DF_2.input_comm[i2])
        tech.append(EmissionActivity_DF_2.tech[i2])
        vintage.append(EmissionActivity_DF_2.vintage[i2])
        output_comm.append(EmissionActivity_DF_2.output_comm[i2])
        emis_act.append(float(np.format_float_positional(EmissionActivity_DF_2.emis_act[i2], 2)))
        emis_act_units.append(EmissionActivity_DF_2.emis_act_units[i2])
        emis_act_notes.append(EmissionActivity_DF_2.emis_act_notes[i2])

        flag_delete_2.append(i2)
EmissionActivity_DF_2 = EmissionActivity_DF_2.drop(flag_delete_2)
EmissionActivity_DF_2 = EmissionActivity_DF_2.reset_index(drop=True)

for i1 in range(0, len(EmissionActivity_DF_1.tech)):
    for i2 in range(0, len(EmissionActivity_DF_2.tech)):
        index1 = EmissionActivity_DF_1.emis_comm[i1] + EmissionActivity_DF_1.input_comm[i1] + EmissionActivity_DF_1.tech[i1] + str(EmissionActivity_DF_1.vintage[i1]) + EmissionActivity_DF_1.output_comm[i1]
        index2 = EmissionActivity_DF_2.emis_comm[i2] + EmissionActivity_DF_2.input_comm[i2] + EmissionActivity_DF_2.tech[i2] + str(EmissionActivity_DF_2.vintage[i2]) + EmissionActivity_DF_2.output_comm[i2]
        if index1 == index2:
            regions.append(EmissionActivity_DF_1.regions[i1])
            emis_comm.append(EmissionActivity_DF_1.emis_comm[i1])
            input_comm.append(EmissionActivity_DF_1.input_comm[i1])
            tech.append(EmissionActivity_DF_1.tech[i1])
            vintage.append(EmissionActivity_DF_1.vintage[i1])
            output_comm.append(EmissionActivity_DF_1.output_comm[i1])
            emis_act.append(float(np.format_float_positional(EmissionActivity_DF_1.emis_act[i1] + EmissionActivity_DF_2.emis_act[i2], 2)))
            emis_act_units.append(EmissionActivity_DF_1.emis_act_units[i1])
            emis_act_notes.append(EmissionActivity_DF_1.emis_act_notes[i1])

EmissionActivity_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "emis_comm": pd.Series(emis_comm, dtype='str'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "emis_act": pd.Series(emis_act, dtype='float'),
        "emis_act_units": pd.Series(emis_act_units, dtype='str'),
        "emis_act_notes": pd.Series(emis_act_notes, dtype='str')
    }
)

EmissionActivity_DF = EmissionActivity_DF.sort_values(by=['tech','vintage'],ignore_index=True)

if tosql_set['EmissionActivity']:
    EmissionActivity_DF.to_sql("EmissionActivity", conn, index=False, if_exists='replace')

if print_set['EmissionActivity']:
    pd.set_option('display.max_rows', len(EmissionActivity_DF))
    pd.set_option('display.max_columns', len(EmissionActivity_DF))
    print("\nEmissionActivity DataFrame\n\n", EmissionActivity_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     EmissionActivity updated...')
else:
    print('[', print_i, '/', len(print_set), ']     EmissionActivity updated...')

# CostInvest

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
CostInvest = pd.read_sql("select * from CostInvest", conn)

regions = list()
tech = list()
vintage = list()
cost_invest = list()
cost_invest_units = list()
cost_invest_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(CostInvest.tech)):
    tech_i = CostInvest.tech[i_tech]

    flag_check = 0
    for check in range(0, len(tech_already_considered)):
        if tech_i == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CostInvest.tech)):
            if CostInvest.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values

            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CostInvest.vintage[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(CostInvest.regions[i_tech])
                    tech.append(CostInvest.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    cost_invest.append(float(np.format_float_scientific(CostInvest.cost_invest[i_tech], 2)))
                    cost_invest_units.append(CostInvest.cost_invest_units[i_tech])
                    cost_invest_notes.append(CostInvest.cost_invest_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = CostInvest.vintage[location[i_location]]
                year2 = CostInvest.vintage[location[i_location + 1]]
                cost1 = CostInvest.cost_invest[location[i_location]]
                cost2 = CostInvest.cost_invest[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(CostInvest.regions[i_tech])
                        tech.append(CostInvest.tech[i_tech])
                        vintage.append(int(year))
                        cost_invest.append(float(np.format_float_scientific(cost1 + (year - year1) / (year2 - year1) * (cost2 - cost1), 2)))
                        cost_invest_units.append(CostInvest.cost_invest_units[i_tech])
                        cost_invest_notes.append(CostInvest.cost_invest_notes[i_tech])

            year_last = CostInvest.vintage[location[i_location + 1]]
            cost = CostInvest.cost_invest[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(CostInvest.regions[i_tech])
                        tech.append(CostInvest.tech[i_tech])
                        vintage.append(int(year))
                        cost_invest.append(float(np.format_float_scientific(CostInvest.cost_invest[location[i_location + 1]], 2)))
                        cost_invest_units.append(CostInvest.cost_invest_units[i_tech])
                        cost_invest_notes.append(CostInvest.cost_invest_notes[i_tech])
            else:
                regions.append(CostInvest.regions[i_tech])
                tech.append(CostInvest.tech[i_tech])
                vintage.append(int(year_last))
                cost_invest.append(float(np.format_float_scientific(CostInvest.cost_invest[location[i_location + 1]], 2)))
                cost_invest_units.append(CostInvest.cost_invest_units[i_tech])
                cost_invest_notes.append(CostInvest.cost_invest_notes[i_tech])

CostInvest_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cost_invest": pd.Series(cost_invest, dtype='float'),
        "cost_invest_units": pd.Series(cost_invest_units, dtype='str'),
        "cost_invest_notes": pd.Series(cost_invest_notes, dtype='str')
    }
)

if tosql_set['CostInvest']:
    CostInvest_DF.to_sql("CostInvest", conn, index=False, if_exists='replace')

if print_set['CostInvest']:
    pd.set_option('display.max_rows', len(CostInvest_DF))
    pd.set_option('display.max_columns', len(CostInvest_DF))
    print("\nCostInvest DataFrame\n\n", CostInvest_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     CostInvest updated...')
else:
    print('[', print_i, '/', len(print_set), ']     CostInvest updated...')

# CostFixed

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
existing_periods = pd.read_sql("select t_periods from time_periods where flag = 'e'", conn)
LifetimeTech = pd.read_sql("select * from LifetimeTech", conn)
LifetimeProcess = pd.read_sql("select * from LifetimeProcess", conn)
CostFixed = pd.read_sql("select * from CostFixed", conn)

regions = list()
periods = list()
tech = list()
vintage = list()
cost_fixed = list()
cost_fixed_units = list()
cost_fixed_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(CostFixed.tech)):
    tech_i = CostFixed.tech[i_tech]

    flag_check = 0
    for check in range(0, len(tech_already_considered)):
        if tech_i == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        lifetime = 0
        year_lifetime = list()
        lifetime_process = list()
        for i_life in range(0, len(LifetimeTech.life)):
            if LifetimeTech.tech[i_life] == tech_i:
                lifetime = LifetimeTech.life[i_life]
        if lifetime == 0:
            for i_life in range(0, len(LifetimeProcess.life_process)):
                if LifetimeProcess.tech[i_life] == tech_i:
                    year_lifetime.append(LifetimeProcess.vintage[i_life])
                    lifetime_process.append(LifetimeProcess.life_process[i_life])
                else:
                    lifetime = lifetime_default

        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CostFixed.tech)):
            if CostFixed.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CostFixed.vintage[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    year_vintage = time_periods.t_periods[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = lifetime_process[i]
                    start = year_vintage
                    stop = year_vintage + lifetime

                    for j_year in range(0, len(time_periods)):
                        year_periods = time_periods.t_periods[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[
                            len(time_periods.t_periods) - 1]:
                            if year_periods > existing_periods.t_periods[len(existing_periods.t_periods) - 1]:
                                regions.append(CostFixed.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostFixed.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_fixed.append(float(np.format_float_scientific(CostFixed.cost_fixed[i_tech], 2)))
                                cost_fixed_units.append(CostFixed.cost_fixed_units[i_tech])
                                cost_fixed_notes.append(CostFixed.cost_fixed_notes[i_tech])

        else:
            year_list = list()
            cost_list = list()
            for i_location in range(0, len(location) - 1):
                year1 = CostFixed.periods[location[i_location]]
                year2 = CostFixed.periods[location[i_location + 1]]
                cost1 = CostFixed.cost_fixed[location[i_location]]
                cost2 = CostFixed.cost_fixed[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        year_list.append(year)
                        cost_list.append(cost1 + (year - year1) / (year2 - year1) * (cost2 - cost1))

            year_last = CostFixed.vintage[location[i_location + 1]]
            cost_last = CostFixed.cost_fixed[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 2]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        year_list.append(year)
                        cost_list.append(cost_last)
            else:
                year_list.append(year_last)
                cost_list.append(cost_last)

            for i_year in range(0, len(year_list)):
                if year_list[i_year] >= CostFixed.vintage[i_tech]:
                    year_vintage = year_list[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = lifetime_process[i]
                    start = year_vintage
                    stop = year_vintage + lifetime

                    for j_year in range(0, len(year_list)):
                        year_periods = year_list[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[
                            len(time_periods.t_periods) - 1]:
                            if year_periods > existing_periods.t_periods[len(existing_periods.t_periods) - 1]:
                                regions.append(CostFixed.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostFixed.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_fixed.append(float(np.format_float_scientific(cost_list[j_year], 2)))
                                cost_fixed_units.append(CostFixed.cost_fixed_units[i_tech])
                                cost_fixed_notes.append(CostFixed.cost_fixed_notes[i_tech])

CostFixed_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cost_fixed": pd.Series(cost_fixed, dtype='float'),
        "cost_fixed_units": pd.Series(cost_fixed_units, dtype='str'),
        "cost_fixed_notes": pd.Series(cost_fixed_notes, dtype='str')
    }
)

if tosql_set['CostFixed']:
    CostFixed_DF.to_sql("CostFixed", conn, index=False, if_exists='replace')

if print_set['CostFixed']:
    pd.set_option('display.max_rows', len(CostFixed_DF))
    pd.set_option('display.max_columns', len(CostFixed_DF))
    print("\nCostFixed DataFrame\n\n", CostFixed_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     CostFixed updated...')
else:
    print('[', print_i, '/', len(print_set), ']     CostFixed updated...')

# CostVariable

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
existing_periods = pd.read_sql("select t_periods from time_periods where flag = 'e'", conn)
LifetimeTech = pd.read_sql("select * from LifetimeTech", conn)
LifetimeProcess = pd.read_sql("select * from LifetimeProcess", conn)
CostVariable = pd.read_sql("select * from CostVariable", conn)

regions = list()
periods = list()
tech = list()
vintage = list()
cost_variable = list()
cost_variable_units = list()
cost_variable_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(CostVariable.tech)):
    tech_i = CostVariable.tech[i_tech]

    flag_check = 0
    for check in range(0, len(tech_already_considered)):
        if tech_i == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        lifetime = 0
        year_lifetime = list()
        lifetime_process = list()
        for i_life in range(0, len(LifetimeTech.life)):
            if LifetimeTech.tech[i_life] == tech_i:
                lifetime = float(LifetimeTech.life[i_life])
        if lifetime == 0:
            for i_life in range(0, len(LifetimeProcess.life_process)):
                if LifetimeProcess.tech[i_life] == tech_i:
                    year_lifetime.append(float(LifetimeProcess.vintage[i_life]))
                    lifetime_process.append(float(LifetimeProcess.life_process[i_life]))
                else:
                    lifetime = lifetime_default

        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CostVariable.tech)):
            if CostVariable.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CostVariable.vintage[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    year_vintage = float(time_periods.t_periods[i_year])
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = float(lifetime_process[i])
                    start = float(year_vintage)
                    stop = float(year_vintage) + lifetime

                    for j_year in range(0, len(time_periods)):
                        year_periods = time_periods.t_periods[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[
                            len(time_periods.t_periods) - 1]:
                            if year_periods > existing_periods.t_periods[len(existing_periods.t_periods) - 1]:
                                regions.append(CostVariable.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostVariable.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_variable.append(float(np.format_float_scientific(CostVariable.cost_variable[i_tech], 2)))
                                cost_variable_units.append(CostVariable.cost_variable_units[i_tech])
                                cost_variable_notes.append(CostVariable.cost_variable_notes[i_tech])

        else:
            year_list = list()
            cost_list = list()
            for i_location in range(0, len(location) - 1):
                year1 = float(CostVariable.periods[location[i_location]])
                year2 = float(CostVariable.periods[location[i_location + 1]])
                cost1 = float(CostVariable.cost_variable[location[i_location]])
                cost2 = float(CostVariable.cost_variable[location[i_location + 1]])

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        year_list.append(year)
                        cost_list.append(cost1 + (year - year1) / (year2 - year1) * (cost2 - cost1))

            year_last = float(CostVariable.vintage[location[i_location + 1]])
            cost_last = float(CostVariable.cost_variable[location[i_location + 1]])
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 2]:  # Different by 2050
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        year_list.append(year)
                        cost_list.append(cost_last)
            else:  # If year_last = 2050
                year_list.append(year_last)
                cost_list.append(cost_last)

            for i_year in range(0, len(year_list)):
                if float(year_list[i_year]) >= float(CostVariable.vintage[i_tech]):
                    year_vintage = year_list[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = float(lifetime_process[i])
                    start = float(year_vintage)
                    stop = float(year_vintage) + lifetime
                    for j_year in range(0, len(year_list)):
                        year_periods = year_list[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[
                            len(time_periods.t_periods) - 1]:
                            if year_periods > existing_periods.t_periods[len(existing_periods.t_periods) - 1]:
                                regions.append(CostVariable.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostVariable.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_variable.append(float(np.format_float_scientific(cost_list[j_year], 2)))
                                cost_variable_units.append(CostVariable.cost_variable_units[i_tech])
                                cost_variable_notes.append(CostVariable.cost_variable_notes[i_tech])

CostVariable_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cost_variable": pd.Series(cost_variable, dtype='float'),
        "cost_variable_units": pd.Series(cost_variable_units, dtype='str'),
        "cost_variable_notes": pd.Series(cost_variable_notes, dtype='str')
    }
)

if tosql_set['CostVariable']:
    CostVariable_DF.to_sql("CostVariable", conn, index=False, if_exists='replace')

if print_set['CostVariable']:
    pd.set_option('display.max_rows', len(CostVariable_DF))
    pd.set_option('display.max_columns', len(CostVariable_DF))
    print("\nCostVariable DataFrame\n\n", CostVariable_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     CostVariable updated...')
else:
    print('[', print_i, '/', len(print_set), ']     CostVariable updated...')

# DiscountRate

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
DiscountRate = pd.read_sql("select * from DiscountRate", conn)

regions = list()
tech = list()
vintage = list()
tech_rate = list()
tech_rate_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(DiscountRate.tech)):
    tech_i = DiscountRate.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(DiscountRate.tech)):
            tech_j_check = DiscountRate.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= DiscountRate.vintage[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(DiscountRate.regions[i_tech])
                    tech.append(DiscountRate.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    tech_rate.append(float(np.format_float_scientific(DiscountRate.tech_rate[i_tech], 2)))
                    tech_rate_notes.append(DiscountRate.tech_rate_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = DiscountRate.vintage[location[i_location]]
                year2 = DiscountRate.vintage[location[i_location + 1]]
                min_cap1 = DiscountRate.tech_rate[location[i_location]]
                min_cap2 = DiscountRate.tech_rate[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(DiscountRate.regions[i_tech])
                        tech.append(DiscountRate.tech[i_tech])
                        vintage.append(int(year))
                        tech_rate.append(float(np.format_float_scientific(min_cap1 + (year - year1) / (year2 - year1) * (min_cap2 - min_cap1), 2)))
                        tech_rate_notes.append(DiscountRate.tech_rate_notes[i_tech])

            year_last = DiscountRate.vintage[location[i_location + 1]]
            min_cap = DiscountRate.tech_rate[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(DiscountRate.regions[i_tech])
                        tech.append(DiscountRate.tech[i_tech])
                        vintage.append(int(year))
                        tech_rate.append(float(np.format_float_scientific(DiscountRate.tech_rate[location[i_location + 1]], 2)))
                        tech_rate_notes.append(DiscountRate.tech_rate_notes[i_tech])

DiscountRate_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "tech_rate": pd.Series(tech_rate, dtype='float'),
        "tech_rate_notes": pd.Series(tech_rate_notes, dtype='str')
    }
)

if tosql_set['DiscountRate']:
    DiscountRate_DF.to_sql("DiscountRate", conn, index=False, if_exists='replace')

if print_set['DiscountRate']:
    pd.set_option('display.max_rows', len(DiscountRate_DF))
    pd.set_option('display.max_columns', len(DiscountRate_DF))
    print("\nDiscountRate DataFrame\n\n", DiscountRate_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     DiscountRate updated...')
else:
    print('[', print_i, '/', len(print_set), ']     DiscountRate updated...')

# MinCapacity

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MinCapacity = pd.read_sql("select * from MinCapacity", conn)

regions = list()
periods = list()
tech = list()
mincap = list()
mincap_units = list()
mincap_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(MinCapacity.tech)):
    tech_i = MinCapacity.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(MinCapacity.tech)):
            tech_j_check = MinCapacity.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= MinCapacity.periods[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MinCapacity.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    tech.append(MinCapacity.tech[i_tech])
                    mincap.append(float(np.format_float_scientific(MinCapacity.mincap[i_tech], 2)))
                    mincap_units.append(MinCapacity.mincap_units[i_tech])
                    mincap_notes.append(MinCapacity.mincap_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MinCapacity.periods[location[i_location]]
                year2 = MinCapacity.periods[location[i_location + 1]]
                min_cap1 = MinCapacity.mincap[location[i_location]]
                min_cap2 = MinCapacity.mincap[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MinCapacity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MinCapacity.tech[i_tech])
                        mincap.append(float(np.format_float_scientific(min_cap1 + (year - year1) / (year2 - year1) * (min_cap2 - min_cap1), 2)))
                        mincap_units.append(MinCapacity.mincap_units[i_tech])
                        mincap_notes.append(MinCapacity.mincap_notes[i_tech])

            year_last = MinCapacity.periods[location[i_location + 1]]
            min_cap = MinCapacity.mincap[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MinCapacity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MinCapacity.tech[i_tech])
                        mincap.append(float(np.format_float_scientific(MinCapacity.mincap[location[i_location + 1]], 2)))
                        mincap_units.append(MinCapacity.mincap_units[i_tech])
                        mincap_notes.append(MinCapacity.mincap_notes[i_tech])

MinCapacity_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "mincap": pd.Series(mincap, dtype='float'),
        "mincap_units": pd.Series(mincap_units, dtype='str'),
        "mincap_notes": pd.Series(mincap_notes, dtype='str')
    }
)

if tosql_set['MinCapacity']:
    MinCapacity_DF.to_sql("MinCapacity", conn, index=False, if_exists='replace')

if print_set['MinCapacity']:
    pd.set_option('display.max_rows', len(MinCapacity_DF))
    pd.set_option('display.max_columns', len(MinCapacity_DF))
    print("\nMinCapacity DataFrame\n\n", MinCapacity_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MinCapacity updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MinCapacity updated...')

# MinActivity

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MinActivity = pd.read_sql("select * from MinActivity", conn)

regions = list()
periods = list()
tech = list()
minact = list()
minact_units = list()
minact_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(MinActivity.tech)):
    tech_i = MinActivity.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(MinActivity.tech)):
            tech_j_check = MinActivity.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= MinActivity.periods[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MinActivity.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    tech.append(MinActivity.tech[i_tech])
                    minact.append(float(np.format_float_scientific(MinActivity.minact[i_tech], 2)))
                    minact_units.append(MinActivity.minact_units[i_tech])
                    minact_notes.append(MinActivity.minact_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MinActivity.periods[location[i_location]]
                year2 = MinActivity.periods[location[i_location + 1]]
                min_act1 = MinActivity.minact[location[i_location]]
                min_act2 = MinActivity.minact[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MinActivity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MinActivity.tech[i_tech])
                        minact.append(float(np.format_float_scientific(min_act1 + (year - year1) / (year2 - year1) * (min_act2 - min_act1), 2)))
                        minact_units.append(MinActivity.minact_units[i_tech])
                        minact_notes.append(MinActivity.minact_notes[i_tech])

            year_last = MinActivity.periods[location[i_location + 1]]
            min_act = MinActivity.minact[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MinActivity.regions[i_tech])
                        periods.append(year)
                        tech.append(MinActivity.tech[i_tech])
                        minact.append(float(np.format_float_scientific(MinActivity.minact[location[i_location + 1]], 2)))
                        minact_units.append(MinActivity.minact_units[i_tech])
                        minact_notes.append(MinActivity.minact_notes[i_tech])

MinActivity_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "minact": pd.Series(minact, dtype='float'),
        "minact_units": pd.Series(minact_units, dtype='str'),
        "minact_notes": pd.Series(minact_notes, dtype='str')
    }
)

if tosql_set['MinActivity']:
    MinActivity_DF.to_sql("MinActivity", conn, index=False, if_exists='replace')

if print_set['MinActivity']:
    pd.set_option('display.max_rows', len(MinActivity_DF))
    pd.set_option('display.max_columns', len(MinActivity_DF))
    print("\nMinActivity DataFrame\n\n", MinActivity_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MinActivity updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MinActivity updated...')

# MaxCapacity

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MaxCapacity = pd.read_sql("select * from MaxCapacity", conn)

regions = list()
periods = list()
tech = list()
maxcap = list()
maxcap_units = list()
maxcap_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(MaxCapacity.tech)):
    tech_i = MaxCapacity.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(MaxCapacity.tech)):
            tech_j_check = MaxCapacity.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= MaxCapacity.periods[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MaxCapacity.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    tech.append(MaxCapacity.tech[i_tech])
                    maxcap.append(float(np.format_float_scientific(MaxCapacity.maxcap[i_tech], 2)))
                    maxcap_units.append(MaxCapacity.maxcap_units[i_tech])
                    maxcap_notes.append(MaxCapacity.maxcap_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MaxCapacity.periods[location[i_location]]
                year2 = MaxCapacity.periods[location[i_location + 1]]
                max_cap1 = MaxCapacity.maxcap[location[i_location]]
                max_cap2 = MaxCapacity.maxcap[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MaxCapacity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MaxCapacity.tech[i_tech])
                        maxcap.append(float(np.format_float_scientific(max_cap1 + (year - year1) / (year2 - year1) * (max_cap2 - max_cap1), 2)))
                        maxcap_units.append(MaxCapacity.maxcap_units[i_tech])
                        maxcap_notes.append(MaxCapacity.maxcap_notes[i_tech])

            year_last = MaxCapacity.periods[location[i_location + 1]]
            max_cap = MaxCapacity.maxcap[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MaxCapacity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MaxCapacity.tech[i_tech])
                        maxcap.append(float(np.format_float_scientific(MaxCapacity.maxcap[location[i_location + 1]], 2)))
                        maxcap_units.append(MaxCapacity.maxcap_units[i_tech])
                        maxcap_notes.append(MaxCapacity.maxcap_notes[i_tech])

MaxCapacity_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "maxcap": pd.Series(maxcap, dtype='float'),
        "maxcap_units": pd.Series(maxcap_units, dtype='str'),
        "maxcap_notes": pd.Series(maxcap_notes, dtype='str')
    }
)

if tosql_set['MaxCapacity']:
    MaxCapacity_DF.to_sql("MaxCapacity", conn, index=False, if_exists='replace')

if print_set['MaxCapacity']:
    pd.set_option('display.max_rows', len(MaxCapacity_DF))
    pd.set_option('display.max_columns', len(MaxCapacity_DF))
    print("\nMaxCapacity DataFrame\n\n", MaxCapacity_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MaxCapacity updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MaxCapacity updated...')

# MaxActivity

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MaxActivity = pd.read_sql("select * from MaxActivity", conn)

regions = list()
periods = list()
tech = list()
maxact = list()
maxact_units = list()
maxact_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(MaxActivity.tech)):
    tech_i = MaxActivity.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(MaxActivity.tech)):
            tech_j_check = MaxActivity.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= MaxActivity.periods[i_tech] and time_periods.t_periods[i_year] != \
                        time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MaxActivity.regions[i_tech])
                    periods.append(int(time_periods.t_periods[i_year]))
                    tech.append(MaxActivity.tech[i_tech])
                    maxact.append(float(np.format_float_scientific(MaxActivity.maxact[i_tech], 2)))
                    maxact_units.append(MaxActivity.maxact_units[i_tech])
                    maxact_notes.append(MaxActivity.maxact_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MaxActivity.periods[location[i_location]]
                year2 = MaxActivity.periods[location[i_location + 1]]
                max_act1 = MaxActivity.maxact[location[i_location]]
                max_act2 = MaxActivity.maxact[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MaxActivity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MaxActivity.tech[i_tech])
                        maxact.append(float(np.format_float_scientific(max_act1 + (year - year1) / (year2 - year1) * (max_act2 - max_act1), 2)))
                        maxact_units.append(MaxActivity.maxact_units[i_tech])
                        maxact_notes.append(MaxActivity.maxact_notes[i_tech])

            year_last = MaxActivity.periods[location[i_location + 1]]
            max_act = MaxActivity.maxact[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MaxActivity.regions[i_tech])
                        periods.append(int(year))
                        tech.append(MaxActivity.tech[i_tech])
                        maxact.append(
                            float(np.format_float_positional(MaxActivity.maxact[location[i_location + 1]], 2)))
                        maxact_units.append(MaxActivity.maxact_units[i_tech])
                        maxact_notes.append(MaxActivity.maxact_notes[i_tech])

MaxActivity_DF = pd.DataFrame(np.transpose([regions, periods, tech, maxact, maxact_units, maxact_notes]),
                              columns=["regions", "periods", "tech", "maxact", "maxact_units", "maxact_notes"]);

MaxActivity_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "maxact": pd.Series(maxact, dtype='float'),
        "maxact_units": pd.Series(maxact_units, dtype='str'),
        "maxact_notes": pd.Series(maxact_notes, dtype='str')
    }
)

if tosql_set['MaxActivity']:
    MaxActivity_DF.to_sql("MaxActivity", conn, index=False, if_exists='replace')

if print_set['MaxActivity']:
    pd.set_option('display.max_rows', len(MaxActivity_DF))
    pd.set_option('display.max_columns', len(MaxActivity_DF))
    print("\nMaxActivity DataFrame\n\n", MaxActivity_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MaxActivity updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MaxActivity updated...')

# MinInputGroup (ONLY INTERPOLATION)

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MinInputGroup = pd.read_sql("select * from MinInputGroup", conn)

regions = list()
periods = list()
input_comm = list()
group_name = list()
gi_min = list()
gi_min_notes = list()

group_name_already_considered = list()
for i_group_name in range(0, len(MinInputGroup.group_name)):
    group_name_i = MinInputGroup.group_name[i_group_name]

    flag_check = 0
    group_name_i_check = MinInputGroup.input_comm[i_group_name] + group_name_i
    for check in range(0, len(group_name_already_considered)):
        if group_name_i_check == group_name_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the group
        flag = 0
        location = list()
        location.append(i_group_name)
        for j_group_name in range(i_group_name + 1, len(MinInputGroup.group_name)):
            group_name_j_check = MinInputGroup.input_comm[j_group_name] + MinInputGroup.group_name[j_group_name]
            if group_name_j_check == group_name_i_check:
                flag = 1
                location.append(j_group_name)
                group_name_already_considered.append(group_name_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] == MinInputGroup.periods[i_group_name] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MinInputGroup.regions[i_group_name])
                    periods.append(int(time_periods.t_periods[i_year]))
                    input_comm.append(MinInputGroup.input_comm[i_group_name])
                    group_name.append(MinInputGroup.group_name[i_group_name])
                    gi_min.append(float(np.format_float_positional(MinInputGroup.gi_min[i_group_name], 3)))
                    gi_min_notes.append(MinInputGroup.gi_min_notes[i_group_name])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MinInputGroup.periods[location[i_location]]
                year2 = MinInputGroup.periods[location[i_location + 1]]
                gi_min1 = MinInputGroup.gi_min[location[i_location]]
                gi_min2 = MinInputGroup.gi_min[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MinInputGroup.regions[i_group_name])
                        periods.append(int(year))
                        input_comm.append(MinInputGroup.input_comm[i_group_name])
                        group_name.append(MinInputGroup.group_name[i_group_name])
                        gi_min.append(float(
                            np.format_float_positional(gi_min1 + (year - year1) / (year2 - year1) * (gi_min2 - gi_min1),
                                                       3)))
                        gi_min_notes.append(MinInputGroup.gi_min_notes[i_group_name])

            year_last = MinInputGroup.periods[location[i_location + 1]]
            max_act = MinInputGroup.gi_min[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year == year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MinInputGroup.regions[i_group_name])
                        periods.append(int(year))
                        input_comm.append(MinInputGroup.input_comm[i_group_name])
                        group_name.append(MinInputGroup.group_name[i_group_name])
                        gi_min.append(
                            float(np.format_float_positional(MinInputGroup.gi_min[location[i_location + 1]], 3)))
                        gi_min_notes.append(MinInputGroup.gi_min_notes[i_group_name])

MinInputGroup_DF = pd.DataFrame(np.transpose([periods, group_name, gi_min, gi_min_notes]),
                                columns=["periods", "group_name", "gi_min", "gi_min_notes"]);

MinInputGroup_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "gi_min": pd.Series(gi_min, dtype='float'),
        "gi_min_notes": pd.Series(gi_min_notes, dtype='str')
    }
)

if tosql_set['MinInputGroup']:
    MinInputGroup_DF.to_sql("MinInputGroup", conn, index=False, if_exists='replace')

if print_set['MinInputGroup']:
    pd.set_option('display.max_rows', len(MinInputGroup_DF))
    pd.set_option('display.max_columns', len(MinInputGroup_DF))
    print("\nMinInputGroup DataFrame\n\n", MinInputGroup_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MinInputGroup updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MinInputGroup updated...')

# MaxInputGroup (ONLY INTERPOLATION)

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MaxInputGroup = pd.read_sql("select * from MaxInputGroup", conn)

regions = list()
periods = list()
input_comm = list()
group_name = list()
gi_max = list()
gi_max_notes = list()

group_name_already_considered = list()
for i_group_name in range(0, len(MaxInputGroup.group_name)):
    group_name_i = MaxInputGroup.group_name[i_group_name]

    flag_check = 0
    group_name_i_check = MaxInputGroup.input_comm[i_group_name] + group_name_i
    for check in range(0, len(group_name_already_considered)):
        if group_name_i_check == group_name_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the group
        flag = 0
        location = list()
        location.append(i_group_name)
        for j_group_name in range(i_group_name + 1, len(MaxInputGroup.group_name)):
            group_name_j_check = MaxInputGroup.input_comm[j_group_name] + MaxInputGroup.group_name[j_group_name]
            if group_name_j_check == group_name_i_check:
                flag = 1
                location.append(j_group_name)
                group_name_already_considered.append(group_name_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] == MaxInputGroup.periods[i_group_name] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MaxInputGroup.regions[i_group_name])
                    periods.append(int(time_periods.t_periods[i_year]))
                    input_comm.append(MaxInputGroup.input_comm[i_group_name])
                    group_name.append(MaxInputGroup.group_name[i_group_name])
                    gi_max.append(float(np.format_float_scientific(MaxInputGroup.gi_max[i_group_name], 3)))
                    gi_max_notes.append(MaxInputGroup.gi_max_notes[i_group_name])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MaxInputGroup.periods[location[i_location]]
                year2 = MaxInputGroup.periods[location[i_location + 1]]
                gi_max1 = MaxInputGroup.gi_max[location[i_location]]
                gi_max2 = MaxInputGroup.gi_max[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MaxInputGroup.regions[i_group_name])
                        periods.append(int(year))
                        input_comm.append(MaxInputGroup.input_comm[i_group_name])
                        group_name.append(MaxInputGroup.group_name[i_group_name])
                        gi_max.append(float(
                            np.format_float_positional(gi_max1 + (year - year1) / (year2 - year1) * (gi_max2 - gi_max1),
                                                       3)))
                        gi_max_notes.append(MaxInputGroup.gi_max_notes[i_group_name])

            year_last = MaxInputGroup.periods[location[i_location + 1]]
            max_act = MaxInputGroup.gi_max[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year == year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MaxInputGroup.regions[i_group_name])
                        periods.append(int(year))
                        input_comm.append(MaxInputGroup.input_comm[i_group_name])
                        group_name.append(MaxInputGroup.group_name[i_group_name])
                        gi_max.append(
                            float(np.format_float_positional(MaxInputGroup.gi_max[location[i_location + 1]], 3)))
                        gi_max_notes.append(MaxInputGroup.gi_max_notes[i_group_name])

MaxInputGroup_DF = pd.DataFrame(np.transpose([periods, group_name, gi_max, gi_max_notes]),
                                columns=["periods", "group_name", "gi_max", "gi_max_notes"]);

MaxInputGroup_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "gi_max": pd.Series(gi_max, dtype='float'),
        "gi_max_notes": pd.Series(gi_max_notes, dtype='str')
    }
)

if tosql_set['MaxInputGroup']:
    MaxInputGroup_DF.to_sql("MaxInputGroup", conn, index=False, if_exists='replace')

if print_set['MaxInputGroup']:
    pd.set_option('display.max_rows', len(MaxInputGroup_DF))
    pd.set_option('display.max_columns', len(MaxInputGroup_DF))
    print("\nMaxInputGroup DataFrame\n\n", MaxInputGroup_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MaxInputGroup updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MaxInputGroup updated...')

# MaxOutputGroup (ONLY INTERPOLATION)

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MaxOutputGroup = pd.read_sql("select * from MaxOutputGroup", conn)

regions = list()
periods = list()
output_comm = list()
group_name = list()
go_max = list()
go_max_notes = list()

group_name_already_considered = list()
for i_group_name in range(0, len(MaxOutputGroup.group_name)):
    group_name_i = MaxOutputGroup.group_name[i_group_name]

    flag_check = 0
    group_name_i_check = MaxOutputGroup.output_comm[i_group_name] + group_name_i
    for check in range(0, len(group_name_already_considered)):
        if group_name_i_check == group_name_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the group
        flag = 0
        location = list()
        location.append(i_group_name)
        for j_group_name in range(i_group_name + 1, len(MaxOutputGroup.group_name)):
            group_name_j_check = MaxOutputGroup.output_comm[j_group_name] + MaxOutputGroup.group_name[j_group_name]
            if group_name_j_check == group_name_i_check:
                flag = 1
                location.append(j_group_name)
                group_name_already_considered.append(group_name_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] == MaxOutputGroup.periods[i_group_name] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(MaxOutputGroup.regions[i_group_name])
                    periods.append(int(time_periods.t_periods[i_year]))
                    output_comm.append(MaxOutputGroup.output_comm[i_group_name])
                    group_name.append(MaxOutputGroup.group_name[i_group_name])
                    go_max.append(float(np.format_float_positional(MaxOutputGroup.go_max[i_group_name], 3)))
                    go_max_notes.append(MaxOutputGroup.go_max_notes[i_group_name])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MaxOutputGroup.periods[location[i_location]]
                year2 = MaxOutputGroup.periods[location[i_location + 1]]
                go_max1 = MaxOutputGroup.go_max[location[i_location]]
                go_max2 = MaxOutputGroup.go_max[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(MaxOutputGroup.regions[i_group_name])
                        periods.append(int(year))
                        output_comm.append(MaxOutputGroup.output_comm[i_group_name])
                        group_name.append(MaxOutputGroup.group_name[i_group_name])
                        go_max.append(float(
                            np.format_float_positional(go_max1 + (year - year1) / (year2 - year1) * (go_max2 - go_max1),
                                                       3)))
                        go_max_notes.append(MaxOutputGroup.go_max_notes[i_group_name])

            year_last = MaxOutputGroup.periods[location[i_location + 1]]
            max_act = MaxOutputGroup.go_max[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year == year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(MaxOutputGroup.regions[i_group_name])
                        periods.append(int(year))
                        output_comm.append(MaxOutputGroup.output_comm[i_group_name])
                        group_name.append(MaxOutputGroup.group_name[i_group_name])
                        go_max.append(
                            float(np.format_float_positional(MaxOutputGroup.go_max[location[i_location + 1]], 3)))
                        go_max_notes.append(MaxOutputGroup.go_max_notes[i_group_name])

MaxOutputGroup_DF = pd.DataFrame(np.transpose([periods, group_name, go_max, go_max_notes]),
                                 columns=["periods", "group_name", "go_max", "go_max_notes"]);

MaxOutputGroup_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "go_max": pd.Series(go_max, dtype='float'),
        "go_max_notes": pd.Series(go_max_notes, dtype='str')
    }
)

if tosql_set['MaxOutputGroup']:
    MaxOutputGroup_DF.to_sql("MaxOutputGroup", conn, index=False, if_exists='replace')

if print_set['MaxOutputGroup']:
    pd.set_option('display.max_rows', len(MaxOutputGroup_DF))
    pd.set_option('display.max_columns', len(MaxOutputGroup_DF))
    print("\nMaxOutputGroup DataFrame\n\n", MaxOutputGroup_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MaxOutputGroup updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MaxOutputGroup updated...')

# MinGenGroupTarget (ONLY INTERPOLATION)

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MinGenGroupTarget = pd.read_sql("select * from MinGenGroupTarget", conn)

periods = list()
group_name = list()
min_act_g = list()
notes = list()

group_name_already_considered = list()
for i_group_name in range(0, len(MinGenGroupTarget.group_name)):
    group_name_i = MinGenGroupTarget.group_name[i_group_name]

    flag_check = 0
    group_name_i_check = group_name_i
    for check in range(0, len(group_name_already_considered)):
        if group_name_i_check == group_name_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the group
        flag = 0
        location = list()
        location.append(i_group_name)
        for j_group_name in range(i_group_name + 1, len(MinGenGroupTarget.group_name)):
            group_name_j_check = MinGenGroupTarget.group_name[j_group_name]
            if group_name_j_check == group_name_i_check:
                flag = 1
                location.append(j_group_name)
                group_name_already_considered.append(group_name_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] == MinGenGroupTarget.periods[i_group_name] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    periods.append(int(time_periods.t_periods[i_year]))
                    group_name.append(MinGenGroupTarget.group_name[i_group_name])
                    min_act_g.append(float(np.format_float_scientific(MinGenGroupTarget.min_act_g[i_group_name], 2)))
                    notes.append(MinGenGroupTarget.notes[i_group_name])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MinGenGroupTarget.periods[location[i_location]]
                year2 = MinGenGroupTarget.periods[location[i_location + 1]]
                min_act_g1 = MinGenGroupTarget.min_act_g[location[i_location]]
                min_act_g2 = MinGenGroupTarget.min_act_g[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        periods.append(int(year))
                        group_name.append(MinGenGroupTarget.group_name[i_group_name])
                        min_act_g.append(float(np.format_float_scientific(min_act_g1 + (year - year1) / (year2 - year1) * (min_act_g2 - min_act_g1), 2)))
                        notes.append(MinGenGroupTarget.notes[i_group_name])

            year_last = MinGenGroupTarget.periods[location[i_location + 1]]
            max_act = MinGenGroupTarget.min_act_g[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year == year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        periods.append(int(year))
                        group_name.append(MinGenGroupTarget.group_name[i_group_name])
                        min_act_g.append(float(np.format_float_scientific(MinGenGroupTarget.min_act_g[location[i_location + 1]], 2)))
                        notes.append(MinGenGroupTarget.notes[i_group_name])

MinGenGroupTarget_DF = pd.DataFrame(np.transpose([periods, group_name, min_act_g, notes]),
                                    columns=["periods", "group_name", "min_act_g", "notes"]);

MinGenGroupTarget_DF = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "group_name": pd.Series(group_name, dtype='str'),
        "min_act_g": pd.Series(min_act_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if tosql_set['MinGenGroupTarget']:
    MinGenGroupTarget_DF.to_sql("MinGenGroupTarget", conn, index=False, if_exists='replace')

if print_set['MinGenGroupTarget']:
    pd.set_option('display.max_rows', len(MinGenGroupTarget_DF))
    pd.set_option('display.max_columns', len(MinGenGroupTarget_DF))
    print("\nMinGenGroupTarget DataFrame\n\n", MinGenGroupTarget_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MinGenGroupTarget updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MinGenGroupTarget updated...')

# MaxGenGroupLimit (ONLY INTERPOLATION)

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
MaxGenGroupLimit = pd.read_sql("select * from MaxGenGroupLimit", conn)

periods = list()
max_group_name = list()
max_act_g = list()
notes = list()

max_group_name_already_considered = list()
for i_max_group_name in range(0, len(MaxGenGroupLimit.max_group_name)):
    max_group_name_i = MaxGenGroupLimit.max_group_name[i_max_group_name]

    flag_check = 0
    max_group_name_i_check = max_group_name_i
    for check in range(0, len(max_group_name_already_considered)):
        if max_group_name_i_check == max_group_name_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the group
        flag = 0
        location = list()
        location.append(i_max_group_name)
        for j_max_group_name in range(i_max_group_name + 1, len(MaxGenGroupLimit.max_group_name)):
            max_group_name_j_check = MaxGenGroupLimit.max_group_name[j_max_group_name]
            if max_group_name_j_check == max_group_name_i_check:
                flag = 1
                location.append(j_max_group_name)
                max_group_name_already_considered.append(max_group_name_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] == MaxGenGroupLimit.periods[i_max_group_name] and \
                        time_periods.t_periods[i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    periods.append(int(time_periods.t_periods[i_year]))
                    max_group_name.append(MaxGenGroupLimit.max_group_name[i_max_group_name])
                    max_act_g.append(float(np.format_float_scientific(MaxGenGroupLimit.max_act_g[i_max_group_name], 2)))
                    notes.append(MaxGenGroupLimit.notes[i_max_group_name])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = MaxGenGroupLimit.periods[location[i_location]]
                year2 = MaxGenGroupLimit.periods[location[i_location + 1]]
                max_act_g1 = MaxGenGroupLimit.max_act_g[location[i_location]]
                max_act_g2 = MaxGenGroupLimit.max_act_g[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        periods.append(int(year))
                        max_group_name.append(MaxGenGroupLimit.max_group_name[i_max_group_name])
                        max_act_g.append(float(np.format_float_scientific(
                            max_act_g1 + (year - year1) / (year2 - year1) * (max_act_g2 - max_act_g1), 2)))
                        notes.append(MaxGenGroupLimit.notes[i_max_group_name])

            year_last = MaxGenGroupLimit.periods[location[i_location + 1]]
            max_act = MaxGenGroupLimit.max_act_g[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year == year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        periods.append(int(year))
                        max_group_name.append(MaxGenGroupLimit.max_group_name[i_max_group_name])
                        max_act_g.append(float(np.format_float_scientific(MaxGenGroupLimit.max_act_g[location[i_location + 1]], 2)))
                        notes.append(MaxGenGroupLimit.notes[i_max_group_name])

MaxGenGroupLimit_DF = pd.DataFrame(np.transpose([periods, max_group_name, max_act_g, notes]),
                                   columns=["periods", "max_group_name", "max_act_g", "notes"]);

MaxGenGroupLimit_DF = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "max_group_name": pd.Series(max_group_name, dtype='str'),
        "max_act_g": pd.Series(max_act_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if tosql_set['MaxGenGroupLimit']:
    MaxGenGroupLimit_DF.to_sql("MaxGenGroupLimit", conn, index=False, if_exists='replace')

if print_set['MaxGenGroupLimit']:
    pd.set_option('display.max_rows', len(MaxGenGroupLimit_DF))
    pd.set_option('display.max_columns', len(MaxGenGroupLimit_DF))
    print("\nMaxGenGroupLimit DataFrame\n\n", MaxGenGroupLimit_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     MaxGenGroupTarget updated...')
else:
    print('[', print_i, '/', len(print_set), ']     MaxGenGroupTarget updated...')

# Demand

conn = sqlite3.connect(database_name)
Allocation = pd.read_sql("select * from Allocation", conn)
Demand = pd.read_sql("select * from Demand", conn)
Driver = pd.read_sql("select * from Driver", conn)
Elasticity = pd.read_sql("select * from Elasticity", conn)
regions=list()
periods=list()
demand_comm=list()
demand=list()
demand_units=list()
demand_notes=list()

for i in range(0, len(Demand.demand_comm)):
    regions.append(Demand.regions[i])
    periods.append(int(Demand.periods[i]))
    demand_comm.append(Demand.demand_comm[i])
    demand.append(Demand.demand[i])
    demand_units.append(Demand.demand_units[i])
    demand_notes.append(Demand.demand_notes[i])
    for j in range(0, len(Allocation.demand_comm)):
        if Allocation.demand_comm[j] == Demand.demand_comm[i]:
            for k in range(0, len(Driver.periods)):
                if Driver.driver_name[k] == Allocation.driver_name[j]:
                    for l in range(0, len(Elasticity.periods)):
                        if Elasticity.demand_comm[l] == Demand.demand_comm[i] and Driver.periods[k] == Elasticity.periods[l]:
                            regions.append(Elasticity.regions[l])
                            periods.append(int(Elasticity.periods[l]))
                            demand_comm.append(Elasticity.demand_comm[l])
                            if not Driver.periods[k] == base_year:
                                demand.append(float(np.format_float_scientific(demand[len(demand)-1]*(1+(Driver.driver[k]/Driver.driver[k-1]-1)*Elasticity.elasticity[l]), 3)))
                                demand_units.append(demand_units[len(demand_units)-1])
                            demand_notes.append('')

Demand_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "demand_comm": pd.Series(demand_comm, dtype='str'),
        "demand": pd.Series(demand, dtype='float'),
        "demand_units": pd.Series(demand_units, dtype='str'),
        "demand_notes": pd.Series(demand_notes, dtype='str')
    }
)

for i in range(0, len(Demand_DF)):
    if Demand_DF.loc[i, lambda df: "periods"] == base_year:
        Demand_DF = Demand_DF.drop(index=[i])

if tosql_set['Demand']:
    Demand_DF.to_sql("Demand", conn, index=False, if_exists='replace')

if print_set['Demand']:
    pd.set_option('display.max_rows', len(Demand_DF))
    pd.set_option('display.max_columns', len(Demand_DF))
    print("\nDemand DataFrame\n\n", Demand_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[',print_i,' /',len(print_set),']     Demand updated...')
else:
    print('[',print_i,'/',len(print_set),']     Demand updated...')



# CapacityFactor

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
CapacityFactor = pd.read_sql("select * from CapacityFactor", conn)

regions = list()
tech = list()
vintage = list()
cf = list()
cf_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(CapacityFactor.tech)):
    tech_i = CapacityFactor.tech[i_tech]

    flag_check = 0
    tech_i_check = tech_i
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CapacityFactor.tech)):
            tech_j_check = CapacityFactor.tech[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CapacityFactor.vintage[i_tech] and time_periods.t_periods[
                    i_year] != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                    regions.append(CapacityFactor.regions[i_tech])
                    tech.append(CapacityFactor.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    cf.append(float(np.format_float_scientific(CapacityFactor.cf[i_tech], 2)))
                    cf_notes.append(CapacityFactor.cf_notes[i_tech])

        else:
            for i_location in range(0, len(location) - 1):
                year1 = CapacityFactor.vintage[location[i_location]]
                year2 = CapacityFactor.vintage[location[i_location + 1]]
                cf1 = CapacityFactor.cf[location[i_location]]
                cf2 = CapacityFactor.cf[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(CapacityFactor.regions[i_tech])
                        tech.append(CapacityFactor.tech[i_tech])
                        vintage.append(int(year))
                        cf.append(float(np.format_float_scientific(cf1 + (year - year1) / (year2 - year1) * (cf2 - cf1), 2)))
                        cf_notes.append(CapacityFactor.cf_notes[i_tech])

            year_last = CapacityFactor.vintage[location[i_location + 1]]
            eff = CapacityFactor.cf[location[i_location + 1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods) - 1]:
                        regions.append(CapacityFactor.regions[i_tech])
                        tech.append(CapacityFactor.tech[i_tech])
                        vintage.append(int(year))
                        cf.append(float(np.format_float_scientific(CapacityFactor.cf[location[i_location + 1]], 2)))
                        cf_notes.append(CapacityFactor.cf_notes[i_tech])
            else:
                regions.append(CapacityFactor.regions[i_tech])
                tech.append(CapacityFactor.tech[i_tech])
                vintage.append(int(year_last))
                cf.append(float(np.format_float_scientific(CapacityFactor.cf[location[i_location + 1]], 2)))
                cf_notes.append(CapacityFactor.cf_notes[i_tech])

CapacityFactor_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cf": pd.Series(cf, dtype='float'),
        "cf_notes": pd.Series(cf_notes, dtype='str')
    }
)

if tosql_set['CapacityFactor']:
    CapacityFactor_DF.to_sql("CapacityFactor", conn, index=False, if_exists='replace')

if print_set['CapacityFactor']:
    pd.set_option('display.max_rows', len(CapacityFactor_DF))
    pd.set_option('display.max_columns', len(CapacityFactor_DF))
    print("\nCapacityFactor DataFrame\n\n", CapacityFactor_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[', print_i, ' /', len(print_set), ']     CapacityFactor updated...')
else:
    print('[', print_i, '/', len(print_set), ']     CapacityFactor updated...')



# CapacityFactorProcess

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
CapacityFactorProcess = pd.read_sql("select * from CapacityFactorProcess", conn)

regions = list()
season_name = list()
tech = list()
vintage = list()
time_of_day_name = list()
cf_process = list()
cf_process_notes = list()

tech_already_considered=list()
for i_tech in range(0, len(CapacityFactorProcess.tech)):
    tech_i = CapacityFactorProcess.tech[i_tech]

    flag_check = 0
    tech_i_check = CapacityFactorProcess.season_name[i_tech] + tech_i + CapacityFactorProcess.time_of_day_name[i_tech]
    for check in range(0, len(tech_already_considered)):
        if tech_i_check == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CapacityFactorProcess.tech)):
            tech_j_check = CapacityFactorProcess.season_name[j_tech] + CapacityFactorProcess.tech[j_tech] + CapacityFactorProcess.time_of_day_name[j_tech]
            if tech_j_check == tech_i_check:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i_check)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CapacityFactorProcess.vintage[i_tech] and time_periods.t_periods[i_year] != time_periods.t_periods[len(time_periods.t_periods)-1]:
                    regions.append(CapacityFactorProcess.regions[i_tech])
                    season_name.append(CapacityFactorProcess.season_name[i_tech])
                    time_of_day_name.append(CapacityFactorProcess.time_of_day_name[i_tech])
                    tech.append(CapacityFactorProcess.tech[i_tech])
                    vintage.append(int(time_periods.t_periods[i_year]))
                    cf_process.append(float(np.format_float_scientific(CapacityFactorProcess.cf_process[i_tech], 2)))
                    cf_process_notes.append(CapacityFactorProcess.cf_process_notes[i_tech])

        else:
            for i_location in range(0, len(location)-1):
                year1 = CapacityFactorProcess.vintage[location[i_location]]
                year2 = CapacityFactorProcess.vintage[location[i_location+1]]
                cf1 = CapacityFactorProcess.cf_process[location[i_location]]
                cf2 = CapacityFactorProcess.cf_process[location[i_location+1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        regions.append(CapacityFactorProcess.regions[i_tech])
                        season_name.append(CapacityFactorProcess.season_name[i_tech])
                        time_of_day_name.append(CapacityFactorProcess.time_of_day_name[i_tech])
                        tech.append(CapacityFactorProcess.tech[i_tech])
                        vintage.append(int(year))
                        cf_process.append(float(np.format_float_scientific(cf1 + (year-year1)/(year2-year1)*(cf2-cf1), 2)))
                        cf_process_notes.append(CapacityFactorProcess.cf_process_notes[i_tech])

            year_last = CapacityFactorProcess.vintage[location[i_location+1]]
            eff = CapacityFactorProcess.cf_process[location[i_location+1]]
            if year_last != time_periods.t_periods[len(time_periods.t_periods)-1]:
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods)-1]:
                        regions.append(CapacityFactorProcess.regions[i_tech])
                        season_name.append(CapacityFactorProcess.season_name[i_tech])
                        time_of_day_name.append(CapacityFactorProcess.time_of_day_name[i_tech])
                        tech.append(CapacityFactorProcess.tech[i_tech])
                        vintage.append(int(year))
                        cf_process.append(float(np.format_float_scientific(CapacityFactorProcess.cf_process[location[i_location + 1]], 2)))
                        cf_process_notes.append(CapacityFactorProcess.cf_process_notes[i_tech])
            else:
                regions.append(CapacityFactorProcess.regions[i_tech])
                season_name.append(CapacityFactorProcess.season_name[i_tech])
                time_of_day_name.append(CapacityFactorProcess.time_of_day_name[i_tech])
                tech.append(CapacityFactorProcess.tech[i_tech])
                vintage.append(int(year_last))
                cf_process.append(float(np.format_float_scientific(CapacityFactorProcess.cf_process[location[i_location + 1]], 2)))
                cf_process_notes.append(CapacityFactorProcess.cf_process_notes[i_tech])

CapacityFactorProcess_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "season_name": pd.Series(season_name, dtype='str'),
        "time_of_day_name": pd.Series(time_of_day_name, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cf_process": pd.Series(cf_process, dtype='float'),
        "cf_process_notes": pd.Series(cf_process_notes, dtype='str')
    }
)

if tosql_set['CapacityFactorProcess']:
    CapacityFactorProcess_DF.to_sql("CapacityFactorProcess", conn, index=False, if_exists='replace')

if print_set['CapacityFactorProcess']:
    pd.set_option('display.max_rows', len(CapacityFactorProcess_DF))
    pd.set_option('display.max_columns', len(CapacityFactorProcess_DF))
    print("\nCapacityFactorProcess DataFrame\n\n", CapacityFactorProcess_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[',print_i,' /',len(print_set),']     CapacityFactorProcess updated...')
else:
    print('[',print_i,'/',len(print_set),']     CapacityFactorProcess updated...')



# CapacityCredit

conn = sqlite3.connect(database_name)
time_periods = pd.read_sql("select * from time_periods", conn)
LifetimeTech = pd.read_sql("select * from LifetimeTech", conn)
LifetimeProcess = pd.read_sql("select * from LifetimeProcess", conn)
CapacityCredit = pd.read_sql("select * from CapacityCredit", conn)

regions = list()
periods = list()
tech = list()
vintage = list()
cf_tech = list()
cf_tech_notes = list()

tech_already_considered = list()
for i_tech in range(0, len(CapacityCredit.tech)):
    tech_i = CapacityCredit.tech[i_tech]

    flag_check = 0
    for check in range(0, len(tech_already_considered)):
        if tech_i == tech_already_considered[check]:
            flag_check = 1

    if flag_check == 0:
        lifetime = 0
        year_lifetime = list()
        lifetime_process = list()
        for i_life in range(0, len(LifetimeTech.life)):
            if LifetimeTech.tech[i_life] == tech_i:
                lifetime = float(LifetimeTech.life[i_life])
        if lifetime == 0:
            for i_life in range(0, len(LifetimeProcess.life_process)):
                if LifetimeProcess.tech[i_life] == tech_i:
                    year_lifetime.append(float(LifetimeProcess.vintage[i_life]))
                    lifetime_process.append(float(LifetimeProcess.life_process[i_life]))
                else:
                    lifetime = lifetime_default

        # Checking if other values are present for the technology
        flag = 0
        location = list()
        location.append(i_tech)
        for j_tech in range(i_tech + 1, len(CapacityCredit.tech)):
            if CapacityCredit.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods.t_periods[i_year] >= CapacityCredit.vintage[i_tech] and time_periods.t_periods[i_year] != time_periods.t_periods[len(time_periods.t_periods)-1]:
                    year_vintage = float(time_periods.t_periods[i_year])
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = float(lifetime_process[i])
                    start = float(year_vintage)
                    stop = float(year_vintage) + lifetime

                    for j_year in range(0, len(time_periods)):
                        year_periods = time_periods.t_periods[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[len(time_periods.t_periods)-1]:
                            regions.append(CapacityCredit.regions[i_tech])
                            periods.append(int(year_periods))
                            tech.append(CapacityCredit.tech[i_tech])
                            vintage.append(int(year_vintage))
                            cf_tech.append(float(np.format_float_scientific(CapacityCredit.cf_tech[i_tech], 2)))
                            cf_tech_notes.append(CapacityCredit.cf_tech_notes[i_tech])

        else:
            year_list = list()
            cost_list = list()
            for i_location in range(0, len(location)-1):
                year1 = float(CapacityCredit.periods[location[i_location]])
                year2 = float(CapacityCredit.periods[location[i_location+1]])
                cost1 = float(CapacityCredit.cf_tech[location[i_location]])
                cost2 = float(CapacityCredit.cf_tech[location[i_location+1]])

                for i_year in range(0, len(time_periods)):
                    year = time_periods.t_periods[i_year]
                    if year1 <= year < year2:
                        year_list.append(year)
                        cost_list.append(cost1 + (year-year1)/(year2-year1)*(cost2-cost1))

            year_last = float(CapacityCredit.vintage[location[i_location+1]])
            cost_last = float(CapacityCredit.cf_tech[location[i_location+1]])
            if year_last != time_periods.t_periods[len(time_periods.t_periods)-2]: # Different by 2050
                for i_year in range(0, len(time_periods.t_periods)):
                    year = time_periods.t_periods[i_year]
                    if year >= year_last and year != time_periods.t_periods[len(time_periods.t_periods)-1]:
                        year_list.append(year)
                        cost_list.append(cost_last)
            else: # If year_last = 2050
                year_list.append(year_last)
                cost_list.append(cost_last)

            for i_year in range(0, len(year_list)):
                if float(year_list[i_year]) >= float(CapacityCredit.vintage[i_tech]):
                    year_vintage = year_list[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = float(lifetime_process[i])
                    start = float(year_vintage)
                    stop = float(year_vintage) + lifetime
                    for j_year in range(0, len(year_list)):
                        year_periods = year_list[j_year]
                        if start <= year_periods < stop and year_periods != time_periods.t_periods[len(time_periods.t_periods)-1]:
                            regions.append(CapacityCredit.regions[i_tech])
                            periods.append(int(year_periods))
                            tech.append(CapacityCredit.tech[i_tech])
                            vintage.append(int(year_vintage))
                            cf_tech.append(float(np.format_float_scientific(cost_list[j_year], 2)))
                            cf_tech_notes.append(CapacityCredit.cf_tech_notes[i_tech])

CapacityCredit_DF = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cf_tech": pd.Series(cf_tech, dtype='float'),
        "cf_tech_notes": pd.Series(cf_tech_notes, dtype='str')
    }
)

if tosql_set['CapacityCredit']:
    CapacityCredit_DF.to_sql("CapacityCredit", conn, index=False, if_exists='replace')

if print_set['CapacityCredit']:
    pd.set_option('display.max_rows', len(CapacityCredit_DF))
    pd.set_option('display.max_columns', len(CapacityCredit_DF))
    print("\nCapacityCredit DataFrame\n\n", CapacityCredit_DF)
    pd.reset_option('display.max_rows')

conn.close()
print_i = print_i + 1
if print_i <= 9:
    print('[',print_i,' /',len(print_set),']     CapacityCredit updated.')
else:
    print('[',print_i,'/',len(print_set),']     CapacityCredit updated.')