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
INSERT INTO "commodity" VALUES('AGR_DEM','d','Agriculture demand','PJ');
INSERT INTO "commodity" VALUES('AGR_ELC','p','Electricity','PJ');
INSERT INTO "commodity" VALUES('AGR_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('AGR_DST','a','Diesel','PJ');
INSERT INTO "commodity" VALUES('AGR_GSL','a','Gasoline','PJ');
INSERT INTO "commodity" VALUES('AGR_LPG','a','Liquified petroleum gas','PJ');
INSERT INTO "commodity" VALUES('AGR_BIO','a','Biofuels','PJ');
INSERT INTO "commodity" VALUES('AGR_SOL','p','Solar','PJ');
INSERT INTO "commodity" VALUES('AGR_GEO','a','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('AGR_HET','p','Heat','PJ');
INSERT INTO "commodity" VALUES('AGR_CH4','e','Agriculture - CH4 emission','t');
INSERT INTO "commodity" VALUES('AGR_CO2','e','Agriculture - CO2 emission','kt');
INSERT INTO "commodity" VALUES('AGR_N2O','e','Agriculture - N2O emission','t');
INSERT INTO "commodity" VALUES('COM_SC','d','Space cooling','PJ');
INSERT INTO "commodity" VALUES('COM_CK','d','Cooking','PJ');
INSERT INTO "commodity" VALUES('COM_SH','d','Space heating','PJ');
INSERT INTO "commodity" VALUES('COM_WH','d','Water heating','PJ');
INSERT INTO "commodity" VALUES('COM_LG','d','Lighting','PJ');
INSERT INTO "commodity" VALUES('COM_OE','d','Other electricity use','PJ');
INSERT INTO "commodity" VALUES('COM_RF','d','Refrigeration','PJ');
INSERT INTO "commodity" VALUES('COM_BIO','a','Biomass','PJ');
INSERT INTO "commodity" VALUES('COM_DST','a','Diesel','PJ');
INSERT INTO "commodity" VALUES('COM_ELC','p','Electricity','PJ');
INSERT INTO "commodity" VALUES('COM_GEO','a','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('COM_HET','p','Heat','PJ');
INSERT INTO "commodity" VALUES('COM_LPG','a','Liquified petroleum gas','PJ');
INSERT INTO "commodity" VALUES('COM_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('COM_SOL','p','Solar','PJ');
INSERT INTO "commodity" VALUES('COM_CH4','e','Commercial - CH4 emisison','t');
INSERT INTO "commodity" VALUES('COM_CO2','e','Commercial - CO2 emisison','kt');
INSERT INTO "commodity" VALUES('COM_N2O','e','Commercial - N2O emisison','t');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('LAN','a','Lanthanum','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('TIT','a','Titanium','t');
INSERT INTO "commodity" VALUES('YTT','a','Yttrium','t');
INSERT INTO "commodity" VALUES('ZIR','a','Zirconium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('BIO_DST1','s','Bio diesel from 1st generation refinery','PJ');
INSERT INTO "commodity" VALUES('BIO_LIQ','s','Liquid biofuels','PJ');
INSERT INTO "commodity" VALUES('BIO_METH','s','Biomethane','PJ');
INSERT INTO "commodity" VALUES('BIO_SLB','s','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','s','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','p','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('ELC_H2','s','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('ELC_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('ELC_SLB','s','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GEO','s','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('H2_BL','s','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('HET','s','Heat','PJ');
INSERT INTO "commodity" VALUES('OIL_DST','s','Distillates','PJ');
INSERT INTO "commodity" VALUES('OIL_GSL','s','Gasoline','PJ');
INSERT INTO "commodity" VALUES('OIL_LPG','s','Liquid petroleum gas','PJ');
INSERT INTO "commodity" VALUES('OIL_NSP','s','Non specified oil','PJ');
INSERT INTO "commodity" VALUES('SOL','s','Solar energy','PJ');
INSERT INTO "commodity" VALUES('SYN_DST','s','Synthetic diesel fuel','PJ');
INSERT INTO "commodity" VALUES('SYN_MET','s','Synthetic methanol','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','s','Synthetic natural gas','PJ');

CREATE TABLE allocation (
    demand_comm TEXT REFERENCES commodity(name),
    driver_name TEXT,
    notes       TEXT,
    PRIMARY KEY(demand_comm, driver_name)
);
INSERT INTO "allocation" VALUES('AGR_DEM','PAGR','');
INSERT INTO "allocation" VALUES('COM_SC','PSER','');
INSERT INTO "allocation" VALUES('COM_CK','PSER','');
INSERT INTO "allocation" VALUES('COM_SH','PSER','');
INSERT INTO "allocation" VALUES('COM_WH','PSER','');
INSERT INTO "allocation" VALUES('COM_LG','PSER','');
INSERT INTO "allocation" VALUES('COM_OE','PSER','');
INSERT INTO "allocation" VALUES('COM_RF','PSER','');

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
INSERT INTO "technology" VALUES('AGR_FT_NGA','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Natural gas');
INSERT INTO "technology" VALUES('AGR_FT_DST','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Diesel');
INSERT INTO "technology" VALUES('AGR_FT_GSL','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Gasoline');
INSERT INTO "technology" VALUES('AGR_FT_LPG','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Liquified petroleum gas');
INSERT INTO "technology" VALUES('AGR_FT_BIO','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Biofuels');
INSERT INTO "technology" VALUES('AGR_FT_GEO','p','AGR','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Geothermal energy');
INSERT INTO "technology" VALUES('AGR_FT_SOL','p','AGR','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Solar');
INSERT INTO "technology" VALUES('AGR_FT_ELC','p','AGR','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Electricity');
INSERT INTO "technology" VALUES('AGR_FT_HET','p','AGR','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Heat');
INSERT INTO "technology" VALUES('AGR_TECH','p','AGR','',NULL,1,1,0,0,0,0,0,0,'Agriculture - Existing technology');
INSERT INTO "technology" VALUES('COM_FT_NGA','p','COM','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Natural gas');
INSERT INTO "technology" VALUES('COM_FT_DST','p','COM','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Diesel');
INSERT INTO "technology" VALUES('COM_FT_LPG','p','COM','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Liquified petroleum gas');
INSERT INTO "technology" VALUES('COM_FT_BIO','p','COM','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Biomass');
INSERT INTO "technology" VALUES('COM_FT_GEO','p','COM','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Geothermal energy');
INSERT INTO "technology" VALUES('COM_FT_SOL','p','COM','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Solar');
INSERT INTO "technology" VALUES('COM_FT_ELC','p','COM','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Electricity');
INSERT INTO "technology" VALUES('COM_FT_HET','p','COM','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Heat');
INSERT INTO "technology" VALUES('COM_SH_HT_NGA_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Natural gas - Existing');
INSERT INTO "technology" VALUES('COM_SH_HP_NGA_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Natural gas - Existing');
INSERT INTO "technology" VALUES('COM_SH_HT_DST_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Diesel - Existing');
INSERT INTO "technology" VALUES('COM_SH_HT_LPG_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - LPG - Existing');
INSERT INTO "technology" VALUES('COM_SH_HT_BIO_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Biomass - Existing');
INSERT INTO "technology" VALUES('COM_SH_RES_ELC_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Electric resistance - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_SH_HP_ELC_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_SH_HEX_HET_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - Existing');
INSERT INTO "technology" VALUES('COM_SH_HEX_GEO_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Geothermal energy - Existing');
INSERT INTO "technology" VALUES('COM_SC_ABS_NGA_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Absorption chiller - Natural gas - Existing');
INSERT INTO "technology" VALUES('COM_SC_CHL_DST_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Chiller - Diesel - Existing');
INSERT INTO "technology" VALUES('COM_SC_CCL_ELC_CNT_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Centralized cooler - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_SC_AHP_ELC_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Air-coupled heat pump - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_SC_ROOM_ELC_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Room cooler - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_SC_ROOF_ELC_E','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Rooftop cooler- Electricity - Existing');
INSERT INTO "technology" VALUES('COM_WH_NGA_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_WH_DST_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel - Existing');
INSERT INTO "technology" VALUES('COM_WH_LPG_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG - Existing');
INSERT INTO "technology" VALUES('COM_WH_ELC_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_WH_HET_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Heat exchanger - Heat - Existing');
INSERT INTO "technology" VALUES('COM_LG_INC_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Incandescent lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_SHAL_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small halogen lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_IRCHAL_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - IRC halogen lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_SFL_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small fluorescent lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_LFL_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large fluorescent lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_CFL_C_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Compact fluorescent lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_MER_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Mercury lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_SOD_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Sodium lamp - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_CK_NGA_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Natural gas - Existing');
INSERT INTO "technology" VALUES('COM_CK_LPG_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - LPG - Existing');
INSERT INTO "technology" VALUES('COM_CK_BIO_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Biomass - Existing');
INSERT INTO "technology" VALUES('COM_CK_ELC_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_RF_RFR_ELC_E','p','COM','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Refrigerator - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_OE_OFF_ELC_E','p','COM','',NULL,1,1,0,0,0,0,0,0,'Other electric - Office equipment - Electricity - Existing');
INSERT INTO "technology" VALUES('COM_LG_INC_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Incandescence light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_SHAL_STD_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Standard small halogen light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_HAL_IMP_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Improved small halogen light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_SFL_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Small fluorescent light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_LFL_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Large fluorescent light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_CFL_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Compact fluorescent light - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_KER_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Kerosene lamp - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_MER_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Mercury lamp - Electricity - New');
INSERT INTO "technology" VALUES('COM_LG_SOD_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Lighting - Sodium lamp - Electricity - New');
INSERT INTO "technology" VALUES('COM_WH_DST_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel - New');
INSERT INTO "technology" VALUES('COM_WH_COND_DST_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Diesel (condensing) - New');
INSERT INTO "technology" VALUES('COM_WH_NGA_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Natural gas - New');
INSERT INTO "technology" VALUES('COM_WH_COND_NGA_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Natural gas (condensing) - New');
INSERT INTO "technology" VALUES('COM_WH_LPG_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG - New');
INSERT INTO "technology" VALUES('COM_WH_COND_LPG_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - LPG (condensing) - New');
INSERT INTO "technology" VALUES('COM_WH_WPEL_BIO_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Wood pellet - Biomass - New');
INSERT INTO "technology" VALUES('COM_WH_ELC_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Electricity - New');
INSERT INTO "technology" VALUES('COM_WH_AHP_ELC_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Air-coupled heat pump-based - Electricity - New');
INSERT INTO "technology" VALUES('COM_WH_HEX_HET_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Heat exchanger - Heat - New');
INSERT INTO "technology" VALUES('COM_WH_SOL_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Water heating - Solar energy - New');
INSERT INTO "technology" VALUES('COM_SH_DST_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater -  Diesel - New');
INSERT INTO "technology" VALUES('COM_SH_COND_DST_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Diesel (condensing) - New');
INSERT INTO "technology" VALUES('COM_SH_NGA_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Natural gas - New');
INSERT INTO "technology" VALUES('COM_SH_COND_NGA_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Natural gas (condensing) - New');
INSERT INTO "technology" VALUES('COM_SH_LPG_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - LPG - New');
INSERT INTO "technology" VALUES('COM_SH_COND_LPG_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - LPG (condensing) - New');
INSERT INTO "technology" VALUES('COM_SH_HEX_HET_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat exchanger - Heat - New');
INSERT INTO "technology" VALUES('COM_SH_HP_AIR_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Air-coupled heat pump - Electricity - New');
INSERT INTO "technology" VALUES('COM_SH_HP_PRB_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump coupled with probe - Electricity - New');
INSERT INTO "technology" VALUES('COM_SH_HP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heat pump - Electricity - New');
INSERT INTO "technology" VALUES('COM_SH_GEO_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Geothermal - New');
INSERT INTO "technology" VALUES('COM_SH_DST_SOL_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Diesel + Solar energy - New');
INSERT INTO "technology" VALUES('COM_SH_LPG_SOL_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - LPG + Solar energy - New');
INSERT INTO "technology" VALUES('COM_SH_NGA_SOL_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Heater - Natural gas + Solar energy - New');
INSERT INTO "technology" VALUES('COM_SH_WPEL_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space heating - Wood pellet - Biomass - New');
INSERT INTO "technology" VALUES('COM_SC_DST_STD_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Diesel (standard) - New');
INSERT INTO "technology" VALUES('COM_SC_DST_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Diesel - New');
INSERT INTO "technology" VALUES('COM_SC_HP_STD_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Heat pump (standard) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_HP_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Heat pump (improved) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_ROOF_STD_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Rooftop (standard) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_ELC_GEO_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Geothermal (improved) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_ELC_GEO_ADV_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Geothermal (advanced) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_ROOF_ADV_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Rooftop (advanced) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_REC_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Reciprocating - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_REC_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Reciprocating (improved) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_CNF_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Centrifugal - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_CNF_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Centrifugal (improved) - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_CNT_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Central - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_ROOM_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Room - Electricity - New');
INSERT INTO "technology" VALUES('COM_SC_GEO_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Geothermal energy (improved) - New');
INSERT INTO "technology" VALUES('COM_SC_ABS_NGA_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Absorption - Natural gas - New');
INSERT INTO "technology" VALUES('COM_SC_NGA_STD_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Natural gas (standard) - New');
INSERT INTO "technology" VALUES('COM_SC_NGA_IMP_N','p','COM','',NULL,0,0,0,0,0,0,0,0,'Space cooling - Natural gas (improved) - New');
INSERT INTO "technology" VALUES('COM_CK_NGA_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Natural gas - New');
INSERT INTO "technology" VALUES('COM_CK_LPG_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - LPG - New');
INSERT INTO "technology" VALUES('COM_CK_DST_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Diesel - New');
INSERT INTO "technology" VALUES('COM_CK_ELC_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Electricity - New');
INSERT INTO "technology" VALUES('COM_CK_BIO_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Cooking - Biomass - New');
INSERT INTO "technology" VALUES('COM_OE_OFF_ELC_STD_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Other electric - Office equipment (standard) - Electricity - New');
INSERT INTO "technology" VALUES('COM_OE_OFF_ELC_IMP_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Other electric - Office equipment (improved) - Electricity - New');
INSERT INTO "technology" VALUES('COM_OE_OFF_ADV_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Other electric - Office equipment (advanced) - Electricity - New');
INSERT INTO "technology" VALUES('COM_RF_STD_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Electricity (standard) - New');
INSERT INTO "technology" VALUES('COM_RF_IMP_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Electricity (improved) - New');
INSERT INTO "technology" VALUES('COM_RF_N','p','COM','',NULL,0,1,0,0,0,0,0,0,'Refrigeration - Electricity - New');
INSERT INTO "technology" VALUES('COM_CHP_NGA_CI_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_NGA_MICRO_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Cogeneration microturbine - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_NGA_CC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Combined cycle - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_SLB_CI_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Internal combustion engine - Solid biomass');
INSERT INTO "technology" VALUES('COM_CHP_NGA_SOFC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Solid oxide fuel cell - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_H2_PEMFC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - PEM fuel cell - Hydrogen');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_LAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lanthanum');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_TIT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Titanium');
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
INSERT INTO "capacity_credit" VALUES('IT',2007,'COM_CHP_NGA_CI_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'COM_CHP_SLB_CI_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'COM_CHP_NGA_CC_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N',2020,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N',2025,0.20,'');

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
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_NGA_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_NGA_MICRO_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_SLB_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_NGA_CC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_NGA_SOFC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','COM_CHP_H2_PEMFC_N',31.536,'PJ/(GW)','');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);
INSERT INTO "commodity_emission_factor" VALUES('AGR_CO2','AGR_NGA',56.10,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CO2','AGR_DST',74.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CO2','AGR_GSL',69.30,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CO2','AGR_LPG',63.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CO2','AGR_BIO',0.0001,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CH4','AGR_NGA',1.10,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CH4','AGR_DST',1.32,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CH4','AGR_GSL',6.92,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CH4','AGR_LPG',5.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_CH4','AGR_BIO',300.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_N2O','AGR_NGA',1.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_N2O','AGR_DST',1.32,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_N2O','AGR_GSL',6.60,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_N2O','AGR_LPG',0.10,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('AGR_N2O','AGR_BIO',4.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CO2','COM_NGA',56.10,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CO2','COM_DST',74.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CO2','COM_LPG',63.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CO2','COM_BIO',0.0001,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CH4','COM_NGA',1.10,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CH4','COM_DST',1.32,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CH4','COM_LPG',5.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_CH4','COM_BIO',300.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_N2O','COM_NGA',1.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_N2O','COM_DST',3.36,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_N2O','COM_LPG',0.01,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('COM_N2O','COM_BIO',4.00,'t/(PJ)','');

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
INSERT INTO "construction_input" VALUES('IT','CHR','COM_CHP_NGA_CI_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','COM_CHP_NGA_CI_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','COM_CHP_NGA_CI_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','COM_CHP_NGA_MICRO_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','COM_CHP_NGA_MICRO_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','COM_CHP_NGA_MICRO_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','COM_CHP_NGA_CC_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','COM_CHP_NGA_CC_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','COM_CHP_NGA_CC_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','COM_CHP_SLB_CI_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','COM_CHP_SLB_CI_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','COM_CHP_NGA_SOFC_N',2020,6.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','COM_CHP_NGA_SOFC_N',2020,1.00E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','COM_CHP_NGA_SOFC_N',2020,1.28E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ZIR','COM_CHP_NGA_SOFC_N',2020,1.79E+00,'t/(GW)','10.1016/j.mtener.2025.101805');

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
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_NGA',2006,4.31,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_DST',2006,6.46,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_GSL',2006,6.46,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_LPG',2006,6.46,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_BIO',2006,2.15,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'AGR_FT_GEO',2006,0.10,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'AGR_FT_SOL',2007,0.10,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'COM_FT_NGA',2006,3.280,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'COM_FT_DST',2006,4.920,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'COM_FT_LPG',2006,4.920,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'COM_FT_BIO',2006,2.620,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'COM_FT_SOL',2006,0.100,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_DST_N',2007,5.87E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_COND_DST_N',2007,8.72E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_NGA_N',2007,4.99E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_COND_NGA_N',2007,6.84E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_LPG_N',2007,5.47E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_COND_LPG_N',2007,7.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_INC_N',2007,1.78E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_SHAL_STD_N',2007,9.00E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_HAL_IMP_N',2007,1.61E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_SFL_N',2007,1.03E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_LFL_N',2007,1.03E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_CFL_N',2007,1.03E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_KER_N',2007,4.00E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_MER_N',2007,1.03E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_LG_SOD_N',2007,1.03E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_DST_N',2007,2.42E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_COND_DST_N',2007,3.60E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_NGA_N',2007,2.06E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_COND_NGA_N',2007,2.82E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_LPG_N',2007,2.26E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_COND_LPG_N',2007,2.89E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_WPEL_BIO_N',2007,5.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_ELC_N',2007,3.40E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_AHP_ELC_N',2007,1.96E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_HEX_HET_N',2007,0.00E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_WH_SOL_N',2007,1.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_HEX_HET_N',2007,2.88E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_HP_AIR_N',2007,4.76E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_HP_PRB_N',2007,6.66E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_HP_N',2007,4.76E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_GEO_N',2007,6.30E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_DST_SOL_N',2007,7.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_LPG_SOL_N',2007,6.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_NGA_SOL_N',2007,6.00E-02,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SH_WPEL_N',2007,1.59E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_DST_STD_N',2007,4.57E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2016,'COM_SC_DST_N',2016,3.30E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_HP_STD_N',2007,1.00E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_HP_IMP_N',2007,1.28E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_ROOF_STD_N',2007,6.27E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_ELC_GEO_IMP_N',2007,1.28E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'COM_SC_ELC_GEO_ADV_N',2010,1.10E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_ROOF_ADV_N',2007,4.77E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_REC_N',2007,3.23E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'COM_SC_REC_IMP_N',2010,3.20E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_CNF_N',2007,2.14E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2016,'COM_SC_CNF_IMP_N',2016,2.15E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_CNT_N',2007,2.62E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_ROOM_N',2007,2.87E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_GEO_IMP_N',2007,3.61E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_ABS_NGA_N',2007,1.59E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_SC_NGA_STD_N',2007,3.08E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'COM_SC_NGA_IMP_N',2010,3.11E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_CK_NGA_N',2007,2.78E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_CK_LPG_N',2007,3.50E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_CK_DST_N',2007,3.50E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_CK_ELC_N',2007,2.22E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_CK_BIO_N',2007,4.17E+00,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_OE_OFF_ELC_STD_N',2007,4.10E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_OE_OFF_ELC_IMP_N',2007,4.20E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'COM_OE_OFF_ADV_N',2010,4.40E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_RF_STD_N',2007,6.30E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'COM_RF_IMP_N',2007,7.90E-01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'COM_RF_N',2010,9.20E-01,'MEUR/(PJ/year)','');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "cost_invest" VALUES('IT','AGR_FT_HET',2007,5.07,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_FT_NGA',2007,2.00E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_FT_GEO',2007,1.50E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_FT_HET',2007,5.07E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_INC_N',2007,6.30E-01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_SHAL_STD_N',2007,7.10E-01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_HAL_IMP_N',2007,2.93E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_SFL_N',2007,1.31E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_LFL_N',2007,3.96E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_CFL_N',2007,5.89E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_KER_N',2007,1.00E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_MER_N',2007,3.80E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_LG_SOD_N',2007,6.24E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_DST_N',2007,2.42E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_COND_DST_N',2007,3.60E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_NGA_N',2007,2.06E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_COND_NGA_N',2007,2.82E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_LPG_N',2007,2.26E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_COND_LPG_N',2007,2.89E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_WPEL_BIO_N',2007,5.00E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_ELC_N',2007,1.70E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_AHP_ELC_N',2007,1.96E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_HEX_HET_N',2007,1.50E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_SOL_N',2007,2.90E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_SOL_N',2020,2.77E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_WH_SOL_N',2050,2.65E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_DST_N',2007,5.87E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_COND_DST_N',2007,8.72E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_NGA_N',2007,4.99E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_COND_NGA_N',2007,6.84E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_LPG_N',2007,5.47E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_COND_LPG_N',2007,7.00E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HEX_HET_N',2007,2.88E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HEX_HET_N',2020,2.75E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HEX_HET_N',2050,2.63E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HP_AIR_N',2007,4.32E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HP_PRB_N',2007,6.66E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HP_N',2007,4.32E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HP_N',2020,4.12E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_HP_N',2050,3.92E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_GEO_N',2007,6.30E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_DST_SOL_N',2007,2.35E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_DST_SOL_N',2020,2.25E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_DST_SOL_N',2050,2.15E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_LPG_SOL_N',2007,2.30E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_LPG_SOL_N',2020,2.20E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_LPG_SOL_N',2050,2.10E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_NGA_SOL_N',2007,2.25E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_NGA_SOL_N',2020,2.15E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_NGA_SOL_N',2050,2.06E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SH_WPEL_N',2007,1.59E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_DST_STD_N',2007,3.90E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_DST_N',2016,2.35E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_HP_STD_N',2007,2.00E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_HP_IMP_N',2007,3.21E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ROOF_STD_N',2007,1.05E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ELC_GEO_IMP_N',2007,3.85E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ELC_GEO_ADV_N',2010,3.85E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ROOF_ADV_N',2007,9.91E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_REC_N',2007,1.91E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_REC_IMP_N',2010,2.18E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_CNF_N',2007,2.52E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_CNF_IMP_N',2016,2.78E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_CNT_N',2007,2.60E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ROOM_N',2007,3.25E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_GEO_IMP_N',2007,4.55E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_ABS_NGA_N',2007,2.35E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_NGA_STD_N',2007,3.55E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_SC_NGA_IMP_N',2010,3.95E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CK_NGA_N',2007,1.90E+02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CK_LPG_N',2007,2.00E+02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CK_DST_N',2007,2.00E+02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CK_ELC_N',2007,1.80E+02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CK_BIO_N',2007,2.00E+02,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_OE_OFF_ELC_STD_N',2007,7.39E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_OE_OFF_ELC_IMP_N',2007,7.99E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_OE_OFF_ADV_N',2010,8.49E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_RF_STD_N',2007,6.66E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_RF_IMP_N',2007,8.72E+00,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_RF_N',2010,1.02E+01,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CI_N',2007,1100.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CI_N',2014,1050.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CI_N',2022,980.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CI_N',2030,900.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CI_N',2050,900.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,1500.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_MICRO_N',2014,1350.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_MICRO_N',2022,1160.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_MICRO_N',2030,1000.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_MICRO_N',2050,1000.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CC_N',2007,1300.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CC_N',2014,1300.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CC_N',2022,1300.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CC_N',2030,1300.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_CC_N',2050,1300.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_SLB_CI_N',2007,1870.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_SLB_CI_N',2014,1785.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_SLB_CI_N',2022,1666.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_SLB_CI_N',2030,1530.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_SLB_CI_N',2050,1350.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_SOFC_N',2020,10000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_SOFC_N',2025,7750,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_NGA_SOFC_N',2030,2250,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_H2_PEMFC_N',2025,1500,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','COM_CHP_H2_PEMFC_N',2030,1050,'MEUR/(GW)','');

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
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_NGA',2006,2.17,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_DST',2006,3.26,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_GSL',2006,3.26,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_LPG',2006,3.26,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_BIO',2006,1.09,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'AGR_FT_GEO',2006,0.10,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2007,'AGR_FT_SOL',2007,0.10,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_ELC',2006,15.00+6.31,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_BIO',2006,1.32,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_DST',2006,2.48+10.68,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_LPG',2006,2.48+4.12,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_NGA',2006,1.66+5.23,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'COM_FT_SOL',2006,0.10,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_CI_N',2007,4.17E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N',2007,2.78E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_CC_N',2007,5.00E-01,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_SLB_CI_N',2007,4.17E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N',2020,30.56,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N',2025,16.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N',2030,4.86,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N',2025,13.89,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N',2030,6.94,'MEUR/(PJ)','');

CREATE TABLE currency (
    curr   TEXT,
    value  REAL,
    ref    TEXT,
    units  TEXT,
    notes  TEXT,
    PRIMARY KEY(curr)
);
INSERT INTO "currency" VALUES('EUR00',1.45,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR01',1.40,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR02',1.36,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR03',1.33,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR04',1.30,'',NULL,NULL);
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
INSERT INTO "currency" VALUES('EUR20',1.00,'REF',NULL,NULL);
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
INSERT INTO "currency" VALUES('USD11',0.80,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD12',0.83,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD13',0.80,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD14',0.80,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD15',0.95,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD16',0.95,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD17',0.92,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD18',0.87,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD19',0.90,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD20',0.88,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD21',0.82,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD22',0.86,'',NULL,NULL);

CREATE TABLE currency_tech (
    tech   TEXT REFERENCES technology(tech),
    curr   TEXT REFERENCES currency(curr),
    notes  TEXT,
    PRIMARY KEY(tech)
);
INSERT INTO "currency_tech" VALUES('COM_LG_INC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_SHAL_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_HAL_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_SFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_LFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_CFL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_KER_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_MER_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_LG_SOD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_COND_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_COND_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_COND_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_WPEL_BIO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_AHP_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_HEX_HET_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_WH_SOL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_COND_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_COND_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_COND_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_HEX_HET_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_HP_AIR_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_HP_PRB_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_HP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_GEO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_DST_SOL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_LPG_SOL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_NGA_SOL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SH_WPEL_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_DST_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_HP_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_HP_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ROOF_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ELC_GEO_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ELC_GEO_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ROOF_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_REC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_REC_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_CNF_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_CNF_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_CNT_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ROOM_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_GEO_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_ABS_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_NGA_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_SC_NGA_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CK_NGA_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CK_LPG_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CK_DST_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CK_ELC_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CK_BIO_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_OE_OFF_ELC_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_OE_OFF_ELC_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_OE_OFF_ADV_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_RF_STD_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_RF_IMP_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_RF_N','EUR05',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_MICRO_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_CC_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_SLB_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_SOFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_H2_PEMFC_N','EUR20',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2006,'AGR_DEM',1.377E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_SC',1.494E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_SC',1.677E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_SC',1.790E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_SC',2.036E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_SC',2.246E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_SC',2.506E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_SC',2.664E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_SC',2.737E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_SC',2.738E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_SC',2.773E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_SC',2.837E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_SC',2.970E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_SC',3.124E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_SC',3.257E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_SC',3.473E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_SC',3.551E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_CK',8.976E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_CK',9.170E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_CK',9.165E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_CK',9.119E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_CK',8.030E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_CK',9.054E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_CK',9.315E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_CK',9.499E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_CK',8.137E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_CK',9.374E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_CK',8.442E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_CK',8.558E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_CK',8.601E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_CK',8.645E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_CK',8.735E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_CK',8.824E+00,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_SH',2.616E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_SH',2.410E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_SH',3.077E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_SH',2.935E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_SH',2.761E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_SH',2.594E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_SH',2.949E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_SH',2.986E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_SH',2.947E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_SH',2.958E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_SH',2.944E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_SH',2.948E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_SH',2.940E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_SH',2.950E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_SH',2.947E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_SH',2.942E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_WH',2.405E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_WH',2.453E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_WH',2.485E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_WH',2.504E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_WH',2.568E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_WH',2.659E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_WH',2.774E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_WH',2.670E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_WH',2.602E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_WH',2.582E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_WH',2.576E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_WH',2.638E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_WH',2.668E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_WH',2.700E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_WH',2.732E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_WH',2.753E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_LG',4.836E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_LG',4.975E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_LG',4.975E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_LG',5.076E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_LG',5.185E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_LG',5.220E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_LG',5.421E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_LG',5.634E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_LG',5.634E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_LG',5.860E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_LG',6.061E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_LG',6.172E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_LG',6.216E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_LG',6.260E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_LG',6.351E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_LG',6.442E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_OE',1.057E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_OE',1.087E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_OE',1.087E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_OE',1.109E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_OE',1.133E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_OE',1.141E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_OE',1.185E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_OE',1.231E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_OE',1.231E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_OE',1.281E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_OE',1.324E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_OE',1.349E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_OE',1.358E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_OE',1.368E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_OE',1.388E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_OE',1.408E+02,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'COM_RF',1.967E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'COM_RF',2.024E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'COM_RF',2.024E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'COM_RF',2.065E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'COM_RF',2.110E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'COM_RF',2.124E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'COM_RF',2.206E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'COM_RF',2.292E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'COM_RF',2.292E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'COM_RF',2.384E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'COM_RF',2.466E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'COM_RF',2.511E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'COM_RF',2.529E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'COM_RF',2.547E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'COM_RF',2.584E+01,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'COM_RF',2.621E+01,'PJ','');

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
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2007,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2008,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2010,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2012,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2014,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2016,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2018,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2020,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2022,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2025,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2030,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2035,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2040,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2045,'fall','noon','COM_SH',0.043,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','COM_SC',0.060,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','COM_SC',0.040,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','COM_SC',0.020,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','COM_SC',0.314,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','COM_SC',0.209,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','COM_SC',0.105,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','COM_SC',0.001,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','COM_SC',0.000,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','night','COM_SH',0.196,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','morning','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','afternoon','COM_SH',0.131,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'winter','noon','COM_SH',0.065,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','night','COM_SH',0.042,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','morning','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','afternoon','COM_SH',0.028,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'spring','noon','COM_SH',0.014,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','night','COM_SH',0.008,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','morning','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','afternoon','COM_SH',0.005,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'summer','noon','COM_SH',0.003,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','night','COM_SH',0.129,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','morning','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','afternoon','COM_SH',0.086,'');
INSERT INTO "demand_specific_distribution" VALUES('IT',2050,'fall','noon','COM_SH',0.043,'');

CREATE TABLE driver (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    driver_name TEXT,
    driver      REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, driver_name)
);
INSERT INTO "driver" VALUES('IT',2006,'PAGR',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PAGR',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PAGR',1.002,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PAGR',0.875,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PAGR',0.880,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PAGR',0.864,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PAGR',0.858,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PAGR',0.872,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PAGR',0.886,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PAGR',0.900,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PAGR',0.914,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PAGR',0.936,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PAGR',0.973,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PAGR',1.012,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PAGR',1.051,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PAGR',1.094,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PSER',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PSER',1.014,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PSER',1.013,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PSER',1.003,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PSER',0.992,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PSER',0.989,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PSER',1.008,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PSER',1.028,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PSER',0.994,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PSER',1.047,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PSER',1.095,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PSER',1.135,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PSER',1.159,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PSER',1.182,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PSER',1.231,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PSER',1.280,NULL,'');

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
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','AGR_FT_NGA',2006,'AGR_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','AGR_FT_NGA',2006,'AGR_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','AGR_FT_NGA',2006,'AGR_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','AGR_FT_NGA',2020,'AGR_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','AGR_FT_DST',2006,'AGR_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','AGR_FT_DST',2006,'AGR_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','AGR_FT_GSL',2006,'AGR_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','AGR_FT_GSL',2006,'AGR_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','AGR_FT_LPG',2006,'AGR_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','AGR_FT_BIO',2006,'AGR_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_LIQ','AGR_FT_BIO',2006,'AGR_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GEO','AGR_FT_GEO',2006,'AGR_GEO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SOL','AGR_FT_SOL',2006,'AGR_SOL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','AGR_FT_ELC',2006,'AGR_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','AGR_FT_ELC',2006,'AGR_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','AGR_FT_ELC',2050,'AGR_ELC',0.95,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','AGR_FT_ELC',2050,'AGR_ELC',0.95,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','AGR_FT_HET',2006,'AGR_HET',0.909,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_NGA','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_DST','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GSL','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_LPG','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_BIO','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_ELC','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_HET','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GEO','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_SOL','AGR_TECH',2006,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_NGA','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_DST','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GSL','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_LPG','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_BIO','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_ELC','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_HET','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GEO','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_SOL','AGR_TECH',2020,'AGR_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_NGA','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_DST','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GSL','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_LPG','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_BIO','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_ELC','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_HET','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GEO','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_SOL','AGR_TECH',2022,'AGR_DEM',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_NGA','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_DST','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GSL','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_LPG','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_BIO','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_ELC','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_HET','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_GEO','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','AGR_SOL','AGR_TECH',2050,'AGR_DEM',1.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','COM_FT_NGA',2006,'COM_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','COM_FT_NGA',2006,'COM_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','COM_FT_NGA',2006,'COM_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','COM_FT_NGA',2020,'COM_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','COM_FT_DST',2006,'COM_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','COM_FT_DST',2006,'COM_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','COM_FT_DST',2006,'COM_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','COM_FT_DST',2006,'COM_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_DST1','COM_FT_DST',2006,'COM_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','COM_FT_LPG',2006,'COM_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','COM_FT_ELC',2006,'COM_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','COM_FT_ELC',2006,'COM_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','COM_FT_BIO',2006,'COM_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GEO','COM_FT_GEO',2006,'COM_GEO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SOL','COM_FT_SOL',2006,'COM_SOL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','COM_FT_HET',2006,'COM_HET',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_HT_NGA_E',2006,'COM_SH',0.700,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_HP_NGA_E',2006,'COM_SH',1.900,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_HT_DST_E',2006,'COM_SH',0.700,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_HT_LPG_E',2006,'COM_SH',0.600,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_SH_HT_BIO_E',2006,'COM_SH',0.250,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_RES_ELC_E',2006,'COM_SH',0.900,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_ELC_E',2006,'COM_SH',2.000,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_SH_HEX_HET_E',2006,'COM_SH',0.900,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_GEO','COM_SH_HEX_GEO_E',2006,'COM_SH',0.900,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SC_ABS_NGA_E',2006,'COM_SC',1.200,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SC_CHL_DST_E',2006,'COM_SC',0.840,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_CCL_ELC_CNT_E',2006,'COM_SC',3.600,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_AHP_ELC_E',2006,'COM_SC',3.720,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ROOM_ELC_E',2006,'COM_SC',3.600,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ROOF_ELC_E',2006,'COM_SC',3.720,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_WH_NGA_E',2006,'COM_WH',0.650,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_WH_DST_E',2006,'COM_WH',0.650,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_LPG_E',2006,'COM_WH',0.600,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_WH_ELC_E',2006,'COM_WH',0.910,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_WH_HET_E',2006,'COM_WH',1.000,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_INC_E',2006,'COM_LG',1.170,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SHAL_E',2006,'COM_LG',1.596,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_IRCHAL_E',2006,'COM_LG',2.087,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SFL_E',2006,'COM_LG',5.632,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_LFL_E',2006,'COM_LG',6.981,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_CFL_C_E',2006,'COM_LG',5.927,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_MER_E',2006,'COM_LG',3.200,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SOD_E',2006,'COM_LG',8.000,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_CK_NGA_E',2006,'COM_CK',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_CK_LPG_E',2006,'COM_CK',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_CK_BIO_E',2006,'COM_CK',0.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_CK_ELC_E',2006,'COM_CK',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_RF_RFR_ELC_E',2006,'COM_RF',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_OE_OFF_ELC_E',2006,'COM_OE',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_INC_N',2007,'COM_LG',1.17,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SHAL_STD_N',2007,'COM_LG',1.60,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_HAL_IMP_N',2007,'COM_LG',2.09,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SFL_N',2007,'COM_LG',5.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_LFL_N',2007,'COM_LG',7.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_CFL_N',2007,'COM_LG',5.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_KER_N',2007,'COM_LG',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_MER_N',2007,'COM_LG',3.20,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_LG_SOD_N',2007,'COM_LG',8.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_WH_DST_N',2007,'COM_WH',0.81,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_WH_COND_DST_N',2007,'COM_WH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_WH_COND_DST_N',2020,'COM_WH',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_WH_COND_DST_N',2050,'COM_WH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_WH_NGA_N',2007,'COM_WH',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_WH_COND_NGA_N',2007,'COM_WH',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_WH_COND_NGA_N',2020,'COM_WH',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_WH_COND_NGA_N',2050,'COM_WH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_LPG_N',2007,'COM_WH',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_LPG_N',2020,'COM_WH',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_LPG_N',2050,'COM_WH',0.74,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_COND_LPG_N',2007,'COM_WH',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_COND_LPG_N',2020,'COM_WH',0.84,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_WH_COND_LPG_N',2050,'COM_WH',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_WH_WPEL_BIO_N',2007,'COM_WH',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_WH_WPEL_BIO_N',2020,'COM_WH',0.78,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_WH_WPEL_BIO_N',2050,'COM_WH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_WH_ELC_N',2007,'COM_WH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_WH_AHP_ELC_N',2007,'COM_WH',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_WH_AHP_ELC_N',2020,'COM_WH',3.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_WH_AHP_ELC_N',2050,'COM_WH',3.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_WH_HEX_HET_N',2007,'COM_WH',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_WH_HEX_HET_N',2020,'COM_WH',0.89,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_WH_HEX_HET_N',2050,'COM_WH',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_WH_SOL_N',2007,'COM_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_WH_SOL_N',2020,'COM_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_WH_SOL_N',2050,'COM_WH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_DST_N',2007,'COM_SH',0.81,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_COND_DST_N',2007,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_COND_DST_N',2020,'COM_SH',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_COND_DST_N',2050,'COM_SH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_NGA_N',2007,'COM_SH',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_NGA_N',2020,'COM_SH',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_COND_NGA_N',2007,'COM_SH',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_COND_NGA_N',2020,'COM_SH',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_COND_NGA_N',2050,'COM_SH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_LPG_N',2007,'COM_SH',0.81,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_LPG_N',2050,'COM_SH',0.81,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_COND_LPG_N',2007,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_COND_LPG_N',2020,'COM_SH',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_COND_LPG_N',2050,'COM_SH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_SH_HEX_HET_N',2007,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_SH_HEX_HET_N',2020,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_HET','COM_SH_HEX_HET_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_AIR_N',2007,'COM_SH',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_AIR_N',2020,'COM_SH',3.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_AIR_N',2050,'COM_SH',4.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_PRB_N',2007,'COM_SH',4.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_PRB_N',2020,'COM_SH',4.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_PRB_N',2050,'COM_SH',5.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SH',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2007,'COM_WH',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SC',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SH',3.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2020,'COM_WH',3.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SC',3.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SH',4.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2050,'COM_WH',4.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SC',4.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_SH',3.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_WH',3.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_SC',3.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_SH',4.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_WH',4.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_SC',4.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_SH',4.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_WH',4.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_SC',4.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_DST_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_DST_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_DST_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_DST_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SH_DST_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_DST_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_LPG_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_LPG_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_LPG_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_LPG_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_SH_LPG_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_LPG_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_NGA_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_NGA_SOL_N',2007,'COM_SH',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_NGA_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_NGA_SOL_N',2020,'COM_SH',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SH_NGA_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_SOL','COM_SH_NGA_SOL_N',2050,'COM_SH',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_SH_WPEL_N',2007,'COM_SH',0.76,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_SH_WPEL_N',2020,'COM_SH',0.79,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_SH_WPEL_N',2050,'COM_SH',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SC_DST_STD_N',2007,'COM_SC',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_SC_DST_N',2016,'COM_SC',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_HP_STD_N',2007,'COM_SC',2.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_HP_IMP_N',2007,'COM_SC',5.28,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ROOF_STD_N',2007,'COM_SC',3.10,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ELC_GEO_IMP_N',2007,'COM_SC',3.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ELC_GEO_ADV_N',2010,'COM_SC',6.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ROOF_ADV_N',2007,'COM_SC',3.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_REC_N',2007,'COM_SC',3.60,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_REC_IMP_N',2010,'COM_SC',3.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_CNF_N',2007,'COM_SC',6.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_CNF_IMP_N',2016,'COM_SC',7.30,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_CNT_N',2007,'COM_SC',3.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_SC_ROOM_N',2007,'COM_SC',3.43,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_GEO','COM_SC_GEO_IMP_N',2007,'COM_SC',4.20,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SC_ABS_NGA_N',2007,'COM_SC',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SC_NGA_STD_N',2007,'COM_SC',2.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_SC_NGA_IMP_N',2010,'COM_SC',2.20,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_NGA','COM_CK_NGA_N',2007,'COM_CK',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_LPG','COM_CK_LPG_N',2007,'COM_CK',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_DST','COM_CK_DST_N',2007,'COM_CK',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_CK_ELC_N',2007,'COM_CK',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_BIO','COM_CK_BIO_N',2007,'COM_CK',0.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_OE_OFF_ELC_STD_N',2007,'COM_OE',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_OE_OFF_ELC_IMP_N',2007,'COM_OE',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_OE_OFF_ADV_N',2010,'COM_OE',1.10,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_RF_STD_N',2007,'COM_RF',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_RF_IMP_N',2007,'COM_RF',1.20,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COM_ELC','COM_RF_N',2010,'COM_RF',1.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'COM_HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'COM_HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'COM_HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'COM_HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'COM_HET',0.520,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'COM_HET',0.510,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'COM_HET',0.500,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'COM_HET',0.480,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'COM_HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'COM_HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'COM_HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'COM_HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'ELC_DST',0.350,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'COM_HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'ELC_DST',0.360,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'COM_HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'COM_HET',0.412,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'ELC_DST',0.390,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'COM_HET',0.402,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'COM_HET',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'COM_HET',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'COM_HET',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TIT',2007,'TIT',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_YTT',2007,'YTT',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_ZIR',2007,'ZIR',1.00,'t/(ethos)','');

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
INSERT INTO "elasticity" VALUES('IT',2007,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'AGR_DEM',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'AGR_DEM',0.40,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'AGR_DEM',0.40,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'AGR_DEM',0.40,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'AGR_DEM',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'AGR_DEM',0.30,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'AGR_DEM',0.30,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'AGR_DEM',0.30,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_SC',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_SC',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_SC',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_SC',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_SC',-1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_SC',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_SC',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_SC',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_SC',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_SC',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_SC',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_SC',0.44,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_SC',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_SC',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_SC',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_CK',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_CK',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_CK',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_CK',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_CK',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_CK',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_CK',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_CK',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_CK',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_CK',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_CK',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_CK',0.31,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_CK',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_CK',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_CK',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_SH',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_SH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_SH',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_SH',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_SH',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_SH',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_SH',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_SH',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_SH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_SH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_SH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_SH',0.44,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_SH',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_SH',0.31,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_SH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_WH',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_WH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_WH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_WH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_WH',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_WH',1.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_WH',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_WH',1.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_WH',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_WH',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_WH',0.38,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_WH',0.31,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_WH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_WH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_WH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_LG',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_LG',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_LG',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_LG',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_LG',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_LG',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_LG',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_LG',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_LG',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_LG',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_LG',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_LG',0.43,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_LG',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_LG',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_LG',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_OE',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_OE',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_OE',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_OE',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_OE',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_OE',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_OE',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_OE',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_OE',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_OE',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_OE',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_OE',0.43,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_OE',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_OE',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_OE',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'COM_RF',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'COM_RF',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'COM_RF',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'COM_RF',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'COM_RF',-2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'COM_RF',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'COM_RF',2.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'COM_RF',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'COM_RF',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'COM_RF',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'COM_RF',0.50,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'COM_RF',0.43,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'COM_RF',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'COM_RF',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'COM_RF',0.35,NULL,NULL);

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
INSERT INTO "emission_activity" VALUES('IT','AGR_CO2','BIO_METH','AGR_FT_NGA',2006,'AGR_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','AGR_CO2','H2_BL','AGR_FT_NGA',2020,'AGR_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','COM_CO2','BIO_METH','COM_FT_NGA',2007,'COM_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','COM_CO2','H2_BL','COM_FT_NGA',2020,'COM_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','COM_CO2','BIO_DST1','COM_FT_DST',2007,'COM_DST',-74.07,'kt/(PJ)','');

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
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_NGA',2006,6.22,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_DST',2006,104.45,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_GSL',2006,0.66,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_LPG',2006,3.08,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_BIO',2006,0.03,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_GEO',2006,3.29,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_SOL',2006,0.01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_HET',2006,0.09,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','AGR_FT_ELC',2006,19.82,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_NGA',2006,328.05,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_DST',2006,19.87,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_LPG',2006,26.49,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_BIO',2006,0.43,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_GEO',2006,5.69,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_SOL',2006,0.32,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_HET',2006,9.45,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_FT_ELC',2006,350.00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HT_NGA_E',2006,6.546E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HP_NGA_E',2006,1.777E-01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HT_DST_E',2006,3.695E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HT_LPG_E',2006,3.449E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HT_BIO_E',2006,3.286E-01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_RES_ELC_E',2006,1.583E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HP_ELC_E',2006,1.055E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HEX_HET_E',2006,8.562E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SH_HEX_GEO_E',2006,1.660E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_ABS_NGA_E',2006,1.471E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_CHL_DST_E',2006,9.982E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_CCL_ELC_CNT_E',2006,5.341E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_AHP_ELC_E',2006,3.333E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_ROOM_ELC_E',2006,1.106E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_SC_ROOF_ELC_E',2006,3.448E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_WH_NGA_E',2006,6.217E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_WH_DST_E',2006,1.255E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_WH_LPG_E',2006,3.861E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_WH_ELC_E',2006,1.152E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_WH_HET_E',2006,4.892E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_INC_E',2006,2.963E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_SHAL_E',2006,1.347E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_IRCHAL_E',2006,1.761E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_SFL_E',2006,1.783E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_LFL_E',2006,2.210E+02,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_CFL_C_E',2006,4.502E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_MER_E',2006,2.701E+01,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_LG_SOD_E',2006,6.752E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_CK_NGA_E',2006,6.376E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_CK_LPG_E',2006,1.030E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_CK_BIO_E',2006,3.775E-03,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_CK_ELC_E',2006,1.575E+00,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','COM_RF_RFR_ELC_E',2006,1.407E+02,'PJ','');

CREATE TABLE lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,12,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_MICRO_N',2014,13,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_MICRO_N',2022,16,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_MICRO_N',2030,20,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_CC_N',2007,15,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_CC_N',2014,18,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_CC_N',2022,20,'year','');
INSERT INTO "lifetime_process" VALUES('IT','COM_CHP_NGA_CC_N',2030,20,'year','');

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
INSERT INTO "lifetime_tech" VALUES('IT','AGR_FT_HET',100,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HT_NGA_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HP_NGA_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HT_DST_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HT_LPG_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HT_BIO_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_RES_ELC_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HP_ELC_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HEX_HET_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HEX_GEO_E',50,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ABS_NGA_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_CHL_DST_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_CCL_ELC_CNT_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_AHP_ELC_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ROOM_ELC_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ROOF_ELC_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_NGA_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_DST_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_LPG_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_ELC_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_HET_E',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_INC_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SHAL_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_IRCHAL_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SFL_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_LFL_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_CFL_C_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_MER_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SOD_E',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_NGA_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_LPG_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_BIO_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_ELC_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_RF_RFR_ELC_E',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_OE_OFF_ELC_E',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_INC_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SHAL_STD_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_HAL_IMP_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SFL_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_LFL_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_CFL_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_KER_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_MER_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_LG_SOD_N',5,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_DST_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_COND_DST_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_NGA_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_COND_NGA_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_LPG_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_COND_LPG_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_WPEL_BIO_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_ELC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_AHP_ELC_N',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_HEX_HET_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_WH_SOL_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_DST_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_COND_DST_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_NGA_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_COND_NGA_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_LPG_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_COND_LPG_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HEX_HET_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HP_AIR_N',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HP_PRB_N',50,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_HP_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_GEO_N',50,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_DST_SOL_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_LPG_SOL_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_NGA_SOL_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SH_WPEL_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_DST_STD_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_DST_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_HP_STD_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_HP_IMP_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ROOF_STD_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ELC_GEO_IMP_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ELC_GEO_ADV_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ROOF_ADV_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_REC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_REC_IMP_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_CNF_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_CNF_IMP_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_CNT_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ROOM_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_GEO_IMP_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_ABS_NGA_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_NGA_STD_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_SC_NGA_IMP_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_NGA_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_LPG_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_DST_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_ELC_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CK_BIO_N',17,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_OE_OFF_ELC_STD_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_OE_OFF_ELC_IMP_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_OE_OFF_ADV_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_RF_STD_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_RF_IMP_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_RF_N',10,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_NGA_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_SLB_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_NGA_SOFC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_H2_PEMFC_N',20,'year','');

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
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_ELC','ge',292.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_ELC','ge',306.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_ELC','ge',308.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_ELC','ge',316.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_ELC','ge',314.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_ELC','ge',257.39,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'COM_FT_ELC','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_LPG','ge',22.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_LPG','ge',17.81,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_LPG','ge',16.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_LPG','ge',17.40,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_LPG','ge',17.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_LPG','ge',17.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'COM_FT_LPG','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_NGA','ge',324.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_NGA','ge',289.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_NGA','ge',248.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_NGA','ge',261.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_NGA','ge',285.39,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_NGA','ge',266.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'COM_FT_NGA','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_NGA_E','ge',1.767E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HP_NGA_E','ge',4.798E-02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_DST_E','ge',9.976E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_LPG_E','ge',9.313E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_BIO_E','ge',8.871E-02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_RES_ELC_E','ge',4.273E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HP_ELC_E','ge',2.849E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HEX_HET_E','ge',2.312E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HEX_GEO_E','ge',4.483E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_NGA_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HP_NGA_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_DST_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_LPG_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_BIO_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_RES_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HP_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HEX_HET_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HEX_GEO_E','ge',4.483E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ABS_NGA_E','ge',1.722E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_CHL_DST_E','ge',1.168E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_CCL_ELC_CNT_E','ge',6.249E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_AHP_ELC_E','ge',3.900E-01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ROOM_ELC_E','ge',1.294E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ROOF_ELC_E','ge',4.035E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_ABS_NGA_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_CHL_DST_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_CCL_ELC_CNT_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_AHP_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_ROOM_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_SC_ROOF_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_NGA_E','ge',5.595E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_DST_E','ge',1.130E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_LPG_E','ge',3.457E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_ELC_E','ge',1.037E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_HET_E','ge',1.101E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_WH_NGA_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_WH_DST_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_WH_LPG_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_WH_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_WH_HET_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_INC_E','ge',2.667E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SHAL_E','ge',1.212E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_IRCHAL_E','ge',1.585E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SFL_E','ge',1.604E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_LFL_E','ge',1.989E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_CFL_C_E','ge',4.052E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_MER_E','ge',2.431E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SOD_E','ge',6.077E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_INC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SHAL_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_IRCHAL_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SFL_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_LFL_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_CFL_C_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_MER_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SOD_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_NGA_E','ge',5.739E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_LPG_E','ge',9.266E-01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_BIO_E','ge',3.397E-03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_ELC_E','ge',1.418E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_CK_NGA_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_CK_LPG_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_CK_BIO_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_CK_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_RF_RFR_ELC_E','ge',1.772E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_RF_RFR_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_OE_OFF_ELC_E','ge',9.520E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_OE_OFF_ELC_E','ge',0.0E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'AGR_FT_GEO','le',3.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'AGR_FT_GEO','le',7.30,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'AGR_FT_SOL','le',0.05,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'AGR_FT_SOL','le',0.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_BIO','le',2.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_BIO','le',0.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_BIO','le',2.33,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_BIO','le',3.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_BIO','le',3.89,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_BIO','le',3.92,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_BIO','le',4.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_BIO','le',100.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_DST','le',21.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_DST','le',14.81,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_DST','le',12.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_DST','le',10.94,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_DST','le',8.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_DST','le',6.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_DST','le',4.97,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_DST','le',99.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_ELC','le',323.61,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_ELC','le',338.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_ELC','le',341.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_ELC','le',350.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_ELC','le',347.20,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_ELC','le',284.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_GEO','le',6.69,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_GEO','le',5.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_GEO','le',5.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_GEO','le',5.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_GEO','le',5.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_GEO','le',5.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_GEO','le',5.05,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_GEO','le',56.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_HET','le',10.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_HET','le',37.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_LPG','le',27.36,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_LPG','le',25.12,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_LPG','le',19.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_LPG','le',18.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_LPG','le',19.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_LPG','le',18.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_LPG','le',19.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_LPG','le',100.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_NGA','le',348.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_NGA','le',358.70,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_NGA','le',319.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_NGA','le',275.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_NGA','le',315.43,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_NGA','le',294.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_NGA','le',1640.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_FT_SOL','le',4.13,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'COM_FT_SOL','le',1.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'COM_FT_SOL','le',1.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'COM_FT_SOL','le',1.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_FT_SOL','le',1.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'COM_FT_SOL','le',1.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_FT_SOL','le',1.90,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'COM_FT_SOL','le',167.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_NGA_E','le',6.201E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HP_NGA_E','le',1.683E-01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_DST_E','le',3.500E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_LPG_E','le',3.268E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HT_BIO_E','le',3.113E-01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_RES_ELC_E','le',1.499E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HP_ELC_E','le',9.995E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HEX_HET_E','le',8.111E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SH_HEX_GEO_E','le',1.660E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ABS_NGA_E','le',1.394E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_CHL_DST_E','le',9.457E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_CCL_ELC_CNT_E','le',5.060E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_AHP_ELC_E','le',3.158E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ROOM_ELC_E','le',1.048E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_SC_ROOF_ELC_E','le',3.267E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_NGA_E','le',5.773E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_DST_E','le',1.166E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_LPG_E','le',3.585E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_ELC_E','le',1.070E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_WH_HET_E','le',4.543E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_INC_E','le',2.667E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SHAL_E','le',1.212E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_IRCHAL_E','le',1.585E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SFL_E','le',1.604E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_LFL_E','le',1.989E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_CFL_C_E','le',4.052E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_MER_E','le',2.431E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_LG_SOD_E','le',6.077E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_NGA_E','le',5.921E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_LPG_E','le',9.560E-01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_BIO_E','le',3.505E-03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_CK_ELC_E','le',1.463E+00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_RF_RFR_ELC_E','le',1.306E+02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'COM_OE_OFF_ELC_E','le',9.823E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HP_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HT_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_RES_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HP_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HEX_HET_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SH_HEX_GEO_E','le',1.660E+01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_ABS_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_CHL_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_CCL_ELC_CNT_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_AHP_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_ROOM_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'COM_SC_ROOF_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_WH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_WH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_WH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_WH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_WH_HET_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_INC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SHAL_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_IRCHAL_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SFL_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_LFL_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_CFL_C_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_MER_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'COM_LG_SOD_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_CK_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_CK_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_CK_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_RF_RFR_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'COM_OE_OFF_ELC_E','le',0.0,'PJ','');

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
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_SH_ELC_GRP','COM_SH_GRP','ge',0.02,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'COM_SH_ELC_GRP','COM_SH_GRP','ge',0.12,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_SH_ELC_GRP','COM_SH_GRP','ge',0.12,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_SH_NGA_GRP','COM_SH_GRP','le',0.91,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_SH_NGA_GRP','COM_SH_GRP','le',0.92,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_SH_HET_GRP','COM_SH_GRP','le',0.05,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_SH_HET_GRP','COM_SH_GRP','le',0.15,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_SH_BIO_GRP','COM_SH_GRP','le',0.01,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_SH_BIO_GRP','COM_SH_GRP','le',0.05,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_WH_ELC_GRP','COM_WH_GRP','ge',0.30,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_WH_ELC_GRP','COM_WH_GRP','ge',0.28,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'COM_WH_HET_GRP','COM_WH_GRP','le',0.05,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'COM_WH_HET_GRP','COM_WH_GRP','le',0.15,'');

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
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_H2_PEMFC_N',2025,'COM_HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_H2_PEMFC_N',2025,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CC_N',2007,'COM_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CC_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CI_N',2007,'COM_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,'COM_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_SOFC_N',2020,'COM_HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_SOFC_N',2020,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_SLB_CI_N',2007,'COM_HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_SLB_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_RF_IMP_N',2007,'COM_RF','le',0.14,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_RF_N',2010,'COM_RF','le',0.14,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_RF_RFR_ELC_E',2006,'COM_RF','le',0.14,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_RF_STD_N',2007,'COM_RF','le',0.14,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ABS_NGA_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ABS_NGA_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_AHP_ELC_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_CCL_ELC_CNT_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_CHL_DST_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_CNF_IMP_N',2016,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_CNF_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_CNT_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_DST_N',2016,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_DST_STD_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ELC_GEO_ADV_N',2010,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ELC_GEO_IMP_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_GEO_IMP_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_HP_IMP_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_HP_STD_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_NGA_IMP_N',2010,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_NGA_STD_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_REC_IMP_N',2010,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_REC_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ROOF_ADV_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ROOF_ELC_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ROOF_STD_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ROOM_ELC_E',2006,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SC_ROOM_N',2007,'COM_SC','le',0.13,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_COND_DST_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_COND_LPG_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_COND_NGA_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_DST_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_DST_SOL_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_GEO_N',2007,'COM_SC','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_GEO_N',2007,'COM_SH','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_GEO_N',2007,'COM_WH','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HEX_GEO_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HEX_HET_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HEX_HET_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_AIR_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_ELC_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_N',2007,'COM_SC','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_N',2007,'COM_SH','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_N',2007,'COM_WH','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_NGA_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HP_PRB_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HT_DST_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HT_LPG_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_HT_NGA_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_LPG_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_LPG_SOL_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_NGA_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_NGA_SOL_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_RES_ELC_E',2006,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_SH_WPEL_N',2007,'COM_SH','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_AHP_ELC_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_COND_DST_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_COND_LPG_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_COND_NGA_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_DST_E',2006,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_DST_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_ELC_E',2006,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_ELC_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_HET_E',2006,'COM_WH','le',0.25,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_HEX_HET_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_LPG_E',2006,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_LPG_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_NGA_E',2006,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_NGA_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_SOL_N',2007,'COM_WH','le',0.10,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_WH_WPEL_BIO_N',2007,'COM_WH','le',0.10,'');

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
INSERT INTO "limit_capacity" VALUES('IT',2007,'COM_SH_HEX_HET_N','le',3.20,'PJ','');
INSERT INTO "limit_capacity" VALUES('IT',2050,'COM_SH_HEX_HET_N','le',23.27,'PJ','');

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
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_CEN','AGR_FT_ELC','ge',0.70,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','AGR_FT_ELC','ge',0.35,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_DST','COM_SH_DST_SOL_N','ge',0.40,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_SOL','COM_SH_DST_SOL_N','ge',0.60,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_LPG','COM_SH_LPG_SOL_N','ge',0.40,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_SOL','COM_SH_LPG_SOL_N','ge',0.60,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_NGA','COM_SH_NGA_SOL_N','ge',0.40,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'COM_SOL','COM_SH_NGA_SOL_N','ge',0.60,'');

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
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','AGR_FT_BIO','ge',1.00,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_SLB','AGR_FT_BIO','ge',0.90,'');
--INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'COM_ELC','COM_CK_GRP','ge',0.15,'');
--INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'COM_ELC','COM_CK_GRP','ge',0.3,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_DST','AGR_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_DST','AGR_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_DST','AGR_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_DST','AGR_FT_DST','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_MET','AGR_FT_GSL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_MET','AGR_FT_GSL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_MET','AGR_FT_GSL','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_MET','AGR_FT_GSL','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','AGR_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','AGR_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','AGR_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','AGR_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','AGR_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','AGR_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','AGR_FT_NGA','le',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','AGR_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','AGR_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','AGR_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','AGR_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','AGR_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','AGR_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','AGR_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_NGA','AGR_TECH','le',0.0497,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_DST','AGR_TECH','le',0.752,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_GSL','AGR_TECH','le',0.00434,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_LPG','AGR_TECH','le',0.0224,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_BIO','AGR_TECH','le',0.000197,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_ELC','AGR_TECH','le',0.155,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_HET','AGR_TECH','le',0.00109,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_GEO','AGR_TECH','le',0.025,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'AGR_SOL','AGR_TECH','le',0.000175,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_NGA','AGR_TECH','le',0.0448,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_DST','AGR_TECH','le',0.752,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_GSL','AGR_TECH','le',0.00447,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_LPG','AGR_TECH','le',0.0223,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_BIO','AGR_TECH','le',0.000203,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_ELC','AGR_TECH','le',0.16,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_HET','AGR_TECH','le',0.000305,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_GEO','AGR_TECH','le',0.0257,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2008,'AGR_SOL','AGR_TECH','le',0.000227,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_NGA','AGR_TECH','le',0.0465,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_DST','AGR_TECH','le',0.749,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_GSL','AGR_TECH','le',0.00366,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_LPG','AGR_TECH','le',0.0225,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_BIO','AGR_TECH','le',0.000478,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_ELC','AGR_TECH','le',0.166,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_HET','AGR_TECH','le',0.00263,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_GEO','AGR_TECH','le',0.019,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'AGR_SOL','AGR_TECH','le',0.000408,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_NGA','AGR_TECH','le',0.0463,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_DST','AGR_TECH','le',0.738,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_GSL','AGR_TECH','le',0.00341,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_LPG','AGR_TECH','le',0.021,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_BIO','AGR_TECH','le',0.000611,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_ELC','AGR_TECH','le',0.18,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_HET','AGR_TECH','le',0.00644,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_GEO','AGR_TECH','le',0.0137,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'AGR_SOL','AGR_TECH','le',0.000581,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_NGA','AGR_TECH','le',0.0466,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_DST','AGR_TECH','le',0.741,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_GSL','AGR_TECH','le',0.00321,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_LPG','AGR_TECH','le',0.0193,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_BIO','AGR_TECH','le',0.00997,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_ELC','AGR_TECH','le',0.171,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_HET','AGR_TECH','le',0.00573,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_GEO','AGR_TECH','le',0.0125,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'AGR_SOL','AGR_TECH','le',0.000664,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_NGA','AGR_TECH','le',0.0464,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_DST','AGR_TECH','le',0.748,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_GSL','AGR_TECH','le',0.0011,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_LPG','AGR_TECH','le',0.00767,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_BIO','AGR_TECH','le',0.0122,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_ELC','AGR_TECH','le',0.173,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_HET','AGR_TECH','le',0.00372,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_GEO','AGR_TECH','le',0.0163,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'AGR_SOL','AGR_TECH','le',0.000714,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_NGA','AGR_TECH','le',0.0472,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_DST','AGR_TECH','le',0.748,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_GSL','AGR_TECH','le',0.00107,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_LPG','AGR_TECH','le',0.00772,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_BIO','AGR_TECH','le',0.0116,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_ELC','AGR_TECH','le',0.173,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_HET','AGR_TECH','le',0.00414,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_GEO','AGR_TECH','le',0.0164,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2018,'AGR_SOL','AGR_TECH','le',0.000756,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_NGA','AGR_TECH','le',0.0464,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_DST','AGR_TECH','le',0.736,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_GSL','AGR_TECH','le',0.00108,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_LPG','AGR_TECH','le',0.00858,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_BIO','AGR_TECH','le',0.0118,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_ELC','AGR_TECH','le',0.185,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_HET','AGR_TECH','le',0.00492,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_GEO','AGR_TECH','le',0.0151,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'AGR_SOL','AGR_TECH','le',0.000862,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_NGA','AGR_TECH','le',0.0482,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_DST','AGR_TECH','le',0.766,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_GSL','AGR_TECH','le',0.00112,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_LPG','AGR_TECH','le',0.00893,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_BIO','AGR_TECH','le',0.0123,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_ELC','AGR_TECH','le',0.193,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_HET','AGR_TECH','le',0.00512,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_GEO','AGR_TECH','le',0.0157,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2022,'AGR_SOL','AGR_TECH','le',0.000897,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_NGA','AGR_TECH','le',0.0505,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_DST','AGR_TECH','le',0.803,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_GSL','AGR_TECH','le',0.00117,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_LPG','AGR_TECH','le',0.00936,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_BIO','AGR_TECH','le',0.0129,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_ELC','AGR_TECH','le',0.202,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_HET','AGR_TECH','le',0.00536,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_GEO','AGR_TECH','le',0.0165,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'AGR_SOL','AGR_TECH','le',0.000939,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_NGA','AGR_TECH','le',0.0551,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_DST','AGR_TECH','le',0.876,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_GSL','AGR_TECH','le',0.00128,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_LPG','AGR_TECH','le',0.0102,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_BIO','AGR_TECH','le',0.0141,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_ELC','AGR_TECH','le',0.22,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_HET','AGR_TECH','le',0.00585,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_GEO','AGR_TECH','le',0.018,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'AGR_SOL','AGR_TECH','le',0.00102,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_DST','COM_FT_DST','le',0.94,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_DST','COM_FT_DST','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_GSL','COM_FT_DST','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_GSL','COM_FT_DST','le',0.16,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_NSP','COM_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_NSP','COM_FT_DST','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_DST','COM_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_DST','COM_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_DST','COM_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_DST','COM_FT_DST','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_DST1','COM_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_DST1','COM_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','COM_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','COM_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','COM_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','COM_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','COM_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','COM_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','COM_FT_NGA','le',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','COM_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','COM_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','COM_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','COM_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','COM_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','COM_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','COM_FT_NGA','le',0.06,'');

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
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_HP_N','COM_SH','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_HP_N','COM_WH','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_HP_N','COM_SC','ge',0.30,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_HP_N','COM_SH','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_HP_N','COM_WH','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_HP_N','COM_SC','ge',0.30,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_HP_N','COM_SH','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_HP_N','COM_WH','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_HP_N','COM_SC','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_GEO_N','COM_SH','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_GEO_N','COM_WH','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_SH_GEO_N','COM_SC','ge',0.30,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_GEO_N','COM_SH','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_GEO_N','COM_WH','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_SH_GEO_N','COM_SC','ge',0.30,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_GEO_N','COM_SH','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_GEO_N','COM_WH','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_SH_GEO_N','COM_SC','ge',0.00,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.375E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CI_N','COM_HET','ge',5.625E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.545E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CI_N','COM_HET','ge',5.455E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.767E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CI_N','COM_HET','ge',5.233E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CI_N','ELC_DST','ge',5.102E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CI_N','COM_HET','ge',4.898E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',3.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N','COM_HET','ge',6.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',3.780E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_MICRO_N','COM_HET','ge',6.220E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',4.186E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_MICRO_N','COM_HET','ge',5.814E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',4.783E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_MICRO_N','COM_HET','ge',5.217E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CC_N','COM_HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CC_N','COM_HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CC_N','COM_HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CC_N','COM_HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.375E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_SLB_CI_N','COM_HET','ge',5.625E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.545E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_SLB_CI_N','COM_HET','ge',5.455E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.767E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_SLB_CI_N','COM_HET','ge',5.233E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.926E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_SLB_CI_N','COM_HET','ge',5.074E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.762E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_CHP_SLB_CI_N','COM_HET','ge',5.238E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.65,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N','COM_HET','ge',0.35,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.69,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N','COM_HET','ge',0.31,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N','COM_HET','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N','ELC_DST','ge',0.54,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N','COM_HET','ge',0.46,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N','ELC_DST','ge',0.59,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N','COM_HET','ge',0.41,'');

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
INSERT INTO "tech_group" VALUES('COM_SH_GRP','');
INSERT INTO "tech_group" VALUES('COM_SH_ELC_GRP','');
INSERT INTO "tech_group" VALUES('COM_SH_NGA_GRP','');
INSERT INTO "tech_group" VALUES('COM_SH_HET_GRP','');
INSERT INTO "tech_group" VALUES('COM_SH_BIO_GRP','');
INSERT INTO "tech_group" VALUES('COM_WH_GRP','');
INSERT INTO "tech_group" VALUES('COM_WH_ELC_GRP','');
INSERT INTO "tech_group" VALUES('COM_WH_HET_GRP','');

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
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_COND_DST_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_COND_LPG_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_COND_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_DST_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_DST_SOL_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_GEO_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HEX_GEO_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HEX_HET_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HEX_HET_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HP_AIR_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HP_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HP_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HP_NGA_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HP_PRB_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HT_BIO_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_HT_NGA_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_NGA_SOL_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_RES_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_GRP','COM_SH_WPEL_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_NGA_GRP','COM_SH_COND_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_HET_GRP','COM_SH_HEX_HET_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_HET_GRP','COM_SH_HEX_HET_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_ELC_GRP','COM_SH_HP_AIR_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_ELC_GRP','COM_SH_HP_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_ELC_GRP','COM_SH_HP_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_NGA_GRP','COM_SH_HP_NGA_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_ELC_GRP','COM_SH_HP_PRB_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_BIO_GRP','COM_SH_HT_BIO_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_NGA_GRP','COM_SH_HT_NGA_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_NGA_GRP','COM_SH_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_NGA_GRP','COM_SH_NGA_SOL_N');
INSERT INTO "tech_group_member" VALUES('COM_SH_ELC_GRP','COM_SH_RES_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_SH_BIO_GRP','COM_SH_WPEL_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_AHP_ELC_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_COND_DST_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_COND_LPG_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_COND_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_DST_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_DST_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_ELC_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_HET_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_HEX_HET_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_LPG_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_LPG_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_NGA_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_NGA_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_SOL_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_GRP','COM_WH_WPEL_BIO_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_ELC_GRP','COM_WH_AHP_ELC_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_ELC_GRP','COM_WH_ELC_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_ELC_GRP','COM_WH_ELC_N');
INSERT INTO "tech_group_member" VALUES('COM_WH_HET_GRP','COM_WH_HET_E');
INSERT INTO "tech_group_member" VALUES('COM_WH_HET_GRP','COM_WH_HEX_HET_N');

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
