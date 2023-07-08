import pandas as pd
import numpy as np
import sqlite3
import time

# Input data and preliminary operations

conn = sqlite3.connect("TEMOA_Italy.sqlite")

lifetime_default = 40
print_i = 0

print_status = True

print_outcome = {'EmissionActivity':        False,
                 'EmissionLimit':           False,
                 'LifetimeProcess':         False,
                 'Efficiency':              False,
                 'TechInputSplit':          False,
                 'TechOutputSplit':         False,
                 'Currency':                False,
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
                 'MinOutputGroup':          False,
                 'MaxOutputGroup':          False,
                 'MinActivityGroup':        False,
                 'MaxActivityGroup':        False,
                 'MinCapacityGroup':        False,
                 'MaxCapacityGroup':        False,
                 'Demand':                  False,
                 'CapacityFactor':          False,
                 'CapacityFactorProcess':   False,
                 'CapacityCredit':          False}

save_tosql = {'EmissionActivity':           True,
              'EmissionLimit':              True,
              'LifetimeProcess':            True,
              'Efficiency':                 True,
              'TechInputSplit':             True,
              'TechOutputSplit':            True,
              'Currency':                   True,
              'CostInvest':                 True,
              'CostFixed':                  True,
              'CostVariable':               True,
              'DiscountRate':               True,
              'MinCapacity':                True,
              'MinActivity':                True,
              'MaxCapacity':                True,
              'MaxActivity':                True,
              'MinInputGroup':              True,
              'MaxInputGroup':              True,
              'MinOutputGroup':             True,
              'MaxOutputGroup':             True,
              'MinActivityGroup':           True,
              'MaxActivityGroup':           True,
              'MinCapacityGroup':           True,
              'MaxCapacityGroup':           True,
              'Demand':                     True,
              'CapacityFactor':             True,
              'CapacityFactorProcess':      True,
              'CapacityCredit':             True}

time_periods = pd.read_sql("SELECT * FROM time_periods", conn)  # Extracting the time_periods
time_periods = time_periods.sort_values(by=['t_periods'], ignore_index=True)
time_periods = time_periods.drop(len(time_periods)-1)  # Removing the last milestone year (it is in time_future but not in time_periods)
time_periods = list(time_periods.t_periods)

time_existing = pd.read_sql("SELECT * FROM time_periods WHERE flag = 'e'", conn)  # Extracting the existing time_periods
time_existing = time_existing.sort_values(by=['t_periods'], ignore_index=True)
time_existing = list(time_existing.t_periods)

time_optimize = pd.read_sql("SELECT * FROM time_periods WHERE flag = 'f'", conn)  # Extracting the future time_periods
time_optimize = time_optimize.sort_values(by=['t_periods'], ignore_index=True)
time_optimize = time_optimize.drop(len(time_optimize)-1)  # Removing the last milestone year (it is in time_future but not in time_optimize)
time_optimize = list(time_optimize.t_periods)

base_year = time_existing[len(time_existing)-1]  # Assuming that the last existing time_period corresponds to the model base year

print('_______________________________________________________________________')
print("{:>62}".format('Output code of database_preprocessing.py:'))

# EmissionActivity

start_time = time.time()

# Evaluating EmissionActivity values from emission factors in the CommodityEmissionFactor table

Efficiency = pd.read_sql("SELECT * FROM Efficiency", conn)  # Loading the Efficiency table from the .SQLite database
CommodityEmissionFactor = pd.read_sql("SELECT * FROM CommodityEmissionFactor", conn)

regions = list()
emis_comm = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
emis_act = list()
emis_act_units = list()
emis_act_notes = list()

for i in range(0, len(CommodityEmissionFactor.input_comm)):
    Efficiency_i = Efficiency[(Efficiency['input_comm'] == CommodityEmissionFactor.input_comm[i])]
    Efficiency_i = Efficiency_i.reset_index(drop=True)
    for j in range(0, len(Efficiency_i.tech)):
        regions.append(Efficiency_i.regions[j])
        emis_comm.append(CommodityEmissionFactor.emis_comm[i])
        input_comm.append(CommodityEmissionFactor.input_comm[i])
        tech.append(Efficiency_i.tech[j])
        vintage.append(Efficiency_i.vintage[j])
        output_comm.append(Efficiency_i.output_comm[j])
        emis_act.append(float(CommodityEmissionFactor.ef[i] / Efficiency_i.efficiency[j]))
        emis_act_units.append('')
        emis_act_notes.append('')

EmissionActivity_CEF = pd.DataFrame(
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

# Merging the interpolated pre-existing EmissionActivity_PEF with EmissionActivity_CEF from CommodityEmissionFactor

EmissionActivity_PEF = pd.read_sql("SELECT * FROM EmissionActivity", conn)

# Extracting the list of all indexes combinations for EmissionActivity_PEF
indexes_PEF = list()
for i in range(0, len(EmissionActivity_PEF)):
    indexes_PEF.append(EmissionActivity_PEF.regions[i] + EmissionActivity_PEF.emis_comm[i] + EmissionActivity_PEF.input_comm[i] +
                       EmissionActivity_PEF.tech[i] + str(EmissionActivity_PEF.vintage[i]) + EmissionActivity_PEF.output_comm[i])
EmissionActivity_PEF['indexes'] = indexes_PEF
indexes_PEF = list(dict.fromkeys(indexes_PEF))  # Removing duplicates

# Extracting the list of all indexes combinations for EmissionActivity_CEF
indexes_CEF = list()
for i in range(0, len(EmissionActivity_CEF)):
    indexes_CEF.append(EmissionActivity_CEF.regions[i] + EmissionActivity_CEF.emis_comm[i] + EmissionActivity_CEF.input_comm[i] +
                       EmissionActivity_CEF.tech[i] + str(EmissionActivity_CEF.vintage[i]) + EmissionActivity_CEF.output_comm[i])
EmissionActivity_CEF['indexes'] = indexes_CEF
indexes_CEF = list(dict.fromkeys(indexes_CEF))  # Removing duplicates

indexes = indexes_PEF + indexes_CEF  # Combining the two indexes lists
indexes = list(dict.fromkeys(indexes))

EmissionActivity = pd.DataFrame({'regions': pd.Series(dtype='str'),
                                 'emis_comm': pd.Series(dtype='str'),
                                 'input_comm': pd.Series(dtype='str'),
                                 'tech': pd.Series(dtype='str'),
                                 'vintage': pd.Series(dtype='int'),
                                 'output_comm': pd.Series(dtype='str'),
                                 'emis_act': pd.Series(dtype='float'),
                                 'emis_act_units': pd.Series(dtype='str'),
                                 'emis_act_notes': pd.Series(dtype='str')})

for i in range(0, len(indexes)):
    EmissionActivity_PEF_i = EmissionActivity_PEF[EmissionActivity_PEF['indexes'] == indexes[i]]
    EmissionActivity_PEF_i = EmissionActivity_PEF_i.reset_index(drop=True)
    EmissionActivity_CEF_i = EmissionActivity_CEF[EmissionActivity_CEF['indexes'] == indexes[i]]
    EmissionActivity_CEF_i = EmissionActivity_CEF_i.reset_index(drop=True)

    if len(EmissionActivity_PEF_i.emis_act) == 0 and len(EmissionActivity_CEF_i.emis_act) == 1:
        EmissionActivity = pd.concat([EmissionActivity, EmissionActivity_CEF_i], ignore_index=True)
    if len(EmissionActivity_PEF_i.emis_act) == 1 and len(EmissionActivity_CEF_i.emis_act) == 0:
        EmissionActivity = pd.concat([EmissionActivity, EmissionActivity_PEF_i], ignore_index=True)
    if len(EmissionActivity_PEF_i.emis_act) == 1 and len(EmissionActivity_CEF_i.emis_act) == 1:
        emis_act = float(EmissionActivity_PEF_i.emis_act[0] + EmissionActivity_CEF_i.emis_act[0])
        if abs(emis_act) >= 1E-2:  # To avoid to include negligible emission factors due to approximations in input data
            EmissionActivity_NewRow = {'regions': EmissionActivity_PEF_i.regions[0],
                                       'emis_comm': EmissionActivity_PEF_i.emis_comm[0],
                                       'input_comm': EmissionActivity_PEF_i.input_comm[0],
                                       'tech': EmissionActivity_PEF_i.tech[0],
                                       'vintage': EmissionActivity_PEF_i.vintage[0],
                                       'output_comm': EmissionActivity_PEF_i.output_comm[0],
                                       'emis_act': emis_act,
                                       'emis_act_units': EmissionActivity_PEF_i.emis_act_units[0],
                                       'emis_act_notes': EmissionActivity_PEF_i.emis_act_notes[0],
                                       'indexes': indexes[i]}
            EmissionActivity = EmissionActivity.append(EmissionActivity_NewRow, ignore_index=True)

EmissionActivity = EmissionActivity.drop(columns=['indexes'])

# Aggregating emissions on aggregated commodities according to EmissionAggregation

EmissionAggregation = pd.read_sql("SELECT * FROM EmissionAggregation", conn)

# Deriving the list of commodity for global emissions
global_comm_list = EmissionAggregation.emis_agg
global_comm_list = list(dict.fromkeys(global_comm_list))

for global_comm in global_comm_list:
    EmissionAggregation_i = EmissionAggregation[EmissionAggregation['emis_agg'] == global_comm]

    # Deriving the list of all the emission commodities associated to the global one
    aggregated_comm_list = EmissionAggregation_i.emis_comm
    aggregated_comm_list = list(dict.fromkeys(aggregated_comm_list))

    EmissionActivity_i = EmissionActivity.loc[EmissionActivity['emis_comm'].isin(aggregated_comm_list)]
    EmissionActivity_i = EmissionActivity_i.reset_index(drop=True)

    # Extracting the list of all indexes combinations for EmissionActivity_i (excluding emis_comm)
    indexes = list()
    for i in range(0, len(EmissionActivity_i)):
        indexes.append(EmissionActivity_i.regions[i] + EmissionActivity_i.input_comm[i] +
                       EmissionActivity_i.tech[i] + str(EmissionActivity_i.vintage[i]) + EmissionActivity_i.output_comm[i])
    EmissionActivity_i['indexes'] = indexes
    indexes = list(dict.fromkeys(indexes))  # Removing duplicates

    for index_i in indexes:
        EmissionActivity_j = EmissionActivity_i[EmissionActivity_i['indexes'] == index_i]
        EmissionActivity_j = EmissionActivity_j.reset_index(drop=True)

        emis_act = 0.0
        for i in range(0, len(EmissionActivity_j.emis_act)):
            EmissionAggregation_j = EmissionAggregation_i[(EmissionAggregation_i['emis_comm'] == EmissionActivity_j.emis_comm[i])]
            EmissionAggregation_j = EmissionAggregation_j.reset_index(drop=True)
            if len(EmissionAggregation_j) != 0:
                emis_act = emis_act + EmissionActivity_j.emis_act[i] * float(EmissionAggregation_j.emis_agg_weight[0])

        if abs(emis_act) >= 1E-2:  # To avoid to include negligible emission factors due to approximations in input data
            EmissionActivity_NewRow = {'regions': EmissionActivity_j.regions[0],
                                       'emis_comm': global_comm,
                                       'input_comm': EmissionActivity_j.input_comm[0],
                                       'tech': EmissionActivity_j.tech[0],
                                       'vintage': EmissionActivity_j.vintage[0],
                                       'output_comm': EmissionActivity_j.output_comm[0],
                                       'emis_act': emis_act,
                                       'emis_act_units': EmissionActivity_j.emis_act_units[0],
                                       'emis_act_notes': EmissionActivity_j.emis_act_notes[0]}
            EmissionActivity = EmissionActivity.append(EmissionActivity_NewRow, ignore_index=True)

# Pre-existing EmissionActivity interpolation (the same algorithm adopted for other vintage indexed parameters)

regions = list()
emis_comm = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
emis_act = list()
emis_act_units = list()
emis_act_notes = list()

# Extracting the list of all indexes combinations for EmissionActivity
indexes = list()
for i in range(0, len(EmissionActivity)):
    indexes.append(EmissionActivity.regions[i] + EmissionActivity.emis_comm[i] + \
                   EmissionActivity.input_comm[i] + EmissionActivity.tech[i] + EmissionActivity.output_comm[i])
EmissionActivity['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    EmissionActivity_i = EmissionActivity[(EmissionActivity['indexes'] == index_i)]
    EmissionActivity_i = EmissionActivity_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(EmissionActivity_i.vintage)):
        if i < len(EmissionActivity_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if EmissionActivity_i.vintage[i] <= x < EmissionActivity_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(EmissionActivity_i.regions[i])
                    emis_comm.append(EmissionActivity_i.emis_comm[i])
                    input_comm.append(EmissionActivity_i.input_comm[i])
                    tech.append(EmissionActivity_i.tech[i])
                    vintage.append(time_periods_i[j])
                    output_comm.append(EmissionActivity_i.output_comm[i])
                    emis_act.append(float(EmissionActivity_i.emis_act[i]))
                    emis_act_units.append(EmissionActivity_i.emis_act_units[i])
                    emis_act_notes.append(EmissionActivity_i.emis_act_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(EmissionActivity_i.regions[i])
                    emis_comm.append(EmissionActivity_i.emis_comm[i])
                    input_comm.append(EmissionActivity_i.input_comm[i])
                    tech.append(EmissionActivity_i.tech[i])
                    vintage.append(time_periods_i[j])
                    output_comm.append(EmissionActivity_i.output_comm[i])
                    emis_act.append(float(EmissionActivity_i.emis_act[i] +
                                            (EmissionActivity_i.emis_act[i + 1] - EmissionActivity_i.emis_act[i]) *
                                            (time_periods_i[j] - EmissionActivity_i.vintage[i]) /
                                            (EmissionActivity_i.vintage[i + 1] - EmissionActivity_i.vintage[i])))
                    emis_act_units.append(EmissionActivity_i.emis_act_units[i])
                    emis_act_notes.append(EmissionActivity_i.emis_act_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= EmissionActivity_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(EmissionActivity_i.regions[i])
                emis_comm.append(EmissionActivity_i.emis_comm[i])
                input_comm.append(EmissionActivity_i.input_comm[i])
                tech.append(EmissionActivity_i.tech[i])
                vintage.append(time_periods_i[j])
                output_comm.append(EmissionActivity_i.output_comm[i])
                emis_act.append(float(EmissionActivity_i.emis_act[i]))
                emis_act_units.append(EmissionActivity_i.emis_act_units[i])
                emis_act_notes.append(EmissionActivity_i.emis_act_notes[i])

# Converting lists into a DataFrame
EmissionActivity = pd.DataFrame(
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

EmissionActivity = EmissionActivity.sort_values(by=['regions', 'tech', 'emis_comm', 'input_comm', 'output_comm', 'vintage'], ignore_index=True)

if save_tosql['EmissionActivity']:
    EmissionActivity.to_sql('EmissionActivity', conn, index=False, if_exists='replace')

if print_outcome['EmissionActivity']:
    pd.set_option('display.max_rows', len(EmissionActivity))
    pd.set_option('display.max_columns', 10)
    print("\nEmissionActivity DataFrame\n\n", EmissionActivity[0:1000])
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']',
                                                                    'EmissionActivity calculated and interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# EmissionLimit

start_time = time.time()

EmissionLimit = pd.read_sql("SELECT * FROM EmissionLimit", conn)  # Loading the EmissionLimit table from the .SQLite database

regions = list()
periods = list()
emis_comm = list()
emis_limit = list()
emis_limit_units = list()
emis_limit_notes = list()

# Extracting the list of all indexes combinations for EmissionLimit
indexes = list()
for i in range(0, len(EmissionLimit)):
    indexes.append(EmissionLimit.regions[i] + EmissionLimit.emis_comm[i])
EmissionLimit['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    EmissionLimit_i = EmissionLimit[(EmissionLimit['indexes'] == index_i)]
    EmissionLimit_i = EmissionLimit_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(EmissionLimit_i.periods)):
        if i < len(EmissionLimit_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if EmissionLimit_i.periods[i] <= x < EmissionLimit_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(EmissionLimit_i.regions[i])
                    periods.append(time_periods_i[j])
                    emis_comm.append(EmissionLimit_i.emis_comm[i])
                    emis_limit.append(float(EmissionLimit_i.emis_limit[i]))
                    emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
                    emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(EmissionLimit_i.regions[i])
                    periods.append(time_periods_i[j])
                    emis_comm.append(EmissionLimit_i.emis_comm[i])
                    emis_limit.append(float(EmissionLimit_i.emis_limit[i] +
                                            (EmissionLimit_i.emis_limit[i + 1] - EmissionLimit_i.emis_limit[i]) *
                                            (time_periods_i[j] - EmissionLimit_i.periods[i]) /
                                            (EmissionLimit_i.periods[i + 1] - EmissionLimit_i.periods[i])))
                    emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
                    emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= EmissionLimit_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(EmissionLimit_i.regions[i])
                periods.append(time_periods_i[j])
                emis_comm.append(EmissionLimit_i.emis_comm[i])
                emis_limit.append(float(EmissionLimit_i.emis_limit[i]))
                emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
                emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])

# Converting lists into a DataFrame
EmissionLimit = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "emis_comm": pd.Series(emis_comm, dtype='str'),
        "emis_limit": pd.Series(emis_limit, dtype='float'),
        "emis_limit_units": pd.Series(emis_limit_units, dtype='str'),
        "emis_limit_notes": pd.Series(emis_limit_notes, dtype='str')
    }
)

if save_tosql['EmissionLimit']:
    EmissionLimit.to_sql('EmissionLimit', conn, index=False, if_exists='replace')

if print_outcome['EmissionLimit']:
    pd.set_option('display.max_rows', len(EmissionLimit))
    pd.set_option('display.max_columns', 10)
    print("\nEmissionLimit DataFrame\n\n", EmissionLimit)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'EmissionLimit interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# LifetimeProcess

start_time = time.time()

LifetimeTech = pd.read_sql("SELECT * FROM LifetimeTech", conn)  # Loading the LifetimeTech table from the .SQLite database (to be used later)
LifetimeProcess = pd.read_sql("SELECT * FROM LifetimeProcess", conn)  # Loading the LifetimeProcess table from the .SQLite database

regions = list()
tech = list()
vintage = list()
life_process = list()
life_process_notes = list()

# Extracting the list of all indexes combinations for LifetimeProcess
indexes = list()
for i in range(0, len(LifetimeProcess)):
    indexes.append(LifetimeProcess.regions[i] + LifetimeProcess.tech[i])
LifetimeProcess['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    LifetimeProcess_i = LifetimeProcess[(LifetimeProcess['indexes'] == index_i)]
    LifetimeProcess_i = LifetimeProcess_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(LifetimeProcess_i.vintage)):
        if i < len(LifetimeProcess_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if LifetimeProcess_i.vintage[i] <= x < LifetimeProcess_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(LifetimeProcess_i.regions[i])
                    tech.append(LifetimeProcess_i.tech[i])
                    vintage.append(time_periods_i[j])
                    life_process.append(int(LifetimeProcess_i.life_process[i]))
                    life_process_notes.append(LifetimeProcess_i.life_process_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(LifetimeProcess_i.regions[i])
                    tech.append(LifetimeProcess_i.tech[i])
                    vintage.append(time_periods_i[j])
                    life_process.append(int(LifetimeProcess_i.life_process[i] +
                                            (LifetimeProcess_i.life_process[i + 1] - LifetimeProcess_i.life_process[i]) *
                                            (time_periods_i[j] - LifetimeProcess_i.vintage[i]) /
                                            (LifetimeProcess_i.vintage[i + 1] - LifetimeProcess_i.vintage[i])))
                    life_process_notes.append(LifetimeProcess_i.life_process_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= LifetimeProcess_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(LifetimeProcess_i.regions[i])
                tech.append(LifetimeProcess_i.tech[i])
                vintage.append(time_periods_i[j])
                life_process.append(int(LifetimeProcess_i.life_process[i]))
                life_process_notes.append(LifetimeProcess_i.life_process_notes[i])

# Converting lists into a DataFrame
LifetimeProcess = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "life_process": pd.Series(life_process, dtype='int'),
        "life_process_notes": pd.Series(life_process_notes, dtype='str')
    }
)

if save_tosql['LifetimeProcess']:
    LifetimeProcess.to_sql('LifetimeProcess', conn, index=False, if_exists='replace')

if print_outcome['LifetimeProcess']:
    pd.set_option('display.max_rows', len(LifetimeProcess))
    pd.set_option('display.max_columns', 10)
    print("\nLifetimeProcess DataFrame\n\n", LifetimeProcess)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'LifetimeProcess interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# Efficiency

start_time = time.time()

Efficiency = pd.read_sql("SELECT * FROM Efficiency", conn)  # Loading the Efficiency table from the .SQLite database

regions = list()
input_comm = list()
tech = list()
vintage = list()
output_comm = list()
efficiency = list()
eff_notes = list()

# Extracting the list of all indexes combinations for Efficiency
indexes = list()
for i in range(0, len(Efficiency)):
    indexes.append(Efficiency.regions[i] + Efficiency.input_comm[i] + Efficiency.tech[i] + Efficiency.output_comm[i])
Efficiency['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    Efficiency_i = Efficiency[(Efficiency['indexes'] == index_i)]
    Efficiency_i = Efficiency_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(Efficiency_i.vintage)):
        if i < len(Efficiency_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if Efficiency_i.vintage[i] <= x < Efficiency_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(Efficiency_i.regions[i])
                    input_comm.append(Efficiency_i.input_comm[i])
                    tech.append(Efficiency_i.tech[i])
                    vintage.append(time_periods_i[j])
                    output_comm.append(Efficiency_i.output_comm[i])
                    efficiency.append(float(Efficiency_i.efficiency[i]))
                    eff_notes.append(Efficiency_i.eff_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(Efficiency_i.regions[i])
                    input_comm.append(Efficiency_i.input_comm[i])
                    tech.append(Efficiency_i.tech[i])
                    vintage.append(time_periods_i[j])
                    output_comm.append(Efficiency_i.output_comm[i])
                    efficiency.append(float(Efficiency_i.efficiency[i] +
                                            (Efficiency_i.efficiency[i + 1] - Efficiency_i.efficiency[i]) *
                                            (time_periods_i[j] - Efficiency_i.vintage[i]) /
                                            (Efficiency_i.vintage[i + 1] - Efficiency_i.vintage[i])))
                    eff_notes.append(Efficiency_i.eff_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= Efficiency_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(Efficiency_i.regions[i])
                input_comm.append(Efficiency_i.input_comm[i])
                tech.append(Efficiency_i.tech[i])
                vintage.append(time_periods_i[j])
                output_comm.append(Efficiency_i.output_comm[i])
                efficiency.append(float(Efficiency_i.efficiency[i]))
                eff_notes.append(Efficiency_i.eff_notes[i])

# Converting lists into a DataFrame
Efficiency = pd.DataFrame(
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

if save_tosql['Efficiency']:
    Efficiency.to_sql('Efficiency', conn, index=False, if_exists='replace')

if print_outcome['Efficiency']:
    pd.set_option('display.max_rows', len(Efficiency))
    pd.set_option('display.max_columns', 10)
    print("\nEfficiency DataFrame\n\n", Efficiency)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'Efficiency interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# TechInputSplit

start_time = time.time()

TechInputSplit = pd.read_sql("SELECT * FROM TechInputSplit", conn)  # Loading the TechInputSplit table from the .SQLite database

regions = list()
periods = list()
input_comm = list()
tech = list()
ti_split = list()
ti_split_notes = list()

# Extracting the list of all indexes combinations for TechInputSplit
indexes = list()
for i in range(0, len(TechInputSplit)):
    indexes.append(TechInputSplit.regions[i] + TechInputSplit.input_comm[i] + TechInputSplit.tech[i])
TechInputSplit['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    TechInputSplit_i = TechInputSplit[(TechInputSplit['indexes'] == index_i)]
    TechInputSplit_i = TechInputSplit_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(TechInputSplit_i.periods)):
        if i < len(TechInputSplit_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if TechInputSplit_i.periods[i] <= x < TechInputSplit_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(TechInputSplit_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(TechInputSplit_i.input_comm[i])
                    tech.append(TechInputSplit_i.tech[i])
                    ti_split.append(float(TechInputSplit_i.ti_split[i]))
                    ti_split_notes.append(TechInputSplit_i.ti_split_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(TechInputSplit_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(TechInputSplit_i.input_comm[i])
                    tech.append(TechInputSplit_i.tech[i])
                    ti_split.append(float(TechInputSplit_i.ti_split[i] +
                                          (TechInputSplit_i.ti_split[i + 1] - TechInputSplit_i.ti_split[i]) *
                                          (time_periods_i[j] - TechInputSplit_i.periods[i]) /
                                          (TechInputSplit_i.periods[i + 1] - TechInputSplit_i.periods[i])))
                    ti_split_notes.append(TechInputSplit_i.ti_split_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= TechInputSplit_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(TechInputSplit_i.regions[i])
                periods.append(time_periods_i[j])
                input_comm.append(TechInputSplit_i.input_comm[i])
                tech.append(TechInputSplit_i.tech[i])
                ti_split.append(float(TechInputSplit_i.ti_split[i]))
                ti_split_notes.append(TechInputSplit_i.ti_split_notes[i])

# Converting lists into a DataFrame
TechInputSplit = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "ti_split": pd.Series(ti_split, dtype='float'),
        "ti_split_notes": pd.Series(ti_split_notes, dtype='str')
    }
)

if save_tosql['TechInputSplit']:
    TechInputSplit.to_sql('TechInputSplit', conn, index=False, if_exists='replace')

if print_outcome['TechInputSplit']:
    pd.set_option('display.max_rows', len(TechInputSplit))
    pd.set_option('display.max_columns', 10)
    print("\nTechInputSplit DataFrame\n\n", TechInputSplit)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'TechInputSplit interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# TechOutputSplit

start_time = time.time()

TechOutputSplit = pd.read_sql("SELECT * FROM TechOutputSplit", conn)  # Loading the TechOutputSplit table from the .SQLite database

regions = list()
periods = list()
tech = list()
output_comm = list()
to_split = list()
to_split_notes = list()

# Extracting the list of all indexes combinations for TechOutputSplit
indexes = list()
for i in range(0, len(TechOutputSplit)):
    indexes.append(TechOutputSplit.regions[i] + TechOutputSplit.tech[i] + TechOutputSplit.output_comm[i])
TechOutputSplit['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    TechOutputSplit_i = TechOutputSplit[(TechOutputSplit['indexes'] == index_i)]
    TechOutputSplit_i = TechOutputSplit_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(TechOutputSplit_i.periods)):
        if i < len(TechOutputSplit_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if TechOutputSplit_i.periods[i] <= x < TechOutputSplit_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(TechOutputSplit_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(TechOutputSplit_i.tech[i])
                    output_comm.append(TechOutputSplit_i.output_comm[i])
                    to_split.append(float(TechOutputSplit_i.to_split[i]))
                    to_split_notes.append(TechOutputSplit_i.to_split_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(TechOutputSplit_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(TechOutputSplit_i.tech[i])
                    output_comm.append(TechOutputSplit_i.output_comm[i])
                    to_split.append(float(TechOutputSplit_i.to_split[i] +
                                          (TechOutputSplit_i.to_split[i + 1] - TechOutputSplit_i.to_split[i]) *
                                          (time_periods_i[j] - TechOutputSplit_i.periods[i]) /
                                          (TechOutputSplit_i.periods[i + 1] - TechOutputSplit_i.periods[i])))
                    to_split_notes.append(TechOutputSplit_i.to_split_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= TechOutputSplit_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(TechOutputSplit_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(TechOutputSplit_i.tech[i])
                output_comm.append(TechOutputSplit_i.output_comm[i])
                to_split.append(float(TechOutputSplit_i.to_split[i]))
                to_split_notes.append(TechOutputSplit_i.to_split_notes[i])

# Converting lists into a DataFrame
TechOutputSplit = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "to_split": pd.Series(to_split, dtype='float'),
        "to_split_notes": pd.Series(to_split_notes, dtype='str')
    }
)

if save_tosql['TechOutputSplit']:
    TechOutputSplit.to_sql('TechOutputSplit', conn, index=False, if_exists='replace')

if print_outcome['TechOutputSplit']:
    pd.set_option('display.max_rows', len(TechOutputSplit))
    pd.set_option('display.max_columns', 10)
    print("\nTechOutputSplit DataFrame\n\n", TechOutputSplit)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'TechOutputSplit interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# Currency  (from the previous database_preprocessing.py)

start_time = time.time()

Currency = pd.read_sql("SELECT * FROM Currency", conn)
CurrencyTech = pd.read_sql("SELECT * FROM CurrencyTech", conn)
CostInvest = pd.read_sql("SELECT * FROM CostInvest", conn)
CostFixed = pd.read_sql("SELECT * FROM CostFixed", conn)
CostVariable = pd.read_sql("SELECT * FROM CostVariable", conn)

for i_Currency in range(0, len(Currency.ref)):
    if str(Currency.ref[i_Currency]) == 'REF':
        reference = Currency.value[i_Currency]

regions = list()
tech = list()
vintage = list()
cost_invest = list()
cost_invest_units = list()
cost_invest_notes = list()

for i_cost in range(0, len(CostInvest.tech)):
    flag_tech = 0
    for i_CurrencyTech in range(0, len(CurrencyTech.tech)):
        if CostInvest.tech[i_cost] == CurrencyTech.tech[i_CurrencyTech]:
            flag_curr = 0
            for i_Currency in range(0, len(Currency.curr)):
                if CurrencyTech.curr[i_CurrencyTech] == Currency.curr[i_Currency]:
                    regions.append(CostInvest.regions[i_cost])
                    tech.append(CostInvest.tech[i_cost])
                    vintage.append(int(CostInvest.vintage[i_cost]))
                    cost_invest.append(float(np.format_float_scientific(CostInvest.cost_invest[i_cost] * Currency.value[i_Currency] / reference)))
                    cost_invest_units.append(CostInvest.cost_invest_units[i_cost])
                    cost_invest_notes.append(CostInvest.cost_invest_notes[i_cost])
                    flag_tech = 1
                    flag_curr = 1
            if flag_curr == 0:
                print('WARNING: The technology "' + CurrencyTech.tech[i_CurrencyTech] + '" is associated to a Currency not included in the table "Currency".')
    if flag_tech == 0:
        regions.append(CostInvest.regions[i_cost])
        tech.append(CostInvest.tech[i_cost])
        vintage.append(int(CostInvest.vintage[i_cost]))
        cost_invest.append(float(CostInvest.cost_invest[i_cost]))
        cost_invest_units.append(CostInvest.cost_invest_units[i_cost])
        cost_invest_notes.append(CostInvest.cost_invest_notes[i_cost])

CostInvest = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cost_invest": pd.Series(cost_invest, dtype='float'),
        "cost_invest_units": pd.Series(cost_invest_units, dtype='str'),
        "cost_invest_notes": pd.Series(cost_invest_notes, dtype='str')
    }
)

if save_tosql['Currency']:
    CostInvest.to_sql("CostInvest", conn, index=False, if_exists='replace')

if print_outcome['CostInvest']:
    pd.set_option('display.max_rows', len(CostInvest))
    pd.set_option('display.max_columns', 10)
    print("\nCostInvest DataFrame\n\n", CostInvest)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

regions = list()
periods = list()
tech = list()
vintage = list()
cost_variable = list()
cost_variable_units = list()
cost_variable_notes = list()

for i_cost in range(0, len(CostVariable.tech)):
    flag_tech = 0
    for i_CurrencyTech in range(0, len(CurrencyTech.tech)):
        if CostVariable.tech[i_cost] == CurrencyTech.tech[i_CurrencyTech]:
            flag_curr = 0
            for i_Currency in range(0, len(Currency.curr)):
                if CurrencyTech.curr[i_CurrencyTech] == Currency.curr[i_Currency]:
                    regions.append(CostVariable.regions[i_cost])
                    periods.append(int(CostVariable.periods[i_cost]))
                    tech.append(CostVariable.tech[i_cost])
                    vintage.append(int(CostVariable.vintage[i_cost]))
                    cost_variable.append(float(np.format_float_scientific(CostVariable.cost_variable[i_cost] * Currency.value[i_Currency] / reference)))
                    cost_variable_units.append(CostVariable.cost_variable_units[i_cost])
                    cost_variable_notes.append(CostVariable.cost_variable_notes[i_cost])
                    flag_tech = 1
                    flag_curr = 1
            if flag_curr == 0:
                print('WARNING: The technology "' + CurrencyTech.tech[i_CurrencyTech] + '" is associated to a Currency not included in the table "Currency".')
    if flag_tech == 0:
        regions.append(CostVariable.regions[i_cost])
        periods.append(int(CostVariable.periods[i_cost]))
        tech.append(CostVariable.tech[i_cost])
        vintage.append(int(CostVariable.vintage[i_cost]))
        cost_variable.append(float(CostVariable.cost_variable[i_cost]))
        cost_variable_units.append(CostVariable.cost_variable_units[i_cost])
        cost_variable_notes.append(CostVariable.cost_variable_notes[i_cost])

CostVariable = pd.DataFrame(
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

if save_tosql['Currency']:
    CostVariable.to_sql("CostVariable", conn, index=False, if_exists='replace')

if print_outcome['CostVariable']:
    pd.set_option('display.max_rows', len(CostVariable))
    pd.set_option('display.max_columns', 10)
    print("\nCostVariable DataFrame\n\n", CostVariable)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

regions = list()
periods = list()
tech = list()
vintage = list()
cost_fixed = list()
cost_fixed_units = list()
cost_fixed_notes = list()

for i_cost in range(0, len(CostFixed.tech)):
    flag_tech = 0
    for i_CurrencyTech in range(0, len(CurrencyTech.tech)):
        if CostFixed.tech[i_cost] == CurrencyTech.tech[i_CurrencyTech]:
            flag_curr = 0
            for i_Currency in range(0, len(Currency.curr)):
                if CurrencyTech.curr[i_CurrencyTech] == Currency.curr[i_Currency]:
                    regions.append(CostFixed.regions[i_cost])
                    periods.append(int(CostFixed.periods[i_cost]))
                    tech.append(CostFixed.tech[i_cost])
                    vintage.append(int(CostFixed.vintage[i_cost]))
                    cost_fixed.append(float(np.format_float_scientific(CostFixed.cost_fixed[i_cost] * Currency.value[i_Currency] / reference)))
                    cost_fixed_units.append(CostFixed.cost_fixed_units[i_cost])
                    cost_fixed_notes.append(CostFixed.cost_fixed_notes[i_cost])
                    flag_tech = 1
                    flag_curr = 1
            if flag_curr == 0:
                print('WARNING: The technology "' + CurrencyTech.tech[i_CurrencyTech] + '" is associated to a Currency not included in the table "Currency".')
    if flag_tech == 0:
        regions.append(CostFixed.regions[i_cost])
        periods.append(int(CostFixed.periods[i_cost]))
        tech.append(CostFixed.tech[i_cost])
        vintage.append(int(CostFixed.vintage[i_cost]))
        cost_fixed.append(float(CostFixed.cost_fixed[i_cost]))
        cost_fixed_units.append(CostFixed.cost_fixed_units[i_cost])
        cost_fixed_notes.append(CostFixed.cost_fixed_notes[i_cost])

CostFixed = pd.DataFrame(
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

if save_tosql['Currency']:
    CostFixed.to_sql("CostFixed", conn, index=False, if_exists='replace')

if print_outcome['CostFixed']:
    pd.set_option('display.max_rows', len(CostFixed))
    pd.set_option('display.max_columns', 10)
    print("\nCostFixed DataFrame\n\n", CostFixed)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'Currency updated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CostInvest

start_time = time.time()

CostInvest = pd.read_sql("SELECT * FROM CostInvest", conn)  # Loading the CostInvest table from the .SQLite database

regions = list()
tech = list()
vintage = list()
cost_invest = list()
cost_invest_units = list()
cost_invest_notes = list()

# Extracting the list of all indexes combinations for CostInvest
indexes = list()
for i in range(0, len(CostInvest)):
    indexes.append(CostInvest.regions[i] + CostInvest.tech[i])
CostInvest['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    CostInvest_i = CostInvest[(CostInvest['indexes'] == index_i)]
    CostInvest_i = CostInvest_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(CostInvest_i.vintage)):
        if i < len(CostInvest_i.vintage) - 1:  # Interpolation
            # Extracting time vintage involved in the interpolation
            time_periods_i = [x for x in time_periods if CostInvest_i.vintage[i] <= x < CostInvest_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(CostInvest_i.regions[i])
                    tech.append(CostInvest_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cost_invest.append(float(CostInvest_i.cost_invest[i]))
                    cost_invest_units.append(CostInvest_i.cost_invest_units[i])
                    cost_invest_notes.append(CostInvest_i.cost_invest_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(CostInvest_i.regions[i])
                    tech.append(CostInvest_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cost_invest.append(float(CostInvest_i.cost_invest[i] +
                                             (CostInvest_i.cost_invest[i + 1] - CostInvest_i.cost_invest[i]) *
                                             (time_periods_i[j] - CostInvest_i.vintage[i]) /
                                             (CostInvest_i.vintage[i + 1] - CostInvest_i.vintage[i])))
                    cost_invest_units.append(CostInvest_i.cost_invest_units[i])
                    cost_invest_notes.append(CostInvest_i.cost_invest_notes[i])
        else:  # Extrapolation
            # Extracting time vintage involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= CostInvest_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(CostInvest_i.regions[i])
                tech.append(CostInvest_i.tech[i])
                vintage.append(time_periods_i[j])
                cost_invest.append(float(CostInvest_i.cost_invest[i]))
                cost_invest_units.append(CostInvest_i.cost_invest_units[i])
                cost_invest_notes.append(CostInvest_i.cost_invest_notes[i])

# Converting lists into a DataFrame
CostInvest = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cost_invest": pd.Series(cost_invest, dtype='float'),
        "cost_invest_units": pd.Series(cost_invest_units, dtype='str'),
        "cost_invest_notes": pd.Series(cost_invest_notes, dtype='str')
    }
)

if save_tosql['CostInvest']:
    CostInvest.to_sql('CostInvest', conn, index=False, if_exists='replace')

if print_outcome['CostInvest']:
    pd.set_option('display.max_rows', len(CostInvest))
    pd.set_option('display.max_columns', 10)
    print("\nCostInvest DataFrame\n\n", CostInvest)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CostInvest interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CostFixed (adaptation of the previous database_preprocessing.py)

start_time = time.time()

CostFixed = pd.read_sql("SELECT * FROM CostFixed", conn)

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
                if time_periods[i_year] >= CostFixed.vintage[i_tech]:
                    year_vintage = time_periods[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = lifetime_process[i]
                    start = year_vintage
                    stop = year_vintage + lifetime

                    for j_year in range(0, len(time_periods)):
                        year_periods = time_periods[j_year]
                        if start <= year_periods < stop:
                            if year_periods > time_existing[len(time_existing) - 1]:
                                regions.append(CostFixed.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostFixed.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_fixed.append(float(np.format_float_scientific(CostFixed.cost_fixed[i_tech])))
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
                    year = time_periods[i_year]
                    if year1 <= year < year2:
                        year_list.append(year)
                        cost_list.append(cost1 + (year - year1) / (year2 - year1) * (cost2 - cost1))

            year_last = CostFixed.vintage[location[i_location + 1]]
            cost_last = CostFixed.cost_fixed[location[i_location + 1]]
            if year_last != time_periods[len(time_periods) - 2]:
                for i_year in range(0, len(time_periods)):
                    year = time_periods[i_year]
                    if year >= year_last:
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
                        if start <= year_periods < stop:
                            if year_periods > time_existing[len(time_existing) - 1]:
                                regions.append(CostFixed.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostFixed.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_fixed.append(float(np.format_float_scientific(cost_list[j_year])))
                                cost_fixed_units.append(CostFixed.cost_fixed_units[i_tech])
                                cost_fixed_notes.append(CostFixed.cost_fixed_notes[i_tech])

CostFixed = pd.DataFrame(
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

if save_tosql['CostFixed']:
    CostFixed.to_sql('CostFixed', conn, index=False, if_exists='replace')

if print_outcome['CostFixed']:
    pd.set_option('display.max_rows', len(CostFixed))
    pd.set_option('display.max_columns', 10)
    print("\nCostFixed DataFrame\n\n", CostFixed)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CostFixed interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CostVariable (adaptation of the previous database_preprocessing.py)

start_time = time.time()

CostVariable = pd.read_sql("SELECT * FROM CostVariable", conn)

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
        for j_tech in range(i_tech + 1, len(CostVariable.tech)):
            if CostVariable.tech[j_tech] == tech_i:
                flag = 1
                location.append(j_tech)
                tech_already_considered.append(tech_i)

        if flag == 0:  # No other values
            for i_year in range(0, len(time_periods)):
                if time_periods[i_year] >= CostVariable.vintage[i_tech]:
                    year_vintage = time_periods[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = lifetime_process[i]
                    start = year_vintage
                    stop = year_vintage + lifetime

                    for j_year in range(0, len(time_periods)):
                        year_periods = time_periods[j_year]
                        if start <= year_periods < stop:
                            if year_periods > time_existing[len(time_existing) - 1]:
                                regions.append(CostVariable.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostVariable.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_variable.append(float(np.format_float_scientific(CostVariable.cost_variable[i_tech])))
                                cost_variable_units.append(CostVariable.cost_variable_units[i_tech])
                                cost_variable_notes.append(CostVariable.cost_variable_notes[i_tech])

        else:
            year_list = list()
            cost_list = list()
            for i_location in range(0, len(location) - 1):
                year1 = CostVariable.periods[location[i_location]]
                year2 = CostVariable.periods[location[i_location + 1]]
                cost1 = CostVariable.cost_variable[location[i_location]]
                cost2 = CostVariable.cost_variable[location[i_location + 1]]

                for i_year in range(0, len(time_periods)):
                    year = time_periods[i_year]
                    if year1 <= year < year2:
                        year_list.append(year)
                        cost_list.append(cost1 + (year - year1) / (year2 - year1) * (cost2 - cost1))

            year_last = CostVariable.vintage[location[i_location + 1]]
            cost_last = CostVariable.cost_variable[location[i_location + 1]]
            if year_last != time_periods[len(time_periods) - 2]:
                for i_year in range(0, len(time_periods)):
                    year = time_periods[i_year]
                    if year >= year_last:
                        year_list.append(year)
                        cost_list.append(cost_last)
            else:
                year_list.append(year_last)
                cost_list.append(cost_last)

            for i_year in range(0, len(year_list)):
                if year_list[i_year] >= CostVariable.vintage[i_tech]:
                    year_vintage = year_list[i_year]
                    for i in range(0, len(year_lifetime)):
                        if year_vintage == year_lifetime[i]:
                            lifetime = lifetime_process[i]
                    start = year_vintage
                    stop = year_vintage + lifetime

                    for j_year in range(0, len(year_list)):
                        year_periods = year_list[j_year]
                        if start <= year_periods < stop and year_periods != time_periods[
                            len(time_periods) - 1]:
                            if year_periods > time_existing[len(time_existing) - 1]:
                                regions.append(CostVariable.regions[i_tech])
                                periods.append(int(year_periods))
                                tech.append(CostVariable.tech[i_tech])
                                vintage.append(int(year_vintage))
                                cost_variable.append(float(np.format_float_scientific(cost_list[j_year])))
                                cost_variable_units.append(CostVariable.cost_variable_units[i_tech])
                                cost_variable_notes.append(CostVariable.cost_variable_notes[i_tech])

CostVariable = pd.DataFrame(
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

if save_tosql['CostVariable']:
    CostVariable.to_sql('CostVariable', conn, index=False, if_exists='replace')

if print_outcome['CostVariable']:
    pd.set_option('display.max_rows', len(CostVariable))
    pd.set_option('display.max_columns', 10)
    print("\nCostVariable DataFrame\n\n", CostVariable)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CostVariable interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# DiscountRate

start_time = time.time()

DiscountRate = pd.read_sql("SELECT * FROM DiscountRate", conn)  # Loading the DiscountRate table from the .SQLite database

regions = list()
tech = list()
vintage = list()
tech_rate = list()
tech_rate_notes = list()

# Extracting the list of all indexes combinations for DiscountRate
indexes = list()
for i in range(0, len(DiscountRate)):
    indexes.append(DiscountRate.regions[i] + DiscountRate.tech[i])
DiscountRate['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    DiscountRate_i = DiscountRate[(DiscountRate['indexes'] == index_i)]
    DiscountRate_i = DiscountRate_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(DiscountRate_i.vintage)):
        if i < len(DiscountRate_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if DiscountRate_i.vintage[i] <= x < DiscountRate_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(DiscountRate_i.regions[i])
                    tech.append(DiscountRate_i.tech[i])
                    vintage.append(time_periods_i[j])
                    tech_rate.append(float(DiscountRate_i.tech_rate[i]))
                    tech_rate_notes.append(DiscountRate_i.tech_rate_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(DiscountRate_i.regions[i])
                    tech.append(DiscountRate_i.tech[i])
                    vintage.append(time_periods_i[j])
                    tech_rate.append(float(DiscountRate_i.tech_rate[i] +
                                           (DiscountRate_i.tech_rate[i + 1] - DiscountRate_i.tech_rate[i]) *
                                           (time_periods_i[j] - DiscountRate_i.vintage[i]) /
                                           (DiscountRate_i.vintage[i + 1] - DiscountRate_i.vintage[i])))
                    tech_rate_notes.append(DiscountRate_i.tech_rate_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= DiscountRate_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(DiscountRate_i.regions[i])
                tech.append(DiscountRate_i.tech[i])
                vintage.append(time_periods_i[j])
                tech_rate.append(float(DiscountRate_i.tech_rate[i]))
                tech_rate_notes.append(DiscountRate_i.tech_rate_notes[i])

# Converting lists into a DataFrame
DiscountRate = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "tech_rate": pd.Series(tech_rate, dtype='float'),
        "tech_rate_notes": pd.Series(tech_rate_notes, dtype='str')
    }
)

if save_tosql['DiscountRate']:
    DiscountRate.to_sql('DiscountRate', conn, index=False, if_exists='replace')

if print_outcome['DiscountRate']:
    pd.set_option('display.max_rows', len(DiscountRate))
    pd.set_option('display.max_columns', 10)
    print("\nDiscountRate DataFrame\n\n", DiscountRate)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'DiscountRate interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinCapacity

start_time = time.time()

MinCapacity = pd.read_sql("SELECT * FROM MinCapacity", conn)  # Loading the MinCapacity table from the .SQLite database

regions = list()
periods = list()
tech = list()
mincap = list()
mincap_units = list()
mincap_notes = list()

# Extracting the list of all indexes combinations for MinCapacity
indexes = list()
for i in range(0, len(MinCapacity)):
    indexes.append(MinCapacity.regions[i] + MinCapacity.tech[i])
MinCapacity['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    MinCapacity_i = MinCapacity[(MinCapacity['indexes'] == index_i)]
    MinCapacity_i = MinCapacity_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinCapacity_i.periods)):
        if i < len(MinCapacity_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinCapacity_i.periods[i] <= x < MinCapacity_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MinCapacity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MinCapacity_i.tech[i])
                    mincap.append(float(MinCapacity_i.mincap[i]))
                    mincap_units.append(MinCapacity_i.mincap_units[i])
                    mincap_notes.append(MinCapacity_i.mincap_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MinCapacity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MinCapacity_i.tech[i])
                    mincap.append(float(MinCapacity_i.mincap[i] +
                                        (MinCapacity_i.mincap[i + 1] - MinCapacity_i.mincap[i]) *
                                        (time_periods_i[j] - MinCapacity_i.periods[i]) /
                                        (MinCapacity_i.periods[i + 1] - MinCapacity_i.periods[i])))
                    mincap_units.append(MinCapacity_i.mincap_units[i])
                    mincap_notes.append(MinCapacity_i.mincap_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= MinCapacity_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MinCapacity_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(MinCapacity_i.tech[i])
                mincap.append(float(MinCapacity_i.mincap[i]))
                mincap_units.append(MinCapacity_i.mincap_units[i])
                mincap_notes.append(MinCapacity_i.mincap_notes[i])

# Converting lists into a DataFrame
MinCapacity = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "mincap": pd.Series(mincap, dtype='float'),
        "mincap_units": pd.Series(mincap_units, dtype='str'),
        "mincap_notes": pd.Series(mincap_notes, dtype='str')
    }
)

if save_tosql['MinCapacity']:
    MinCapacity.to_sql('MinCapacity', conn, index=False, if_exists='replace')

if print_outcome['MinCapacity']:
    pd.set_option('display.max_rows', len(MinCapacity))
    pd.set_option('display.max_columns', 10)
    print("\nMinCapacity DataFrame\n\n", MinCapacity)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinCapacity interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinActivity

start_time = time.time()

MinActivity = pd.read_sql("SELECT * FROM MinActivity", conn)  # Loading the MinActivity table from the .SQLite database

regions = list()
periods = list()
tech = list()
minact = list()
minact_units = list()
minact_notes = list()

# Extracting the list of all indexes combinations for MinActivity
indexes = list()
for i in range(0, len(MinActivity)):
    indexes.append(MinActivity.regions[i] + MinActivity.tech[i])
MinActivity['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    MinActivity_i = MinActivity[(MinActivity['indexes'] == index_i)]
    MinActivity_i = MinActivity_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinActivity_i.periods)):
        if i < len(MinActivity_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinActivity_i.periods[i] <= x < MinActivity_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MinActivity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MinActivity_i.tech[i])
                    minact.append(float(MinActivity_i.minact[i]))
                    minact_units.append(MinActivity_i.minact_units[i])
                    minact_notes.append(MinActivity_i.minact_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MinActivity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MinActivity_i.tech[i])
                    minact.append(float(MinActivity_i.minact[i] +
                                        (MinActivity_i.minact[i + 1] - MinActivity_i.minact[i]) *
                                        (time_periods_i[j] - MinActivity_i.periods[i]) /
                                        (MinActivity_i.periods[i + 1] - MinActivity_i.periods[i])))
                    minact_units.append(MinActivity_i.minact_units[i])
                    minact_notes.append(MinActivity_i.minact_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= MinActivity_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MinActivity_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(MinActivity_i.tech[i])
                minact.append(float(MinActivity_i.minact[i]))
                minact_units.append(MinActivity_i.minact_units[i])
                minact_notes.append(MinActivity_i.minact_notes[i])

# Converting lists into a DataFrame
MinActivity = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "minact": pd.Series(minact, dtype='float'),
        "minact_units": pd.Series(minact_units, dtype='str'),
        "minact_notes": pd.Series(minact_notes, dtype='str')
    }
)

if save_tosql['MinActivity']:
    MinActivity.to_sql('MinActivity', conn, index=False, if_exists='replace')

if print_outcome['MinActivity']:
    pd.set_option('display.max_rows', len(MinActivity))
    pd.set_option('display.max_columns', 10)
    print("\nMinActivity DataFrame\n\n", MinActivity)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinActivity interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxCapacity

start_time = time.time()

MaxCapacity = pd.read_sql("SELECT * FROM MaxCapacity", conn)  # Loading the MaxCapacity table from the .SQLite database

regions = list()
periods = list()
tech = list()
maxcap = list()
maxcap_units = list()
maxcap_notes = list()

# Extracting the list of all indexes combinations for MaxCapacity
indexes = list()
for i in range(0, len(MaxCapacity)):
    indexes.append(MaxCapacity.regions[i] + MaxCapacity.tech[i])
MaxCapacity['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    MaxCapacity_i = MaxCapacity[(MaxCapacity['indexes'] == index_i)]
    MaxCapacity_i = MaxCapacity_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxCapacity_i.periods)):
        if i < len(MaxCapacity_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxCapacity_i.periods[i] <= x < MaxCapacity_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MaxCapacity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MaxCapacity_i.tech[i])
                    maxcap.append(float(MaxCapacity_i.maxcap[i]))
                    maxcap_units.append(MaxCapacity_i.maxcap_units[i])
                    maxcap_notes.append(MaxCapacity_i.maxcap_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MaxCapacity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MaxCapacity_i.tech[i])
                    maxcap.append(float(MaxCapacity_i.maxcap[i] +
                                        (MaxCapacity_i.maxcap[i + 1] - MaxCapacity_i.maxcap[i]) *
                                        (time_periods_i[j] - MaxCapacity_i.periods[i]) /
                                        (MaxCapacity_i.periods[i + 1] - MaxCapacity_i.periods[i])))
                    maxcap_units.append(MaxCapacity_i.maxcap_units[i])
                    maxcap_notes.append(MaxCapacity_i.maxcap_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= MaxCapacity_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MaxCapacity_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(MaxCapacity_i.tech[i])
                maxcap.append(float(MaxCapacity_i.maxcap[i]))
                maxcap_units.append(MaxCapacity_i.maxcap_units[i])
                maxcap_notes.append(MaxCapacity_i.maxcap_notes[i])

# Converting lists into a DataFrame
MaxCapacity = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "maxcap": pd.Series(maxcap, dtype='float'),
        "maxcap_units": pd.Series(maxcap_units, dtype='str'),
        "maxcap_notes": pd.Series(maxcap_notes, dtype='str')
    }
)

if save_tosql['MaxCapacity']:
    MaxCapacity.to_sql('MaxCapacity', conn, index=False, if_exists='replace')

if print_outcome['MaxCapacity']:
    pd.set_option('display.max_rows', len(MaxCapacity))
    pd.set_option('display.max_columns', 10)
    print("\nMaxCapacity DataFrame\n\n", MaxCapacity)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxCapacity interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxActivity

start_time = time.time()

MaxActivity = pd.read_sql("SELECT * FROM MaxActivity", conn)  # Loading the MaxActivity table from the .SQLite database

regions = list()
periods = list()
tech = list()
maxact = list()
maxact_units = list()
maxact_notes = list()

# Extracting the list of all indexes combinations for MaxActivity
indexes = list()
for i in range(0, len(MaxActivity)):
    indexes.append(MaxActivity.regions[i] + MaxActivity.tech[i])
MaxActivity['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    MaxActivity_i = MaxActivity[(MaxActivity['indexes'] == index_i)]
    MaxActivity_i = MaxActivity_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxActivity_i.periods)):
        if i < len(MaxActivity_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxActivity_i.periods[i] <= x < MaxActivity_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MaxActivity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MaxActivity_i.tech[i])
                    maxact.append(float(MaxActivity_i.maxact[i]))
                    maxact_units.append(MaxActivity_i.maxact_units[i])
                    maxact_notes.append(MaxActivity_i.maxact_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MaxActivity_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(MaxActivity_i.tech[i])
                    maxact.append(float(MaxActivity_i.maxact[i] +
                                        (MaxActivity_i.maxact[i + 1] - MaxActivity_i.maxact[i]) *
                                        (time_periods_i[j] - MaxActivity_i.periods[i]) /
                                        (MaxActivity_i.periods[i + 1] - MaxActivity_i.periods[i])))
                    maxact_units.append(MaxActivity_i.maxact_units[i])
                    maxact_notes.append(MaxActivity_i.maxact_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= MaxActivity_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MaxActivity_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(MaxActivity_i.tech[i])
                maxact.append(float(MaxActivity_i.maxact[i]))
                maxact_units.append(MaxActivity_i.maxact_units[i])
                maxact_notes.append(MaxActivity_i.maxact_notes[i])

# Converting lists into a DataFrame
MaxActivity = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "maxact": pd.Series(maxact, dtype='float'),
        "maxact_units": pd.Series(maxact_units, dtype='str'),
        "maxact_notes": pd.Series(maxact_notes, dtype='str')
    }
)

if save_tosql['MaxActivity']:
    MaxActivity.to_sql('MaxActivity', conn, index=False, if_exists='replace')

if print_outcome['MaxActivity']:
    pd.set_option('display.max_rows', len(MaxActivity))
    pd.set_option('display.max_columns', 10)
    print("\nMaxActivity DataFrame\n\n", MaxActivity)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxActivity interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinInputGroup

start_time = time.time()

MinInputGroup = pd.read_sql("SELECT * FROM MinInputGroup", conn)  # Loading the MinInputGroup table from the .SQLite database

regions = list()
periods = list()
input_comm = list()
group_name = list()
gi_min = list()
gi_min_notes = list()

# Extracting the list of all indexes combinations for MinInputGroup
indexes = list()
for i in range(0, len(MinInputGroup)):
    indexes.append(MinInputGroup.regions[i] + MinInputGroup.input_comm[i] + MinInputGroup.group_name[i])
MinInputGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MinInputGroup_i = MinInputGroup[(MinInputGroup['indexes'] == index_i)]
    MinInputGroup_i = MinInputGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinInputGroup_i.periods)):
        if i < len(MinInputGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinInputGroup_i.periods[i] <= x < MinInputGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MinInputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(MinInputGroup_i.input_comm[i])
                    group_name.append(MinInputGroup_i.group_name[i])
                    gi_min.append(float(MinInputGroup_i.gi_min[i]))
                    gi_min_notes.append(MinInputGroup_i.gi_min_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MinInputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(MinInputGroup_i.input_comm[i])
                    group_name.append(MinInputGroup_i.group_name[i])
                    gi_min.append(float(MinInputGroup_i.gi_min[i] +
                                        (MinInputGroup_i.gi_min[i + 1] - MinInputGroup_i.gi_min[i]) *
                                        (time_periods_i[j] - MinInputGroup_i.periods[i]) /
                                        (MinInputGroup_i.periods[i + 1] - MinInputGroup_i.periods[i])))
                    gi_min_notes.append(MinInputGroup_i.gi_min_notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MinInputGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MinInputGroup_i.regions[i])
                periods.append(time_periods_i[j])
                input_comm.append(MinInputGroup_i.input_comm[i])
                group_name.append(MinInputGroup_i.group_name[i])
                gi_min.append(float(MinInputGroup_i.gi_min[i]))
                gi_min_notes.append(MinInputGroup_i.gi_min_notes[i])

# Converting lists into a DataFrame
MinInputGroup = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "gi_min": pd.Series(gi_min, dtype='float'),
        "gi_min_notes": pd.Series(gi_min_notes, dtype='str')
    }
)

if save_tosql['MinInputGroup']:
    MinInputGroup.to_sql('MinInputGroup', conn, index=False, if_exists='replace')

if print_outcome['MinInputGroup']:
    pd.set_option('display.max_rows', len(MinInputGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMinInputGroup DataFrame\n\n", MinInputGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinInputGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxInputGroup

start_time = time.time()

MaxInputGroup = pd.read_sql("SELECT * FROM MaxInputGroup", conn)  # Loading the MaxInputGroup table from the .SQLite database

regions = list()
periods = list()
input_comm = list()
group_name = list()
gi_max = list()
gi_max_notes = list()

# Extracting the list of all indexes combinations for MaxInputGroup
indexes = list()
for i in range(0, len(MaxInputGroup)):
    indexes.append(MaxInputGroup.regions[i] + MaxInputGroup.input_comm[i] + MaxInputGroup.group_name[i])
MaxInputGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MaxInputGroup_i = MaxInputGroup[(MaxInputGroup['indexes'] == index_i)]
    MaxInputGroup_i = MaxInputGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxInputGroup_i.periods)):
        if i < len(MaxInputGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxInputGroup_i.periods[i] <= x < MaxInputGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MaxInputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(MaxInputGroup_i.input_comm[i])
                    group_name.append(MaxInputGroup_i.group_name[i])
                    gi_max.append(float(MaxInputGroup_i.gi_max[i]))
                    gi_max_notes.append(MaxInputGroup_i.gi_max_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MaxInputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    input_comm.append(MaxInputGroup_i.input_comm[i])
                    group_name.append(MaxInputGroup_i.group_name[i])
                    gi_max.append(float(MaxInputGroup_i.gi_max[i] +
                                        (MaxInputGroup_i.gi_max[i + 1] - MaxInputGroup_i.gi_max[i]) *
                                        (time_periods_i[j] - MaxInputGroup_i.periods[i]) /
                                        (MaxInputGroup_i.periods[i + 1] - MaxInputGroup_i.periods[i])))
                    gi_max_notes.append(MaxInputGroup_i.gi_max_notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MaxInputGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MaxInputGroup_i.regions[i])
                periods.append(time_periods_i[j])
                input_comm.append(MaxInputGroup_i.input_comm[i])
                group_name.append(MaxInputGroup_i.group_name[i])
                gi_max.append(float(MaxInputGroup_i.gi_max[i]))
                gi_max_notes.append(MaxInputGroup_i.gi_max_notes[i])

# Converting lists into a DataFrame
MaxInputGroup = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "input_comm": pd.Series(input_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "gi_max": pd.Series(gi_max, dtype='float'),
        "gi_max_notes": pd.Series(gi_max_notes, dtype='str')
    }
)

if save_tosql['MaxInputGroup']:
    MaxInputGroup.to_sql('MaxInputGroup', conn, index=False, if_exists='replace')

if print_outcome['MaxInputGroup']:
    pd.set_option('display.max_rows', len(MaxInputGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMaxInputGroup DataFrame\n\n", MaxInputGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxInputGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinOutputGroup

start_time = time.time()

MinOutputGroup = pd.read_sql("SELECT * FROM MinOutputGroup", conn)  # Loading the MinOutputGroup table from the .SQLite database

regions = list()
periods = list()
output_comm = list()
group_name = list()
go_min = list()
go_min_notes = list()

# Extracting the list of all indexes combinations for MinOutputGroup
indexes = list()
for i in range(0, len(MinOutputGroup)):
    indexes.append(MinOutputGroup.regions[i] + MinOutputGroup.output_comm[i] + MinOutputGroup.group_name[i])
MinOutputGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MinOutputGroup_i = MinOutputGroup[(MinOutputGroup['indexes'] == index_i)]
    MinOutputGroup_i = MinOutputGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinOutputGroup_i.periods)):
        if i < len(MinOutputGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinOutputGroup_i.periods[i] <= x < MinOutputGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MinOutputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    output_comm.append(MinOutputGroup_i.output_comm[i])
                    group_name.append(MinOutputGroup_i.group_name[i])
                    go_min.append(float(MinOutputGroup_i.go_min[i]))
                    go_min_notes.append(MinOutputGroup_i.go_min_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MinOutputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    output_comm.append(MinOutputGroup_i.output_comm[i])
                    group_name.append(MinOutputGroup_i.group_name[i])
                    go_min.append(float(MinOutputGroup_i.go_min[i] +
                                        (MinOutputGroup_i.go_min[i + 1] - MinOutputGroup_i.go_min[i]) *
                                        (time_periods_i[j] - MinOutputGroup_i.periods[i]) /
                                        (MinOutputGroup_i.periods[i + 1] - MinOutputGroup_i.periods[i])))
                    go_min_notes.append(MinOutputGroup_i.go_min_notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MinOutputGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MinOutputGroup_i.regions[i])
                periods.append(time_periods_i[j])
                output_comm.append(MinOutputGroup_i.output_comm[i])
                group_name.append(MinOutputGroup_i.group_name[i])
                go_min.append(float(MinOutputGroup_i.go_min[i]))
                go_min_notes.append(MinOutputGroup_i.go_min_notes[i])

# Converting lists into a DataFrame
MinOutputGroup = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "go_min": pd.Series(go_min, dtype='float'),
        "go_min_notes": pd.Series(go_min_notes, dtype='str')
    }
)

if save_tosql['MinOutputGroup']:
    MinOutputGroup.to_sql('MinOutputGroup', conn, index=False, if_exists='replace')

if print_outcome['MinOutputGroup']:
    pd.set_option('display.min_rows', len(MinOutputGroup))
    pd.set_option('display.min_columns', 10)
    print("\nMinOutputGroup DataFrame\n\n", MinOutputGroup)
    pd.reset_option('display.min_rows')
    pd.reset_option('display.min_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinOutputGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxOutputGroup

start_time = time.time()

MaxOutputGroup = pd.read_sql("SELECT * FROM MaxOutputGroup", conn)  # Loading the MaxOutputGroup table from the .SQLite database

regions = list()
periods = list()
output_comm = list()
group_name = list()
go_max = list()
go_max_notes = list()

# Extracting the list of all indexes combinations for MaxOutputGroup
indexes = list()
for i in range(0, len(MaxOutputGroup)):
    indexes.append(MaxOutputGroup.regions[i] + MaxOutputGroup.output_comm[i] + MaxOutputGroup.group_name[i])
MaxOutputGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MaxOutputGroup_i = MaxOutputGroup[(MaxOutputGroup['indexes'] == index_i)]
    MaxOutputGroup_i = MaxOutputGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxOutputGroup_i.periods)):
        if i < len(MaxOutputGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxOutputGroup_i.periods[i] <= x < MaxOutputGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(MaxOutputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    output_comm.append(MaxOutputGroup_i.output_comm[i])
                    group_name.append(MaxOutputGroup_i.group_name[i])
                    go_max.append(float(MaxOutputGroup_i.go_max[i]))
                    go_max_notes.append(MaxOutputGroup_i.go_max_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(MaxOutputGroup_i.regions[i])
                    periods.append(time_periods_i[j])
                    output_comm.append(MaxOutputGroup_i.output_comm[i])
                    group_name.append(MaxOutputGroup_i.group_name[i])
                    go_max.append(float(MaxOutputGroup_i.go_max[i] +
                                        (MaxOutputGroup_i.go_max[i + 1] - MaxOutputGroup_i.go_max[i]) *
                                        (time_periods_i[j] - MaxOutputGroup_i.periods[i]) /
                                        (MaxOutputGroup_i.periods[i + 1] - MaxOutputGroup_i.periods[i])))
                    go_max_notes.append(MaxOutputGroup_i.go_max_notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MaxOutputGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(MaxOutputGroup_i.regions[i])
                periods.append(time_periods_i[j])
                output_comm.append(MaxOutputGroup_i.output_comm[i])
                group_name.append(MaxOutputGroup_i.group_name[i])
                go_max.append(float(MaxOutputGroup_i.go_max[i]))
                go_max_notes.append(MaxOutputGroup_i.go_max_notes[i])

# Converting lists into a DataFrame
MaxOutputGroup = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "output_comm": pd.Series(output_comm, dtype='str'),
        "group_name": pd.Series(group_name, dtype='str'),
        "go_max": pd.Series(go_max, dtype='float'),
        "go_max_notes": pd.Series(go_max_notes, dtype='str')
    }
)

if save_tosql['MaxOutputGroup']:
    MaxOutputGroup.to_sql('MaxOutputGroup', conn, index=False, if_exists='replace')

if print_outcome['MaxOutputGroup']:
    pd.set_option('display.max_rows', len(MaxOutputGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMaxOutputGroup DataFrame\n\n", MaxOutputGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxOutputGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinActivityGroup

start_time = time.time()

MinActivityGroup = pd.read_sql("SELECT * FROM MinActivityGroup", conn)  # Loading the MinActivityGroup table from the .SQLite database

periods = list()
group_name = list()
min_act_g = list()
notes = list()

# Extracting the list of all indexes combinations for MinActivityGroup
indexes = list()
for i in range(0, len(MinActivityGroup)):
    indexes.append(MinActivityGroup.group_name[i])
MinActivityGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MinActivityGroup_i = MinActivityGroup[(MinActivityGroup['indexes'] == index_i)]
    MinActivityGroup_i = MinActivityGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinActivityGroup_i.periods)):
        if i < len(MinActivityGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinActivityGroup_i.periods[i] <= x < MinActivityGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    periods.append(time_periods_i[j])
                    group_name.append(MinActivityGroup_i.group_name[i])
                    min_act_g.append(float(MinActivityGroup_i.min_act_g[i]))
                    notes.append(MinActivityGroup_i.notes[i])
                else:  # Linear interpolation for intermediate time periods
                    periods.append(time_periods_i[j])
                    group_name.append(MinActivityGroup_i.group_name[i])
                    min_act_g.append(float(MinActivityGroup_i.min_act_g[i] +
                                     (MinActivityGroup_i.min_act_g[i + 1] - MinActivityGroup_i.min_act_g[i]) *
                                     (time_periods_i[j] - MinActivityGroup_i.periods[i]) /
                                     (MinActivityGroup_i.periods[i + 1] - MinActivityGroup_i.periods[i])))
                    notes.append(MinActivityGroup_i.notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MinActivityGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                periods.append(time_periods_i[j])
                group_name.append(MinActivityGroup_i.group_name[i])
                min_act_g.append(float(MinActivityGroup_i.min_act_g[i]))
                notes.append(MinActivityGroup_i.notes[i])

# Converting lists into a DataFrame
MinActivityGroup = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "group_name": pd.Series(group_name, dtype='str'),
        "min_act_g": pd.Series(min_act_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if save_tosql['MinActivityGroup']:
    MinActivityGroup.to_sql('MinActivityGroup', conn, index=False, if_exists='replace')

if print_outcome['MinActivityGroup']:
    pd.set_option('display.max_rows', len(MinActivityGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMinActivityGroup DataFrame\n\n", MinActivityGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinActivityGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxActivityGroup

start_time = time.time()

MaxActivityGroup = pd.read_sql("SELECT * FROM MaxActivityGroup", conn)  # Loading the MaxActivityGroup table from the .SQLite database

periods = list()
group_name = list()
max_act_g = list()
notes = list()

# Extracting the list of all indexes combinations for MaxActivityGroup
indexes = list()
for i in range(0, len(MaxActivityGroup)):
    indexes.append(MaxActivityGroup.group_name[i])
MaxActivityGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MaxActivityGroup_i = MaxActivityGroup[(MaxActivityGroup['indexes'] == index_i)]
    MaxActivityGroup_i = MaxActivityGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxActivityGroup_i.periods)):
        if i < len(MaxActivityGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxActivityGroup_i.periods[i] <= x < MaxActivityGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    periods.append(time_periods_i[j])
                    group_name.append(MaxActivityGroup_i.group_name[i])
                    max_act_g.append(float(MaxActivityGroup_i.max_act_g[i]))
                    notes.append(MaxActivityGroup_i.notes[i])
                else:  # Linear interpolation for intermediate time periods
                    periods.append(time_periods_i[j])
                    group_name.append(MaxActivityGroup_i.group_name[i])
                    max_act_g.append(float(MaxActivityGroup_i.max_act_g[i] +
                                     (MaxActivityGroup_i.max_act_g[i + 1] - MaxActivityGroup_i.max_act_g[i]) *
                                     (time_periods_i[j] - MaxActivityGroup_i.periods[i]) /
                                     (MaxActivityGroup_i.periods[i + 1] - MaxActivityGroup_i.periods[i])))
                    notes.append(MaxActivityGroup_i.notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MaxActivityGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                periods.append(time_periods_i[j])
                group_name.append(MaxActivityGroup_i.group_name[i])
                max_act_g.append(float(MaxActivityGroup_i.max_act_g[i]))
                notes.append(MaxActivityGroup_i.notes[i])

# Converting lists into a DataFrame
MaxActivityGroup = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "group_name": pd.Series(group_name, dtype='str'),
        "max_act_g": pd.Series(max_act_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if save_tosql['MaxActivityGroup']:
    MaxActivityGroup.to_sql('MaxActivityGroup', conn, index=False, if_exists='replace')

if print_outcome['MaxActivityGroup']:
    pd.set_option('display.max_rows', len(MaxActivityGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMaxActivityGroup DataFrame\n\n", MaxActivityGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxActivityGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MinCapacityGroup

start_time = time.time()

MinCapacityGroup = pd.read_sql("SELECT * FROM MinCapacityGroup", conn)  # Loading the MinCapacityGroup table from the .SQLite database

periods = list()
group_name = list()
min_cap_g = list()
notes = list()

# Extracting the list of all indexes combinations for MinCapacityGroup
indexes = list()
for i in range(0, len(MinCapacityGroup)):
    indexes.append(MinCapacityGroup.group_name[i])
MinCapacityGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MinCapacityGroup_i = MinCapacityGroup[(MinCapacityGroup['indexes'] == index_i)]
    MinCapacityGroup_i = MinCapacityGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MinCapacityGroup_i.periods)):
        if i < len(MinCapacityGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MinCapacityGroup_i.periods[i] <= x < MinCapacityGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    periods.append(time_periods_i[j])
                    group_name.append(MinCapacityGroup_i.group_name[i])
                    min_cap_g.append(float(MinCapacityGroup_i.min_cap_g[i]))
                    notes.append(MinCapacityGroup_i.notes[i])
                else:  # Linear interpolation for intermediate time periods
                    periods.append(time_periods_i[j])
                    group_name.append(MinCapacityGroup_i.group_name[i])
                    min_cap_g.append(float(MinCapacityGroup_i.min_cap_g[i] +
                                     (MinCapacityGroup_i.min_cap_g[i + 1] - MinCapacityGroup_i.min_cap_g[i]) *
                                     (time_periods_i[j] - MinCapacityGroup_i.periods[i]) /
                                     (MinCapacityGroup_i.periods[i + 1] - MinCapacityGroup_i.periods[i])))
                    notes.append(MinCapacityGroup_i.notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MinCapacityGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                periods.append(time_periods_i[j])
                group_name.append(MinCapacityGroup_i.group_name[i])
                min_cap_g.append(float(MinCapacityGroup_i.min_cap_g[i]))
                notes.append(MinCapacityGroup_i.notes[i])

# Converting lists into a DataFrame
MinCapacityGroup = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "group_name": pd.Series(group_name, dtype='str'),
        "min_cap_g": pd.Series(min_cap_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if save_tosql['MinCapacityGroup']:
    MinCapacityGroup.to_sql('MinCapacityGroup', conn, index=False, if_exists='replace')

if print_outcome['MinCapacityGroup']:
    pd.set_option('display.max_rows', len(MinCapacityGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMinCapacityGroup DataFrame\n\n", MinCapacityGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MinCapacityGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# MaxCapacityGroup

start_time = time.time()

MaxCapacityGroup = pd.read_sql("SELECT * FROM MaxCapacityGroup", conn)  # Loading the MaxCapacityGroup table from the .SQLite database

periods = list()
group_name = list()
max_cap_g = list()
notes = list()

# Extracting the list of all indexes combinations for MaxCapacityGroup
indexes = list()
for i in range(0, len(MaxCapacityGroup)):
    indexes.append(MaxCapacityGroup.group_name[i])
MaxCapacityGroup['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating
for index_i in indexes:
    MaxCapacityGroup_i = MaxCapacityGroup[(MaxCapacityGroup['indexes'] == index_i)]
    MaxCapacityGroup_i = MaxCapacityGroup_i.sort_values(by=['periods'], ignore_index=True)
    for i in range(0, len(MaxCapacityGroup_i.periods)):
        if i < len(MaxCapacityGroup_i.periods) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if MaxCapacityGroup_i.periods[i] <= x < MaxCapacityGroup_i.periods[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    periods.append(time_periods_i[j])
                    group_name.append(MaxCapacityGroup_i.group_name[i])
                    max_cap_g.append(float(MaxCapacityGroup_i.max_cap_g[i]))
                    notes.append(MaxCapacityGroup_i.notes[i])
                else:  # Linear interpolation for intermediate time periods
                    periods.append(time_periods_i[j])
                    group_name.append(MaxCapacityGroup_i.group_name[i])
                    max_cap_g.append(float(MaxCapacityGroup_i.max_cap_g[i] +
                                     (MaxCapacityGroup_i.max_cap_g[i + 1] - MaxCapacityGroup_i.max_cap_g[i]) *
                                     (time_periods_i[j] - MaxCapacityGroup_i.periods[i]) /
                                     (MaxCapacityGroup_i.periods[i + 1] - MaxCapacityGroup_i.periods[i])))
                    notes.append(MaxCapacityGroup_i.notes[i])
        else:  # Last time period
            time_periods_i = [x for x in time_periods if x == MaxCapacityGroup_i.periods[i]]
            for j in range(0, len(time_periods_i)):
                periods.append(time_periods_i[j])
                group_name.append(MaxCapacityGroup_i.group_name[i])
                max_cap_g.append(float(MaxCapacityGroup_i.max_cap_g[i]))
                notes.append(MaxCapacityGroup_i.notes[i])

# Converting lists into a DataFrame
MaxCapacityGroup = pd.DataFrame(
    {
        "periods": pd.Series(periods, dtype='int'),
        "group_name": pd.Series(group_name, dtype='str'),
        "max_cap_g": pd.Series(max_cap_g, dtype='float'),
        "notes": pd.Series(notes, dtype='str')
    }
)

if save_tosql['MaxCapacityGroup']:
    MaxCapacityGroup.to_sql('MaxCapacityGroup', conn, index=False, if_exists='replace')

if print_outcome['MaxCapacityGroup']:
    pd.set_option('display.max_rows', len(MaxCapacityGroup))
    pd.set_option('display.max_columns', 10)
    print("\nMaxCapacityGroup DataFrame\n\n", MaxCapacityGroup)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'MaxCapacityGroup interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CapacityFactor

start_time = time.time()

CapacityFactor = pd.read_sql("SELECT * FROM CapacityFactor", conn)  # Loading the CapacityFactor table from the .SQLite database

regions = list()
tech = list()
vintage = list()
cf = list()
cf_notes = list()

# Extracting the list of all indexes combinations for CapacityFactor
indexes = list()
for i in range(0, len(CapacityFactor)):
    indexes.append(CapacityFactor.regions[i] + CapacityFactor.tech[i])
CapacityFactor['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    CapacityFactor_i = CapacityFactor[(CapacityFactor['indexes'] == index_i)]
    CapacityFactor_i = CapacityFactor_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(CapacityFactor_i.vintage)):
        if i < len(CapacityFactor_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if CapacityFactor_i.vintage[i] <= x < CapacityFactor_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(CapacityFactor_i.regions[i])
                    tech.append(CapacityFactor_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cf.append(float(CapacityFactor_i.cf[i]))
                    cf_notes.append(CapacityFactor_i.cf_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(CapacityFactor_i.regions[i])
                    tech.append(CapacityFactor_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cf.append(float(CapacityFactor_i.cf[i] +
                                    (CapacityFactor_i.cf[i + 1] - CapacityFactor_i.cf[i]) *
                                    (time_periods_i[j] - CapacityFactor_i.vintage[i]) /
                                    (CapacityFactor_i.vintage[i + 1] - CapacityFactor_i.vintage[i])))
                    cf_notes.append(CapacityFactor_i.cf_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= CapacityFactor_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(CapacityFactor_i.regions[i])
                tech.append(CapacityFactor_i.tech[i])
                vintage.append(time_periods_i[j])
                cf.append(float(CapacityFactor_i.cf[i]))
                cf_notes.append(CapacityFactor_i.cf_notes[i])

# Converting lists into a DataFrame
CapacityFactor = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cf": pd.Series(cf, dtype='float'),
        "cf_notes": pd.Series(cf_notes, dtype='str')
    }
)

if save_tosql['CapacityFactor']:
    CapacityFactor.to_sql('CapacityFactor', conn, index=False, if_exists='replace')

if print_outcome['CapacityFactor']:
    pd.set_option('display.max_rows', len(CapacityFactor))
    pd.set_option('display.max_columns', 10)
    print("\nCapacityFactor DataFrame\n\n", CapacityFactor)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CapacityFactor interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CapacityFactorProcess

start_time = time.time()

CapacityFactorProcess = pd.read_sql("SELECT * FROM CapacityFactorProcess", conn)  # Loading the CapacityFactorProcess table from the .SQLite database

regions = list()
season_name = list()
time_of_day_name = list()
tech = list()
vintage = list()
cf_process = list()
cf_process_notes = list()

# Extracting the list of all indexes combinations for CapacityFactorProcess
indexes = list()
for i in range(0, len(CapacityFactorProcess)):
    indexes.append(CapacityFactorProcess.regions[i] + CapacityFactorProcess.season_name[i] +
                   CapacityFactorProcess.time_of_day_name[i] + CapacityFactorProcess.tech[i])
CapacityFactorProcess['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    CapacityFactorProcess_i = CapacityFactorProcess[(CapacityFactorProcess['indexes'] == index_i)]
    CapacityFactorProcess_i = CapacityFactorProcess_i.sort_values(by=['vintage'], ignore_index=True)
    for i in range(0, len(CapacityFactorProcess_i.vintage)):
        if i < len(CapacityFactorProcess_i.vintage) - 1:  # Interpolation
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if CapacityFactorProcess_i.vintage[i] <= x < CapacityFactorProcess_i.vintage[i+1]]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(CapacityFactorProcess_i.regions[i])
                    season_name.append(CapacityFactorProcess_i.season_name[i])
                    time_of_day_name.append(CapacityFactorProcess_i.time_of_day_name[i])
                    tech.append(CapacityFactorProcess_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cf_process.append(float(CapacityFactorProcess_i.cf_process[i]))
                    cf_process_notes.append(CapacityFactorProcess_i.cf_process_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(CapacityFactorProcess_i.regions[i])
                    season_name.append(CapacityFactorProcess_i.season_name[i])
                    time_of_day_name.append(CapacityFactorProcess_i.time_of_day_name[i])
                    tech.append(CapacityFactorProcess_i.tech[i])
                    vintage.append(time_periods_i[j])
                    cf_process.append(float(CapacityFactorProcess_i.cf_process[i] +
                                            (CapacityFactorProcess_i.cf_process[i + 1] - CapacityFactorProcess_i.cf_process[i]) *
                                            (time_periods_i[j] - CapacityFactorProcess_i.vintage[i]) /
                                            (CapacityFactorProcess_i.vintage[i + 1] - CapacityFactorProcess_i.vintage[i])))
                    cf_process_notes.append(CapacityFactorProcess_i.cf_process_notes[i])
        else:  # Extrapolation
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if x >= CapacityFactorProcess_i.vintage[i]]
            for j in range(0, len(time_periods_i)):
                regions.append(CapacityFactorProcess_i.regions[i])
                season_name.append(CapacityFactorProcess_i.season_name[i])
                time_of_day_name.append(CapacityFactorProcess_i.time_of_day_name[i])
                tech.append(CapacityFactorProcess_i.tech[i])
                vintage.append(time_periods_i[j])
                cf_process.append(float(CapacityFactorProcess_i.cf_process[i]))
                cf_process_notes.append(CapacityFactorProcess_i.cf_process_notes[i])

# Converting lists into a DataFrame
CapacityFactorProcess = pd.DataFrame(
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

if save_tosql['CapacityFactorProcess']:
    CapacityFactorProcess.to_sql('CapacityFactorProcess', conn, index=False, if_exists='replace')

if print_outcome['CapacityFactorProcess']:
    pd.set_option('display.max_rows', len(CapacityFactorProcess))
    pd.set_option('display.max_columns', 10)
    print("\nCapacityFactorProcess DataFrame\n\n", CapacityFactorProcess)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CapacityFactorProcess interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# CapacityCredit

start_time = time.time()

CapacityCredit = pd.read_sql("SELECT * FROM CapacityCredit", conn)  # Loading the CapacityCredit table from the .SQLite database

# Interpolation across vintages
# Extracting the list of all indexes combinations for CapacityCredit
indexes = list()
for i in range(0, len(CapacityCredit)):
    indexes.append(CapacityCredit.regions[i] + CapacityCredit.tech[i])
CapacityCredit['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

for index_i in indexes:
    CapacityCredit_i = CapacityCredit[(CapacityCredit['indexes'] == index_i)]
    CapacityCredit_i = CapacityCredit_i.sort_values(by=['vintage', 'periods'], ignore_index=True)
    all_vintage = list(CapacityCredit_i.vintage)
    for i in range(0, len(time_periods)):
        # Piecewise constant interpolation across vintages, assuming the average of value(s) from the previous available vintage
        if time_periods[i] not in all_vintage and time_periods[i] > all_vintage[0]:
            CapacityCredit_ii = {
                'regions': CapacityCredit_i.regions[0],
                'periods': time_periods[i],
                'tech': CapacityCredit_i.tech[0],
                'vintage': time_periods[i],
                'cf_tech': np.average(CapacityCredit_i.cf_tech[(CapacityCredit_i['vintage'] == time_periods[i-1])]),
                'cf_tech_notes': CapacityCredit_i.cf_tech_notes[0],
                'indexes': index_i
            }
            # Adding the value for the new vintage
            CapacityCredit_i = CapacityCredit_i.append(CapacityCredit_ii, ignore_index=True)

    # Updating CapacityCredit by removing the previous row for index_i and inserting the new ones with interpolation across vintages
    CapacityCredit = CapacityCredit.drop(CapacityCredit[CapacityCredit.indexes == index_i].index)
    CapacityCredit = pd.concat([CapacityCredit, CapacityCredit_i], ignore_index=True)

CapacityCredit = CapacityCredit.sort_values(by=['tech', 'vintage', 'periods'], ignore_index=True)
CapacityCredit = CapacityCredit.drop(columns=['indexes'])

# Interpolation across periods
regions = list()
periods = list()
tech = list()
vintage = list()
cf_tech = list()
cf_tech_notes = list()

# Extracting the list of all indexes combinations for CapacityCredit
indexes = list()
for i in range(0, len(CapacityCredit)):
    indexes.append(CapacityCredit.regions[i] + CapacityCredit.tech[i] + str(CapacityCredit.vintage[i]))
CapacityCredit['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    CapacityCredit_i = CapacityCredit[(CapacityCredit['indexes'] == index_i)]
    CapacityCredit_i = CapacityCredit_i.sort_values(by=['vintage', 'periods'], ignore_index=True)

    for i in range(0, len(CapacityCredit_i.vintage)):
        tech_i = CapacityCredit_i.tech[0]

        # Reading the technology lifetime in the i-th vintage
        LifetimeTech_i = LifetimeTech[(LifetimeTech['regions'] == CapacityCredit_i.regions[i]) & (LifetimeTech['tech'] == tech_i)]
        LifetimeTech_i = LifetimeTech_i.reset_index(drop=True)
        LifetimeProcess_i = LifetimeProcess[(LifetimeProcess['regions'] == CapacityCredit_i.regions[i]) &
                                            (LifetimeProcess['tech'] == tech_i) &
                                            (LifetimeProcess['vintage'] == CapacityCredit_i.vintage[i])]
        LifetimeProcess_i = LifetimeProcess_i.reset_index(drop=True)
        if len(LifetimeTech_i.life) > 0:
            lifetime = LifetimeTech_i.life[0]
        elif len(LifetimeProcess_i.life_process) > 0:
            lifetime = LifetimeProcess_i.life_process[0]
        else:
            lifetime = lifetime_default

        if i < len(CapacityCredit_i.vintage) - 1:  # Linear interpolation across time periods within the same vintage
            # Extracting time periods involved in the interpolation
            time_periods_i = [x for x in time_periods if CapacityCredit_i.periods[i] <= x < CapacityCredit_i.periods[i+1] and
                              base_year < x < CapacityCredit_i.periods[i] + lifetime]
            for j in range(0, len(time_periods_i)):
                if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                    regions.append(CapacityCredit_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(CapacityCredit_i.tech[i])
                    vintage.append(CapacityCredit_i.vintage[i])
                    cf_tech.append(float(CapacityCredit_i.cf_tech[i]))
                    cf_tech_notes.append(CapacityCredit_i.cf_tech_notes[i])
                else:  # Linear interpolation for intermediate time periods
                    regions.append(CapacityCredit_i.regions[i])
                    periods.append(time_periods_i[j])
                    tech.append(CapacityCredit_i.tech[i])
                    vintage.append(CapacityCredit_i.vintage[i])
                    cf_tech.append(float(CapacityCredit_i.cf_tech[i] +
                                         (CapacityCredit_i.cf_tech[i + 1] - CapacityCredit_i.cf_tech[i]) *
                                         (time_periods_i[j] - CapacityCredit_i.periods[i]) /
                                         (CapacityCredit_i.periods[i + 1] - CapacityCredit_i.periods[i])))
                    cf_tech_notes.append(CapacityCredit_i.cf_tech_notes[i])
        else:  # Constant extrapolation across time periods within the same vintage
            # Extracting time periods involved in the extrapolation
            time_periods_i = [x for x in time_periods if CapacityCredit_i.periods[i] <= x and
                              base_year < x < CapacityCredit_i.periods[i] + lifetime]
            for j in range(0, len(time_periods_i)):
                regions.append(CapacityCredit_i.regions[i])
                periods.append(time_periods_i[j])
                tech.append(CapacityCredit_i.tech[i])
                vintage.append(CapacityCredit_i.vintage[i])
                cf_tech.append(float(CapacityCredit_i.cf_tech[i]))
                cf_tech_notes.append(CapacityCredit_i.cf_tech_notes[i])

# Converting lists into a DataFrame
CapacityCredit = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "tech": pd.Series(tech, dtype='str'),
        "vintage": pd.Series(vintage, dtype='int'),
        "cf_tech": pd.Series(cf_tech, dtype='float'),
        "cf_tech_notes": pd.Series(cf_tech_notes, dtype='str')
    }
)

if save_tosql['CapacityCredit']:
    CapacityCredit.to_sql('CapacityCredit', conn, index=False, if_exists='replace')

if print_outcome['CapacityCredit']:
    pd.set_option('display.max_rows', len(CapacityCredit))
    pd.set_option('display.max_columns', 10)
    print("\nCapacityCredit DataFrame\n\n", CapacityCredit)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'CapacityCredit interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

# Demand (from the previous database_preprocessing.py)

start_time = time.time()

Allocation = pd.read_sql("select * from Allocation", conn)
Demand = pd.read_sql("select * from Demand", conn)
Driver = pd.read_sql("select * from Driver", conn)
Elasticity = pd.read_sql("select * from Elasticity", conn)

regions = list()
periods = list()
demand_comm = list()
demand = list()
demand_units = list()
demand_notes = list()

for i in range(0, len(Demand.demand_comm)):
    if Demand.periods[i] == base_year:
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
                                    demand.append(float(np.format_float_scientific(demand[len(demand) - 1] * (1 + (Driver.driver[k] / Driver.driver[k - 1] - 1) * Elasticity.elasticity[l]))))
                                    demand_units.append(demand_units[len(demand_units) - 1])
                                demand_notes.append('')

Demand_1 = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "demand_comm": pd.Series(demand_comm, dtype='str'),
        "demand": pd.Series(demand, dtype='float'),
        "demand_units": pd.Series(demand_units, dtype='str'),
        "demand_notes": pd.Series(demand_notes, dtype='str')
    }
)

for i in range(0, len(Demand_1)):
    if Demand_1.loc[i, lambda df: "periods"] == base_year:
        Demand_1 = Demand_1.drop(index=[i])
Demand_1 = Demand_1.reset_index(drop=True)

regions = list()
periods = list()
demand_comm = list()
demand = list()
demand_units = list()
demand_notes = list()
flag_delete = list()

for i in range(0, len(Demand.demand_comm)):
    if Demand.periods[i] != base_year:
        flag_check = 0
        for j in range(0, len(Demand_1)):
            if Demand.regions[i] == Demand_1.regions[j] and Demand.demand_comm[i] == Demand_1.demand_comm[j] and Demand.periods[i] == Demand_1.periods[j]:
                flag_delete.append(j)
        regions.append(Demand.regions[i])
        periods.append(int(Demand.periods[i]))
        demand_comm.append(Demand.demand_comm[i])
        demand.append(Demand.demand[i])
        demand_units.append(Demand.demand_units[i])
        demand_notes.append(Demand.demand_notes[i])

Demand_1 = Demand_1.drop(flag_delete)
Demand_1 = Demand_1.reset_index(drop=True)

Demand_2 = pd.DataFrame(
    {
        "regions": pd.Series(regions, dtype='str'),
        "periods": pd.Series(periods, dtype='int'),
        "demand_comm": pd.Series(demand_comm, dtype='str'),
        "demand": pd.Series(demand, dtype='float'),
        "demand_units": pd.Series(demand_units, dtype='str'),
        "demand_notes": pd.Series(demand_notes, dtype='str')
    }
)

if len(Demand_1) != 0 or len(Demand_2) != 0:
    Demand = pd.merge(Demand_1, Demand_2, how='outer')
    Demand = Demand.sort_values(by=['regions', 'demand_comm', 'periods'], ignore_index=True)

if save_tosql['Demand']:
    Demand.to_sql('Demand', conn, index=False, if_exists='replace')

if print_outcome['Demand']:
    pd.set_option('display.max_rows', len(Demand))
    pd.set_option('display.max_columns', 10)
    print("\nDemand DataFrame\n\n", Demand)
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'Demand projected.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

print('_______________________________________________________________________')