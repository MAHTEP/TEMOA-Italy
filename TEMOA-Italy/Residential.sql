BEGIN TRANSACTION;

CREATE TABLE commodity_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "commodity_type" VALUES('p','physical commodity');
INSERT INTO "commodity_type" VALUES('e','emissions commodity');
INSERT INTO "commodity_type" VALUES('d','demand commodity');
INSERT INTO "commodity_type" VALUES('w','waste commodity');
INSERT INTO "commodity_type" VALUES('wa','waste annual commodity');
INSERT INTO "commodity_type" VALUES('wp','waste physical commodity');
INSERT INTO "commodity_type" VALUES('a','annual commodity');
INSERT INTO "commodity_type" VALUES('s','source commodity');

CREATE TABLE commodity (
    name        TEXT PRIMARY KEY,
    flag        TEXT REFERENCES commodity_type(label),
    description TEXT,
    units       TEXT
);
INSERT INTO "commodity" VALUES('RES_CD','d','Clothes drying','Glav');
INSERT INTO "commodity" VALUES('RES_CK','d','Cooking','PJ');
INSERT INTO "commodity" VALUES('RES_CW','d','Clothes washing','Glav');
INSERT INTO "commodity" VALUES('RES_DW','d','Dish washing','Glav');
INSERT INTO "commodity" VALUES('RES_LG','d','Lighting','Glm');
INSERT INTO "commodity" VALUES('RES_OE','d','Other electric','PJ');
INSERT INTO "commodity" VALUES('RES_RF','d','Refrigeration','Gl');
INSERT INTO "commodity" VALUES('RES_SC','d','Space cooling','Mm2');
INSERT INTO "commodity" VALUES('RES_SH_SO','d','Space heating - SF-Old','Mm2');
INSERT INTO "commodity" VALUES('RES_SH_MO','d','Space heating - MF-Old','Mm2');
INSERT INTO "commodity" VALUES('RES_SH_SN','d','Space heating - SF-New','Mm2');
INSERT INTO "commodity" VALUES('RES_SH_MN','d','Space heating - MF-New','Mm2');
INSERT INTO "commodity" VALUES('RES_WH','d','Water heating','PJ');
INSERT INTO "commodity" VALUES('RES_BIO','a','Biomass','PJ');
INSERT INTO "commodity" VALUES('RES_COA','a','Coal','PJ');
INSERT INTO "commodity" VALUES('RES_DST','a','Diesel','PJ');
INSERT INTO "commodity" VALUES('RES_ELC','p','Electricity','PJ');
INSERT INTO "commodity" VALUES('RES_GEO','a','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('RES_HET','p','Heat','PJ');
INSERT INTO "commodity" VALUES('RES_HFO','a','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('RES_KER','a','Kerosene','PJ');
INSERT INTO "commodity" VALUES('RES_LPG','a','LPG','PJ');
INSERT INTO "commodity" VALUES('RES_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('RES_SOL','p','Solar energy','PJ');
INSERT INTO "commodity" VALUES('RES_INS_C','p','Insulation - Cooling','PJ');
INSERT INTO "commodity" VALUES('RES_INS_MO','p','Insulation - MF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_INS_SN','p','Insulation - SF-New','PJ');
INSERT INTO "commodity" VALUES('RES_INS_SO','p','Insulation - SF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PC_MO','p','Cooling from heat pump - MF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PC_SN','p','Cooling from heat pump - SF-New','PJ');
INSERT INTO "commodity" VALUES('RES_PC_SO','p','Cooling from heat pump - SF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PH_MO','p','Heating from heat pump - MF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PH_SN','p','Heating from heat pump - SF-New','PJ');
INSERT INTO "commodity" VALUES('RES_PH_SO','p','Heating from heat pump - SF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PW_MO','p','Hot water from heat pump - MF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_PW_SN','p','Hot water from heat pump - SF-New','PJ');
INSERT INTO "commodity" VALUES('RES_PW_SO','p','Hot water from heat pump - SF-Old','PJ');
INSERT INTO "commodity" VALUES('RES_RF_FRZ','a','Refrigeration - Freezers','Gl');
INSERT INTO "commodity" VALUES('RES_RF_RFG','a','Refrigeration - Refrigerators','Gl');
INSERT INTO "commodity" VALUES('RES_CH4','e','Residential - CH4 emission','t');
INSERT INTO "commodity" VALUES('RES_CO2','e','Residential - CO2 emission','kt');
INSERT INTO "commodity" VALUES('RES_N2O','e','Residential - N2O emission','t');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('LAN','a','Lanthanum','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('YTT','a','Yttrium','t');
INSERT INTO "commodity" VALUES('ZIR','a','Zirconium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('BIO_METH','s','Biomethane','PJ');
INSERT INTO "commodity" VALUES('BIO_GAS','s','Biogas','PJ');
INSERT INTO "commodity" VALUES('BIO_SLB','s','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('COA_HCO','s','Hard coal','PJ');
INSERT INTO "commodity" VALUES('COA_OVC','s','Coke oven coke','PJ');
INSERT INTO "commodity" VALUES('CRT_EFF','s','Energy efficiency certificates','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','s','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','p','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('ELC_H2','s','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('ELC_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_COG','s','Coke oven gas','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GEO','s','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('H2_BL','s','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('HET','s','Heat','PJ');
INSERT INTO "commodity" VALUES('OIL_DST','s','Distillates','PJ');
INSERT INTO "commodity" VALUES('OIL_HFO','s','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('OIL_KER','s','Other kerosene','PJ');
INSERT INTO "commodity" VALUES('OIL_LPG','s','Liquid petroleum gas','PJ');
INSERT INTO "commodity" VALUES('OIL_NSP','s','Non specified oil','PJ');
INSERT INTO "commodity" VALUES('SOL','s','Solar energy','PJ');
INSERT INTO "commodity" VALUES('SYN_DST','s','Synthetic diesel fuel','PJ');
INSERT INTO "commodity" VALUES('SYN_KER','s','Synthetic kerosene','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','s','Synthetic natural gas','PJ');

CREATE TABLE allocation (
    demand_comm TEXT REFERENCES commodity(name),
    driver_name TEXT,
    notes       TEXT,
    PRIMARY KEY(demand_comm, driver_name)
);
INSERT INTO "allocation" VALUES('RES_CD','POP','');
INSERT INTO "allocation" VALUES('RES_CK','POP','');
INSERT INTO "allocation" VALUES('RES_CW','POP','');
INSERT INTO "allocation" VALUES('RES_DW','POP','');
INSERT INTO "allocation" VALUES('RES_LG','POP','');
INSERT INTO "allocation" VALUES('RES_OE','POP','');
INSERT INTO "allocation" VALUES('RES_RF','POP','');
INSERT INTO "allocation" VALUES('RES_SC','POP','');
INSERT INTO "allocation" VALUES('RES_SH_SO','POP','');
INSERT INTO "allocation" VALUES('RES_SH_MO','POP','');
INSERT INTO "allocation" VALUES('RES_SH_SN','DRH3','');
INSERT INTO "allocation" VALUES('RES_SH_MN','DRH4','');
INSERT INTO "allocation" VALUES('RES_WH','POP','');

CREATE TABLE sector_label (
    sector TEXT PRIMARY KEY,
    notes  TEXT
);
INSERT INTO "sector_label" VALUES('AGR','agriculture');
INSERT INTO "sector_label" VALUES('COM','commercial');
INSERT INTO "sector_label" VALUES('RES','residential');
INSERT INTO "sector_label" VALUES('TRA','transport');
INSERT INTO "sector_label" VALUES('IND','industry');
INSERT INTO "sector_label" VALUES('ELC','electricity');
INSERT INTO "sector_label" VALUES('GEN','generation');
INSERT INTO "sector_label" VALUES('STG','storage');
INSERT INTO "sector_label" VALUES('IMP','import');
INSERT INTO "sector_label" VALUES('UPS','upstream');
INSERT INTO "sector_label" VALUES('H2','hydrogen');
INSERT INTO "sector_label" VALUES('CCUS','ccus');
INSERT INTO "sector_label" VALUES('MAT','materials');

CREATE TABLE technology_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "technology_type" VALUES('r','resource technology');
INSERT INTO "technology_type" VALUES('p','production technology');
INSERT INTO "technology_type" VALUES('pb','baseload production technology');
INSERT INTO "technology_type" VALUES('ps','storage production technology');

CREATE TABLE technology (
    tech         TEXT NOT NULL PRIMARY KEY,
    flag         TEXT NOT NULL REFERENCES technology_type(label),
    sector       TEXT REFERENCES sector_label(sector),
    category     TEXT,
    sub_category TEXT,
    unlim_cap    INTEGER NOT NULL DEFAULT 0,
    annual       INTEGER NOT NULL DEFAULT 0,
    reserve      INTEGER NOT NULL DEFAULT 0,
    curtail      INTEGER NOT NULL DEFAULT 0,
    retire       INTEGER NOT NULL DEFAULT 0,
    flex         INTEGER NOT NULL DEFAULT 0,
    exchange     INTEGER NOT NULL DEFAULT 0,
    seas_stor    INTEGER NOT NULL DEFAULT 0,
    description  TEXT
);
INSERT INTO "technology" VALUES('RES_FT_NGA','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Natural gas mix');
INSERT INTO "technology" VALUES('RES_FT_DST','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Diesel');
INSERT INTO "technology" VALUES('RES_FT_HFO','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Heavy fuel oil');
INSERT INTO "technology" VALUES('RES_FT_KER','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Kerosene');
INSERT INTO "technology" VALUES('RES_FT_COA','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Coal');
INSERT INTO "technology" VALUES('RES_FT_LPG','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - LPG');
INSERT INTO "technology" VALUES('RES_FT_BIO','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Biofuels');
INSERT INTO "technology" VALUES('RES_FT_GEO','p','RES','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Geothermal');
INSERT INTO "technology" VALUES('RES_FT_SOL','p','RES','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Solar');
INSERT INTO "technology" VALUES('RES_FT_HET','p','RES','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Heat');
INSERT INTO "technology" VALUES('RES_FT_ELC','p','RES','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Electricity');
INSERT INTO "technology" VALUES('RES_SH_BUR_NGA_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Natural gas - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_AHP_NGA_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Natural gas - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_DST_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Diesel - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_HFO_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Heavy fuel oil - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_KER_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Kerosene - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_COA_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Coal - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_LPG_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - LPG - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Woodstove - Biomass - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HT_ELC_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Electric heater - Electricity - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_ELC_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Electricity - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - heat - SF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_GEO_SO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Geothermal energy - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_NGA_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Natural gas - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_NGA_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Natural gas - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_DST_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Diesel - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_HFO_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Heavy fuel oil - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_KER_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Kerosene - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_COA_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Coal - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_LPG_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - LPG - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Woodstove - Biomass - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HT_ELC_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Electric heater - Electricity - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Electricity - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - heat - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_GEO_MO_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Geothermal energy - MF-old - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_NGA_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Natural gas - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_AHP_NGA_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Natural gas - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_DST_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Diesel - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_HFO_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Heavy fuel oil - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_KER_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Kerosene - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_COA_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Coal - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_LPG_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - LPG - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Woodstove - Biomass - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_HT_ELC_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Electric heater - Electricity - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Electricity - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_GEO_SN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Natural gas - SF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_BUR_NGA_MN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Burner - Natural gas - MF-new - Existing');
INSERT INTO "technology" VALUES('RES_SH_HP_NGA_MN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Natural gas - MF-new - Existing');
INSERT INTO "technology" VALUES('RES_SC_CEN_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Central cooling - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_SC_EHP_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_SC_ROOM_E','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Room cooling - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_WH_NGA_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Natural gas - Existing');
INSERT INTO "technology" VALUES('RES_WH_HFO_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Heavy fuel oil - Existing');
INSERT INTO "technology" VALUES('RES_WH_DST_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel - Existing');
INSERT INTO "technology" VALUES('RES_WH_LPG_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG - Existing');
INSERT INTO "technology" VALUES('RES_WH_BIO_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Biomass - Existing');
INSERT INTO "technology" VALUES('RES_WH_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_WH_HET_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Heat - Existing');
INSERT INTO "technology" VALUES('RES_WH_SOL_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Solar energy - Existing');
INSERT INTO "technology" VALUES('RES_RF_TECH','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration technology');
INSERT INTO "technology" VALUES('RES_RF_RFG_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Refrigerator - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_RF_FRZ_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Freezer - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_CW_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_CD_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth drying - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_DW_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_CK_NGA_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Natural gas - Existing');
INSERT INTO "technology" VALUES('RES_CK_LPG_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - LPG - Existing');
INSERT INTO "technology" VALUES('RES_CK_ELC_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_OE_EQP_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Other electric - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_LFL_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large fluorescent light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_SFL_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small fluorescent light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_LHAL_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large halogen light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_SHAL_IMP_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small improved halogen light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_SHAL_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small halogen light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_MIN_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Medium incandescence light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_LG_SIN_E','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small incandescence light - Electricity - Existing');
INSERT INTO "technology" VALUES('RES_RF_RFG_CLB_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class B refrigerator - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_RFG_CLA1_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class A refrigerator - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_RFG_CLA2_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class A+ refrigerator - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_RFG_CLA3_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class A++ refrigerator - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_RFG_2010_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - New refrigerator 2010 - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_RFG_2020_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - New refrigerator 2020 - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_FRZ_CLB_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class B freezer - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_FRZ_CLA1_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class A freezer - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_FRZ_CLA2_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Class A++ freezer - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_FRZ_2010_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - New freezer 2010 - Electricity - New');
INSERT INTO "technology" VALUES('RES_RF_FRZ_2020_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - New freezer 2020 - Electricity - New');
INSERT INTO "technology" VALUES('RES_WH_DST_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel - New');
INSERT INTO "technology" VALUES('RES_WH_DST_COND_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel (condensing) - New');
INSERT INTO "technology" VALUES('RES_WH_NGA_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Natural gas - New');
INSERT INTO "technology" VALUES('RES_WH_NGA_COND_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Natural gas (condensing) - New');
INSERT INTO "technology" VALUES('RES_WH_LPG_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG - New');
INSERT INTO "technology" VALUES('RES_WH_LPG_COND_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG (condensing) - New');
INSERT INTO "technology" VALUES('RES_WH_WPL_BIO_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Biomass wood pellet water heater - New');
INSERT INTO "technology" VALUES('RES_WH_ELC_RES_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Resistance - Electricity - New');
INSERT INTO "technology" VALUES('RES_WH_AHP_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Air-coupled heat pump - Electricity - New');
INSERT INTO "technology" VALUES('RES_WH_HNS_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Heat pump coupled near surface - Electricity  - New');
INSERT INTO "technology" VALUES('RES_WH_SOL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Water heating - Solar energy - New');
INSERT INTO "technology" VALUES('RES_WH_PDC_ACS_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Water heating - Heat pump sanitary water- Heat pump');
INSERT INTO "technology" VALUES('RES_CW_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - Electricity - New');
INSERT INTO "technology" VALUES('RES_CW_ELC_IMP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - Electricity (improved) - New');
INSERT INTO "technology" VALUES('RES_CW_ELC_ADV_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - Electricity (advanced) - New');
INSERT INTO "technology" VALUES('RES_CW_2010_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - New electric cloth washing machine 2010 - Electricity - New');
INSERT INTO "technology" VALUES('RES_CW_2020_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth washing - New electric cloth washing machine 2020 - Electricity - New');
INSERT INTO "technology" VALUES('RES_CD_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth drying - Electricity (standard) - New');
INSERT INTO "technology" VALUES('RES_CD_ELC_ADV_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth drying - Electricity (advanced) - New');
INSERT INTO "technology" VALUES('RES_CD_ELC_NEW_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cloth drying - Electricity (new) - New');
INSERT INTO "technology" VALUES('RES_DW_ELC_STD_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - Electricity (standard) - New');
INSERT INTO "technology" VALUES('RES_DW_ELC_IMP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - Electricity (improved) - New');
INSERT INTO "technology" VALUES('RES_DW_ELC_ADV_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - Electricity (advanced) - New');
INSERT INTO "technology" VALUES('RES_DW_2010_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - New dish washer 2010 - Electricity - New');
INSERT INTO "technology" VALUES('RES_DW_2020_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Dish washing - New dish washer 2020 - Electricity - New');
INSERT INTO "technology" VALUES('RES_CK_NGA_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Natural gas - New');
INSERT INTO "technology" VALUES('RES_CK_COA_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Coal - New');
INSERT INTO "technology" VALUES('RES_CK_LPG_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - LPG - New');
INSERT INTO "technology" VALUES('RES_CK_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Electricity - New');
INSERT INTO "technology" VALUES('RES_CK_BIO_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Cooking - Biomass - New');
INSERT INTO "technology" VALUES('RES_LG_BFL_IMP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Big fluorescent compact energy-saver light - Electricity  - New');
INSERT INTO "technology" VALUES('RES_LG_SFL_IMP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small fluorescent compact energy-saver light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_EFL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Electrodeless fluorescent induction light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_LFL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large fluorescent light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_SFL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small fluorescent light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_LHAL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large standard halogen light 220 V - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_SHAL_IMP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small improved halogen 12 V - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_SHAL_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small standard halogen 12 V - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_MIN_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Incandescent medium light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_SIN_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Incandescent small light - Electricity - New');
INSERT INTO "technology" VALUES('RES_LG_KER_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - Kerosene lamp - Kerosene - New');
INSERT INTO "technology" VALUES('RES_LG_LED_ELC_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Lighting - LED lamp - Electricity - New');
INSERT INTO "technology" VALUES('RES_SH_DST_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_DST_COND_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel (condensing) - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_COND_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas (condensing) - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_COND_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG (condensing) - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood stove - Biomass - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WPL_BIO_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood pellet - Biomass - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump heating - Electricity - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HNS_ELC_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled near surface - Electricity - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HPP_ELC_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled with probe - Electricity - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HP_HET_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Heat - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HPTS_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat-pump electricity-to-service transformation - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_DST_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + Diesel - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_LPG_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + LPG heating - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_NGA_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + NGA heating - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_ROOF_INS_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Roof insulation - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_INT_INS_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Internal insulation - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_BASE_INS_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Base floor insulation - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WIN_INS_SO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Windows insulation - SF-old - New');
INSERT INTO "technology" VALUES('RES_SH_DST_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_DST_COND_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel (condensing) - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_COND_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas (condensing) - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_COND_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG (condensing) - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood stove - Biomass - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WPL_BIO_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood pellet - Biomass - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump heating - Electricity  - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HNS_ELC_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled near surface - Electricity - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HPP_ELC_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled with probe - Electricity - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat  - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HP_HET_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Heat - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_HPTS_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat-pump electricity-to-service transformation - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_DST_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + Diesel - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_LPG_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + LPG heating - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_NGA_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + NGA heating - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_ROOF_INS_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Roof insulation - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_INT_INS_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Internal insulation - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_BASE_INS_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Base floor insulation - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_WIN_INS_MO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Windows insulation - MF-old - New');
INSERT INTO "technology" VALUES('RES_SH_DST_COND_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel (condensing) - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_COND_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas (condensing) - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_COND_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG (condensing) - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood stove - Biomass - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_WPL_BIO_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood pellet - Biomass - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump heating - Electricity - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HNS_ELC_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled near surface - Electricity - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HPP_ELC_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled with probe - Electricity - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HP_HET_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Heat - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HPTS_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat-pump electricity-to-service transformation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HPTS_GEO_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Geothermal heat-pump electricity-to-service transformation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_DST_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + Diesel - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_LPG_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + LPG heating - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_SOL_NGA_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Solar + NGA heating - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_ROOF_INS_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Roof insulation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_INT_INS_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Internal insulation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_BASE_INS_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Base floor insulation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_WIN_INS_SN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Windows insulation - SF-new - New');
INSERT INTO "technology" VALUES('RES_SH_DST_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_DST_COND_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Diesel (condensing) - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_NGA_COND_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Natural gas (condensing) - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_LPG_COND_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - LPG (condensing) - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_WST_BIO_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood stove - Biomass - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_WPL_BIO_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood pellet - Biomass - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_AHP_ELC_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump heating - Electricity - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HNS_ELC_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled near surface - Electricity - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HPP_ELC_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled with probe - Electricity - MF-new - New');
INSERT INTO "technology" VALUES('RES_SH_HEX_HET_MN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - MF-new - New');
INSERT INTO "technology" VALUES('RES_SC_AHP_ELC_STD_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump cooling - Electricity (standard) - New');
INSERT INTO "technology" VALUES('RES_SC_AHP_ELC_IMP_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump cooling - Electricity (improved) - New');
INSERT INTO "technology" VALUES('RES_SC_CEN_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Central - New');
INSERT INTO "technology" VALUES('RES_SC_ROOM_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Room - New');
INSERT INTO "technology" VALUES('RES_SC_AHP_ELC_ADV_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump - Electricity (advanced) - New');
INSERT INTO "technology" VALUES('RES_SC_GEO_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Heat pump - Geothermal energy - New');
INSERT INTO "technology" VALUES('RES_SC_ROOM_ELC_NEW_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Room - Electricity (new) - New');
INSERT INTO "technology" VALUES('RES_SC_GEO_IMP_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Heat pump - Geothermal (improved) - New');
INSERT INTO "technology" VALUES('RES_SC_AHP_NGA_ADV_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump - Natural gas (advanced) - New');
INSERT INTO "technology" VALUES('RES_SC_CEN_NGA_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Central - Natural gas - New');
INSERT INTO "technology" VALUES('RES_SC_AHP_NGA_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump - Natural gas (new) - New');
INSERT INTO "technology" VALUES('RES_SC_HP_N','p','RES','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Heat pump - New');
INSERT INTO "technology" VALUES('RES_MISC_EQP_N','p','RES','',NULL,0,1,0,0,0,0,0,0,'Miscellaneous equipment - New');
INSERT INTO "technology" VALUES('RES_CHP_NGA_CI_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_MICRO_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Cogenerative microturbine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_CC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Combined cycle - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_STR_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Stirling engine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_SOFC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Solid oxide fuel cell - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_H2_PEMFC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Solid oxide fuel cell - Hydrogen');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_LAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lanthanum');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_YTT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Yttrium');
INSERT INTO "technology" VALUES('MAT_SUP_ZIR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Zirconium');

CREATE TABLE time_period_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "time_period_type" VALUES('e','existing vintages');
INSERT INTO "time_period_type" VALUES('f','future vintages');

CREATE TABLE time_period (
    sequence INTEGER UNIQUE,
    period   INTEGER PRIMARY KEY,
    flag     TEXT REFERENCES time_period_type(label)
);
INSERT INTO "time_period" VALUES(1,2006,'e');
INSERT INTO "time_period" VALUES(2,2007,'f');
INSERT INTO "time_period" VALUES(3,2008,'f');
INSERT INTO "time_period" VALUES(4,2010,'f');
INSERT INTO "time_period" VALUES(5,2012,'f');
INSERT INTO "time_period" VALUES(6,2014,'f');
INSERT INTO "time_period" VALUES(7,2016,'f');
INSERT INTO "time_period" VALUES(8,2018,'f');
INSERT INTO "time_period" VALUES(9,2020,'f');
INSERT INTO "time_period" VALUES(10,2022,'f');
INSERT INTO "time_period" VALUES(11,2025,'f');
INSERT INTO "time_period" VALUES(12,2030,'f');
INSERT INTO "time_period" VALUES(13,2035,'f');
INSERT INTO "time_period" VALUES(14,2040,'f');
INSERT INTO "time_period" VALUES(15,2045,'f');
INSERT INTO "time_period" VALUES(16,2050,'f');
INSERT INTO "time_period" VALUES(17,2060,'f');

CREATE TABLE capacity_credit (
    region  TEXT,
    period  INTEGER REFERENCES time_period(period),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    credit  REAL,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage),
    CHECK(credit >= 0 AND credit <= 1)
);
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_CI_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_CC_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2022,'RES_CHP_NGA_STR_N',2022,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N',2020,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N',2020,0.2,'');

CREATE TABLE time_of_day (
    sequence INTEGER UNIQUE,
    tod      TEXT PRIMARY KEY,
    hours    REAL NOT NULL DEFAULT 1,
    notes    TEXT,
    CHECK(hours > 0)
);
INSERT INTO "time_of_day" VALUES(1,'afternoon',6.0,NULL);
INSERT INTO "time_of_day" VALUES(2,'morning',6.0,NULL);
INSERT INTO "time_of_day" VALUES(3,'night',9.0,NULL);
INSERT INTO "time_of_day" VALUES(4,'noon',3.0,NULL);

CREATE TABLE time_season (
    sequence         INTEGER UNIQUE,
    season           TEXT PRIMARY KEY,
    segment_fraction REAL NOT NULL DEFAULT 0,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
INSERT INTO "time_season" VALUES(1,'fall',0.252,NULL);
INSERT INTO "time_season" VALUES(2,'spring',0.2493,NULL);
INSERT INTO "time_season" VALUES(3,'summer',0.252,NULL);
INSERT INTO "time_season" VALUES(4,'winter',0.2467,NULL);

CREATE TABLE capacity_factor_process (
    region  TEXT,
    season  TEXT REFERENCES time_season(season),
    tod     TEXT REFERENCES time_of_day(tod),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    factor  REAL,
    notes   TEXT,
    PRIMARY KEY(region, season, tod, tech, vintage),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE capacity_factor_tech (
    region TEXT,
    season TEXT REFERENCES time_season(season),
    tod    TEXT REFERENCES time_of_day(tod),
    tech   TEXT REFERENCES technology(tech),
    factor REAL,
    notes  TEXT,
    PRIMARY KEY(region, season, tod, tech),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE capacity_to_activity (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    c2a    REAL,
    units  TEXT,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_NGA_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_NGA_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_DST_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_HFO_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_KER_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_COA_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_LPG_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HT_ELC_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_ELC_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_GEO_SO_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_NGA_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_NGA_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_DST_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_HFO_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_KER_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_COA_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_LPG_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HT_ELC_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_GEO_MO_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_NGA_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_NGA_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_DST_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_HFO_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_KER_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_COA_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_LPG_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HT_ELC_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_GEO_SN_E',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_BUR_NGA_MN_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_NGA_MN_E',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_CEN_E',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_EHP_E',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_ROOM_E',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_COND_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_COND_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_COND_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WPL_BIO_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HNS_ELC_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HPP_ELC_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_HET_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_DST_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_LPG_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_NGA_SO_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_COND_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_COND_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_COND_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WPL_BIO_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HNS_ELC_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HPP_ELC_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_HET_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_DST_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_LPG_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_NGA_MO_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_COND_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_COND_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_COND_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WPL_BIO_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HNS_ELC_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HPP_ELC_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HP_HET_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_DST_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_LPG_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_SOL_NGA_SN_N',3.1949,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_DST_COND_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_NGA_COND_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_LPG_COND_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WST_BIO_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_WPL_BIO_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_AHP_ELC_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HNS_ELC_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HPP_ELC_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SH_HEX_HET_MN_N',3.0303,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_AHP_ELC_STD_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_AHP_ELC_IMP_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_CEN_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_ROOM_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_AHP_ELC_ADV_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_GEO_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_ROOM_ELC_NEW_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_GEO_IMP_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_AHP_NGA_ADV_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_CEN_NGA_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_SC_AHP_NGA_N',8.5707,'Mm2/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_MICRO_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_CC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_STR_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_SOFC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_H2_PEMFC_N',31.536,'PJ/(GW)','');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_NGA',56.1,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_DST',74.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_HFO',77.37,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_KER',71.87,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_COA',98.27,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_LPG',63.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CO2','RES_BIO',0.0001,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_NGA',1.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_DST',1.32,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_HFO',0.72,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_KER',5.53,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_COA',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_LPG',5.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_CH4','RES_BIO',300.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_NGA',1.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_DST',3.36,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_HFO',3.11,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_KER',6.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_COA',1.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_LPG',0.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('RES_N2O','RES_BIO',4.0,'t/(PJ)','');

CREATE TABLE construction_input (
    region     TEXT,
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    vintage    INTEGER REFERENCES time_period(period),
    value      REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(region, input_comm, tech, vintage)
);
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_CI_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_CI_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_CI_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_MICRO_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_MICRO_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_MICRO_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_CC_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_CC_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_CC_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_STR_N',2022,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_STR_N',2022,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_STR_N',2022,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_SOFC_N',2020,6.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','RES_CHP_NGA_SOFC_N',2020,1.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','RES_CHP_NGA_SOFC_N',2020,0.128,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ZIR','RES_CHP_NGA_SOFC_N',2020,1.79,'t/(GW)','10.1016/j.mtener.2025.101805');

CREATE TABLE cost_emission (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT NOT NULL REFERENCES commodity(name),
    cost      REAL NOT NULL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, emis_comm)
);

CREATE TABLE cost_fixed (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL REFERENCES time_period(period),
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_NGA',2006,4.1,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_DST',2006,6.15,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_HFO',2006,6.15,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_KER',2006,6.15,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_COA',2006,6.97,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_LPG',2006,6.15,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'RES_FT_BIO',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_RFG_CLB_N',2007,20.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_RFG_CLA1_N',2007,20.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_RFG_CLA2_N',2007,30.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_RFG_CLA3_N',2007,40.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'RES_RF_RFG_2010_N',2010,50.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'RES_RF_RFG_2020_N',2020,80.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_FRZ_CLB_N',2007,10.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_FRZ_CLA1_N',2007,10.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_RF_FRZ_CLA2_N',2007,20.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'RES_RF_FRZ_2010_N',2010,25.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'RES_RF_FRZ_2020_N',2020,40.0,'MEUR/(Gl/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_DST_N',2007,0.024,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_DST_COND_N',2007,0.036,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_NGA_N',2007,0.021,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_NGA_COND_N',2007,0.028,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_LPG_N',2007,0.023,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_LPG_COND_N',2007,0.029,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_WPL_BIO_N',2007,0.05,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_ELC_RES_N',2007,0.034,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_AHP_ELC_N',2007,0.196,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_HNS_ELC_N',2007,0.209,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_WH_SOL_N',2007,0.01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CW_ELC_N',2007,10.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CW_ELC_IMP_N',2007,20.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CW_ELC_ADV_N',2007,20.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'RES_CW_2010_ELC_N',2010,30.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'RES_CW_2020_ELC_N',2020,30.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CD_ELC_N',2007,20.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'RES_CD_ELC_ADV_N',2010,30.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'RES_CD_ELC_NEW_N',2020,40.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_DW_ELC_STD_N',2007,20.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_DW_ELC_IMP_N',2007,30.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_DW_ELC_ADV_N',2007,30.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'RES_DW_2010_ELC_N',2010,40.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'RES_DW_2020_ELC_N',2020,50.0,'MEUR/(Glav/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CK_NGA_N',2007,2.3,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CK_COA_N',2007,9.927,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CK_LPG_N',2007,3.449,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CK_ELC_N',2007,4.599,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_CK_BIO_N',2007,4.963,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_LHAL_N',2007,0.42,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_SHAL_IMP_N',2007,0.82,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_SHAL_N',2007,0.51,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_MIN_N',2007,0.38,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_SIN_N',2007,0.71,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_LG_KER_N',2007,4.0,'MEUR/(Glm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_SO_N',2007,0.05866,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_COND_SO_N',2007,0.0872,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_SO_N',2007,0.04994,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_COND_SO_N',2007,0.0684,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_SO_N',2007,0.0547,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_COND_SO_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WST_BIO_SO_N',2007,0.02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WPL_BIO_SO_N',2007,0.1585,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_AHP_ELC_SO_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HNS_ELC_SO_N',2007,0.5074,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPP_ELC_SO_N',2007,0.6659,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HEX_HET_SO_N',2007,0.0288,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HP_HET_SO_N',2007,0.0001,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPTS_SO_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_DST_SO_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_LPG_SO_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_NGA_SO_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_MO_N',2007,0.05866,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_COND_MO_N',2007,0.0872,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_MO_N',2007,0.04994,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_COND_MO_N',2007,0.0684,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_MO_N',2007,0.0547,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_COND_MO_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WST_BIO_MO_N',2007,0.02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WPL_BIO_MO_N',2007,0.1585,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_AHP_ELC_MO_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HNS_ELC_MO_N',2007,0.5074,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPP_ELC_MO_N',2007,0.6659,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HEX_HET_MO_N',2007,0.0288,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HP_HET_MO_N',2007,0.0001,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPTS_MO_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_DST_MO_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_LPG_MO_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_NGA_MO_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_COND_SN_N',2007,0.0872,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_COND_SN_N',2007,0.0684,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_COND_SN_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WST_BIO_SN_N',2007,0.02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WPL_BIO_SN_N',2007,0.1585,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_AHP_ELC_SN_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HNS_ELC_SN_N',2007,0.5074,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPP_ELC_SN_N',2007,0.6659,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HEX_HET_SN_N',2007,0.0288,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HP_HET_SN_N',2007,0.0001,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPTS_SN_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPTS_GEO_SN_N',2007,0.01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_DST_SN_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_LPG_SN_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_SOL_NGA_SN_N',2007,0.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_MN_N',2007,0.05866,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_DST_COND_MN_N',2007,0.0872,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_MN_N',2007,0.04994,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_NGA_COND_MN_N',2007,0.0684,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_MN_N',2007,0.0547,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_LPG_COND_MN_N',2007,0.07,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WST_BIO_MN_N',2007,0.02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_WPL_BIO_MN_N',2007,0.1585,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_AHP_ELC_MN_N',2007,0.4756,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HNS_ELC_MN_N',2007,0.5074,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HPP_ELC_MN_N',2007,0.6659,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SH_HEX_HET_MN_N',2007,0.0288,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_AHP_ELC_STD_N',2007,0.6309,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_AHP_ELC_IMP_N',2007,0.7344,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_CEN_N',2007,0.9631,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_ROOM_N',2007,0.9396,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_AHP_ELC_ADV_N',2007,1.01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_GEO_N',2007,1.119,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_ROOM_ELC_NEW_N',2007,1.163,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_GEO_IMP_N',2007,0.7222,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_AHP_NGA_ADV_N',2007,0.8079,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_CEN_NGA_N',2007,1.299,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2016,'RES_SC_AHP_NGA_N',2016,1.28,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_SC_HP_N',2007,0.01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'RES_MISC_EQP_N',2007,11.95,'MEUR/(PJ/year)','');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "cost_invest" VALUES('IT','RES_FT_NGA',2007,20.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_FT_GEO',2007,1.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_FT_HET',2007,5.07,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_CLB_N',2007,1600.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_CLA1_N',2007,2200.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_CLA2_N',2007,2700.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_CLA3_N',2007,3700.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_2010_N',2010,5000.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_RFG_2020_N',2020,7700.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_FRZ_CLB_N',2007,1100.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_FRZ_CLA1_N',2007,1500.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_FRZ_CLA2_N',2007,1900.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_FRZ_2010_N',2010,2568.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_RF_FRZ_2020_N',2020,3954.0,'MEUR/(Gl)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_DST_N',2007,2.42,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_DST_COND_N',2007,3.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_NGA_N',2007,2.06,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_NGA_COND_N',2007,2.82,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_LPG_N',2007,2.26,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_LPG_COND_N',2007,2.89,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_WPL_BIO_N',2007,5.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_ELC_RES_N',2007,1.7,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_AHP_ELC_N',2007,19.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_HNS_ELC_N',2007,20.94,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_SOL_N',2007,29.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_SOL_N',2020,27.72,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_SOL_N',2050,26.51,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_WH_PDC_ACS_N',2007,0.01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CW_ELC_N',2007,1466.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CW_ELC_IMP_N',2007,2256.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CW_ELC_ADV_N',2007,2707.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CW_2010_ELC_N',2010,3158.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CW_2020_ELC_N',2020,3835.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CD_ELC_N',2007,6000.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CD_ELC_ADV_N',2010,7500.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CD_ELC_NEW_N',2020,9000.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_DW_ELC_STD_N',2007,2400.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_DW_ELC_IMP_N',2007,2800.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_DW_ELC_ADV_N',2007,3400.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_DW_2010_ELC_N',2010,3900.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_DW_2020_ELC_N',2020,5300.0,'MEUR/(Glav)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CK_NGA_N',2007,91.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CK_COA_N',2007,66.18,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CK_LPG_N',2007,138.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CK_ELC_N',2007,184.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CK_BIO_N',2007,66.18,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_BFL_IMP_N',2007,23.78,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_SFL_IMP_N',2007,7.93,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_EFL_N',2007,50.74,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_LFL_N',2007,3.96,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_SFL_N',2007,13.06,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_LHAL_N',2007,1.06,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_SHAL_IMP_N',2007,5.44,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_SHAL_N',2007,1.27,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_MIN_N',2007,0.42,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_SIN_N',2007,0.79,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_KER_N',2007,1.0,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_LG_LED_ELC_N',2007,63.42,'MEUR/(Glm)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_SO_N',2007,5.87,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_COND_SO_N',2007,8.72,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_SO_N',2007,4.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_COND_SO_N',2007,6.84,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_SO_N',2007,5.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_COND_SO_N',2007,7.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_SO_N',2007,2.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_SO_N',2020,3.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_SO_N',2050,4.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WPL_BIO_SO_N',2007,15.85,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_AHP_ELC_SO_N',2007,47.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HNS_ELC_SO_N',2007,50.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPP_ELC_SO_N',2007,66.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SO_N',2007,2.88,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SO_N',2020,2.75,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SO_N',2050,2.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HP_HET_SO_N',2007,0.01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_SO_N',2007,47.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SO_N',2007,23.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SO_N',2020,22.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SO_N',2050,21.48,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SO_N',2007,23.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SO_N',2020,21.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SO_N',2050,21.02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SO_N',2007,22.49,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SO_N',2020,21.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SO_N',2050,20.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_ROOF_INS_SO_N',2007,481.32,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_INT_INS_SO_N',2007,859.34,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_BASE_INS_SO_N',2007,1493.51,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WIN_INS_SO_N',2007,2767.65,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_MO_N',2007,5.87,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_COND_MO_N',2007,8.72,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_MO_N',2007,4.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_COND_MO_N',2007,6.84,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_MO_N',2007,5.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_COND_MO_N',2007,7.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_MO_N',2007,2.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WPL_BIO_MO_N',2007,15.85,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_AHP_ELC_MO_N',2007,47.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HNS_ELC_MO_N',2007,50.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPP_ELC_MO_N',2007,66.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MO_N',2007,2.88,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MO_N',2020,2.75,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MO_N',2050,2.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HP_HET_MO_N',2007,0.01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_MO_N',2007,47.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_MO_N',2007,23.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_MO_N',2020,22.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_MO_N',2050,21.48,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_MO_N',2007,23.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_MO_N',2020,21.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_MO_N',2050,21.02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_MO_N',2007,22.49,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_MO_N',2020,21.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_MO_N',2050,20.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_ROOF_INS_MO_N',2007,377.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_INT_INS_MO_N',2007,406.02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_BASE_INS_MO_N',2007,431.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WIN_INS_MO_N',2007,923.76,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_COND_SN_N',2007,8.72,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_COND_SN_N',2007,6.84,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_COND_SN_N',2007,7.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_SN_N',2007,2.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WPL_BIO_SN_N',2007,15.85,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_AHP_ELC_SN_N',2007,47.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HNS_ELC_SN_N',2007,50.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPP_ELC_SN_N',2007,66.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SN_N',2007,2.88,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SN_N',2020,2.75,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_SN_N',2050,2.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HP_HET_SN_N',2007,0.01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_SN_N',2007,43.24,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_SN_N',2020,41.18,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_SN_N',2050,39.22,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPTS_GEO_SN_N',2007,60.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SN_N',2007,23.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SN_N',2020,22.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_DST_SN_N',2050,21.48,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SN_N',2007,23.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SN_N',2020,21.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_LPG_SN_N',2050,21.02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SN_N',2007,22.49,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SN_N',2020,21.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_SOL_NGA_SN_N',2050,20.56,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_ROOF_INS_SN_N',2007,262.64,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_INT_INS_SN_N',2007,264.2,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_BASE_INS_SN_N',2007,559.32,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WIN_INS_SN_N',2007,1953.37,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_MN_N',2007,5.87,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_DST_COND_MN_N',2007,8.72,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_MN_N',2007,4.99,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_NGA_COND_MN_N',2007,6.84,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_MN_N',2007,5.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_LPG_COND_MN_N',2007,7.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WST_BIO_MN_N',2007,2.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_WPL_BIO_MN_N',2007,15.85,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_AHP_ELC_MN_N',2007,43.24,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HNS_ELC_MN_N',2007,50.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HPP_ELC_MN_N',2007,66.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MN_N',2007,2.88,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MN_N',2020,2.75,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SH_HEX_HET_MN_N',2050,2.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_AHP_ELC_STD_N',2007,31.55,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_AHP_ELC_IMP_N',2007,40.39,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_CEN_N',2007,48.47,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_ROOM_N',2007,47.02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_AHP_ELC_ADV_N',2007,50.49,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_GEO_N',2007,60.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_ROOM_ELC_NEW_N',2007,57.52,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_GEO_IMP_N',2007,91.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_AHP_NGA_ADV_N',2007,40.39,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_CEN_NGA_N',2007,54.53,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_AHP_NGA_N',2016,60.59,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_SC_HP_N',2007,0.01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_MISC_EQP_N',2007,1.26,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2007,1100.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2014,1050.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2022,980.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2030,900.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,1500.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2014,1350.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2022,1160.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2030,1000.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2007,1300.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2014,1300.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2022,1300.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_STR_N',2022,2180.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_STR_N',2030,2100.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,10000.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2025,8000.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2030,3500.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,6000.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2025,5000.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2030,4000.0,'MEUR/(GW)','');

CREATE TABLE cost_variable (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL REFERENCES time_period(period),
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_ELC',2006,21.31,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_BIO',2006,1.55,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_COA',2006,3.88,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_DST',2006,13.79,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_HFO',2006,8.25,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_KER',2006,13.2,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_LPG',2006,7.23,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_NGA',2006,7.300000000000001,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'RES_FT_SOL',2006,0.1,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_CI_N',2007,4.17,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_CI_N',2014,3.75,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_CI_N',2022,3.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_CI_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N',2007,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N',2014,2.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N',2022,1.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N',2030,1.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_CC_N',2007,0.5,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_CC_N',2014,0.44,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_CC_N',2022,0.42,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_STR_N',2022,5.0,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_STR_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N',2020,27.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N',2025,22.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_SOFC_N',2030,6.94,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N',2020,20.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N',2025,13.89,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N',2030,6.94,'MEUR/(PJ)','');

CREATE TABLE currency (
    curr   TEXT,
    value  REAL,
    ref    TEXT,
    units  TEXT,
    notes  TEXT,
    PRIMARY KEY(curr)
);
INSERT INTO "currency" VALUES('EUR00',1.45,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR01',1.4,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR02',1.36,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR03',1.33,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR04',1.3,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR05',1.27,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR06',1.24,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR07',1.21,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR08',1.17,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR09',1.16,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR10',1.14,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR11',1.11,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR12',1.08,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR13',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR14',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR15',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR16',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR17',1.04,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR18',1.02,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR19',1.01,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR20',1.0,'REF',NULL,NULL);
INSERT INTO "currency" VALUES('EUR21',0.97,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR22',0.92,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD00',1.57,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD01',1.55,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD02',1.43,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD03',1.07,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD04',1.03,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD05',0.93,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD06',0.98,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD07',0.88,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD08',0.79,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD09',0.83,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD10',0.85,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD11',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD12',0.83,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD13',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD14',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD15',0.95,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD16',0.95,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD17',0.92,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD18',0.87,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD19',0.9,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD20',0.88,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD21',0.82,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD22',0.86,'',NULL,NULL);

CREATE TABLE currency_tech (
    tech   TEXT REFERENCES technology(tech),
    curr   TEXT REFERENCES currency(curr),
    notes  TEXT,
    PRIMARY KEY(tech)
);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_CLB_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_CLA1_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_CLA2_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_CLA3_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_2010_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_RFG_2020_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_FRZ_CLB_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_FRZ_CLA1_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_FRZ_CLA2_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_FRZ_2010_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_RF_FRZ_2020_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_DST_COND_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_NGA_COND_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_LPG_COND_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_WPL_BIO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_ELC_RES_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_AHP_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_HNS_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_SOL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_WH_PDC_ACS_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CW_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CW_ELC_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CW_ELC_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CW_2010_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CW_2020_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CD_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CD_ELC_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CD_ELC_NEW_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_DW_ELC_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_DW_ELC_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_DW_ELC_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_DW_2010_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_DW_2020_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CK_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CK_COA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CK_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CK_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CK_BIO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_BFL_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_SFL_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_EFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_LFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_SFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_LHAL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_SHAL_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_SHAL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_MIN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_SIN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_KER_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_LG_LED_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_COND_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_COND_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_COND_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WST_BIO_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WPL_BIO_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_AHP_ELC_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HNS_ELC_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPP_ELC_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HEX_HET_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HP_HET_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPTS_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_DST_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_LPG_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_NGA_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_ROOF_INS_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_INT_INS_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_BASE_INS_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WIN_INS_SO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_COND_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_COND_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_COND_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WST_BIO_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WPL_BIO_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_AHP_ELC_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HNS_ELC_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPP_ELC_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HEX_HET_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HP_HET_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPTS_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_DST_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_LPG_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_NGA_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_ROOF_INS_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_INT_INS_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_BASE_INS_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WIN_INS_MO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_COND_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_COND_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_COND_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WST_BIO_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WPL_BIO_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_AHP_ELC_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HNS_ELC_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPP_ELC_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HEX_HET_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HP_HET_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPTS_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPTS_GEO_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_DST_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_LPG_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_SOL_NGA_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_ROOF_INS_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_INT_INS_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_BASE_INS_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WIN_INS_SN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_DST_COND_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_NGA_COND_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_LPG_COND_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WST_BIO_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_WPL_BIO_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_AHP_ELC_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HNS_ELC_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HPP_ELC_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SH_HEX_HET_MN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_AHP_ELC_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_AHP_ELC_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_CEN_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_ROOM_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_AHP_ELC_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_GEO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_ROOM_ELC_NEW_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_GEO_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_AHP_NGA_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_CEN_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_AHP_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_SC_HP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_MISC_EQP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_MICRO_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_CC_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_STR_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_SOFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_H2_PEMFC_N','EUR20',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2006,'RES_CD',0.0828,'Glav','');
INSERT INTO "demand" VALUES('IT',2006,'RES_CK',24.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'RES_CK',23.9,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'RES_CK',23.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'RES_CK',23.9,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'RES_CK',24.1,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'RES_CK',25.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'RES_CK',26.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'RES_CK',26.3,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'RES_CK',26.1,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'RES_CK',26.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'RES_CK',25.8,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'RES_CK',24.9,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'RES_CK',23.8,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'RES_CK',22.7,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'RES_CK',22.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'RES_CK',21.7,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'RES_CW',6.015,'Glav','');
INSERT INTO "demand" VALUES('IT',2006,'RES_DW',2.77,'Glav','');
INSERT INTO "demand" VALUES('IT',2006,'RES_LG',353.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2007,'RES_LG',359.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2008,'RES_LG',366.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2010,'RES_LG',378.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2012,'RES_LG',396.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2014,'RES_LG',413.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2016,'RES_LG',420.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2018,'RES_LG',428.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2020,'RES_LG',434.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2022,'RES_LG',440.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2025,'RES_LG',446.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2030,'RES_LG',452.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2035,'RES_LG',456.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2040,'RES_LG',460.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2045,'RES_LG',465.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2050,'RES_LG',469.0,'Glm','');
INSERT INTO "demand" VALUES('IT',2006,'RES_OE',68.43,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'RES_RF',9.013,'Gl','');
INSERT INTO "demand" VALUES('IT',2006,'RES_SC',303.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2007,'RES_SC',272.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2008,'RES_SC',354.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2010,'RES_SC',393.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2012,'RES_SC',699.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2014,'RES_SC',626.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2016,'RES_SC',816.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2018,'RES_SC',903.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2020,'RES_SC',849.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2022,'RES_SC',906.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2025,'RES_SC',937.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2030,'RES_SC',977.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2035,'RES_SC',1000.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2040,'RES_SC',1040.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2045,'RES_SC',1100.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2050,'RES_SC',1150.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2006,'RES_SH_SO',1940.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2007,'RES_SH_SO',1830.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2008,'RES_SH_SO',1890.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2010,'RES_SH_SO',1950.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2012,'RES_SH_SO',1940.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2014,'RES_SH_SO',1710.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2016,'RES_SH_SO',1820.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2018,'RES_SH_SO',1770.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2020,'RES_SH_SO',1780.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2022,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2025,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2030,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2035,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2040,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2045,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2050,'RES_SH_SO',1810.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2006,'RES_SH_MO',98.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2007,'RES_SH_MO',85.6,'Mm2','');
INSERT INTO "demand" VALUES('IT',2008,'RES_SH_MO',92.2,'Mm2','');
INSERT INTO "demand" VALUES('IT',2010,'RES_SH_MO',99.3,'Mm2','');
INSERT INTO "demand" VALUES('IT',2012,'RES_SH_MO',97.4,'Mm2','');
INSERT INTO "demand" VALUES('IT',2014,'RES_SH_MO',72.6,'Mm2','');
INSERT INTO "demand" VALUES('IT',2016,'RES_SH_MO',84.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2018,'RES_SH_MO',79.3,'Mm2','');
INSERT INTO "demand" VALUES('IT',2020,'RES_SH_MO',79.5,'Mm2','');
INSERT INTO "demand" VALUES('IT',2022,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2025,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2030,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2035,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2040,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2045,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2050,'RES_SH_MO',83.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2006,'RES_SH_SN',21.7,'Mm2','');
INSERT INTO "demand" VALUES('IT',2007,'RES_SH_SN',45.3,'Mm2','');
INSERT INTO "demand" VALUES('IT',2008,'RES_SH_SN',71.5,'Mm2','');
INSERT INTO "demand" VALUES('IT',2010,'RES_SH_SN',117.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2012,'RES_SH_SN',171.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2014,'RES_SH_SN',207.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2016,'RES_SH_SN',237.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2018,'RES_SH_SN',246.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2020,'RES_SH_SN',255.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2022,'RES_SH_SN',265.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2025,'RES_SH_SN',271.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2030,'RES_SH_SN',276.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2035,'RES_SH_SN',279.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2040,'RES_SH_SN',281.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2045,'RES_SH_SN',284.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2050,'RES_SH_SN',286.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2006,'RES_SH_MN',1.49,'Mm2','');
INSERT INTO "demand" VALUES('IT',2007,'RES_SH_MN',4.11,'Mm2','');
INSERT INTO "demand" VALUES('IT',2008,'RES_SH_MN',7.02,'Mm2','');
INSERT INTO "demand" VALUES('IT',2010,'RES_SH_MN',12.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2012,'RES_SH_MN',18.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2014,'RES_SH_MN',22.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2016,'RES_SH_MN',25.4,'Mm2','');
INSERT INTO "demand" VALUES('IT',2018,'RES_SH_MN',26.5,'Mm2','');
INSERT INTO "demand" VALUES('IT',2020,'RES_SH_MN',27.4,'Mm2','');
INSERT INTO "demand" VALUES('IT',2022,'RES_SH_MN',28.5,'Mm2','');
INSERT INTO "demand" VALUES('IT',2025,'RES_SH_MN',29.1,'Mm2','');
INSERT INTO "demand" VALUES('IT',2030,'RES_SH_MN',29.8,'Mm2','');
INSERT INTO "demand" VALUES('IT',2035,'RES_SH_MN',30.0,'Mm2','');
INSERT INTO "demand" VALUES('IT',2040,'RES_SH_MN',30.2,'Mm2','');
INSERT INTO "demand" VALUES('IT',2045,'RES_SH_MN',30.7,'Mm2','');
INSERT INTO "demand" VALUES('IT',2050,'RES_SH_MN',30.9,'Mm2','');
INSERT INTO "demand" VALUES('IT',2006,'RES_WH',71.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'RES_WH',71.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'RES_WH',71.6,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'RES_WH',71.9,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'RES_WH',71.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'RES_WH',69.8,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'RES_WH',71.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'RES_WH',72.7,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'RES_WH',73.3,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'RES_WH',73.7,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'RES_WH',74.0,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'RES_WH',74.5,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'RES_WH',74.9,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'RES_WH',75.7,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'RES_WH',76.6,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'RES_WH',77.3,'PJ','');

CREATE TABLE demand_specific_distribution (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    demand_name TEXT REFERENCES commodity(name),
    dsd         REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, season, tod, demand_name),
    CHECK(dsd >= 0 AND dsd <= 1)
);
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','RES_SH_MN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','RES_SC',0.06,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','RES_SC',0.04,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','RES_SC',0.02,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','RES_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','RES_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','RES_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','RES_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','RES_SC',0.0,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','RES_SH_SO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','RES_SH_SO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','RES_SH_SO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','RES_SH_SO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','RES_SH_SO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','RES_SH_SO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','RES_SH_SO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','RES_SH_SO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','RES_SH_SO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','RES_SH_SO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','RES_SH_SO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','RES_SH_SO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','RES_SH_MO',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','RES_SH_MO',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','RES_SH_MO',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','RES_SH_MO',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','RES_SH_MO',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','RES_SH_MO',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','RES_SH_MO',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','RES_SH_MO',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','RES_SH_MO',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','RES_SH_MO',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','RES_SH_MO',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','RES_SH_MO',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','RES_SH_SN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','RES_SH_SN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','RES_SH_SN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','RES_SH_SN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','RES_SH_SN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','RES_SH_SN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','RES_SH_SN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','RES_SH_SN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','RES_SH_SN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','RES_SH_SN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','RES_SH_SN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','RES_SH_SN',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','RES_SH_MN',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','RES_SH_MN',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','RES_SH_MN',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','RES_SH_MN',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','RES_SH_MN',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','RES_SH_MN',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','RES_SH_MN',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','RES_SH_MN',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','RES_SH_MN',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','RES_SH_MN',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','RES_SH_MN',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','RES_SH_MN',0.043,'');

CREATE TABLE driver (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    driver_name TEXT,
    driver      REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, driver_name)
);
INSERT INTO "driver" VALUES('IT',2006,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'POP',1.003,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'POP',1.01,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'POP',1.019,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'POP',1.023,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'POP',1.047,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'POP',1.045,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'POP',1.042,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'POP',1.027,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'POP',1.022,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'POP',1.029,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'POP',1.037,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'POP',1.033,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'POP',1.03,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'POP',1.021,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'POP',1.013,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'DRH3',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'DRH3',1.05,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'DRH3',1.103,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'DRH3',1.216,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'DRH3',1.34,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'DRH3',1.477,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'DRH3',1.629,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'DRH3',1.711,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'DRH3',1.798,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'DRH3',1.871,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'DRH3',1.985,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'DRH3',2.192,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'DRH3',2.368,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'DRH3',2.544,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'DRH3',2.748,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'DRH3',2.952,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'DRH4',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'DRH4',1.1,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'DRH4',1.21,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'DRH4',1.464,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'DRH4',1.772,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'DRH4',2.144,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'DRH4',2.594,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'DRH4',2.86,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'DRH4',3.153,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'DRH4',3.41,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'DRH4',3.836,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'DRH4',4.667,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'DRH4',5.787,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'DRH4',6.908,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'DRH4',8.567,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'DRH4',10.225,NULL,'');

CREATE TABLE efficiency (
    region      TEXT,
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, input_comm, tech, vintage, output_comm),
    CHECK(efficiency > 0)
);
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','RES_FT_NGA',2006,'RES_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_COG','RES_FT_NGA',2006,'RES_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','RES_FT_NGA',2006,'RES_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','RES_FT_NGA',2006,'RES_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','RES_FT_NGA',2020,'RES_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','RES_FT_DST',2006,'RES_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','RES_FT_DST',2006,'RES_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','RES_FT_DST',2006,'RES_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','RES_FT_HFO',2006,'RES_HFO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_KER','RES_FT_KER',2006,'RES_KER',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_KER','RES_FT_KER',2006,'RES_KER',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','RES_FT_COA',2006,'RES_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_OVC','RES_FT_COA',2006,'RES_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','RES_FT_LPG',2006,'RES_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','RES_FT_BIO',2006,'RES_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_GAS','RES_FT_BIO',2006,'RES_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SOL','RES_FT_SOL',2006,'RES_SOL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GEO','RES_FT_GEO',2006,'RES_GEO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','RES_FT_ELC',2006,'RES_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','RES_FT_ELC',2006,'RES_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','RES_FT_HET',2006,'RES_HET',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_BUR_NGA_SO_E',2006,'RES_SH_SO',2.331985,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_AHP_NGA_SO_E',2006,'RES_SH_SO',3.5139500000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_BUR_DST_SO_E',2006,'RES_SH_SO',2.331985,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HFO','RES_SH_BUR_HFO_SO_E',2006,'RES_SH_SO',2.331985,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_KER','RES_SH_BUR_KER_SO_E',2006,'RES_SH_SO',0.19167,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_COA','RES_SH_BUR_COA_SO_E',2006,'RES_SH_SO',1.7569750000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_BUR_LPG_SO_E',2006,'RES_SH_SO',2.17226,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SO_E',2006,'RES_SH_SO',0.798625,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HT_ELC_SO_E',2006,'RES_SH_SO',2.8750500000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HP_ELC_SO_E',2006,'RES_SH_SO',6.389,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_SO_E',2006,'RES_SH_SO',2.8750500000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_GEO','RES_SH_HP_GEO_SO_E',2006,'RES_SH_SO',12.1391,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_BUR_NGA_MO_E',2006,'RES_SH_MO',2.212119,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_HP_NGA_MO_E',2006,'RES_SH_MO',3.33333,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_BUR_DST_MO_E',2006,'RES_SH_MO',2.212119,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HFO','RES_SH_BUR_HFO_MO_E',2006,'RES_SH_MO',2.212119,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_KER','RES_SH_BUR_KER_MO_E',2006,'RES_SH_MO',0.18181799999999998,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_COA','RES_SH_BUR_COA_MO_E',2006,'RES_SH_MO',1.666665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_BUR_LPG_MO_E',2006,'RES_SH_MO',2.060604,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_MO_E',2006,'RES_SH_MO',0.757575,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HT_ELC_MO_E',2006,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MO_E',2006,'RES_SH_MO',6.0606,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_MO_E',2006,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_GEO','RES_SH_HP_GEO_MO_E',2006,'RES_SH_MO',11.515139999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_BUR_NGA_SN_E',2006,'RES_SH_SN',2.42782,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_AHP_NGA_SN_E',2006,'RES_SH_SN',3.7056199999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_BUR_DST_SN_E',2006,'RES_SH_SN',2.42782,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HFO','RES_SH_BUR_HFO_SN_E',2006,'RES_SH_SN',2.42782,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_KER','RES_SH_BUR_KER_SN_E',2006,'RES_SH_SN',0.22361500000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_COA','RES_SH_BUR_COA_SN_E',2006,'RES_SH_SN',1.820865,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_BUR_LPG_SN_E',2006,'RES_SH_SN',2.30004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SN_E',2006,'RES_SH_SN',0.83057,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HT_ELC_SN_E',2006,'RES_SH_SN',3.034775,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SN_E',2006,'RES_SH_SN',6.708450000000001,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_SN_E',2006,'RES_SH_SN',3.034775,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_GEO','RES_SH_HP_GEO_SN_E',2006,'RES_SH_SN',12.746055000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_BUR_NGA_MN_E',2006,'RES_SH_MN',2.303028,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_HP_NGA_MN_E',2006,'RES_SH_MN',3.515148,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_CEN_E',2006,'RES_SC',20.56968,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_EHP_E',2006,'RES_SC',23.99796,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_ROOM_E',2006,'RES_SC',20.56968,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_E',2006,'RES_WH',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HFO','RES_WH_HFO_E',2006,'RES_WH',0.58,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_E',2006,'RES_WH',0.58,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_E',2006,'RES_WH',0.54,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_WH_BIO_E',2006,'RES_WH',0.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_ELC_E',2006,'RES_WH',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_WH_HET_E',2006,'RES_WH',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_WH_SOL_E',2006,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_RF_RFG','RES_RF_TECH',2006,'RES_RF',1.0,'Gl/(Gl)','');
INSERT INTO "efficiency" VALUES('IT','RES_RF_FRZ','RES_RF_TECH',2006,'RES_RF',1.0,'Gl/(Gl)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_ELC_E',2006,'RES_RF_RFG',0.21,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_ELC_E',2006,'RES_RF_FRZ',0.19,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_ELC_E',2006,'RES_CW',0.26,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CD_ELC_E',2006,'RES_CD',0.068,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_ELC_E',2006,'RES_DW',0.175,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_CK_NGA_E',2006,'RES_CK',0.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_CK_LPG_E',2006,'RES_CK',0.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CK_ELC_E',2006,'RES_CK',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_OE_EQP_E',2006,'RES_OE',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_LFL_E',2006,'RES_LG',38.617,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SFL_E',2006,'RES_LG',31.157,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_LHAL_E',2006,'RES_LG',7.46,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SHAL_IMP_E',2006,'RES_LG',11.41,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SHAL_E',2006,'RES_LG',7.899,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_MIN_E',2006,'RES_LG',5.705,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SIN_E',2006,'RES_LG',4.827,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_CLB_N',2007,'RES_RF_RFG',0.22,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_CLA1_N',2007,'RES_RF_RFG',0.2778,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_CLA2_N',2007,'RES_RF_RFG',0.3968,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_CLA3_N',2007,'RES_RF_RFG',0.463,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_2010_N',2010,'RES_RF_RFG',0.5556,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_RFG_2020_N',2020,'RES_RF_RFG',0.6944,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_CLB_N',2007,'RES_RF_FRZ',0.1984,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_CLA1_N',2007,'RES_RF_FRZ',0.2778,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_CLA2_N',2007,'RES_RF_FRZ',0.463,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_2010_N',2010,'RES_RF_FRZ',0.5556,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_RF_FRZ_2020_N',2020,'RES_RF_FRZ',0.6944,'Gl/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_N',2007,'RES_WH',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_N',2020,'RES_WH',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_N',2050,'RES_WH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_COND_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_COND_N',2020,'RES_WH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_WH_DST_COND_N',2050,'RES_WH',1.09,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_N',2007,'RES_WH',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_N',2020,'RES_WH',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_N',2050,'RES_WH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_COND_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_COND_N',2020,'RES_WH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_WH_NGA_COND_N',2050,'RES_WH',1.09,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_N',2007,'RES_WH',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_N',2020,'RES_WH',0.84,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_N',2050,'RES_WH',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_COND_N',2007,'RES_WH',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_COND_N',2020,'RES_WH',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_WH_LPG_COND_N',2050,'RES_WH',0.74,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_WH_WPL_BIO_N',2007,'RES_WH',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_WH_WPL_BIO_N',2020,'RES_WH',0.78,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_WH_WPL_BIO_N',2050,'RES_WH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_ELC_RES_N',2007,'RES_WH',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_AHP_ELC_N',2007,'RES_WH',3.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_AHP_ELC_N',2020,'RES_WH',3.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_AHP_ELC_N',2050,'RES_WH',3.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_HNS_ELC_N',2007,'RES_WH',3.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_HNS_ELC_N',2020,'RES_WH',4.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_WH_HNS_ELC_N',2050,'RES_WH',4.18,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_WH_SOL_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PW_SO','RES_WH_PDC_ACS_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PW_MO','RES_WH_PDC_ACS_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PW_SN','RES_WH_PDC_ACS_N',2007,'RES_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_ELC_N',2007,'RES_CW',0.31,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_ELC_IMP_N',2007,'RES_CW',0.4,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_ELC_ADV_N',2007,'RES_CW',0.46,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_2010_ELC_N',2010,'RES_CW',0.51,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CW_2020_ELC_N',2020,'RES_CW',0.62,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CD_ELC_N',2007,'RES_CD',0.068,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CD_ELC_ADV_N',2010,'RES_CD',0.06944,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CD_ELC_NEW_N',2020,'RES_CD',0.07937,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_ELC_STD_N',2007,'RES_DW',0.21,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_ELC_IMP_N',2007,'RES_DW',0.2671,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_ELC_ADV_N',2007,'RES_DW',0.3086,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_2010_ELC_N',2010,'RES_DW',0.3268,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_DW_2020_ELC_N',2020,'RES_DW',0.3704,'Glav/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_CK_NGA_N',2007,'RES_CK',0.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_COA','RES_CK_COA_N',2007,'RES_CK',0.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_CK_LPG_N',2007,'RES_CK',0.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_CK_ELC_N',2007,'RES_CK',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_CK_BIO_N',2007,'RES_CK',0.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_BFL_IMP_N',2007,'RES_LG',34.6,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SFL_IMP_N',2007,'RES_LG',24.37,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_EFL_N',2007,'RES_LG',38.99,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_LFL_N',2007,'RES_LG',42.88,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SFL_N',2007,'RES_LG',34.6,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_LHAL_N',2007,'RES_LG',8.285,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SHAL_IMP_N',2007,'RES_LG',12.67,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SHAL_N',2007,'RES_LG',8.772,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_MIN_N',2007,'RES_LG',6.335,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_SIN_N',2007,'RES_LG',5.361,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_KER','RES_LG_KER_N',2007,'RES_LG',3.655,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_LG_LED_ELC_N',2007,'RES_LG',15.11,'Glm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_MISC_EQP_N',2007,'RES_OE',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_SO_N',2007,'RES_SH_SO',2.5878690000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_DST_SO_N',2007,'RES_SH_SO',2.5878690000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_SO_N',2007,'RES_SH_SO',2.492022,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_NGA_SO_N',2007,'RES_SH_SO',2.492022,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_NGA_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',2.715665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',2.715665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',2.939308,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',2.939308,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_SO_N',2007,'RES_SH_SO',2.396175,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_LPG_SO_N',2007,'RES_SH_SO',2.396175,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_SO_N',2020,'RES_SH_SO',2.5878690000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_LPG_SO_N',2020,'RES_SH_SO',2.5878690000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',2.715665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',2.715665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.9584699999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.9584699999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2020,'RES_SH_SO',1.118215,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2020,'RES_SH_SO',1.118215,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2050,'RES_SH_SO',1.437705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2050,'RES_SH_SO',1.437705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',2.428124,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',2.428124,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',2.523971,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',2.523971,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',2.651767,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',2.651767,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',10.54317,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',10.54317,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',12.7796,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',12.7796,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',15.047979,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',15.047979,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',12.7796,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',12.7796,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',15.9745,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',15.9745,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SO','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PH_SO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PC_SO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PW_SO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PH_SO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PC_SO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PW_SO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PH_SO',4.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PC_SO',4.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PW_SO',4.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PH_SO','RES_SH_HP_HET_SO_N',2007,'RES_SH_SO',3.1949,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_SO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_SO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_SO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_SO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_MO_N',2007,'RES_SH_MO',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_DST_MO_N',2007,'RES_SH_MO',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_MO_N',2007,'RES_SH_MO',2.3636340000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_NGA_MO_N',2007,'RES_SH_MO',2.3636340000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_NGA_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',2.575755,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',2.575755,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_MO_N',2007,'RES_SH_MO',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_LPG_MO_N',2007,'RES_SH_MO',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.90909,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.90909,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_MO_N',2020,'RES_SH_MO',1.51515,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_WST_BIO_MO_N',2020,'RES_SH_MO',1.51515,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',2.303028,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',2.303028,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',2.393937,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',2.393937,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',2.515149,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',2.515149,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',9.999989999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',9.999989999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',12.1212,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',12.1212,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',14.272713,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',14.272713,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',12.1212,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',12.1212,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',15.1515,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',15.1515,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',13.63635,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',13.63635,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',16.66665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',16.66665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_MO','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PH_MO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PC_MO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PW_MO',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PH_MO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PC_MO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PW_MO',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PH_MO',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PC_MO',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PW_MO',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PH_MO','RES_SH_HP_HET_MO_N',2007,'RES_SH_MO',3.0303,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',2.4848459999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',2.606058,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_MO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_MO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_MO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_MO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',3.003206,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',3.131002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.9584699999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.9584699999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_SN_N',2020,'RES_SH_SN',1.59745,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_WST_BIO_SN_N',2020,'RES_SH_SN',1.59745,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',2.428124,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',2.428124,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',2.523971,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',2.523971,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',2.651767,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',2.651767,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',10.54317,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',10.54317,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',15.047979,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',15.047979,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',14.37705,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',17.57195,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',18.370675000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_SN','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PH_SN',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PC_SN',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PW_SN',3.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PH_SN',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PC_SN',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PW_SN',4.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PH_SN',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PC_SN',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PW_SN',4.7,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PH_SN',3.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PC_SN',3.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PW_SN',3.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PH_SN','RES_SH_HP_HET_SN_N',2007,'RES_SH_SN',3.1949,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',2.619818,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',2.747614,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',2.87541,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_SN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_SN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_SN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_SN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_C',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_MN_N',2007,'RES_SH_MN',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MN_N',2007,'RES_SH_MN',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MN_N',2020,'RES_SH_MN',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_DST','RES_SH_DST_COND_MN_N',2050,'RES_SH_MN',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_MN_N',2007,'RES_SH_MN',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2007,'RES_SH_MN',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2020,'RES_SH_MN',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2050,'RES_SH_MN',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_MN_N',2007,'RES_SH_MN',2.454543,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2007,'RES_SH_MN',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2020,'RES_SH_MN',2.8484819999999997,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2050,'RES_SH_MN',2.969694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WST_BIO_MN_N',2007,'RES_SH_MN',3.0303,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2007,'RES_SH_MN',2.303028,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2020,'RES_SH_MN',2.393937,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2050,'RES_SH_MN',2.515149,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2007,'RES_SH_MN',9.999989999999999,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2020,'RES_SH_MN',13.63635,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2050,'RES_SH_MN',14.272713,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2007,'RES_SH_MN',13.63635,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2020,'RES_SH_MN',16.66665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2050,'RES_SH_MN',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2007,'RES_SH_MN',13.63635,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2020,'RES_SH_MN',16.66665,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2050,'RES_SH_MN',17.424225,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_HET','RES_SH_HEX_HET_MN_N',2007,'RES_SH_MN',2.72727,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',26.569170000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',26.569170000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',30.168864000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',30.168864000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_CEN_N',2007,'RES_SC',25.112151000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_CEN_N',2007,'RES_SC',25.112151000000004,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_ROOM_N',2007,'RES_SC',29.397501000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_ROOM_N',2007,'RES_SC',29.397501000000002,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',36.939717,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',36.939717,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_GEO_N',2007,'RES_SC',35.13987,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_GEO_N',2007,'RES_SC',35.13987,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_ELC','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',30.168864000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',30.168864000000003,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_GEO','RES_SC_GEO_IMP_N',2007,'RES_SC',35.99694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_GEO_IMP_N',2007,'RES_SC',35.99694,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',9.42777,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',9.42777,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SC_CEN_NGA_N',2007,'RES_SC',10.28484,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_CEN_NGA_N',2007,'RES_SC',10.28484,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_NGA','RES_SC_AHP_NGA_N',2016,'RES_SC',10.28484,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_INS_C','RES_SC_AHP_NGA_N',2016,'RES_SC',10.28484,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PC_SO','RES_SC_HP_N',2007,'RES_SC',1.0,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PC_MO','RES_SC_HP_N',2007,'RES_SC',1.0,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','RES_PC_SN','RES_SC_HP_N',2007,'RES_SC',1.0,'Mm2/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'ELC_DST',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'ELC_DST',0.41,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.45,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'RES_HET',0.45,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'RES_HET',0.45,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'RES_HET',0.45,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'RES_HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'ELC_DST',0.28,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.31,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'ELC_DST',0.36,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.44,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'RES_HET',0.52,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'RES_HET',0.51,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'RES_HET',0.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'RES_HET',0.48,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'ELC_DST',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'RES_HET',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'ELC_DST',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'RES_HET',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'ELC_DST',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'RES_HET',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'ELC_DST',0.16,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'RES_HET',0.64,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.2,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'RES_HET',0.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'ELC_DST',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'RES_HET',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'ELC_DST',0.92,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'RES_HET',0.92,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'RES_HET',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'RES_HET',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_YTT',2007,'YTT',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_ZIR',2007,'ZIR',1.0,'t/(ethos)','');

CREATE TABLE efficiency_variable (
    region      TEXT,
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    notes       TEXT,
    PRIMARY KEY(region, season, tod, input_comm, tech, vintage, output_comm),
    CHECK(efficiency > 0)
);

CREATE TABLE elasticity (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    demand_comm TEXT REFERENCES commodity(name),
    elasticity  REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, demand_comm)
);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_SC',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_SC',3.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_SC',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_SC',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_SC',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_CD',5.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_CD',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_CD',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_CD',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_CD',1.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_CD',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_CD',1.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_CD',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_CW',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_CW',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_CW',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_CW',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_CW',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_CW',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_CW',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_CW',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_CW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_DW',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_DW',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_DW',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_DW',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_DW',0.63,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_DW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_DW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_DW',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_OE',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_OE',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_OE',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_OE',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_OE',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_OE',0.63,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_OE',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_OE',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_OE',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_SH_SO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_SH_SO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_SH_MO',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_SH_MO',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_SH_SN',3.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_SH_SN',3.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_SH_SN',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_SH_SN',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_SH_SN',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_SH_SN',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_SH_SN',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_SH_SN',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_SH_SN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_SH_SN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_SH_SN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_SH_SN',0.84,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_SH_SN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_SH_SN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_SH_SN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_SH_MN',3.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_SH_MN',3.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_SH_MN',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_SH_MN',2.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_SH_MN',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_SH_MN',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_SH_MN',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_SH_MN',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_SH_MN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_SH_MN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_SH_MN',0.94,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_SH_MN',0.84,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_SH_MN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_SH_MN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_SH_MN',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_WH',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_CK',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_CK',0.15,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_LG',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_LG',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_LG',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_LG',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_LG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_LG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_LG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_LG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_LG',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_LG',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_LG',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_LG',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_LG',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_LG',0.48,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_LG',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'RES_RF',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'RES_RF',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'RES_RF',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'RES_RF',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'RES_RF',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'RES_RF',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'RES_RF',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'RES_RF',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'RES_RF',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'RES_RF',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'RES_RF',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'RES_RF',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'RES_RF',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'RES_RF',0.48,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'RES_RF',0.45,NULL,NULL);

CREATE TABLE emission_activity (
    region      TEXT,
    emis_comm   TEXT REFERENCES commodity(name),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    activity    REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, emis_comm, input_comm, tech, vintage, output_comm)
);
INSERT INTO "emission_activity" VALUES('IT','RES_CO2','BIO_METH','RES_FT_NGA',2007,'RES_NGA',-56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','RES_CO2','H2_BL','RES_FT_NGA',2020,'RES_NGA',-56.1,'kt/(PJ)','');

CREATE TABLE emission_aggregation (
    emis_agg        TEXT REFERENCES commodity(name),
    emis_comm       TEXT REFERENCES commodity(name),
    emis_agg_weight REAL,
    notes           TEXT,
    PRIMARY KEY(emis_agg, emis_comm)
);

CREATE TABLE emission_embodied (
    region    TEXT,
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, emis_comm, tech, vintage)
);

CREATE TABLE emission_end_of_life (
    region    TEXT,
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, emis_comm, tech, vintage)
);

CREATE TABLE end_of_life_output (
    region      TEXT,
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    value       REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, tech, vintage, output_comm)
);

CREATE TABLE existing_capacity (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_NGA',2006,735.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_DST',2006,135.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_HFO',2006,6.592,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_KER',2006,0.7972,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_COA',2006,0.3012,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_LPG',2006,87.84,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_BIO',2006,200.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_GEO',2006,0.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_SOL',2006,1.509,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_HET',2006,15.03,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_FT_ELC',2006,300.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_NGA_SO_E',2006,2400.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_AHP_NGA_SO_E',2006,36.7,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_DST_SO_E',2006,469.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_HFO_SO_E',2006,23.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_KER_SO_E',2006,0.258,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_COA_SO_E',2006,0.835,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_LPG_SO_E',2006,166.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_WST_BIO_SO_E',2006,247.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HT_ELC_SO_E',2006,9.62,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_ELC_SO_E',2006,4.07,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HEX_HET_SO_E',2006,19.8,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_GEO_SO_E',2006,1.93,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_NGA_MO_E',2006,128.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_NGA_MO_E',2006,1.95,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_DST_MO_E',2006,25.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_HFO_MO_E',2006,1.23,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_KER_MO_E',2006,0.0137,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_COA_MO_E',2006,0.0444,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_LPG_MO_E',2006,8.84,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_WST_BIO_MO_E',2006,13.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HT_ELC_MO_E',2006,0.512,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_AHP_ELC_MO_E',2006,0.217,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HEX_HET_MO_E',2006,1.05,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_GEO_MO_E',2006,0.102,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_NGA_SN_E',2006,26.9,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_AHP_NGA_SN_E',2006,0.41,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_DST_SN_E',2006,5.24,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_HFO_SN_E',2006,0.258,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_KER_SN_E',2006,0.00288,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_COA_SN_E',2006,0.00932,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_LPG_SN_E',2006,1.86,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_WST_BIO_SN_E',2006,2.76,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HT_ELC_SN_E',2006,0.108,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_AHP_ELC_SN_E',2006,0.0455,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HEX_HET_SN_E',2006,0.221,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_GEO_SN_E',2006,0.0215,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_BUR_NGA_MN_E',2006,2.69,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SH_HP_NGA_MN_E',2006,0.041,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SC_CEN_E',2006,145.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SC_EHP_E',2006,13.2,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_SC_ROOM_E',2006,114.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_NGA_E',2006,348.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_HFO_E',2006,1.67,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_DST_E',2006,45.7,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_LPG_E',2006,32.3,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_BIO_E',2006,5.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_ELC_E',2006,252.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_HET_E',2006,70.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_WH_SOL_E',2006,12.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_RF_TECH',2006,9.01,'Gl','');
INSERT INTO "existing_capacity" VALUES('IT','RES_RF_RFG_ELC_E',2006,7.19,'Gl','');
INSERT INTO "existing_capacity" VALUES('IT','RES_RF_FRZ_ELC_E',2006,1.83,'Gl','');
INSERT INTO "existing_capacity" VALUES('IT','RES_CW_ELC_E',2006,6.02,'Glav','');
INSERT INTO "existing_capacity" VALUES('IT','RES_CD_ELC_E',2006,0.0829,'Glav','');
INSERT INTO "existing_capacity" VALUES('IT','RES_DW_ELC_E',2006,2.77,'Glav','');
INSERT INTO "existing_capacity" VALUES('IT','RES_CK_NGA_E',2006,10.7,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_CK_LPG_E',2006,6.4,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_CK_ELC_E',2006,8.78,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_OE_EQP_E',2006,68.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_LFL_E',2006,94.9,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_SFL_E',2006,98.4,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_LHAL_E',2006,2.62,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_SHAL_IMP_E',2006,4.01,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_SHAL_E',2006,5.55,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_MIN_E',2006,80.1,'Glm','');
INSERT INTO "existing_capacity" VALUES('IT','RES_LG_SIN_E',2006,67.8,'Glm','');

CREATE TABLE lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,12.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2014,13.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2022,16.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2030,20.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2007,15.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2014,18.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2022,20.0,'year','');

CREATE TABLE lifetime_survival_curve (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL,
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    fraction REAL,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);

CREATE TABLE lifetime_tech (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech)
);
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_NGA_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_NGA_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_DST_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_HFO_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_KER_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_COA_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_LPG_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HT_ELC_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_ELC_SO_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_SO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_GEO_SO_E',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_NGA_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_NGA_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_DST_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_HFO_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_KER_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_COA_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_LPG_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HT_ELC_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_MO_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_MO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_GEO_MO_E',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_NGA_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_NGA_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_DST_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_HFO_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_KER_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_COA_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_LPG_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HT_ELC_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_SN_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_SN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_GEO_SN_E',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BUR_NGA_MN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_NGA_MN_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_CEN_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_EHP_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_ROOM_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_NGA_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_HFO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_DST_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_LPG_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_BIO_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_ELC_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_HET_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_SOL_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CD_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_ELC_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_NGA_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_LPG_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_OE_EQP_E',5.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_LFL_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SFL_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_LHAL_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SHAL_IMP_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SHAL_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_MIN_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SIN_E',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_CLB_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_CLA1_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_CLA2_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_CLA3_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_2010_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_RFG_2020_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_CLB_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_CLA1_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_CLA2_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_2010_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_RF_FRZ_2020_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_DST_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_DST_COND_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_NGA_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_NGA_COND_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_LPG_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_LPG_COND_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_WPL_BIO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_ELC_RES_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_AHP_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_HNS_ELC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_SOL_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_WH_PDC_ACS_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_ELC_IMP_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_ELC_ADV_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_2010_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CW_2020_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CD_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CD_ELC_ADV_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CD_ELC_NEW_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_ELC_STD_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_ELC_IMP_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_ELC_ADV_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_2010_ELC_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_DW_2020_ELC_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_NGA_N',17.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_COA_N',17.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_LPG_N',17.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_ELC_N',17.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CK_BIO_N',17.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_BFL_IMP_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SFL_IMP_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_EFL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_LFL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SFL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_LHAL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SHAL_IMP_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SHAL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_MIN_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_SIN_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_KER_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_LG_LED_ELC_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_COND_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_COND_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_COND_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_SO_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WPL_BIO_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HNS_ELC_SO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPP_ELC_SO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_HET_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPTS_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_DST_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_LPG_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_NGA_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_ROOF_INS_SO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_INT_INS_SO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BASE_INS_SO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WIN_INS_SO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_COND_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_COND_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_COND_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_MO_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WPL_BIO_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HNS_ELC_MO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPP_ELC_MO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_HET_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPTS_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_DST_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_LPG_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_NGA_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_ROOF_INS_MO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_INT_INS_MO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BASE_INS_MO_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WIN_INS_MO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_COND_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_COND_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_COND_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_SN_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WPL_BIO_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HNS_ELC_SN_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPP_ELC_SN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HP_HET_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPTS_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPTS_GEO_SN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_DST_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_LPG_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_SOL_NGA_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_ROOF_INS_SN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_INT_INS_SN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_BASE_INS_SN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WIN_INS_SN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_DST_COND_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_NGA_COND_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_LPG_COND_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WST_BIO_MN_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_WPL_BIO_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_AHP_ELC_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HNS_ELC_MN_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HPP_ELC_MN_N',50.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SH_HEX_HET_MN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_AHP_ELC_STD_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_AHP_ELC_IMP_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_CEN_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_ROOM_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_AHP_ELC_ADV_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_GEO_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_ROOM_ELC_NEW_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_GEO_IMP_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_AHP_NGA_ADV_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_CEN_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_AHP_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_SC_HP_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_MISC_EQP_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_CI_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_STR_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_SOFC_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_H2_PEMFC_N',20.0,'year','');

CREATE TABLE operator (
    operator TEXT PRIMARY KEY,
    notes    TEXT
);
INSERT INTO "operator" VALUES('le','less-than-or-equal (≤)');
INSERT INTO "operator" VALUES('ge','greater-than-or-equal (≥)');
INSERT INTO "operator" VALUES('eq','equal (=)');

CREATE TABLE limit_activity (
    region       TEXT,
    period       INTEGER REFERENCES time_period(period),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    activity     REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, period, tech_or_group, operator)
);
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_BIO','ge',253.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_BIO','ge',263.91,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_BIO','ge',240.02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_BIO','ge',257.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_BIO','ge',248.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_BIO','ge',239.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_BIO','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_DST','ge',79.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_DST','ge',61.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_DST','ge',48.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_DST','ge',41.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_DST','ge',38.52,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_DST','ge',30.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_DST','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_ELC','ge',237.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_ELC','ge',233.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_ELC','ge',223.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_ELC','ge',221.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_ELC','ge',223.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_ELC','ge',226.44,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_ELC','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_HET','ge',9.84,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_HET','ge',32.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_HET','ge',34.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_HET','ge',36.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_HET','ge',39.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_HET','ge',34.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_HET','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_LPG','ge',53.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_LPG','ge',47.7,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_LPG','ge',43.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_LPG','ge',45.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_LPG','ge',44.44,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_LPG','ge',43.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_LPG','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_NGA','ge',709.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_NGA','ge',719.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_NGA','ge',639.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_NGA','ge',683.36,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_NGA','ge',649.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_NGA','ge',635.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_NGA','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_SOL','ge',3.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_SOL','ge',4.76,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_SOL','ge',5.44,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_SOL','ge',6.02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_SOL','ge',6.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_SOL','ge',7.17,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'RES_FT_SOL','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_SO_E','ge',1242.8161,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_NGA_SO_E','ge',18.977706,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_SO_E','ge',218.53116000000003,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_SO_E','ge',7.188525,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_SO_E','ge',0.13354681999999998,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_SO_E','ge',0.4313115,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_SO_E','ge',81.78944000000001,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_SO_E','ge',127.796,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_SO_E','ge',4.984044,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_ELC_SO_E','ge',2.1086340000000003,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_SO_E','ge',10.255629,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_SO_E','ge',0.9968088,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_NGA_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_AHP_NGA_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_DST_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_HFO_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_KER_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_COA_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_LPG_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_WST_BIO_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HT_ELC_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_ELC_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HEX_HET_SO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_GEO_SO_E','ge',0.9968088,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_MO_E','ge',60.606,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_NGA_MO_E','ge',0.9272718,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_MO_E','ge',10.666656,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_MO_E','ge',0.4666662,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_MO_E','ge',0.006515145,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_MO_E','ge',0.021060585,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_MO_E','ge',4.212117,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_MO_E','ge',6.242418,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_MO_E','ge',0.24303006,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_ELC_MO_E','ge',0.10272716999999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_MO_E','ge',0.49999950000000004,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_MO_E','ge',0.04878783,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_NGA_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_NGA_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_DST_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_HFO_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_KER_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_COA_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_LPG_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_WST_BIO_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HT_ELC_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_AHP_ELC_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HEX_HET_MO_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_GEO_MO_E','ge',0.04878783,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_SN_E','ge',13.929764,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_NGA_SN_E','ge',0.21246085,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_SN_E','ge',2.7124701,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_SN_E','ge',0.13386631000000002,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_SN_E','ge',0.0014888234,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_SN_E','ge',0.004824299000000001,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_SN_E','ge',0.9616649,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_SN_E','ge',1.4281203,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_SN_E','ge',0.055591259999999997,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_ELC_SN_E','ge',0.023546413,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_SN_E','ge',0.11437742,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_SN_E','ge',0.011150201,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_NGA_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_AHP_NGA_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_DST_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_HFO_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_KER_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_COA_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_LPG_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_WST_BIO_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HT_ELC_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_AHP_ELC_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HEX_HET_SN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_GEO_SN_E','ge',0.011150201,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_MN_E','ge',1.3212108,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_NGA_MN_E','ge',0.020151495,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_BUR_NGA_MN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SH_HP_NGA_MN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_CEN_E','ge',142.2703,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_EHP_E','ge',12.941455,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_ROOM_E','ge',111.41649999999998,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SC_CEN_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SC_EHP_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_SC_ROOM_E','ge',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_NGA_E','ge',31.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_HFO_E','ge',0.1505,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_DST_E','ge',4.114,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_LPG_E','ge',2.904,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_BIO_E','ge',0.4586,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_ELC_E','ge',22.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_HET_E','ge',6.348,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_SOL_E','ge',1.122,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_BIO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_HET_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_WH_SOL_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_RF_RFG_ELC_E','ge',6.469,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_RF_FRZ_ELC_E','ge',1.651,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_RF_RFG_ELC_E','ge',0.0,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_RF_FRZ_ELC_E','ge',0.0,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CW_ELC_E','ge',5.419,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_CW_ELC_E','ge',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CD_ELC_E','ge',0.07459,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_CD_ELC_E','ge',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_DW_ELC_E','ge',2.496,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_DW_ELC_E','ge',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_NGA_E','ge',9.645,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_LPG_E','ge',4.037,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_ELC_E','ge',7.898,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_CK_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_CK_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_CK_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_OE_EQP_E','ge',47.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_OE_EQP_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_LFL_E','ge',85.4,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SFL_E','ge',88.6,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_LHAL_E','ge',2.36,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SHAL_IMP_E','ge',3.6,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SHAL_E','ge',4.99,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_MIN_E','ge',72.1,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SIN_E','ge',61.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_LFL_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_SFL_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_LHAL_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_SHAL_IMP_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_SHAL_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_MIN_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_LG_SIN_E','ge',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_BIO','le',280.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_BIO','le',291.69,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_BIO','le',265.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_BIO','le',284.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_BIO','le',274.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_BIO','le',264.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_BIO','le',528.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_FT_COA','le',5.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_DST','le',88.1,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_DST','le',68.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_DST','le',53.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_DST','le',46.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_DST','le',42.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_DST','le',33.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_DST','le',67.58,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_ELC','le',262.85,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_ELC','le',257.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_ELC','le',246.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_ELC','le',245.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_ELC','le',247.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_ELC','le',250.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_ELC','le',1000.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_HET','le',10.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_HET','le',35.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_HET','le',37.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_HET','le',40.7,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_HET','le',43.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_HET','le',38.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_HET','le',76.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_FT_GEO','le',5.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_FT_KER','le',10.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_NGA','le',784.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_NGA','le',795.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_NGA','le',706.38,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_NGA','le',755.3,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_NGA','le',717.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_NGA','le',702.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_NGA','le',1404.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_FT_SOL','le',3.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_FT_SOL','le',5.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'RES_FT_SOL','le',6.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_FT_SOL','le',6.65,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'RES_FT_SOL','le',7.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_FT_SOL','le',7.92,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_FT_SOL','le',1000.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_SO_E','le',1282.43286,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_NGA_SO_E','le',19.6102962,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_SO_E','le',250.73575200000002,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_SO_E','le',12.364263,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_SO_E','le',0.137444598,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_SO_E','le',0.44568854999999996,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_SO_E','le',88.562628,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_SO_E','le',131.693778,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_SO_E','le',5.141233079999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_ELC_SO_E','le',2.17380996,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_SO_E','le',10.5815088,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_SO_E','le',1.02939678,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_NGA_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_AHP_NGA_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_DST_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_HFO_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_KER_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_COA_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_LPG_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_WST_BIO_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HT_ELC_SO_E','le',2.012787,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_ELC_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HEX_HET_SO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_GEO_SO_E','le',1.10990826,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_MO_E','le',64.909026,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_NGA_MO_E','le',0.98727174,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_MO_E','le',12.6545328,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_MO_E','le',0.6218175599999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_MO_E','le',0.0069272657999999996,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_MO_E','le',0.0224727048,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_MO_E','le',4.47817734,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_MO_E','le',6.654538799999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_MO_E','le',0.25909065,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_ELC_MO_E','le',0.10963625400000002,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_MO_E','le',0.533454012,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_MO_E','le',0.05192722080000001,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_NGA_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_NGA_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_DST_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_HFO_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_KER_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_COA_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_LPG_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_WST_BIO_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HT_ELC_MO_E','le',0.818181,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_AHP_ELC_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HEX_HET_MO_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_GEO_MO_E','le',0.055636307999999995,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_SN_E','le',14.37705,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_NGA_SN_E','le',0.219106242,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_DST_SN_E','le',2.8006493399999997,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_HFO_SN_E','le',0.13801967999999998,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_KER_SN_E','le',0.00153546894,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_COA_SN_E','le',0.004980210119999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_LPG_SN_E','le',0.98914104,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_WST_BIO_SN_E','le',1.47220992,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HT_ELC_SN_E','le',0.0573931836,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_AHP_ELC_SN_E','le',0.024325968599999997,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HEX_HET_SN_E','le',0.11789180999999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_GEO_SN_E','le',0.01150164,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_NGA_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_AHP_NGA_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_DST_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_HFO_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_KER_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_COA_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_LPG_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_WST_BIO_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HT_ELC_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_AHP_ELC_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HEX_HET_SN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_GEO_SN_E','le',0.012364262999999999,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_BUR_NGA_MN_E','le',1.363635,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SH_HP_NGA_MN_E','le',0.0207817974,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_BUR_NGA_MN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SH_HP_NGA_MN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_CEN_E','le',208.26801,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_EHP_E','le',18.821257199999998,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_SC_ROOM_E','le',163.528956,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SC_CEN_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SC_EHP_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_SC_ROOM_E','le',0.0,'Mm2','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_NGA_E','le',31.6953,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_HFO_E','le',0.15215199999999998,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_DST_E','le',4.15961,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_LPG_E','le',2.93657,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_BIO_E','le',0.46373600000000004,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_ELC_E','le',22.959300000000002,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_HET_E','le',6.41823,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_WH_SOL_E','le',1.13477,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_HFO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_WH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_BIO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_HET_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'RES_WH_SOL_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_RF_RFG_ELC_E','le',6.540170000000001,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_RF_FRZ_ELC_E','le',1.66894,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_RF_RFG_ELC_E','le',0.0,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_RF_FRZ_ELC_E','le',0.0,'Gl','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CW_ELC_E','le',5.47911,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_CW_ELC_E','le',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CD_ELC_E','le',0.0754208,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_CD_ELC_E','le',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_DW_ELC_E','le',2.5234300000000003,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_DW_ELC_E','le',0.0,'Glav','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_NGA_E','le',9.7552,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_LPG_E','le',4.08226,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_CK_ELC_E','le',7.98616,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_CK_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_CK_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'RES_CK_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_OE_EQP_E','le',68.5,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'RES_OE_EQP_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_LFL_E','le',88.1,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SFL_E','le',91.4,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_LHAL_E','le',2.43,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SHAL_IMP_E','le',3.72,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SHAL_E','le',5.15,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_MIN_E','le',74.4,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'RES_LG_SIN_E','le',62.9,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_LFL_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_SFL_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_LHAL_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_SHAL_IMP_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_SHAL_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_MIN_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2016,'RES_LG_SIN_E','le',0.0,'Glm','');
INSERT INTO "limit_activity" VALUES('IT',2010,'RES_LG_HAL_IN_GRP','ge',100.0,NULL,'Glm');
INSERT INTO "limit_activity" VALUES('IT',2050,'RES_LG_HAL_IN_GRP','ge',50.0,NULL,'Glm');

CREATE TABLE limit_activity_share (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    sub_group   TEXT,
    super_group TEXT,
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, sub_group, super_group, operator)
);
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SO_BIO_GRP','RES_SH_SO_GRP','ge',0.20,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SO_BIO_GRP','RES_SH_MO_GRP','ge',0.20,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SO_BIO_GRP','RES_SH_SN_GRP','ge',0.20,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SO_NGA_GRP','RES_SH_SO_GRP','le',0.75,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'RES_SH_SO_NGA_GRP','RES_SH_SO_GRP','le',0.80,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SO_ELC_GRP','RES_SH_SO_GRP','le',0.01,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'RES_SH_SO_ELC_GRP','RES_SH_SO_GRP','le',0.06,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'RES_SH_SO_ELC_GRP','RES_SH_SO_GRP','le',0.10,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_MO_NGA_GRP','RES_SH_MO_GRP','le',0.66,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'RES_SH_MO_NGA_GRP','RES_SH_MO_GRP','le',0.75,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_MO_ELC_GRP','RES_SH_MO_GRP','le',0.01,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'RES_SH_MO_ELC_GRP','RES_SH_MO_GRP','le',0.08,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'RES_SH_MO_ELC_GRP','RES_SH_MO_GRP','le',0.10,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SN_NGA_GRP','RES_SH_SN_GRP','le',0.80,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'RES_SH_SN_NGA_GRP','RES_SH_SN_GRP','le',0.90,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_SH_SN_ELC_GRP','RES_SH_SN_GRP','le',0.01,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'RES_SH_SN_ELC_GRP','RES_SH_SN_GRP','le',0.08,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'RES_SH_SN_ELC_GRP','RES_SH_SN_GRP','le',0.10,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_WH_ELC_GRP','RES_WH_GRP','ge',0.25,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'RES_WH_ELC_GRP','RES_WH_GRP','ge',0.20,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_WH_NGA_GRP','RES_WH_GRP','le',0.50,'');
INSERT INTO "limit_activity_share" VALUES('IT',2030,'RES_WH_NGA_GRP','RES_WH_GRP','le',0.80,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_CK_ELC_GRP','RES_CK_GRP','ge',0.24,'');
INSERT INTO "limit_activity_share" VALUES('IT',2030,'RES_CK_ELC_GRP','RES_CK_GRP','ge',0.20,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_CK_BIO_GRP','RES_CK_GRP','le',0.01,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'RES_CK_BIO_GRP','RES_CK_GRP','le',0.06,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'RES_CK_LPG_GRP','RES_CK_GRP','le',0.30,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'RES_CK_LPG_GRP','RES_CK_GRP','le',0.13,'');

CREATE TABLE limit_annual_capacity_factor (
    region       TEXT,
    tech_or_group TEXT,
    vintage      INTEGER REFERENCES time_period(period),
    output_comm  TEXT REFERENCES commodity(name),
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    factor       REAL,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, vintage, output_comm, operator),
    CHECK(factor >= 0 AND factor <= 1)
);
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,'ELC_DST','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,'RES_HET','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CC_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CC_N',2007,'RES_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CI_N',2007,'RES_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,'RES_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,'ELC_DST','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,'RES_HET','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_STR_N',2022,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_STR_N',2022,'RES_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_AHP_ELC_STD_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_AHP_NGA_N',2016,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_CEN_E',2006,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_CEN_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_CEN_NGA_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_EHP_E',2006,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_GEO_IMP_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_GEO_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_ROOM_E',2006,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SC_ROOM_N',2007,'RES_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_NGA_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_AHP_NGA_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_COA_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_COA_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_COA_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_DST_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_DST_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_DST_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_HFO_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_HFO_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_HFO_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_KER_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_KER_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_KER_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_LPG_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_LPG_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_LPG_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_NGA_MN_E',2006,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_NGA_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_NGA_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_BUR_NGA_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_COND_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_DST_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HNS_ELC_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPP_ELC_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_GEO_SN_N',2007,'RES_PC_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_GEO_SN_N',2007,'RES_PH_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_GEO_SN_N',2007,'RES_PW_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_MO_N',2007,'RES_PC_MO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_MO_N',2007,'RES_PH_MO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_MO_N',2007,'RES_PW_MO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SN_N',2007,'RES_PC_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SN_N',2007,'RES_PH_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SN_N',2007,'RES_PW_SN','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SO_N',2007,'RES_PC_SO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SO_N',2007,'RES_PH_SO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HPTS_SO_N',2007,'RES_PW_SO','le',0.4,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_ELC_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_GEO_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_GEO_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_GEO_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_NGA_MN_E',2006,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HP_NGA_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HT_ELC_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HT_ELC_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_HT_ELC_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_COND_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_LPG_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_COND_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_NGA_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WPL_BIO_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_MN_N',2007,'RES_SH_MN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_MO_E',2006,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_SN_E',2006,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_SO_E',2006,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO','le',0.18,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_AHP_ELC_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_BIO_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_DST_COND_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_DST_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_DST_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_ELC_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_ELC_RES_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_HET_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_HFO_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_HNS_ELC_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_LPG_COND_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_LPG_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_LPG_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_NGA_COND_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_NGA_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_NGA_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_SOL_E',2006,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_SOL_N',2007,'RES_WH','le',0.1,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_WH_WPL_BIO_N',2007,'RES_WH','le',0.1,'');

CREATE TABLE limit_capacity (
    region       TEXT,
    period       INTEGER REFERENCES time_period(period),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    capacity     REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, period, tech_or_group, operator)
);
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_ROOF_INS_SO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_INT_INS_SO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_BASE_INS_SO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_WIN_INS_SO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_ROOF_INS_SO_N','le',94.9,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_INT_INS_SO_N','le',45.39,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_BASE_INS_SO_N','le',33.01,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_WIN_INS_SO_N','le',16.5,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_ROOF_INS_MO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_INT_INS_MO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_BASE_INS_MO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_WIN_INS_MO_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_ROOF_INS_MO_N','le',15.84,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_INT_INS_MO_N','le',40.49,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_BASE_INS_MO_N','le',15.84,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_WIN_INS_MO_N','le',14.08,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_ROOF_INS_SN_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_INT_INS_SN_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_BASE_INS_SN_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'RES_SH_WIN_INS_SN_N','le',0.0,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_ROOF_INS_SN_N','le',73.96,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_INT_INS_SN_N','le',35.37,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_BASE_INS_SN_N','le',25.73,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'RES_SH_WIN_INS_SN_N','le',12.86,'PJ','');

CREATE TABLE limit_capacity_share (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    sub_group   TEXT,
    super_group TEXT,
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, sub_group, super_group, operator)
);

CREATE TABLE limit_degrowth_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_degrowth_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_degrowth_new_capacity_delta (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_emission (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT REFERENCES commodity(name),
    operator  TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, emis_comm, operator)
);

CREATE TABLE limit_growth_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_growth_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_growth_new_capacity_delta (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    vintage      INTEGER REFERENCES time_period(period),
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    new_cap      REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, vintage, operator)
);

CREATE TABLE limit_new_capacity_share (
    region      TEXT,
    sub_group   TEXT,
    super_group TEXT,
    vintage     INTEGER REFERENCES time_period(period),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, sub_group, super_group, vintage, operator)
);

CREATE TABLE limit_resource (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    cum_act      REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE region (
    region TEXT PRIMARY KEY,
    notes  TEXT
);
INSERT INTO "region" VALUES('IT','Italy');

CREATE TABLE limit_seasonal_capacity_factor (
    region       TEXT REFERENCES region(region),
    season       TEXT REFERENCES time_season(season),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    factor       REAL,
    notes        TEXT,
    PRIMARY KEY(region, season, tech_or_group, operator)
);

CREATE TABLE limit_storage_level_fraction (
    region   TEXT,
    season   TEXT,
    tod      TEXT REFERENCES time_of_day(tod),
    tech     TEXT REFERENCES technology(tech),
    operator TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    fraction REAL,
    notes    TEXT,
    PRIMARY KEY(region, season, tod, tech, operator),
    CHECK(fraction >= 0 AND fraction <= 1)
);

CREATE TABLE limit_tech_input_split (
    region     TEXT,
    period     INTEGER REFERENCES time_period(period),
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    operator   TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion REAL,
    notes      TEXT,
    PRIMARY KEY(region, period, input_comm, tech, operator)
);
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_DST_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_DST_COND_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_NGA_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_NGA_COND_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_LPG_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_LPG_COND_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WST_BIO_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WPL_BIO_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_AHP_ELC_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HNS_ELC_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HPP_ELC_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_HET','RES_SH_HEX_HET_SO_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_DST_SO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_LPG_SO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_NGA_SO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_SOL_DST_SO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_SOL_LPG_SO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_SOL_NGA_SO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_DST_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_DST_COND_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_NGA_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_NGA_COND_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_LPG_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_LPG_COND_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WST_BIO_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WPL_BIO_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_AHP_ELC_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HNS_ELC_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HPP_ELC_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_HET','RES_SH_HEX_HET_MO_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_DST_MO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_LPG_MO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_NGA_MO_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_SOL_DST_MO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_SOL_LPG_MO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_SOL_NGA_MO_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_DST_COND_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_NGA_COND_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_LPG_COND_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WST_BIO_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_BIO','RES_SH_WPL_BIO_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_AHP_ELC_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HNS_ELC_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SH_HPP_ELC_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_HET','RES_SH_HEX_HET_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_DST_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_LPG_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_SOL','RES_SH_SOL_NGA_SN_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_DST','RES_SH_SOL_DST_SN_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_LPG','RES_SH_SOL_LPG_SN_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SH_SOL_NGA_SN_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_AHP_ELC_STD_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_AHP_ELC_IMP_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_CEN_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_ROOM_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_AHP_ELC_ADV_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_GEO_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_ELC','RES_SC_ROOM_ELC_NEW_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_GEO','RES_SC_GEO_IMP_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SC_AHP_NGA_ADV_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'RES_NGA','RES_SC_CEN_NGA_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2016,'RES_NGA','RES_SC_AHP_NGA_N','ge',0.5,'');

CREATE TABLE limit_tech_input_split_annual (
    region     TEXT,
    period     INTEGER REFERENCES time_period(period),
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    operator   TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion REAL,
    notes      TEXT,
    PRIMARY KEY(region, period, input_comm, tech, operator)
);
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'GAS_NGA','RES_FT_NGA','ge',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'GAS_NGA','RES_FT_NGA','ge',0.98,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_DST','RES_FT_DST','ge',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_DST','RES_FT_DST','ge',0.98,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','RES_FT_BIO','ge',0.98,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_GAS','RES_FT_BIO','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_SLB','RES_FT_BIO','ge',0.8,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_GAS','RES_FT_BIO','ge',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'COA_HCO','RES_FT_COA','ge',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'COA_HCO','RES_FT_COA','ge',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_DST','RES_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_DST','RES_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_DST','RES_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_DST','RES_FT_DST','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_KER','RES_FT_KER','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_KER','RES_FT_KER','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_KER','RES_FT_KER','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_KER','RES_FT_KER','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','RES_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','RES_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','RES_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','RES_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','RES_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','RES_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','RES_FT_NGA','le',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','RES_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','RES_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','RES_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','RES_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','RES_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','RES_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','RES_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'RES_RF_RFG','RES_RF_TECH','ge',0.8,'');

CREATE TABLE limit_tech_output_split (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    tech        TEXT REFERENCES technology(tech),
    output_comm TEXT REFERENCES commodity(name),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion  REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, tech, output_comm, operator)
);
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SO_N','RES_PH_SO','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SO_N','RES_PC_SO','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SO_N','RES_PW_SO','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SO_N','RES_PH_SO','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SO_N','RES_PC_SO','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SO_N','RES_PW_SO','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SO_N','RES_PH_SO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SO_N','RES_PC_SO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SO_N','RES_PW_SO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_MO_N','RES_PH_MO','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_MO_N','RES_PC_MO','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_MO_N','RES_PW_MO','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_MO_N','RES_PH_MO','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_MO_N','RES_PC_MO','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_MO_N','RES_PW_MO','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_MO_N','RES_PH_MO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_MO_N','RES_PC_MO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_MO_N','RES_PW_MO','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SN_N','RES_PH_SN','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SN_N','RES_PC_SN','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_SN_N','RES_PW_SN','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SN_N','RES_PH_SN','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SN_N','RES_PC_SN','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_SN_N','RES_PW_SN','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SN_N','RES_PH_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SN_N','RES_PC_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_SN_N','RES_PW_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN','ge',0.3,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN','ge',0.0,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CI_N','ELC_DST','ge',0.4375,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_CI_N','ELC_DST','ge',0.4545,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_CI_N','ELC_DST','ge',0.4767,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_CI_N','ELC_DST','ge',0.5102,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CI_N','RES_HET','ge',0.5625,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_CI_N','RES_HET','ge',0.5455,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_CI_N','RES_HET','ge',0.5233,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_CI_N','RES_HET','ge',0.4898,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',0.35,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',0.378,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',0.4186,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',0.4783,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N','RES_HET','ge',0.65,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N','RES_HET','ge',0.622,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N','RES_HET','ge',0.5814,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N','RES_HET','ge',0.5217,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CC_N','ELC_DST','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CC_N','RES_HET','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_STR_N','ELC_DST','ge',0.8,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_STR_N','RES_HET','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_STR_N','ELC_DST','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_STR_N','RES_HET','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N','ELC_DST','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N','RES_HET','ge',0.5,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N','ELC_DST','ge',0.61,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N','RES_HET','ge',0.39,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.54,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N','RES_HET','ge',0.46,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.53,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N','RES_HET','ge',0.47,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.58,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N','RES_HET','ge',0.42,'');

CREATE TABLE limit_tech_output_split_annual (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    tech        TEXT REFERENCES technology(tech),
    output_comm TEXT REFERENCES commodity(name),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion  REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, tech, output_comm, operator)
);

CREATE TABLE linked_tech (
    primary_region TEXT,
    primary_tech   TEXT REFERENCES technology(tech),
    emis_comm      TEXT REFERENCES commodity(name),
    driven_tech    TEXT REFERENCES technology(tech),
    notes          TEXT,
    PRIMARY KEY(primary_region, primary_tech, emis_comm)
);

CREATE TABLE loan_lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);

CREATE TABLE loan_rate (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    rate    REAL,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);

CREATE TABLE metadata (
    element TEXT PRIMARY KEY,
    value   INT,
    notes   TEXT
);
INSERT INTO "metadata" VALUES('DB_MAJOR',4,NULL);
INSERT INTO "metadata" VALUES('DB_MINOR',0,NULL);

CREATE TABLE metadata_real (
    element TEXT PRIMARY KEY,
    value   REAL,
    notes   TEXT
);
INSERT INTO "metadata_real" VALUES('global_discount_rate',0.05,NULL);
INSERT INTO "metadata_real" VALUES('default_loan_rate',0.05,NULL);

CREATE TABLE myopic_efficiency (
    base_year   INTEGER,
    region      TEXT,
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    lifetime    INTEGER,
    PRIMARY KEY(region, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_built_capacity (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    PRIMARY KEY(region, scenario, tech, vintage)
);

CREATE TABLE output_cost (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    d_invest REAL,
    d_fixed  REAL,
    d_var    REAL,
    d_emiss  REAL,
    invest   REAL,
    fixed    REAL,
    var      REAL,
    emiss    REAL,
    units    TEXT,
    PRIMARY KEY(scenario, region, period, tech, vintage)
);

CREATE TABLE output_curtailment (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT,
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    curtailment REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_dual_variable (
    scenario        TEXT,
    constraint_name TEXT,
    dual            REAL,
    PRIMARY KEY(constraint_name, scenario)
);

CREATE TABLE output_emission (
    scenario  TEXT,
    region    TEXT,
    sector    TEXT REFERENCES sector_label(sector),
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    emission  REAL,
    units     TEXT,
    PRIMARY KEY(region, scenario, period, emis_comm, tech, vintage)
);

CREATE TABLE output_flow_in (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT REFERENCES sector_label(sector),
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    flow        REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_flow_out (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT REFERENCES sector_label(sector),
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    flow        REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_flow_out_summary (
    scenario    TEXT NOT NULL,
    region      TEXT NOT NULL,
    sector      TEXT,
    period      INTEGER,
    input_comm  TEXT NOT NULL,
    tech        TEXT NOT NULL,
    vintage     INTEGER,
    output_comm TEXT NOT NULL,
    flow        REAL NOT NULL,
    PRIMARY KEY(scenario, region, period, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_net_capacity (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    PRIMARY KEY(region, scenario, period, tech, vintage)
);

CREATE TABLE output_objective (
    scenario          TEXT,
    objective_name    TEXT,
    total_system_cost REAL
);

CREATE TABLE output_retired_capacity (
    scenario  TEXT,
    region    TEXT,
    sector    TEXT REFERENCES sector_label(sector),
    period    INTEGER REFERENCES time_period(period),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    cap_eol   REAL,
    cap_early REAL,
    units     TEXT,
    PRIMARY KEY(region, scenario, period, tech, vintage)
);

CREATE TABLE output_storage_level (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    season   TEXT,
    tod      TEXT REFERENCES time_of_day(tod),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    level    REAL,
    units    TEXT,
    PRIMARY KEY(scenario, region, period, season, tod, tech, vintage)
);

CREATE TABLE planning_reserve_margin (
    region TEXT PRIMARY KEY REFERENCES region(region),
    margin REAL,
    notes  TEXT
);

CREATE TABLE ramp_down_hourly (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    rate   REAL,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE ramp_up_hourly (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    rate   REAL,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE reserve_capacity_derate (
    region  TEXT,
    season  TEXT REFERENCES time_season(season),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    factor  REAL,
    notes   TEXT,
    PRIMARY KEY(region, season, tech, vintage),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE tech_group (
    group_name TEXT PRIMARY KEY,
    notes      TEXT
);
INSERT INTO "tech_group" VALUES('RES_SH_SO_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SO_BIO_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SO_NGA_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SO_ELC_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_MO_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_MO_NGA_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_MO_ELC_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SN_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SN_NGA_GRP','');
INSERT INTO "tech_group" VALUES('RES_SH_SN_ELC_GRP','');
INSERT INTO "tech_group" VALUES('RES_WH_GRP','');
INSERT INTO "tech_group" VALUES('RES_WH_ELC_GRP','');
INSERT INTO "tech_group" VALUES('RES_WH_NGA_GRP','');
INSERT INTO "tech_group" VALUES('RES_CK_GRP','');
INSERT INTO "tech_group" VALUES('RES_CK_ELC_GRP','');
INSERT INTO "tech_group" VALUES('RES_CK_BIO_GRP','');
INSERT INTO "tech_group" VALUES('RES_CK_LPG_GRP','');
INSERT INTO "tech_group" VALUES('RES_LG_HAL_IN_GRP','');

CREATE TABLE rps_requirement (
    region      TEXT NOT NULL REFERENCES region(region),
    period      INTEGER NOT NULL REFERENCES time_period(period),
    tech_group  TEXT NOT NULL REFERENCES tech_group(group_name),
    requirement REAL NOT NULL,
    notes       TEXT
);

CREATE TABLE storage_duration (
    region   TEXT,
    tech     TEXT,
    duration REAL,
    notes    TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE tech_group_member (
    group_name TEXT REFERENCES tech_group(group_name),
    tech       TEXT REFERENCES technology(tech),
    PRIMARY KEY(group_name, tech)
);
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_BIO_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_COA_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_ELC_E');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_LPG_E');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_LPG_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_NGA_E');
INSERT INTO "tech_group_member" VALUES('RES_CK_GRP','RES_CK_NGA_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_BIO_GRP','RES_CK_BIO_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_ELC_GRP','RES_CK_ELC_E');
INSERT INTO "tech_group_member" VALUES('RES_CK_ELC_GRP','RES_CK_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_CK_LPG_GRP','RES_CK_LPG_E');
INSERT INTO "tech_group_member" VALUES('RES_CK_LPG_GRP','RES_CK_LPG_N');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_LHAL_E');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_LHAL_N');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_MIN_E');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_MIN_N');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SHAL_E');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SHAL_IMP_E');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SHAL_IMP_N');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SHAL_N');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SIN_E');
INSERT INTO "tech_group_member" VALUES('RES_LG_HAL_IN_GRP','RES_LG_SIN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_AHP_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_DST_COND_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_DST_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_HEX_HET_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_HNS_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_HPP_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_HP_HET_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_LPG_COND_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_LPG_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_NGA_COND_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_NGA_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_SOL_DST_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_SOL_LPG_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_SOL_NGA_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_WPL_BIO_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_GRP','RES_SH_WST_BIO_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_BIO_GRP','RES_SH_WPL_BIO_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_BIO_GRP','RES_SH_WST_BIO_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_NGA_GRP','RES_SH_NGA_COND_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_NGA_GRP','RES_SH_NGA_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_ELC_GRP','RES_SH_AHP_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_ELC_GRP','RES_SH_HNS_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_ELC_GRP','RES_SH_HPP_ELC_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SO_ELC_GRP','RES_SH_HP_HET_SO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_AHP_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_DST_COND_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_DST_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_HEX_HET_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_HNS_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_HPP_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_HP_HET_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_LPG_COND_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_LPG_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_NGA_COND_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_NGA_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_SOL_DST_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_SOL_LPG_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_SOL_NGA_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_WPL_BIO_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_GRP','RES_SH_WST_BIO_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_ELC_GRP','RES_SH_AHP_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_ELC_GRP','RES_SH_HNS_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_ELC_GRP','RES_SH_HPP_ELC_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_ELC_GRP','RES_SH_HP_HET_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_NGA_GRP','RES_SH_NGA_COND_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_MO_NGA_GRP','RES_SH_NGA_MO_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_AHP_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_DST_COND_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_HEX_HET_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_HNS_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_HPP_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_HP_HET_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_LPG_COND_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_NGA_COND_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_SOL_DST_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_SOL_LPG_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_SOL_NGA_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_WPL_BIO_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_GRP','RES_SH_WST_BIO_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_ELC_GRP','RES_SH_AHP_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_ELC_GRP','RES_SH_HNS_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_ELC_GRP','RES_SH_HPP_ELC_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_ELC_GRP','RES_SH_HP_HET_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_NGA_GRP','RES_SH_SOL_NGA_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_SH_SN_NGA_GRP','RES_SH_NGA_COND_SN_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_AHP_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_BIO_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_DST_COND_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_DST_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_DST_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_ELC_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_ELC_RES_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_HET_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_HFO_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_HNS_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_LPG_COND_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_LPG_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_LPG_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_NGA_COND_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_NGA_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_NGA_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_PDC_ACS_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_SOL_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_SOL_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_GRP','RES_WH_WPL_BIO_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_ELC_GRP','RES_WH_AHP_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_ELC_GRP','RES_WH_ELC_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_ELC_GRP','RES_WH_ELC_RES_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_ELC_GRP','RES_WH_HNS_ELC_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_ELC_GRP','RES_WH_PDC_ACS_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_NGA_GRP','RES_WH_NGA_COND_N');
INSERT INTO "tech_group_member" VALUES('RES_WH_NGA_GRP','RES_WH_NGA_E');
INSERT INTO "tech_group_member" VALUES('RES_WH_NGA_GRP','RES_WH_NGA_N');

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
