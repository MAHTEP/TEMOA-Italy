import pandas as pd
import numpy as np
import sqlite3

conn = sqlite3.connect("TEMOA_Italy.sqlite")

Commodities = pd.read_sql("select comm_name from commodities", conn)
Commodities = pd.Series(Commodities.comm_name).tolist()
Efficiency_out = pd.read_sql("select output_comm from Efficiency", conn)
Efficiency_out = pd.Series(Efficiency_out.output_comm).tolist()
Efficiency_in = pd.read_sql("select input_comm from Efficiency", conn)
Efficiency_in = pd.Series(Efficiency_in.input_comm).tolist()
Efficiency_tech = pd.read_sql("select tech from Efficiency", conn)
Efficiency_tech = pd.Series(Efficiency_tech.tech).tolist()
Technologies = pd.read_sql("select tech from technologies", conn)
Technologies = pd.Series(Technologies.tech).tolist()
Capacity = pd.read_sql("select tech from CapacityFactor", conn)
Capacity = pd.Series(Capacity.tech).tolist()
CostFixed = pd.read_sql("select tech from CostFixed", conn)
CostFixed = pd.Series(CostFixed.tech).tolist()
CostInvest = pd.read_sql("select tech from CostInvest", conn)
CostInvest = pd.Series(CostInvest.tech).tolist()
CostVariable = pd.read_sql("select * from CostVariable", conn)
p_cv = pd.Series(CostVariable.periods).tolist()
v_cv = pd.Series(CostVariable.vintage).tolist()
CostVariable = pd.Series(CostVariable.tech).tolist()
Lifetime = pd.read_sql("select tech from LifetimeTech", conn)
Lifetime = pd.Series(Lifetime.tech).tolist()
Techannual = pd.read_sql("select tech from tech_annual", conn)
Techannual = pd.Series(Techannual.tech).tolist()
Demand = pd.read_sql("select demand_comm from demand", conn)
Demand = pd.Series(Demand.demand_comm).tolist()
TechOutputSplit = pd.read_sql("select tech from TechOutputSplit", conn)
TechOutputSplit = pd.Series(TechOutputSplit.tech).tolist()
TechInputSplit = pd.read_sql("select tech from TechInputSplit", conn)
TechInputSplit = pd.Series(TechInputSplit.tech).tolist()
MaxActivity = pd.read_sql("select * from MaxActivity", conn)
Tech_MaxActivity = pd.Series(MaxActivity.tech).tolist()
Periods_MaxActivity = pd.Series(MaxActivity.periods).tolist()
MaxAct_MaxActivity = pd.Series(MaxActivity.maxact).tolist()

per_vin_cv = list()
for i in range(0, len(p_cv)-1):
    if p_cv[i] == v_cv[i]:
        ...
    else:
        per_vin_cv.append(CostVariable[i])

missing_tech_in_efficiency_table = list()
for i in range(0, len(Efficiency_tech)-1):
    if Technologies.count(Efficiency_tech[i]) > 0:
        ...
    else:
        missing_tech_in_efficiency_table.append(Efficiency_tech[i])
print("missing_tech_in_efficiency_table")
print(missing_tech_in_efficiency_table)

missing_input_comm_in_efficiency_table = list()
for i in range(0, len(Efficiency_in)-1):
    if Commodities.count(Efficiency_in[i]) > 0:
        ...
    else:
        missing_input_comm_in_efficiency_table.append(Efficiency_in[i])
        print(i)
print("missing_input_comm_in_efficiency_table")
print(missing_input_comm_in_efficiency_table)

missing_output_comm_in_efficiency_table = list()
for i in range(0, len(Efficiency_out)-1):
    if Commodities.count(Efficiency_out[i]) > 0:
        ...
    else:
        missing_output_comm_in_efficiency_table.append(Efficiency_out[i])
        print(i)
print("missing_output_comm_in_efficiency_table")
print(missing_output_comm_in_efficiency_table)

missing_tech_in_techoutputsplit_table = list()
for i in range(0, len(TechOutputSplit)-1):
    if Technologies.count(TechOutputSplit[i]) > 0:
        ...
    else:
        missing_tech_in_techoutputsplit_table.append(TechOutputSplit[i])
print("missing_tech_in_techoutputsplit_table")
print(missing_tech_in_techoutputsplit_table)
Missing_techs = pd.DataFrame(missing_tech_in_techoutputsplit_table)

missing_tech_in_life_table = list()
for i in range(0, len(Lifetime)-1):
    if Technologies.count(Lifetime[i]) > 0:
        ...
    else:
        missing_tech_in_life_table.append(Lifetime[i])
print("missing_tech_in_life_table")
print(missing_tech_in_life_table)
Missing_techs = pd.DataFrame(missing_tech_in_life_table)

missing_tech_in_af_table = list()
for i in range(0, len(Capacity)-1):
    if Technologies.count(Capacity[i]) > 0:
        ...
    else:
        missing_tech_in_af_table.append(Capacity[i])
print("missing_tech_in_af_table")
print(missing_tech_in_af_table)
Missing_techs = pd.DataFrame(missing_tech_in_af_table)

missing_tech_in_ci_table = list()
for i in range(0, len(CostInvest)-1):
    if Technologies.count(CostInvest[i]) > 0:
        ...
    else:
        missing_tech_in_ci_table.append(CostInvest[i])
print("missing_tech_in_ci_table")
print(missing_tech_in_ci_table)

missing_tech_in_cf_table = list()
for i in range(0, len(CostFixed)-1):
    if Technologies.count(CostFixed[i]) > 0:
        ...
    else:
        missing_tech_in_cf_table.append(CostFixed[i])
print("missing_tech_in_cf_table")
print(missing_tech_in_cf_table)

missing_tech_in_cv_table = list()
for i in range(0, len(CostVariable)-1):
    if Technologies.count(CostVariable[i]) > 0:
        ...
    else:
        missing_tech_in_cf_table.append(CostVariable[i])
print("missing_tech_in_cv_table")
print(missing_tech_in_cv_table)

missing_tech_in_techannual_table = list()
for i in range(0, len(Techannual)-1):
    if Technologies.count(Techannual[i]) > 0:
        ...
    else:
        missing_tech_in_techannual_table.append(Techannual[i])
print("missing_tech_in_techannual_table")
print(missing_tech_in_techannual_table)

missing_comm_in_demand_table = list()
for i in range(0, len(Demand)-1):
    if Commodities.count(Demand[i]) > 0:
        ...
    else:
        missing_comm_in_demand_table.append(Demand[i])
print("missing_comm_in_demand_table")
print(missing_comm_in_demand_table)

## To identify technologies without any investment cost (leading to useless capacity installation).
#missing_tech_in_cost_invest_table = list()
#for i in range(0, len(Technologies)-1):
#    if CostInvest.count(Technologies[i]) > 0:
#        ...
#    else:
#        missing_tech_in_cost_invest_table.append(Technologies[i])
#print("missing_tech_in_cost_invest_table")
#print(missing_tech_in_cost_invest_table)

## This last part of the script is slow to run. It should be activated only if necessary.
#tech_to_remove_by_tech_annual = list()
#tech_to_remove_by_tech_annual.append('tech_temp')
#for i in range(0, len(Commodities)):
#    tech_prod_same_comm = list()
#    tech_prod_same_comm.append('tech_temp')
#    for j in range(0, len(Efficiency_tech)):
#        if Efficiency_out[j] == Commodities[i]:
#            flag = 0
#            for i3 in range(0, len(tech_prod_same_comm)):
#                if Efficiency_tech[j] == tech_prod_same_comm[i3]:
#                    flag = 1
#            if flag == 0:
#                tech_prod_same_comm.append(Efficiency_tech[j])
#
#    tech_prod_same_comm.remove('tech_temp')
#
#    for i2 in range(0, len(tech_prod_same_comm)):
#        for j2 in range(0, len(Techannual)):
#            for k2 in range(0, len(TechOutputSplit)):
#                if tech_prod_same_comm[i2] == Techannual[j2] == TechOutputSplit[k2]:
#                    flag = 0
#                    for l2 in range(0, len(tech_to_remove_by_tech_annual)):
#                        if TechOutputSplit[k2] == tech_to_remove_by_tech_annual[l2]:
#                            flag = 1
#                    if flag == 0:
#                        tech_to_remove_by_tech_annual.append(TechOutputSplit[k2])
#
#tech_to_remove_by_tech_annual.remove('tech_temp')
#
#tech_to_remove_by_tech_annual.append('tech_temp')
#for i in range(0, len(Commodities)):
#    tech_prod_same_comm = list()
#    tech_prod_same_comm.append('tech_temp')
#    for j in range(0, len(Efficiency_tech)):
#        if Efficiency_in[j] == Commodities[i]:
#            flag = 0
#            for i3 in range(0, len(tech_prod_same_comm)):
#                if Efficiency_tech[j] == tech_prod_same_comm[i3]:
#                    flag = 1
#            if flag == 0:
#                tech_prod_same_comm.append(Efficiency_tech[j])
#
#    tech_prod_same_comm.remove('tech_temp')
#
#    for i2 in range(0, len(tech_prod_same_comm)):
#        for j2 in range(0, len(Techannual)):
#            for k2 in range(0, len(TechInputSplit)):
#                if tech_prod_same_comm[i2] == Techannual[j2] == TechInputSplit[k2]:
#                    flag = 0
#                    for l2 in range(0, len(tech_to_remove_by_tech_annual)):
#                        if TechInputSplit[k2] == tech_to_remove_by_tech_annual[l2]:
#                            flag = 1
#                    if flag == 0:
#                        tech_to_remove_by_tech_annual.append(TechInputSplit[k2])
#
#tech_to_remove_by_tech_annual.remove('tech_temp')
#print("tech_to_remove_by_tech_annual")
#print(tech_to_remove_by_tech_annual)

conn.close()