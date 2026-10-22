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
INSERT INTO "commodity" VALUES('ELC_BGS','a','Biogas','PJ');
INSERT INTO "commodity" VALUES('ELC_BLQ','a','Bioliquids','PJ');
INSERT INTO "commodity" VALUES('ELC_BMU','a','Municipal waste','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','a','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_COA','a','Coal','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','a','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('ELC_GASDER','a','Derived gas','PJ');
INSERT INTO "commodity" VALUES('ELC_GEO','a','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('ELC_H2','p','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('ELC_HHC','a','Heavy hydrocarbons','PJ');
INSERT INTO "commodity" VALUES('ELC_HYD','p','Hydroelectric energy','PJ');
INSERT INTO "commodity" VALUES('ELC_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('ELC_NUC','a','Nuclear fuel','PJ');
INSERT INTO "commodity" VALUES('ELC_OIL','a','Oil','PJ');
INSERT INTO "commodity" VALUES('ELC_SLB','a','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('ELC_SOL','p','Solar energy','PJ');
INSERT INTO "commodity" VALUES('ELC_WIN','p','Wind energy','PJ');
INSERT INTO "commodity" VALUES('HET','p','Heat','PJ');
INSERT INTO "commodity" VALUES('SNK_ELC_CO2','a','Power sector - Physical CO2 for storage/utilization','kt');
INSERT INTO "commodity" VALUES('ELC_CH4','e','Power sector - CH4 emission','t');
INSERT INTO "commodity" VALUES('ELC_CO2','e','Power sector - CO2 emission','kt');
INSERT INTO "commodity" VALUES('ELC_N2O','e','Power sector - N2O emission','t');
INSERT INTO "commodity" VALUES('ELC_DEM','d','Electricity Demand','PJ');
INSERT INTO "commodity" VALUES('HET_DEM','d','Heat Demand','PJ');
INSERT INTO "commodity" VALUES('SNK_CO2_CCS','e','Captured CO2 for storage/utilization - Emission','kt');
INSERT INTO "commodity" VALUES('ALU','a','Aluminum','t');
INSERT INTO "commodity" VALUES('BOR','a','Boron','t');
INSERT INTO "commodity" VALUES('CER','a','Cerium','t');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COB','a','Cobalt','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('DYS','a','Dysprosium','t');
INSERT INTO "commodity" VALUES('EUP','a','Europium','t');
INSERT INTO "commodity" VALUES('FLU','a','Fluospar','t');
INSERT INTO "commodity" VALUES('GAD','a','Gadolinium','t');
INSERT INTO "commodity" VALUES('GAL','a','Gallium','t');
INSERT INTO "commodity" VALUES('GER','a','Germanium','t');
INSERT INTO "commodity" VALUES('GRA','a','Graphite','t');
INSERT INTO "commodity" VALUES('IND','a','Indium','t');
INSERT INTO "commodity" VALUES('IRI','a','Iridium','t');
INSERT INTO "commodity" VALUES('LAN','a','Lanthanum','t');
INSERT INTO "commodity" VALUES('LIT','a','Lithium','t');
INSERT INTO "commodity" VALUES('MAG','a','Magnesium','t');
INSERT INTO "commodity" VALUES('MAN','a','Manganese','t');
INSERT INTO "commodity" VALUES('MOL','a','Molybdenum','t');
INSERT INTO "commodity" VALUES('NEO','a','Neodymium','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('NIO','a','Niobium','t');
INSERT INTO "commodity" VALUES('PAL','a','Palladium','t');
INSERT INTO "commodity" VALUES('PHO','a','Phosphorus','t');
INSERT INTO "commodity" VALUES('PLA','a','Platinum','t');
INSERT INTO "commodity" VALUES('PRA','a','Praseodymium','t');
INSERT INTO "commodity" VALUES('SIL','a','Silicon','t');
INSERT INTO "commodity" VALUES('SIV','a','Silver','t');
INSERT INTO "commodity" VALUES('TAN','a','Tantalum','t');
INSERT INTO "commodity" VALUES('TER','a','Terbium','t');
INSERT INTO "commodity" VALUES('TIT','a','Titanium','t');
INSERT INTO "commodity" VALUES('VAN','a','Vanadium','t');
INSERT INTO "commodity" VALUES('YTT','a','Yttrium','t');
INSERT INTO "commodity" VALUES('ZIR','a','Zirconium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('BIO_BIN','a','Industrial wastes','PJ');
INSERT INTO "commodity" VALUES('BIO_BMU','a','Municipal wastes','PJ');
INSERT INTO "commodity" VALUES('BIO_DST1','a','Bio diesel from 1st generation refinery','PJ');
INSERT INTO "commodity" VALUES('BIO_GAS','a','Biogas','PJ');
INSERT INTO "commodity" VALUES('BIO_METH','a','Biomethane','PJ');
INSERT INTO "commodity" VALUES('BIO_SLB','a','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('COA_HCO','a','Hard coal','PJ');
INSERT INTO "commodity" VALUES('COA_OVC','a','Coke oven coke','PJ');
INSERT INTO "commodity" VALUES('GAS_BFG','a','Blast furnace gas','PJ');
INSERT INTO "commodity" VALUES('GAS_COG','a','Coke oven gas','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_RFG','a','Refinery gas','PJ');
INSERT INTO "commodity" VALUES('GEO','a','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('H2','p','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('H2_EL','p','Hydrogen from electrolysis','PJ');
INSERT INTO "commodity" VALUES('H2_BL','p','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('HYD','p','Hydroelectric energy','PJ');
INSERT INTO "commodity" VALUES('NUC','a','Uranium U3O8 yellowcake','PJ');
INSERT INTO "commodity" VALUES('OIL_CRD','a','Crude oil','PJ');
INSERT INTO "commodity" VALUES('OIL_DST','a','Distillates','PJ');
INSERT INTO "commodity" VALUES('OIL_GSL','a','Gasoline','PJ');
INSERT INTO "commodity" VALUES('OIL_HFO','a','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('OIL_KER','a','Other kerosene','PJ');
INSERT INTO "commodity" VALUES('OIL_LPG','a','Liquid petroleum gas','PJ');
INSERT INTO "commodity" VALUES('OIL_NAP','a','Naphtha','PJ');
INSERT INTO "commodity" VALUES('OIL_NSP','a','Non specified oil','PJ');
INSERT INTO "commodity" VALUES('OIL_PTC','a','Petroleum coke','PJ');
INSERT INTO "commodity" VALUES('SOL','p','Solar energy','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','a','Synthetic natural gas','PJ');
INSERT INTO "commodity" VALUES('WIN','p','Wind energy','PJ');
INSERT INTO "commodity" VALUES('DMY_OUT','d','Dummy output commodity','DMY_OUT');

CREATE TABLE allocation (
    demand_comm TEXT REFERENCES commodity(name),
    driver_name TEXT,
    notes       TEXT,
    PRIMARY KEY(demand_comm, driver_name)
);
INSERT INTO "allocation" VALUES('DMY_OUT','GDP','');

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
INSERT INTO "technology" VALUES('COM_CHP_NGA_CI_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_NGA_MICRO_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Cogeneration microturbine - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_NGA_CC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Combined cycle - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_SLB_CI_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Internal combustion engine - Solid biomass');
INSERT INTO "technology" VALUES('COM_CHP_NGA_SOFC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - Solid oxide fuel cell - Natural gas');
INSERT INTO "technology" VALUES('COM_CHP_H2_PEMFC_N','p','COM','',NULL,0,0,1,0,0,0,0,0,'mCHP - Commercial - PEM fuel cell - Hydrogen');
INSERT INTO "technology" VALUES('IND_CHP_NGA_CI_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_NGA_TG_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Simple cycle gas turbine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_NGA_TV_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Steam turbine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_BLQ_CI_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Internal combustion engine - Bioliquid');
INSERT INTO "technology" VALUES('RES_CHP_NGA_CI_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_MICRO_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Cogenerative microturbine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_CC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Combined cycle - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_STR_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Stirling engine - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_NGA_SOFC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Solid oxide fuel cell - Natural gas');
INSERT INTO "technology" VALUES('RES_CHP_H2_PEMFC_N','p','RES','',NULL,0,0,1,0,0,0,0,0,'mCHP - Residential - Solid oxide fuel cell - Hydrogen');
INSERT INTO "technology" VALUES('ELC_FT_BGS','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Biogas');
INSERT INTO "technology" VALUES('ELC_FT_BLQ','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Bioliquids');
INSERT INTO "technology" VALUES('ELC_FT_BMU','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Municipal waste');
INSERT INTO "technology" VALUES('ELC_FT_COA','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Coal');
INSERT INTO "technology" VALUES('ELC_FT_DERGAS','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Derived gas');
INSERT INTO "technology" VALUES('ELC_FT_GEO','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Geothermal');
INSERT INTO "technology" VALUES('ELC_FT_HHC','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Heavy hydrocarbons');
INSERT INTO "technology" VALUES('ELC_FT_HYD','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydroelectric');
INSERT INTO "technology" VALUES('ELC_FT_NGA','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Natural gas');
INSERT INTO "technology" VALUES('ELC_FT_NUC','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Nuclear fuel');
INSERT INTO "technology" VALUES('ELC_FT_OIL','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Oil');
INSERT INTO "technology" VALUES('ELC_FT_SLB','p','ELC','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Solid biomass');
INSERT INTO "technology" VALUES('ELC_FT_SOL','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Solar');
INSERT INTO "technology" VALUES('ELC_FT_WIN','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Wind');
INSERT INTO "technology" VALUES('ELC_FT_H2','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydrogen');
INSERT INTO "technology" VALUES('ELC_COA_COND_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Coal condensation steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_COA_OIL_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Coal and oil plant - Existing');
INSERT INTO "technology" VALUES('ELC_DERGAS_CC_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Derived gas combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_NGA_CC_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_NGA_OIL_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas and oil plant - Existing');
INSERT INTO "technology" VALUES('ELC_NGA_STM_REP_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Repowered natural gas steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_NGA_TURB_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas turbine - Existing');
INSERT INTO "technology" VALUES('ELC_NGA_MIN_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Minor natural gas plant - Existing');
INSERT INTO "technology" VALUES('ELC_DST_TURB_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Diesel turbine - Existing');
INSERT INTO "technology" VALUES('ELC_OIL_STM_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Oil steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_BGS_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Biogas plant - Existing');
INSERT INTO "technology" VALUES('ELC_BIO_CEN_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Centralized biomass plant - Existing');
INSERT INTO "technology" VALUES('ELC_BIO_DST_E','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Distributed biomass plant - Existing');
INSERT INTO "technology" VALUES('ELC_GEO_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Geothermal plant - Existing');
INSERT INTO "technology" VALUES('ELC_SOL_E','p','ELC','',NULL,0,0,0,1,0,0,0,0,'Solar plant - Existing');
INSERT INTO "technology" VALUES('ELC_WIN_E','p','ELC','',NULL,0,0,0,1,0,0,0,0,'Wind plant - Existing');
INSERT INTO "technology" VALUES('ELC_HYD_FLO_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Flowing water hydroelectric plant - Existing');
INSERT INTO "technology" VALUES('ELC_HYD_FLO_L10MW_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Flowing water hydroelectric plant (< 10MW) - Existing');
INSERT INTO "technology" VALUES('ELC_HYD_RES_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Reservoir hydroelectric plant - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_GASDER_CC_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration derived gas combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_HHC_CC_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration heavy hydrocarbons combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_CC_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration natural gas combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_TURB_CEN_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Centralized cogeneration natural gas turbine - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_TURB_DST_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Distributed cogeneration natural gas turbine - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_STM_COND_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration natural gas condensation steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_OIL_STM_COND_CEN_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Centralized cogeneration oil condensation steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_OIL_STM_COND_DST_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Distributed cogeneration oil condensation steam cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_BMU_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration municipal waste plant - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_BGS_COG_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration biogas plant - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_COA_IGCC_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration integrated gasification coal combined cycle - Existing');
INSERT INTO "technology" VALUES('ELC_CHP_BIO_CEN_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Centralized cogeneration biomass plant - Existing');
INSERT INTO "technology" VALUES('HET_NGA_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas heat plant - Existing');
INSERT INTO "technology" VALUES('HET_GEO_E','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Geothermal heat plant - Existing');
INSERT INTO "technology" VALUES('ELC_COA_STM_P','pb','ELC','',NULL,0,0,0,0,0,0,0,0,'Coal steam cycle - New (planned)');
INSERT INTO "technology" VALUES('ELC_NGA_CC_P','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas combined cycle - New (planned)');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_CC_P','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration natural gas combined cycle - New (planned)');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_TURB_P','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Cogeneration natural gas turbine - New (planned)');
INSERT INTO "technology" VALUES('ELC_WIN_P','p','ELC','',NULL,0,0,0,1,0,0,0,0,'Wind plant - New (planned)');
INSERT INTO "technology" VALUES('ELC_NGA_CT_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Natural gas combustion turbine - New');
INSERT INTO "technology" VALUES('ELC_NGA_CC_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Natural gas combined cycle - New');
INSERT INTO "technology" VALUES('ELC_COA_STM_N','pb','ELC','',NULL,0,0,1,0,0,0,0,0,'Coal steam cycle - New');
INSERT INTO "technology" VALUES('ELC_OIL_STM_N','pb','ELC','',NULL,0,0,1,0,0,0,0,0,'Oil steam cycle - New');
INSERT INTO "technology" VALUES('ELC_BLQ_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Bioliquid plant - New');
INSERT INTO "technology" VALUES('ELC_BIO_5C_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Biomass (5 cent) plant - New');
INSERT INTO "technology" VALUES('ELC_BIO_12C_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Biomass (12 cent) plant - New');
INSERT INTO "technology" VALUES('ELC_BGS_AGR_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Agriculture and farming biogas plant - New');
INSERT INTO "technology" VALUES('ELC_BGS_LAN_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Landfill biogas plant - New');
INSERT INTO "technology" VALUES('ELC_HYD_MICRO_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Micro hydroelectric (< 1MW) - New');
INSERT INTO "technology" VALUES('ELC_HYD_MINI_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Mini hydroelectric (> 1MW) - New');
INSERT INTO "technology" VALUES('ELC_GEO_HENT_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Geothermal high enthalpy plant - New');
INSERT INTO "technology" VALUES('ELC_GEO_LENT_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Geothermal low enthalpy plant - New');
INSERT INTO "technology" VALUES('ELC_WIN_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Wind plant - New');
INSERT INTO "technology" VALUES('ELC_WIN_OFF_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Wind plant - Offshore - New');
INSERT INTO "technology" VALUES('ELC_WIN_OFF_DEEP_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Wind plant - Deep offshore - New');
INSERT INTO "technology" VALUES('ELC_PV_GRO_ITC_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic ground plant - Northwest Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_GRO_ITF_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic ground plant - South Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_GRO_ITG_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic ground plant - Insular Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_GRO_ITH_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic ground plant - Northeast Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_GRO_ITI_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic ground plant - Central Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_ROOF_ITC_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic roof plant - Northwest Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_ROOF_ITF_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic roof plant - South Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_ROOF_ITG_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic roof plant - Insular Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_ROOF_ITH_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic roof plant - Northeast Italy - New');
INSERT INTO "technology" VALUES('ELC_PV_ROOF_ITI_N','p','ELC','',NULL,0,0,1,1,0,0,0,0,'Photovoltaic roof plant - Central Italy - New');
INSERT INTO "technology" VALUES('ELC_H2_PEMFC_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'PEM fuel cell system running on hydrogen 100 kW based - New');
INSERT INTO "technology" VALUES('ELC_NUC_LWR_N','pb','ELC','',NULL,0,0,1,0,0,0,0,0,'Nuclear fission - Light Water Reactor');
INSERT INTO "technology" VALUES('ELC_NUC_SMR_N','pb','ELC','',NULL,0,0,1,0,0,0,0,0,'Nuclear fission - Small Modular Reactor');
INSERT INTO "technology" VALUES('ELC_CHP_BMU_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Cogeneration municipal waste plant - New');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_TURB_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Cogeneration natural gas turbine - New');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_CC_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Cogeneration natural gas combined cycle - New');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_CP_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Cogeneration natural gas cycle in counter pressure - New');
INSERT INTO "technology" VALUES('ELC_CHP_NGA_TAP_N','p','ELC','',NULL,0,0,1,0,0,0,0,0,'Cogeneration natural gas cycle with steam tapping - New');
INSERT INTO "technology" VALUES('HET_NGA_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Natural gas heat plant - New');
INSERT INTO "technology" VALUES('HET_OIL_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Oil heat plant - New');
INSERT INTO "technology" VALUES('HET_BIO_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Biomass heat plant - New');
INSERT INTO "technology" VALUES('HET_COA_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Coal heat plant - New');
INSERT INTO "technology" VALUES('HET_GEO_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Geothermal heat plant - New');
INSERT INTO "technology" VALUES('HET_GEO_SHA_N','p','ELC','',NULL,0,0,0,0,0,0,0,0,'Geothermal shallow heat plant - New');
INSERT INTO "technology" VALUES('STG_ELC_HYD_PUM_E','ps','STG','',NULL,0,0,1,0,0,0,0,0,'Storage - Pumping hydroelectric plant - Existing');
INSERT INTO "technology" VALUES('STG_ELC_CEN_BTT','ps','STG','',NULL,0,0,1,0,0,0,0,0,'Storage - Centralized Electricity - Lithium-Ion Battery');
INSERT INTO "technology" VALUES('STG_ELC_DST_BTT','ps','STG','',NULL,0,0,1,0,0,0,0,0,'Storage - Distributed Electricity - Lithium-Ion Battery');
INSERT INTO "technology" VALUES('STG_ELC_CEN_VRFB','ps','STG','',NULL,0,0,1,0,0,0,0,0,'Storage - Centralized Electricity - Vanadium-Redox-Flow Battery');
INSERT INTO "technology" VALUES('STG_ELC_DST_VRFB','ps','STG','',NULL,0,0,1,0,0,0,0,0,'Storage - Distributed Electricity - Vanadium-Redox-Flow Battery');
INSERT INTO "technology" VALUES('STG_H2_TNK','ps','STG','',NULL,0,0,0,0,0,0,0,0,'Storage - Hydrogen - Tank');
INSERT INTO "technology" VALUES('CCUS_ELC_COA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Coal power plant w/CCUS');
INSERT INTO "technology" VALUES('CCUS_ELC_NGA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Natural gas power plant w/CCUS');
INSERT INTO "technology" VALUES('CCUS_ELC_COA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_ELC_COA');
INSERT INTO "technology" VALUES('CCUS_ELC_NGA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_ELC_NGA');
INSERT INTO "technology" VALUES('UPS_IMP_COA','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Coal Price');
INSERT INTO "technology" VALUES('UPS_IMP_NGA','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Natural Gas Price');
INSERT INTO "technology" VALUES('UPS_IMP_OIL','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Oil and Oil Products Price');
INSERT INTO "technology" VALUES('UPS_IMP_H2','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Hydrogen Price');
INSERT INTO "technology" VALUES('UPS_IMP_NUC','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Import of Uranium U3O8 yellowcake');
INSERT INTO "technology" VALUES('UPS_IMP_BIO','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Bioenergies Price');
INSERT INTO "technology" VALUES('UPS_IMP_BIO_METH','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Biomethane Price');
INSERT INTO "technology" VALUES('UPS_RNW_WIN','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Wind Resource');
INSERT INTO "technology" VALUES('UPS_RNW_HYD','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Hydroelectric Resource');
INSERT INTO "technology" VALUES('UPS_RNW_GEO','p','UPS','',NULL,0,1,0,0,0,0,0,0,'Geothermal Resource');
INSERT INTO "technology" VALUES('UPS_RNW_SOL','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Solar Resource');
INSERT INTO "technology" VALUES('UPS_IMP_ELC_CEN','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Import of Electricity');
INSERT INTO "technology" VALUES('UPS_EXP_ELC_CEN','p','UPS','',NULL,0,0,0,0,0,0,0,0,'Export of Electricity');
INSERT INTO "technology" VALUES('DISTR_ELC','p','ELC','',NULL,0,0,0,0,0,0,0,0,'');
INSERT INTO "technology" VALUES('END_USES_ELC','p','ELC','',NULL,1,0,0,0,0,0,0,0,'');
INSERT INTO "technology" VALUES('END_USES_HET','p','ELC','',NULL,1,0,0,0,0,0,0,0,'');
INSERT INTO "technology" VALUES('DMY_IMP_TECH','p','UPS','',NULL,1,0,0,0,0,0,0,0,'Dummy import technology');
INSERT INTO "technology" VALUES('DMY_OUT_TECH','p','UPS','',NULL,1,1,0,0,0,0,0,0,'Dummy technology to produce DMY_OUT');
INSERT INTO "technology" VALUES('MAT_SUP_ALU','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Aluminum');
INSERT INTO "technology" VALUES('MAT_SUP_BOR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Boron');
INSERT INTO "technology" VALUES('MAT_SUP_CER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Cerium');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COB','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Cobalt');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_DYS','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Dysprosium');
INSERT INTO "technology" VALUES('MAT_SUP_EUP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Europium');
INSERT INTO "technology" VALUES('MAT_SUP_FLU','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Fluospar');
INSERT INTO "technology" VALUES('MAT_SUP_GAD','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Gadolinium');
INSERT INTO "technology" VALUES('MAT_SUP_GAL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Gallium');
INSERT INTO "technology" VALUES('MAT_SUP_GER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Germanium');
INSERT INTO "technology" VALUES('MAT_SUP_GRA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Graphite');
INSERT INTO "technology" VALUES('MAT_SUP_IND','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Indium');
INSERT INTO "technology" VALUES('MAT_SUP_IRI','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Iridium');
INSERT INTO "technology" VALUES('MAT_SUP_LAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lanthanum');
INSERT INTO "technology" VALUES('MAT_SUP_LIT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lithium');
INSERT INTO "technology" VALUES('MAT_SUP_MAG','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Magnesium');
INSERT INTO "technology" VALUES('MAT_SUP_MAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Manganese');
INSERT INTO "technology" VALUES('MAT_SUP_MOL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Molybdenum');
INSERT INTO "technology" VALUES('MAT_SUP_NEO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Neodymium');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_NIO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Niobium');
INSERT INTO "technology" VALUES('MAT_SUP_PAL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Palladium');
INSERT INTO "technology" VALUES('MAT_SUP_PHO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Phosphorus');
INSERT INTO "technology" VALUES('MAT_SUP_PLA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Platinum');
INSERT INTO "technology" VALUES('MAT_SUP_PRA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Praseodymium');
INSERT INTO "technology" VALUES('MAT_SUP_SIL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Silicon');
INSERT INTO "technology" VALUES('MAT_SUP_SIV','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Silver');
INSERT INTO "technology" VALUES('MAT_SUP_TAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Tantalum');
INSERT INTO "technology" VALUES('MAT_SUP_TER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Terbium');
INSERT INTO "technology" VALUES('MAT_SUP_TIT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Titanium');
INSERT INTO "technology" VALUES('MAT_SUP_VAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Vanadium');
INSERT INTO "technology" VALUES('MAT_SUP_YTT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Yttrium');
INSERT INTO "technology" VALUES('MAT_SUP_ZIR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Zirconium');

CREATE TABLE time_period_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "time_period_type" VALUES('e','Existing vintages');
INSERT INTO "time_period_type" VALUES('f','Future vintages');

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
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_CI_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_TG_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_TV_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2014,'IND_CHP_BLQ_CI_N',2014,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_CI_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'RES_CHP_NGA_CC_N',2007,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2022,'RES_CHP_NGA_STR_N',2022,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N',2020,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N',2020,0.20,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_BGS_AGR_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_BGS_LAN_N',2007,0.50,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_HYD_MICRO_N',2007,0.30,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2008,'ELC_HYD_MINI_N',2008,0.30,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_WIN_N',2007,0.25,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_WIN_OFF_N',2007,0.30,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2030,'ELC_WIN_OFF_DEEP_N',2030,0.35,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_GRO_ITC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_GRO_ITF_N',2007,0.20,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_GRO_ITG_N',2007,0.20,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_GRO_ITH_N',2007,0.20,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_GRO_ITI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_ROOF_ITC_N',2007,0.15,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_ROOF_ITF_N',2007,0.15,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_ROOF_ITG_N',2007,0.15,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_ROOF_ITH_N',2007,0.15,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_PV_ROOF_ITI_N',2007,0.15,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2035,'ELC_NUC_LWR_N',2035,1.00,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2035,'ELC_NUC_SMR_N',2035,1.00,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_CHP_BMU_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_CHP_NGA_TURB_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_CHP_NGA_CC_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_CHP_NGA_CP_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2007,'ELC_CHP_NGA_TAP_N',2007,0.70,'TIMES-Italy');
INSERT INTO "capacity_credit" VALUES('IT',2020,'STG_ELC_CEN_BTT',2020,0.70,'Assumption');
INSERT INTO "capacity_credit" VALUES('IT',2020,'STG_ELC_DST_BTT',2020,0.70,'Assumption');
INSERT INTO "capacity_credit" VALUES('IT',2020,'STG_ELC_CEN_VRFB',2020,0.70,'10.1016/j.mtener.2025.101805');
INSERT INTO "capacity_credit" VALUES('IT',2020,'STG_ELC_DST_VRFB',2020,0.70,'10.1016/j.mtener.2025.101805');

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
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_SOL_E',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_SOL_E',0.167,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_SOL_E',0.391,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_SOL_E',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_SOL_E',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_SOL_E',0.297,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_SOL_E',0.496,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_SOL_E',0.136,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_SOL_E',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_SOL_E',0.307,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_SOL_E',0.539,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_SOL_E',0.144,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_SOL_E',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_SOL_E',0.159,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_SOL_E',0.330,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_SOL_E',0.052,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_WIN_E',0.226,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_WIN_E',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_WIN_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_WIN_E',0.227,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_WIN_E',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_WIN_E',0.132,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_WIN_E',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_WIN_E',0.147,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_WIN_E',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_WIN_E',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_WIN_E',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_WIN_E',0.117,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_WIN_E',0.203,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_WIN_E',0.206,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_WIN_E',0.224,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_WIN_E',0.200,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_HYD_RES_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_HYD_RES_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_HYD_RES_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_HYD_RES_E',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_HYD_RES_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_HYD_RES_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_HYD_RES_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_HYD_RES_E',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_HYD_RES_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_HYD_RES_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_HYD_RES_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_HYD_RES_E',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_HYD_RES_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_HYD_RES_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_HYD_RES_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_HYD_RES_E',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_WIN_P',0.226,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_WIN_P',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_WIN_P',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_WIN_P',0.227,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_WIN_P',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_WIN_P',0.132,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_WIN_P',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_WIN_P',0.147,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_WIN_P',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_WIN_P',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_WIN_P',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_WIN_P',0.117,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_WIN_P',0.203,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_WIN_P',0.206,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_WIN_P',0.224,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_WIN_P',0.200,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_WIN_N',0.226,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_WIN_N',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_WIN_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_WIN_N',0.227,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_WIN_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_WIN_N',0.132,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_WIN_N',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_WIN_N',0.147,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_WIN_N',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_WIN_N',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_WIN_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_WIN_N',0.117,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_WIN_N',0.203,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_WIN_N',0.206,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_WIN_N',0.224,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_WIN_N',0.200,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_WIN_OFF_N',0.226,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_WIN_OFF_N',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_WIN_OFF_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_WIN_OFF_N',0.227,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_WIN_OFF_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_WIN_OFF_N',0.132,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_WIN_OFF_N',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_WIN_OFF_N',0.147,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_WIN_OFF_N',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_WIN_OFF_N',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_WIN_OFF_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_WIN_OFF_N',0.117,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_WIN_OFF_N',0.203,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_WIN_OFF_N',0.206,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_WIN_OFF_N',0.224,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_WIN_OFF_N',0.200,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_WIN_OFF_DEEP_N',0.226,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_WIN_OFF_DEEP_N',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_WIN_OFF_DEEP_N',0.257,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_WIN_OFF_DEEP_N',0.227,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_WIN_OFF_DEEP_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_WIN_OFF_DEEP_N',0.132,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_WIN_OFF_DEEP_N',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_WIN_OFF_DEEP_N',0.147,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_WIN_OFF_DEEP_N',0.087,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_WIN_OFF_DEEP_N',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_WIN_OFF_DEEP_N',0.123,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_WIN_OFF_DEEP_N',0.117,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_WIN_OFF_DEEP_N',0.203,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_WIN_OFF_DEEP_N',0.206,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_WIN_OFF_DEEP_N',0.224,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_WIN_OFF_DEEP_N',0.200,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_GRO_ITC_N',0.168,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_GRO_ITC_N',0.452,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_GRO_ITC_N',0.120,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_GRO_ITC_N',0.302,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_GRO_ITC_N',0.546,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_GRO_ITC_N',0.177,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_GRO_ITC_N',0.307,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_GRO_ITC_N',0.589,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_GRO_ITC_N',0.185,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_GRO_ITC_N',0.148,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_GRO_ITC_N',0.363,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_GRO_ITC_N',0.070,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_GRO_ITF_N',0.225,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_GRO_ITF_N',0.455,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_GRO_ITF_N',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_GRO_ITF_N',0.384,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_GRO_ITF_N',0.586,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_GRO_ITF_N',0.149,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_GRO_ITF_N',0.392,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_GRO_ITF_N',0.623,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_GRO_ITF_N',0.154,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_GRO_ITF_N',0.225,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_GRO_ITF_N',0.400,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_GRO_ITF_N',0.058,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_GRO_ITG_N',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_GRO_ITG_N',0.502,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_GRO_ITG_N',0.120,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_GRO_ITG_N',0.369,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_GRO_ITG_N',0.642,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_GRO_ITG_N',0.181,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_GRO_ITG_N',0.373,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_GRO_ITG_N',0.671,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_GRO_ITG_N',0.186,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_GRO_ITG_N',0.229,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_GRO_ITG_N',0.448,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_GRO_ITG_N',0.079,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_GRO_ITH_N',0.180,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_GRO_ITH_N',0.443,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_GRO_ITH_N',0.104,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_GRO_ITH_N',0.324,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_GRO_ITH_N',0.545,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_GRO_ITH_N',0.163,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_GRO_ITH_N',0.329,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_GRO_ITH_N',0.585,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_GRO_ITH_N',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_GRO_ITH_N',0.159,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_GRO_ITH_N',0.353,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_GRO_ITH_N',0.060,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_GRO_ITI_N',0.202,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_GRO_ITI_N',0.459,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_GRO_ITI_N',0.106,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_GRO_ITI_N',0.351,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_GRO_ITI_N',0.571,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_GRO_ITI_N',0.163,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_GRO_ITI_N',0.361,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_GRO_ITI_N',0.623,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_GRO_ITI_N',0.173,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_GRO_ITI_N',0.192,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_GRO_ITI_N',0.391,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_GRO_ITI_N',0.065,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_ROOF_ITC_N',0.168,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_ROOF_ITC_N',0.452,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_ROOF_ITC_N',0.120,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_ROOF_ITC_N',0.302,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_ROOF_ITC_N',0.546,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_ROOF_ITC_N',0.177,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_ROOF_ITC_N',0.307,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_ROOF_ITC_N',0.589,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_ROOF_ITC_N',0.185,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_ROOF_ITC_N',0.148,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_ROOF_ITC_N',0.363,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_ROOF_ITC_N',0.070,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_ROOF_ITF_N',0.225,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_ROOF_ITF_N',0.455,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_ROOF_ITF_N',0.092,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_ROOF_ITF_N',0.384,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_ROOF_ITF_N',0.586,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_ROOF_ITF_N',0.149,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_ROOF_ITF_N',0.392,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_ROOF_ITF_N',0.623,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_ROOF_ITF_N',0.154,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_ROOF_ITF_N',0.225,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_ROOF_ITF_N',0.400,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_ROOF_ITF_N',0.058,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_ROOF_ITG_N',0.228,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_ROOF_ITG_N',0.502,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_ROOF_ITG_N',0.120,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_ROOF_ITG_N',0.369,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_ROOF_ITG_N',0.642,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_ROOF_ITG_N',0.181,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_ROOF_ITG_N',0.373,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_ROOF_ITG_N',0.671,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_ROOF_ITG_N',0.186,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_ROOF_ITG_N',0.229,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_ROOF_ITG_N',0.448,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_ROOF_ITG_N',0.079,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_ROOF_ITH_N',0.180,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_ROOF_ITH_N',0.443,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_ROOF_ITH_N',0.104,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_ROOF_ITH_N',0.324,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_ROOF_ITH_N',0.545,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_ROOF_ITH_N',0.163,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_ROOF_ITH_N',0.329,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_ROOF_ITH_N',0.585,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_ROOF_ITH_N',0.170,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_ROOF_ITH_N',0.159,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_ROOF_ITH_N',0.353,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_ROOF_ITH_N',0.060,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','morning','ELC_PV_ROOF_ITI_N',0.202,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','noon','ELC_PV_ROOF_ITI_N',0.459,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','winter','afternoon','ELC_PV_ROOF_ITI_N',0.106,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','morning','ELC_PV_ROOF_ITI_N',0.351,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','noon','ELC_PV_ROOF_ITI_N',0.571,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','spring','afternoon','ELC_PV_ROOF_ITI_N',0.163,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','morning','ELC_PV_ROOF_ITI_N',0.361,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','noon','ELC_PV_ROOF_ITI_N',0.623,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','summer','afternoon','ELC_PV_ROOF_ITI_N',0.173,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','morning','ELC_PV_ROOF_ITI_N',0.192,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','noon','ELC_PV_ROOF_ITI_N',0.391,'');
INSERT INTO "capacity_factor_tech" VALUES('IT','fall','afternoon','ELC_PV_ROOF_ITI_N',0.065,'');

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
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_TG_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_TV_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_BLQ_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_MICRO_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_CC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_STR_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_NGA_SOFC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','RES_CHP_H2_PEMFC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_COA_COND_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_COA_OIL_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_DERGAS_CC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_CC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_OIL_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_STM_REP_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_TURB_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_MIN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_DST_TURB_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_OIL_STM_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BGS_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BIO_CEN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BIO_DST_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_GEO_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_SOL_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_WIN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_HYD_FLO_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_HYD_FLO_L10MW_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_HYD_RES_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_GASDER_CC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_HHC_CC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_CC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_STM_COND_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_BMU_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_BGS_COG_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_COA_IGCC_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_BIO_CEN_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','HET_NGA_E',1.00,'PJ/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','HET_GEO_E',1.00,'PJ/(PJ)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_COA_STM_P',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_CC_P',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_CC_P',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_TURB_P',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_WIN_P',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_CT_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NGA_CC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_COA_STM_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_OIL_STM_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BLQ_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BIO_5C_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BIO_12C_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BGS_AGR_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_BGS_LAN_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_HYD_MICRO_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_HYD_MINI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_GEO_HENT_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_GEO_LENT_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_WIN_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_WIN_OFF_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_WIN_OFF_DEEP_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_GRO_ITC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_GRO_ITF_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_GRO_ITG_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_GRO_ITH_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_GRO_ITI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_ROOF_ITC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_ROOF_ITF_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_ROOF_ITG_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_ROOF_ITH_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_PV_ROOF_ITI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_H2_PEMFC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NUC_LWR_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_NUC_SMR_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_BMU_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_TURB_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_CC_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_CP_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','ELC_CHP_NGA_TAP_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_ELC_HYD_PUM_E',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_ELC_CEN_BTT',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_ELC_DST_BTT',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_ELC_CEN_VRFB',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_ELC_DST_VRFB',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','STG_H2_TNK',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','CCUS_ELC_COA',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','CCUS_ELC_NGA',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','UPS_IMP_ELC_CEN',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','UPS_EXP_ELC_CEN',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','DISTR_ELC',31.536,'PJ/(GW)','');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_NGA',56.10,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_COA',101.16,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_OIL',79.55,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_SLB',0.00,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_BMU',85.85,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CO2','ELC_BGS',0.00,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_NGA',0.13,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_COA',1.15,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_OIL',0.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_SLB',30.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_BMU',0.02,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_CH4','ELC_BGS',300.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_NGA',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_COA',1.91,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_OIL',3.18,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_SLB',4.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_BMU',4.00,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('ELC_N2O','ELC_BGS',4.00,'t/(PJ)','');

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
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_CI_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_CI_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_CI_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_TG_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_TG_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_TG_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_TV_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_TV_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_TV_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_BLQ_CI_N',2014,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','IND_CHP_BLQ_CI_N',2014,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_CI_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_CI_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_CI_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_MICRO_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_MICRO_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_MICRO_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_CC_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_CC_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_CC_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','RES_CHP_NGA_STR_N',2022,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','RES_CHP_NGA_STR_N',2022,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_STR_N',2022,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','RES_CHP_NGA_SOFC_N',2020,6.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','RES_CHP_NGA_SOFC_N',2020,1.00E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','RES_CHP_NGA_SOFC_N',2020,1.28E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ZIR','RES_CHP_NGA_SOFC_N',2020,1.79E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_DERGAS_CC_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_DERGAS_CC_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_DERGAS_CC_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_CC_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_CC_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_CC_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_OIL_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_OIL_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_OIL_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_STM_REP_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_STM_REP_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_STM_REP_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_TURB_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_TURB_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_TURB_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_MIN_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_MIN_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_MIN_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_DST_TURB_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_DST_TURB_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_DST_TURB_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_OIL_STM_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_OIL_STM_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_OIL_STM_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_GASDER_CC_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_GASDER_CC_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_GASDER_CC_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_HHC_CC_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_HHC_CC_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_HHC_CC_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_CC_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_CC_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_CC_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_TURB_CEN_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_TURB_CEN_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_TURB_CEN_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_TURB_DST_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_TURB_DST_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_TURB_DST_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_STM_COND_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_STM_COND_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_STM_COND_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_OIL_STM_COND_CEN_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_OIL_STM_COND_CEN_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_OIL_STM_COND_CEN_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_OIL_STM_COND_DST_E',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_OIL_STM_COND_DST_E',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_OIL_STM_COND_DST_E',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_CC_P',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_CC_P',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_CC_P',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_CC_P',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_CC_P',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_CC_P',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_TURB_P',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_TURB_P',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_TURB_P',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_CT_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_CT_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_CT_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NGA_CC_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NGA_CC_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NGA_CC_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_OIL_STM_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_OIL_STM_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_OIL_STM_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_TURB_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_TURB_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_TURB_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_CC_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_CC_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_CC_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_CP_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_CP_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_CP_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_NGA_TAP_N',2007,4.83E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_NGA_TAP_N',2007,1.10E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_NGA_TAP_N',2007,1.58E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_COA_COND_E',2007,3.08E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_COA_COND_E',2007,2.02E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_COA_COND_E',2007,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_COA_COND_E',2007,6.63E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_COA_COND_E',2007,7.21E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_COA_OIL_E',2007,3.08E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_COA_OIL_E',2007,2.02E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_COA_OIL_E',2007,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_COA_OIL_E',2007,6.63E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_COA_OIL_E',2007,7.21E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_CHP_COA_IGCC_E',2007,3.08E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_CHP_COA_IGCC_E',2007,2.02E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_COA_IGCC_E',2007,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_CHP_COA_IGCC_E',2007,6.63E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_CHP_COA_IGCC_E',2007,7.21E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_COA_STM_P',2007,3.08E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_COA_STM_P',2007,2.02E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_COA_STM_P',2007,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_COA_STM_P',2007,6.63E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_COA_STM_P',2007,7.21E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_COA_STM_N',2007,3.08E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_COA_STM_N',2007,2.02E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_COA_STM_N',2007,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_COA_STM_N',2007,6.63E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_COA_STM_N',2007,7.21E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BGS_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BGS_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BIO_CEN_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BIO_CEN_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BIO_DST_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BIO_DST_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_BMU_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_CHP_BMU_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_BGS_COG_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_CHP_BGS_COG_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_BIO_CEN_E',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_CHP_BIO_CEN_E',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BLQ_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BLQ_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BIO_5C_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BIO_5C_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BIO_12C_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BIO_12C_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BGS_AGR_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BGS_AGR_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_BGS_LAN_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_BGS_LAN_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_CHP_BMU_N',2007,2.27E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_CHP_BMU_N',2007,4.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_NUC_LWR_N',2035,7.64E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_NUC_LWR_N',2035,5.35E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','CER','ELC_NUC_LWR_N',2035,4.05E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NUC_LWR_N',2035,4.59E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_NUC_LWR_N',2035,9.00E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NUC_LWR_N',2035,1.50E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_NUC_LWR_N',2035,2.12E-04,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','EUP','ELC_NUC_LWR_N',2035,1.63E-02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','FLU','ELC_NUC_LWR_N',2035,4.55E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GAD','ELC_NUC_LWR_N',2035,5.69E-02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_NUC_LWR_N',2035,2.12E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GRA','ELC_NUC_LWR_N',2035,9.58E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_NUC_LWR_N',2035,1.90E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','LAN','ELC_NUC_LWR_N',2035,1.87E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','LIT','ELC_NUC_LWR_N',2035,9.87E-05,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MAG','ELC_NUC_LWR_N',2035,1.35E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_NUC_LWR_N',2035,6.18E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_NUC_LWR_N',2035,3.12E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_NUC_LWR_N',2035,1.50E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NUC_LWR_N',2035,3.42E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NIO','ELC_NUC_LWR_N',2035,5.07E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PAL','ELC_NUC_LWR_N',2035,1.92E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PHO','ELC_NUC_LWR_N',2035,2.13E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PLA','ELC_NUC_LWR_N',2035,9.83E-04,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_NUC_LWR_N',2035,5.02E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_NUC_LWR_N',2035,4.88E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_NUC_LWR_N',2035,3.47E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TAN','ELC_NUC_LWR_N',2035,3.89E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_NUC_LWR_N',2035,6.42E-05,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_NUC_LWR_N',2035,6.01E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','VAN','ELC_NUC_LWR_N',2035,2.16E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','YTT','ELC_NUC_LWR_N',2035,1.19E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','ZIR','ELC_NUC_LWR_N',2035,6.13E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_NUC_SMR_N',2035,7.64E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_NUC_SMR_N',2035,5.35E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','CER','ELC_NUC_SMR_N',2035,4.05E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_NUC_SMR_N',2035,4.59E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','COB','ELC_NUC_SMR_N',2035,9.00E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_NUC_SMR_N',2035,1.50E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_NUC_SMR_N',2035,2.12E-04,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','EUP','ELC_NUC_SMR_N',2035,1.63E-02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','FLU','ELC_NUC_SMR_N',2035,4.55E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GAD','ELC_NUC_SMR_N',2035,5.69E-02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_NUC_SMR_N',2035,2.12E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','GRA','ELC_NUC_SMR_N',2035,9.58E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_NUC_SMR_N',2035,1.90E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','LAN','ELC_NUC_SMR_N',2035,1.87E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','LIT','ELC_NUC_SMR_N',2035,9.87E-05,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MAG','ELC_NUC_SMR_N',2035,1.35E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_NUC_SMR_N',2035,6.18E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_NUC_SMR_N',2035,3.12E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_NUC_SMR_N',2035,1.50E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_NUC_SMR_N',2035,3.42E+03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','NIO','ELC_NUC_SMR_N',2035,5.07E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PAL','ELC_NUC_SMR_N',2035,1.92E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PHO','ELC_NUC_SMR_N',2035,2.13E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PLA','ELC_NUC_SMR_N',2035,9.83E-04,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_NUC_SMR_N',2035,5.02E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_NUC_SMR_N',2035,4.88E+02,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_NUC_SMR_N',2035,3.47E-01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TAN','ELC_NUC_SMR_N',2035,3.89E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_NUC_SMR_N',2035,6.42E-05,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','TIT','ELC_NUC_SMR_N',2035,6.01E+01,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','VAN','ELC_NUC_SMR_N',2035,2.16E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','YTT','ELC_NUC_SMR_N',2035,1.19E-03,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','ZIR','ELC_NUC_SMR_N',2035,6.13E+00,'t/(GW)','');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_HYD_FLO_E',2007,1.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_HYD_FLO_E',2007,2.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_HYD_FLO_E',2007,3.00E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_HYD_FLO_L10MW_E',2007,1.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_HYD_FLO_L10MW_E',2007,2.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_HYD_FLO_L10MW_E',2007,3.00E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_HYD_RES_E',2007,1.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_HYD_RES_E',2007,2.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_HYD_RES_E',2007,3.00E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_HYD_MICRO_N',2007,1.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_HYD_MICRO_N',2007,2.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_HYD_MICRO_N',2007,3.00E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_HYD_MINI_N',2008,1.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_HYD_MINI_N',2008,2.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_HYD_MINI_N',2008,3.00E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_GEO_E',2007,6.20E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_GEO_E',2007,1.20E+05,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_GEO_HENT_N',2007,6.20E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_GEO_HENT_N',2007,1.20E+05,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_GEO_LENT_N',2007,6.20E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_GEO_LENT_N',2007,1.20E+05,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_WIN_E',2007,1.25E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_WIN_E',2007,9.40E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_WIN_E',2007,4.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_WIN_E',2007,1.80E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_WIN_E',2007,4.74E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_WIN_E',2007,7.84E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_WIN_E',2007,1.03E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_WIN_E',2007,4.04E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_WIN_E',2007,3.99E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_WIN_E',2007,5.84E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_WIN_E',2007,1.14E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_WIN_P',2007,1.25E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_WIN_P',2007,9.40E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_WIN_P',2007,4.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_WIN_P',2007,1.80E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_WIN_P',2007,4.74E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_WIN_P',2007,7.84E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_WIN_P',2007,1.03E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_WIN_P',2007,4.04E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_WIN_P',2007,3.99E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_WIN_P',2007,5.84E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_WIN_P',2007,1.14E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_WIN_N',2007,1.25E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_WIN_N',2007,9.40E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_WIN_N',2007,4.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_WIN_N',2007,1.80E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_WIN_N',2007,4.74E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_WIN_N',2007,7.84E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_WIN_N',2007,1.03E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_WIN_N',2007,4.04E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_WIN_N',2007,3.99E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_WIN_N',2007,5.84E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_WIN_N',2007,1.14E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_WIN_OFF_N',2007,6.65E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_WIN_OFF_N',2007,5.25E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_WIN_OFF_N',2007,5.33E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_WIN_OFF_N',2007,2.69E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_WIN_OFF_N',2007,1.54E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_WIN_OFF_N',2007,7.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_WIN_OFF_N',2007,1.11E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_WIN_OFF_N',2007,1.61E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_WIN_OFF_N',2007,2.70E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_WIN_OFF_N',2007,3.04E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_WIN_OFF_N',2007,6.10E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_WIN_OFF_DEEP_N',2030,6.65E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','BOR','ELC_WIN_OFF_DEEP_N',2030,5.25E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','ELC_WIN_OFF_DEEP_N',2030,5.33E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_WIN_OFF_DEEP_N',2030,2.69E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','ELC_WIN_OFF_DEEP_N',2030,1.54E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','ELC_WIN_OFF_DEEP_N',2030,7.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','ELC_WIN_OFF_DEEP_N',2030,1.11E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','ELC_WIN_OFF_DEEP_N',2030,1.61E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','ELC_WIN_OFF_DEEP_N',2030,2.70E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','ELC_WIN_OFF_DEEP_N',2030,3.04E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','ELC_WIN_OFF_DEEP_N',2030,6.10E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_SOL_E',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_SOL_E',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_SOL_E',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_SOL_E',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_SOL_E',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_SOL_E',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_GRO_ITC_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_GRO_ITC_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_GRO_ITC_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_GRO_ITC_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_GRO_ITC_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_GRO_ITC_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_GRO_ITF_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_GRO_ITF_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_GRO_ITF_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_GRO_ITF_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_GRO_ITF_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_GRO_ITF_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_GRO_ITG_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_GRO_ITG_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_GRO_ITG_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_GRO_ITG_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_GRO_ITG_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_GRO_ITG_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_GRO_ITH_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_GRO_ITH_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_GRO_ITH_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_GRO_ITH_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_GRO_ITH_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_GRO_ITH_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_GRO_ITI_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_GRO_ITI_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_GRO_ITI_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_GRO_ITI_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_GRO_ITI_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_GRO_ITI_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_ROOF_ITC_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_ROOF_ITC_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_ROOF_ITC_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_ROOF_ITC_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_ROOF_ITC_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_ROOF_ITC_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_ROOF_ITF_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_ROOF_ITF_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_ROOF_ITF_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_ROOF_ITF_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_ROOF_ITF_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_ROOF_ITF_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_ROOF_ITG_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_ROOF_ITG_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_ROOF_ITG_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_ROOF_ITG_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_ROOF_ITG_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_ROOF_ITG_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_ROOF_ITH_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_ROOF_ITH_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_ROOF_ITH_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_ROOF_ITH_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_ROOF_ITH_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_ROOF_ITH_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','ELC_PV_ROOF_ITI_N',2007,7.50E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','ELC_PV_ROOF_ITI_N',2007,4.60E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','ELC_PV_ROOF_ITI_N',2007,4.00E-02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','ELC_PV_ROOF_ITI_N',2007,1.50E-01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIL','ELC_PV_ROOF_ITI_N',2007,3.80E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','ELC_PV_ROOF_ITI_N',2007,1.90E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','STG_ELC_CEN_BTT',2020,1.35E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','STG_ELC_CEN_BTT',2020,6.22E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','STG_ELC_CEN_BTT',2020,5.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','FLU','STG_ELC_CEN_BTT',2020,2.31E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','STG_ELC_CEN_BTT',2020,7.31E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LIT','STG_ELC_CEN_BTT',2020,8.68E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','STG_ELC_CEN_BTT',2020,7.03E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','STG_ELC_CEN_BTT',2020,2.00E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PHO','STG_ELC_CEN_BTT',2020,4.14E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ALU','STG_ELC_DST_BTT',2020,1.35E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','STG_ELC_DST_BTT',2020,6.22E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','STG_ELC_DST_BTT',2020,5.05E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','FLU','STG_ELC_DST_BTT',2020,2.31E+01,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','STG_ELC_DST_BTT',2020,7.31E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LIT','STG_ELC_DST_BTT',2020,8.68E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','STG_ELC_DST_BTT',2020,7.03E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','STG_ELC_DST_BTT',2020,2.00E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PHO','STG_ELC_DST_BTT',2020,4.14E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','STG_ELC_CEN_VRFB',2020,2.23E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','STG_ELC_CEN_VRFB',2020,1.98E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','STG_ELC_CEN_VRFB',2020,2.03E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','STG_ELC_DST_VRFB',2020,2.23E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','STG_ELC_DST_VRFB',2020,1.98E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','STG_ELC_DST_VRFB',2020,2.03E+04,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','CCUS_ELC_COA',2020,3.26E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','CCUS_ELC_COA',2020,7.50E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','CCUS_ELC_COA',2020,6.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','CCUS_ELC_COA',2020,3.76E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','CCUS_ELC_COA',2020,7.50E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','CCUS_ELC_COA',2020,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','CCUS_ELC_COA',2020,1.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','CCUS_ELC_COA',2020,1.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','CCUS_ELC_NGA',2020,3.26E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','CCUS_ELC_NGA',2020,7.50E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','CCUS_ELC_NGA',2020,6.92E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','CCUS_ELC_NGA',2020,3.76E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','CCUS_ELC_NGA',2020,7.50E+00,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','CCUS_ELC_NGA',2020,1.15E+03,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','CCUS_ELC_NGA',2020,1.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','CCUS_ELC_NGA',2020,1.00E+02,'t/(GW)','10.1016/j.mtener.2025.101805');

CREATE TABLE cost_emission (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT NOT NULL REFERENCES commodity(name),
    cost      REAL NOT NULL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, emis_comm)
);
INSERT INTO "cost_emission" VALUES('IT',2007,'ELC_CO2',0.010,'MEUR/(kt)','ETS');
INSERT INTO "cost_emission" VALUES('IT',2030,'ELC_CO2',0.080,'MEUR/(kt)','ETS');
INSERT INTO "cost_emission" VALUES('IT',2050,'ELC_CO2',0.150,'MEUR/(kt)','ETS');

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
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_FT_H2',2020,1.57,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_COA_COND_E',2006,32.32,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_COA_OIL_E',2006,30.42,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_DERGAS_CC_E',2006,37.89,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_NGA_CC_E',2006,13.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_NGA_OIL_E',2006,17.86,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_NGA_STM_REP_E',2006,15.40,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_NGA_TURB_E',2006,26.24,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_NGA_MIN_E',2006,17.98,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_DST_TURB_E',2006,22.19,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_OIL_STM_E',2006,42.61,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_BGS_E',2006,12.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_BIO_CEN_E',2006,12.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_BIO_DST_E',2006,12.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_GEO_E',2006,94.03,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_SOL_E',2006,30.80,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_WIN_E',2006,34.00,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_HYD_FLO_E',2006,33.65,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_HYD_FLO_L10MW_E',2006,33.65,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_HYD_RES_E',2006,13.29,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_GASDER_CC_E',2006,22.42,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_HHC_CC_E',2006,29.14,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_NGA_CC_E',2006,20.11,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_NGA_TURB_CEN_E',2006,32.85,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_NGA_TURB_DST_E',2006,32.85,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_NGA_STM_COND_E',2006,34.27,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_OIL_STM_COND_CEN_E',2006,23.71,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_OIL_STM_COND_DST_E',2006,43.60,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_BMU_E',2006,220.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_BGS_COG_E',2006,220.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_COA_IGCC_E',2006,220.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'ELC_CHP_BIO_CEN_E',2006,220.50,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_COA_STM_P',2007,32.04,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_NGA_CC_P',2007,12.91,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_CHP_NGA_CC_P',2007,21.45,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_CHP_NGA_TURB_P',2007,23.10,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_WIN_P',2007,34.00,'MEUR/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_NGA_CT_N',2007,21.00,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_NGA_CC_N',2007,28.00,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_COA_STM_N',2007,74.00,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_OIL_STM_N',2007,74.00,'MUSD/(GW/year)','Assumption');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_BLQ_N',2007,150.85,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_BIO_5C_N',2007,150.85,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_BIO_12C_N',2007,150.85,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_BGS_AGR_N',2007,75.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2014,'ELC_BGS_AGR_N',2014,66.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2022,'ELC_BGS_AGR_N',2022,55.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_BGS_AGR_N',2030,45.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2040,'ELC_BGS_AGR_N',2040,40.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_HYD_MICRO_N',2007,78.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2008,'ELC_HYD_MINI_N',2008,33.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_GEO_HENT_N',2007,86.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2014,'ELC_GEO_HENT_N',2014,84.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2022,'ELC_GEO_HENT_N',2022,75.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_GEO_HENT_N',2030,71.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2040,'ELC_GEO_HENT_N',2040,60.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_GEO_LENT_N',2007,86.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2014,'ELC_GEO_LENT_N',2014,84.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2022,'ELC_GEO_LENT_N',2022,75.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_GEO_LENT_N',2030,71.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2040,'ELC_GEO_LENT_N',2040,60.00,'MEUR/(GW/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_WIN_N',2007,49.00,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_WIN_N',2020,43.00,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_WIN_N',2030,38.95,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_WIN_N',2050,33.11,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_WIN_OFF_N',2007,111.34,'MUSD/(GW/year)','Assumption');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_WIN_OFF_N',2020,111.34,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_WIN_OFF_N',2030,86.19,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_WIN_OFF_N',2050,70.21,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_WIN_OFF_DEEP_N',2030,68.89,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_WIN_OFF_DEEP_N',2050,57.15,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_GRO_ITC_N',2007,43.24,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_GRO_ITC_N',2020,22.62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_GRO_ITC_N',2030,15.22,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_GRO_ITC_N',2050,13.25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_GRO_ITF_N',2007,43.24,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_GRO_ITF_N',2020,22.62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_GRO_ITF_N',2030,15.22,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_GRO_ITF_N',2050,13.25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_GRO_ITG_N',2007,43.24,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_GRO_ITG_N',2020,22.62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_GRO_ITG_N',2030,15.22,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_GRO_ITG_N',2050,13.25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_GRO_ITH_N',2007,43.24,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_GRO_ITH_N',2020,22.62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_GRO_ITH_N',2030,15.22,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_GRO_ITH_N',2050,13.25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_GRO_ITI_N',2007,43.24,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_GRO_ITI_N',2020,22.62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_GRO_ITI_N',2030,15.22,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_GRO_ITI_N',2050,13.25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_ROOF_ITC_N',2007,48.08,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_ROOF_ITC_N',2020,24.04,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_ROOF_ITC_N',2030,12.44,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_ROOF_ITC_N',2050,10.35,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_ROOF_ITF_N',2007,48.08,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_ROOF_ITF_N',2020,24.04,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_ROOF_ITF_N',2030,12.44,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_ROOF_ITF_N',2050,10.35,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_ROOF_ITG_N',2007,48.08,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_ROOF_ITG_N',2020,24.04,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_ROOF_ITG_N',2030,12.44,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_ROOF_ITG_N',2050,10.35,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_ROOF_ITH_N',2007,48.08,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_ROOF_ITH_N',2020,24.04,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_ROOF_ITH_N',2030,12.44,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_ROOF_ITH_N',2050,10.35,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'ELC_PV_ROOF_ITI_N',2007,48.08,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'ELC_PV_ROOF_ITI_N',2020,24.04,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'ELC_PV_ROOF_ITI_N',2030,12.44,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'ELC_PV_ROOF_ITI_N',2050,10.35,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2035,'ELC_NUC_LWR_N',2035,154,'MUSD/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2035,'ELC_NUC_SMR_N',2035,154,'MUSD/(GW/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_NGA_N',2007,2.4,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_OIL_N',2007,2.5,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_BIO_N',2007,2.8,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_COA_N',2007,2.8,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_GEO_N',2007,2.5,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2007,'HET_GEO_SHA_N',2007,2.5,'MEUR/(PJ/year)','TIMES-Italy');
INSERT INTO "cost_fixed" VALUES('IT',2006,'STG_ELC_HYD_PUM_E',2006,17.82,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'STG_ELC_CEN_BTT',2020,62,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'STG_ELC_CEN_BTT',2030,30,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'STG_ELC_CEN_BTT',2050,23,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'STG_ELC_DST_BTT',2020,72,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2030,'STG_ELC_DST_BTT',2030,33,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2050,'STG_ELC_DST_BTT',2050,25,'MUSD/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'STG_ELC_CEN_VRFB',2020,6.8,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2030,'STG_ELC_CEN_VRFB',2030,5.5,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2050,'STG_ELC_CEN_VRFB',2050,4.3,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2020,'STG_ELC_DST_VRFB',2020,7.2,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2030,'STG_ELC_DST_VRFB',2030,5.9,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2050,'STG_ELC_DST_VRFB',2050,4.5,'MUSD/(GW/year)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_fixed" VALUES('IT',2014,'STG_H2_TNK',2014,6*0.60/0.0036/31.536,'MEUR/(GW/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'STG_H2_TNK',2025,6*0.47/0.0036/31.536,'MEUR/(GW/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_ELC_COA',2020,125,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2035,'CCUS_ELC_COA',2035,108,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_ELC_NGA',2020,67,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2035,'CCUS_ELC_NGA',2035,60,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2007,'DISTR_ELC',2007,0.4,'MEUR/(GW/year)','Assumption');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
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
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2007,1.10E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2014,1.05E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2022,1.03E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2030,9.45E+02,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_TG_N',2007,8.00E+02,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_TV_N',2007,1.50E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2014,2.10E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2022,2.06E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2030,1.89E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2050,1.80E+03,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2007,1100,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2014,1050,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2022,980,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CI_N',2030,900,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,1500,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2014,1350,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2022,1160,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_MICRO_N',2030,1000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2007,1300,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2014,1300,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_CC_N',2022,1300,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_STR_N',2022,2180,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_STR_N',2030,2100,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,10000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2025,8000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_NGA_SOFC_N',2030,3500,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,6000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2025,5000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','RES_CHP_H2_PEMFC_N',2030,4000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_FT_H2',2020,30.29,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CT_N',2007,922,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CT_N',2020,922,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CT_N',2050,703,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CC_N',2007,1038,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CC_N',2020,1038,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_NGA_CC_N',2030,838,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_COA_STM_N',2007,3075,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_COA_STM_N',2020,3075,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_COA_STM_N',2050,2240,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_OIL_STM_N',2007,3075,'MUSD/(GW)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','ELC_OIL_STM_N',2020,3075,'MUSD/(GW)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','ELC_OIL_STM_N',2050,2240,'MUSD/(GW)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','ELC_BLQ_N',2007,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BLQ_N',2020,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BLQ_N',2050,3626,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_5C_N',2007,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_5C_N',2020,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_5C_N',2050,3626,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_12C_N',2007,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_12C_N',2020,4416,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BIO_12C_N',2050,3626,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_AGR_N',2007,3500,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_AGR_N',2014,3000,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_AGR_N',2022,2500,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_AGR_N',2030,2250,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_AGR_N',2040,2025,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_LAN_N',2007,1100,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_LAN_N',2014,1050,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_LAN_N',2022,950,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_LAN_N',2030,915,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_BGS_LAN_N',2040,900,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_HYD_MICRO_N',2007,4500,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_HYD_MINI_N',2008,2250,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_HENT_N',2007,4000,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_HENT_N',2014,3800,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_HENT_N',2022,3500,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_HENT_N',2030,3350,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_HENT_N',2040,3200,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_LENT_N',2007,6000,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_LENT_N',2014,5700,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_LENT_N',2022,5250,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_LENT_N',2030,4690,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_GEO_LENT_N',2040,4480,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_N',2007,2532,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_N',2020,1462,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_N',2030,956,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_N',2050,765,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_N',2007,5000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_N',2020,3739,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_N',2030,2758,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_N',2050,2343,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_DEEP_N',2030,4049,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_WIN_OFF_DEEP_N',2050,3467,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITC_N',2007,6000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITC_N',2020,1333,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITC_N',2030,754,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITC_N',2050,620,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITF_N',2007,6000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITF_N',2020,1333,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITF_N',2030,754,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITF_N',2050,620,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITG_N',2007,6000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITG_N',2020,1333,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITG_N',2030,754,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITG_N',2050,620,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITH_N',2007,6000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITH_N',2020,1333,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITH_N',2030,754,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITH_N',2050,620,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITI_N',2007,6000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITI_N',2020,1333,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITI_N',2030,754,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_GRO_ITI_N',2050,620,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITC_N',2007,8000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITC_N',2020,2263,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITC_N',2030,972,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITC_N',2050,751,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITF_N',2007,8000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITF_N',2020,2263,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITF_N',2030,972,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITF_N',2050,751,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITG_N',2007,8000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITG_N',2020,2263,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITG_N',2030,972,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITG_N',2050,751,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITH_N',2007,8000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITH_N',2020,2263,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITH_N',2030,972,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITH_N',2050,751,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITI_N',2007,8000,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITI_N',2020,2263,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITI_N',2030,972,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_PV_ROOF_ITI_N',2050,751,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','ELC_H2_PEMFC_N',2022,3000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_H2_PEMFC_N',2030,2000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_H2_PEMFC_N',2040,1500,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_H2_PEMFC_N',2050,1000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_LWR_N',2035,5289*1.000,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_LWR_N',2040,5289*1.276,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_LWR_N',2045,5289*1.409,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_LWR_N',2050,5289*1.409,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_SMR_N',2035,5491*1.000,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_SMR_N',2040,5491*1.276,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_SMR_N',2045,5491*1.409,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_NUC_SMR_N',2050,5491*1.409,'MUSD/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2007,4000,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2010,3600,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2014,3429,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2022,2895,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2030,2287,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_BMU_N',2040,2059,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_NGA_TURB_N',2007,960,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_NGA_CC_N',2007,720,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_NGA_CP_N',2007,702,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','ELC_CHP_NGA_TAP_N',2007,702,'MEUR/(GW)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_NGA_N',2007,4.5,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_OIL_N',2007,5.0,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_BIO_N',2007,6.0,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_COA_N',2007,6.0,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_GEO_N',2007,12.0,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','HET_GEO_SHA_N',2007,12.0,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_BTT',2020,2466,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_BTT',2030,1210,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_BTT',2050,908,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_BTT',2020,2869,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_BTT',2030,1337,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_BTT',2050,1002,'MUSD/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_VRFB',2020,2386,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_VRFB',2030,1906,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_CEN_VRFB',2050,1429,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_VRFB',2020,2549,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_VRFB',2030,2037,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_ELC_DST_VRFB',2050,1528,'MUSD/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "cost_invest" VALUES('IT','STG_H2_TNK',2014,6*13.0/0.0036/31.536,'MEUR/(GW)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','STG_H2_TNK',2025,6*10.3/0.0036/31.536,'MEUR/(GW)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_COA',2020,5542,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_COA',2030,3416,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_NGA',2020,2630,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_NGA',2050,1582,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','UPS_IMP_ELC_CEN',2007,1000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','UPS_EXP_ELC_CEN',2007,1000,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','DISTR_ELC',2007,20.0,'MEUR/(GW)','Assumption');

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
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_CI_N',2007,4.17E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N',2007,2.78E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_NGA_CC_N',2007,5.00E-01,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'COM_CHP_SLB_CI_N',2007,4.17E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N',2020,30.56,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N',2025,16.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N',2030,4.86,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N',2025,13.89,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N',2030,6.94,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_CI_N',2007,4.17E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_NGA_CI_N',2014,3.75E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_NGA_CI_N',2022,3.22E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'IND_CHP_NGA_CI_N',2030,2.78E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_TG_N',2007,1.67E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_NGA_TG_N',2014,1.53E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_NGA_TG_N',2022,1.39E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_TV_N',2007,1.39E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_BLQ_CI_N',2014,3.75E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_BLQ_CI_N',2022,3.22E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'IND_CHP_BLQ_CI_N',2030,2.78E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2050,'IND_CHP_BLQ_CI_N',2050,2.50E+00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_CI_N',2007,4.17,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_CI_N',2014,3.75,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_CI_N',2022,3.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_CI_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N',2007,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N',2014,2.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N',2022,1.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N',2030,1.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'RES_CHP_NGA_CC_N',2007,0.50,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'RES_CHP_NGA_CC_N',2014,0.44,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_CC_N',2022,0.42,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'RES_CHP_NGA_STR_N',2022,5.00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_STR_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N',2020,27.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N',2025,22.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_NGA_SOFC_N',2030,6.94,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N',2020,20.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N',2025,13.89,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N',2030,6.94,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_FT_BMU',2007,3.00,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2020,'ELC_FT_H2',2020,0.32,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_COA_COND_E',2006,0.58,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_COA_OIL_E',2006,0.34,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_DERGAS_CC_E',2006,0.49,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_NGA_CC_E',2006,0.41,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_NGA_OIL_E',2006,0.35,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_NGA_STM_REP_E',2006,0.33,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_NGA_TURB_E',2006,0.50,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_NGA_MIN_E',2006,0.85,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_DST_TURB_E',2006,0.48,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_OIL_STM_E',2006,0.45,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_BGS_E',2006,0.36,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_BIO_CEN_E',2006,0.36,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_BIO_DST_E',2006,0.36,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_GEO_E',2006,3.48,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_SOL_E',2006,13.89,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_WIN_E',2006,0.00,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_HYD_FLO_E',2006,0.08,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_HYD_FLO_L10MW_E',2006,0.08,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_HYD_RES_E',2006,0.08,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_GASDER_CC_E',2006,0.64,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_HHC_CC_E',2006,0.45,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_NGA_CC_E',2006,0.79,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_NGA_TURB_CEN_E',2006,0.57,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_NGA_TURB_DST_E',2006,0.57,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_NGA_STM_COND_E',2006,0.48,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_OIL_STM_COND_CEN_E',2006,0.49,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_OIL_STM_COND_DST_E',2006,0.47,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_BMU_E',2006,0.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_BGS_COG_E',2006,0.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_COA_IGCC_E',2006,0.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2006,'ELC_CHP_BIO_CEN_E',2006,0.83,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_COA_STM_P',2007,0.46,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_NGA_CC_P',2007,1.41,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_CC_P',2007,0.49,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_TURB_P',2007,0.50,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_NGA_CT_N',2007,1.39,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_NGA_CC_N',2007,0.56,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_COA_STM_N',2007,2.22,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_OIL_STM_N',2007,2.22,'MUSD/(PJ)','Assumption');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_BLQ_N',2007,1.61,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_BIO_5C_N',2007,1.61,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_BIO_12C_N',2007,1.61,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_BGS_LAN_N',2007,1.61,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2022,'ELC_H2_PEMFC_N',2022,29.17,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'ELC_H2_PEMFC_N',2030,22.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2040,'ELC_H2_PEMFC_N',2040,18.06,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2050,'ELC_H2_PEMFC_N',2050,8.33,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_BMU_N',2007,12.50,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2030,'ELC_CHP_BMU_N',2030,9.50,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_TURB_N',2007,1.67,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2014,'ELC_CHP_NGA_TURB_N',2014,1.53,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2022,'ELC_CHP_NGA_TURB_N',2022,1.39,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2030,'ELC_CHP_NGA_TURB_N',2030,1.25,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2040,'ELC_CHP_NGA_TURB_N',2040,1.11,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_CC_N',2007,0.50,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2014,'ELC_CHP_NGA_CC_N',2014,0.44,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2022,'ELC_CHP_NGA_CC_N',2022,0.42,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2030,'ELC_CHP_NGA_CC_N',2030,0.37,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2040,'ELC_CHP_NGA_CC_N',2040,0.33,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_CP_N',2007,1.39,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2007,'ELC_CHP_NGA_TAP_N',2007,1.39,'MEUR/(PJ)','TIMES-Italy');
INSERT INTO "cost_variable" VALUES('IT',2006,'STG_ELC_HYD_PUM_E',2006,0.51,'MUSD/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_COA',2007,3.03,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_IMP_COA',2030,2.63,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_IMP_COA',2050,2.84,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_NGA',2007,11.98,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_IMP_NGA',2030,6.55,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_IMP_NGA',2050,7.09,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_OIL',2007,6.93,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_IMP_OIL',2030,10.49,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_IMP_OIL',2050,12.15,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_H2',2007,100.00,'M€/PJ','Assuming 12 €/kg');
INSERT INTO "cost_variable" VALUES('IT',2035,'UPS_IMP_NUC',2035,0.960,'M$/ton','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_BIO',2007,5.00,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_BIO_METH',2007,11.98*2,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_IMP_BIO_METH',2030,6.55*2,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_IMP_BIO_METH',2050,7.09*2,'M€/PJ','Import Price');
INSERT INTO "cost_variable" VALUES('IT',2006,'UPS_IMP_ELC_CEN',2006,26.29,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_IMP_ELC_CEN',2007,25.91,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2008,'UPS_IMP_ELC_CEN',2008,25.22,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2010,'UPS_IMP_ELC_CEN',2010,18.63,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2012,'UPS_IMP_ELC_CEN',2012,23.34,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2014,'UPS_IMP_ELC_CEN',2014,17.06,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2016,'UPS_IMP_ELC_CEN',2016,13.20,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2018,'UPS_IMP_ELC_CEN',2018,17.59,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2020,'UPS_IMP_ELC_CEN',2020,26.81,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2022,'UPS_IMP_ELC_CEN',2022,81.74,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2025,'UPS_IMP_ELC_CEN',2025,42.41,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_IMP_ELC_CEN',2030,23.18,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2040,'UPS_IMP_ELC_CEN',2040,24.13,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_IMP_ELC_CEN',2050,25.09,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2006,'UPS_EXP_ELC_CEN',2006,-26.59,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2007,'UPS_EXP_ELC_CEN',2007,-27.30,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2008,'UPS_EXP_ELC_CEN',2008,-27.61,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2010,'UPS_EXP_ELC_CEN',2010,-20.53,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2012,'UPS_EXP_ELC_CEN',2012,-22.74,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2014,'UPS_EXP_ELC_CEN',2014,-16.88,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2016,'UPS_EXP_ELC_CEN',2016,-13.49,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2018,'UPS_EXP_ELC_CEN',2018,-17.59,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2020,'UPS_EXP_ELC_CEN',2020,-23.68,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2022,'UPS_EXP_ELC_CEN',2022,-84.97,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2025,'UPS_EXP_ELC_CEN',2025,-44.08,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2030,'UPS_EXP_ELC_CEN',2030,-24.09,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2040,'UPS_EXP_ELC_CEN',2040,-25.08,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2050,'UPS_EXP_ELC_CEN',2050,-26.08,'M€/PJ','');
INSERT INTO "cost_variable" VALUES('IT',2007,'DMY_IMP_TECH',2007,10000.0,'M€/PJ','');

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
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_MICRO_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_CC_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_SLB_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_NGA_SOFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('COM_CHP_H2_PEMFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_TG_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_TV_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_BLQ_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_MICRO_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_CC_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_STR_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_NGA_SOFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('RES_CHP_H2_PEMFC_N','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_FT_H2','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('ELC_COA_COND_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_COA_OIL_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_DERGAS_CC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_CC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_OIL_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_STM_REP_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_TURB_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_MIN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_DST_TURB_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_OIL_STM_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BGS_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BIO_CEN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BIO_DST_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_GEO_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_SOL_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_WIN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_HYD_FLO_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_HYD_FLO_L10MW_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_HYD_RES_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_GASDER_CC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_HHC_CC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_CC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_TURB_CEN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_TURB_DST_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_STM_COND_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_OIL_STM_COND_CEN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_OIL_STM_COND_DST_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_BMU_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_BGS_COG_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_COA_IGCC_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_BIO_CEN_E','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_H2_PEMFC_N','EUR13',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NUC_LWR_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NUC_SMR_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_COA_STM_P','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_CC_P','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_CC_P','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_TURB_P','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_WIN_P','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_CT_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_NGA_CC_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_COA_STM_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_OIL_STM_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BLQ_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BIO_5C_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BIO_12C_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BGS_AGR_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_BGS_LAN_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_HYD_MICRO_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_HYD_MINI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_GEO_HENT_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_GEO_LENT_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_WIN_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_WIN_OFF_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_WIN_OFF_DEEP_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_GRO_ITC_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_GRO_ITF_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_GRO_ITG_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_GRO_ITH_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_GRO_ITI_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_ROOF_ITC_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_ROOF_ITF_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_ROOF_ITG_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_ROOF_ITH_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_PV_ROOF_ITI_N','USD20',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_BMU_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_TURB_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_CC_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_CP_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('ELC_CHP_NGA_TAP_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('STG_ELC_HYD_PUM_E','USD20',NULL);
INSERT INTO "currency_tech" VALUES('STG_ELC_CEN_BTT','USD20',NULL);
INSERT INTO "currency_tech" VALUES('STG_ELC_DST_BTT','USD20',NULL);
INSERT INTO "currency_tech" VALUES('STG_ELC_CEN_VRFB','USD20',NULL);
INSERT INTO "currency_tech" VALUES('STG_ELC_DST_VRFB','USD20',NULL);
INSERT INTO "currency_tech" VALUES('STG_H2_TNK','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_ELC_COA','USD20',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_ELC_NGA','USD20',NULL);
INSERT INTO "currency_tech" VALUES('UPS_IMP_ELC_CEN','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('UPS_EXP_ELC_CEN','EUR20',NULL);
INSERT INTO "currency_tech" VALUES('UPS_IMP_NUC','USD22',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2007,'ELC_DEM',1129.99,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2008,'ELC_DEM',1148.87,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2010,'ELC_DEM',1087.43,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2012,'ELC_DEM',1077.40,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2014,'ELC_DEM',1007.38,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2016,'ELC_DEM',1043.16,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2018,'ELC_DEM',1042.95,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2020,'ELC_DEM',1009.91,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2022,'ELC_DEM',1022.26,'PJ','IEA');
INSERT INTO "demand" VALUES('IT',2025,'ELC_DEM',984.13,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2030,'ELC_DEM',1085.99,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2035,'ELC_DEM',1191.04,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2040,'ELC_DEM',1295.30,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2045,'ELC_DEM',1393.12,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2050,'ELC_DEM',1432.38,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2007,'HET_DEM',0.20*1129.99,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'HET_DEM',0.20*1148.87,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'HET_DEM',0.20*1087.43,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'HET_DEM',0.20*1077.4,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'HET_DEM',0.20*1007.38,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'HET_DEM',0.20*1043.16,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'HET_DEM',0.20*1042.95,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'HET_DEM',0.20*1009.91,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'HET_DEM',0.20*1022.26,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'HET_DEM',203.89,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2030,'HET_DEM',214.08,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2035,'HET_DEM',224.79,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2040,'HET_DEM',236.03,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2045,'HET_DEM',247.83,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2050,'HET_DEM',260.22,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "demand" VALUES('IT',2006,'DMY_OUT',1E6,'PJ','');

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

CREATE TABLE driver (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    driver_name TEXT,
    driver      REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, driver_name)
);
INSERT INTO "driver" VALUES('IT',2006,'POP',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'POP',1.003,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'POP',1.010,NULL,'');
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
INSERT INTO "driver" VALUES('IT',2040,'POP',1.030,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'POP',1.021,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'POP',1.013,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'GDP',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'GDP',1.015,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'GDP',1.004,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'GDP',0.965,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'GDP',0.943,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'GDP',0.928,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'GDP',0.947,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'GDP',0.971,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'GDP',0.933,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'GDP',0.980,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'GDP',1.024,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'GDP',1.046,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'GDP',1.065,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'GDP',1.084,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'GDP',1.141,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'GDP',1.198,NULL,'');
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
INSERT INTO "driver" VALUES('IT',2006,'DRH3',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'DRH3',1.050,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'DRH3',1.103,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'DRH3',1.216,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'DRH3',1.340,NULL,'');
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
INSERT INTO "driver" VALUES('IT',2006,'DRH4',1.000,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'DRH4',1.100,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'DRH4',1.210,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'DRH4',1.464,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'DRH4',1.772,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'DRH4',2.144,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'DRH4',2.594,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'DRH4',2.860,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'DRH4',3.153,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'DRH4',3.410,NULL,'');
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
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_COA',2007,'COA_HCO',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_COA',2007,'COA_OVC',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NGA',2007,'GAS_BFG',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NGA',2007,'GAS_COG',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NGA',2007,'GAS_RFG',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NGA',2007,'GAS_NGA',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NGA',2007,'SYN_NGA',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_NSP',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_PTC',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_CRD',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_DST',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_GSL',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_HFO',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_KER',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_LPG',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_OIL',2007,'OIL_NAP',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_H2',2007,'H2',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_H2',2007,'H2_BL',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_H2',2007,'H2_EL',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_NUC',2035,'NUC',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO',2007,'BIO_GAS',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO',2007,'BIO_DST1',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO',2007,'BIO_BIN',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO',2007,'BIO_BMU',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO',2007,'BIO_SLB',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_BIO_METH',2007,'BIO_METH',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_RNW_WIN',2007,'WIN',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_RNW_HYD',2007,'HYD',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_RNW_GEO',2007,'GEO',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_RNW_SOL',2007,'SOL',1.00,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','UPS_IMP_ELC_CEN',2006,'ELC_CEN',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','UPS_EXP_ELC_CEN',2006,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'HET',0.520,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'HET',0.510,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'HET',0.500,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'HET',0.480,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'HET',0.400,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'ELC_DST',0.350,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'ELC_DST',0.360,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'HET',0.412,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'ELC_DST',0.390,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'HET',0.402,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'ELC_DST',0.800,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'ELC_DST',0.825,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'ELC_DST',0.860,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'ELC_DST',0.880,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'ELC_DST',0.907,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'ELC_DST',0.740,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'ELC_DST',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'ELC_DST',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'ELC_DST',0.800,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'ELC_DST',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'ELC_DST',0.760,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'ELC_DST',0.774,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'ELC_DST',0.790,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'ELC_DST',0.870,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'ELC_DST',0.905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'ELC_DST',0.923,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'ELC_DST',0.931,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'HET',0.800,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'HET',0.825,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'HET',0.860,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'HET',0.880,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'HET',0.907,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'HET',0.740,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'HET',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'HET',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'HET',0.800,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'HET',0.750,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'HET',0.760,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'HET',0.774,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'HET',0.790,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'HET',0.870,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'HET',0.905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'HET',0.923,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'HET',0.931,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'HET',0.450,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'HET',0.432,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'HET',0.520,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'HET',0.510,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'HET',0.500,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'HET',0.480,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'ELC_DST',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'HET',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'ELC_DST',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'HET',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'ELC_DST',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'HET',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'ELC_DST',0.16,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'HET',0.64,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.20,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'HET',0.60,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'ELC_DST',0.92,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'HET',0.92,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_GAS','ELC_FT_BGS',2007,'ELC_BGS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_DST1','ELC_FT_BLQ',2007,'ELC_BLQ',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_BIN','ELC_FT_BMU',2007,'ELC_BMU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_BMU','ELC_FT_BMU',2007,'ELC_BMU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','ELC_FT_COA',2007,'ELC_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_OVC','ELC_FT_COA',2007,'ELC_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_BFG','ELC_FT_COA',2007,'ELC_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_COG','ELC_FT_COA',2007,'ELC_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_RFG','ELC_FT_DERGAS',2007,'ELC_GASDER',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GEO','ELC_FT_GEO',2007,'ELC_GEO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','ELC_FT_HHC',2007,'ELC_HHC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_PTC','ELC_FT_HHC',2007,'ELC_HHC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HYD','ELC_FT_HYD',2007,'ELC_HYD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','ELC_FT_NGA',2007,'ELC_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','ELC_FT_NGA',2007,'ELC_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','ELC_FT_NGA',2007,'ELC_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','ELC_FT_NGA',2020,'ELC_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','NUC','ELC_FT_NUC',2035,'ELC_NUC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_CRD','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_KER','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NAP','ELC_FT_OIL',2007,'ELC_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','ELC_FT_SLB',2007,'ELC_SLB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SOL','ELC_FT_SOL',2007,'ELC_SOL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','WIN','ELC_FT_WIN',2007,'ELC_WIN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_COND_E',2006,'ELC_CEN',0.34,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_COND_E',2010,'ELC_CEN',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_OIL_E',2006,'ELC_CEN',0.27,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_COA_OIL_E',2006,'ELC_CEN',0.27,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GASDER','ELC_DERGAS_CC_E',2006,'ELC_CEN',0.36,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CC_E',2006,'ELC_CEN',0.50,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CC_E',2010,'ELC_CEN',0.46,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_OIL_E',2006,'ELC_CEN',0.39,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_OIL_E',2010,'ELC_CEN',0.30,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_NGA_OIL_E',2006,'ELC_CEN',0.39,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_NGA_OIL_E',2010,'ELC_CEN',0.30,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_STM_REP_E',2006,'ELC_CEN',0.42,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_TURB_E',2006,'ELC_CEN',0.42,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_MIN_E',2006,'ELC_CEN',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_DST_TURB_E',2006,'ELC_CEN',0.27,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_OIL_STM_E',2006,'ELC_CEN',0.36,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_OIL_STM_E',2010,'ELC_CEN',0.27,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_BGS_E',2006,'ELC_DST',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_CEN_E',2006,'ELC_CEN',0.23,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_DST_E',2006,'ELC_DST',0.23,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','ELC_GEO_E',2006,'ELC_CEN',0.10,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_SOL_E',2006,'ELC_DST',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_WIN','ELC_WIN_E',2006,'ELC_CEN',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HYD','ELC_HYD_FLO_E',2006,'ELC_CEN',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HYD','ELC_HYD_FLO_L10MW_E',2006,'ELC_DST',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HYD','ELC_HYD_RES_E',2006,'ELC_CEN',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_GASDER_CC_E',2006,'ELC_CEN',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_GASDER_CC_E',2006,'HET',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HHC','ELC_CHP_HHC_CC_E',2006,'ELC_CEN',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HHC','ELC_CHP_HHC_CC_E',2006,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_E',2006,'ELC_CEN',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_E',2006,'HET',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_CEN_E',2006,'ELC_CEN',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_CEN_E',2006,'HET',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_DST_E',2006,'ELC_DST',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_DST_E',2006,'HET',0.70,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2006,'ELC_CEN',0.73,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2006,'HET',0.73,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_CEN_E',2006,'ELC_CEN',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_CEN_E',2006,'HET',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_DST_E',2006,'ELC_DST',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_DST_E',2006,'HET',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BMU','ELC_CHP_BMU_E',2006,'ELC_CEN',0.48,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BMU','ELC_CHP_BMU_E',2006,'HET',0.48,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_CHP_BGS_COG_E',2006,'ELC_CEN',0.66,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_CHP_BGS_COG_E',2006,'HET',0.66,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_CHP_COA_IGCC_E',2006,'ELC_CEN',0.47,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_CHP_COA_IGCC_E',2006,'HET',0.47,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_CHP_BIO_CEN_E',2006,'ELC_CEN',0.49,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_CHP_BIO_CEN_E',2006,'HET',0.49,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','HET_NGA_E',2006,'HET',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','HET_GEO_E',2006,'HET',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_STM_P',2007,'ELC_CEN',0.42,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CC_P',2007,'ELC_CEN',0.47,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_P',2007,'ELC_CEN',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_P',2007,'HET',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_P',2007,'ELC_CEN',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_P',2007,'HET',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_WIN','ELC_WIN_P',2007,'ELC_CEN',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CT_N',2007,'ELC_CEN',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CT_N',2050,'ELC_CEN',1.10*0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CC_N',2007,'ELC_CEN',0.54,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_NGA_CC_N',2050,'ELC_CEN',1.10*0.54,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_STM_N',2007,'ELC_CEN',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','ELC_COA_STM_N',2050,'ELC_CEN',1.10*0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_OIL_STM_N',2007,'ELC_CEN',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','ELC_OIL_STM_N',2050,'ELC_CEN',1.10*0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','ELC_BLQ_N',2007,'ELC_CEN',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','ELC_BLQ_N',2050,'ELC_CEN',1.10*0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_5C_N',2007,'ELC_CEN',0.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_5C_N',2050,'ELC_CEN',1.10*0.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_12C_N',2007,'ELC_CEN',0.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SLB','ELC_BIO_12C_N',2050,'ELC_CEN',1.10*0.25,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_BGS_AGR_N',2007,'ELC_DST',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_BGS_AGR_N',2040,'ELC_DST',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_BGS_LAN_N',2007,'ELC_DST',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BGS','ELC_BGS_LAN_N',2040,'ELC_DST',0.40,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HYD','ELC_HYD_MICRO_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_HYD','ELC_HYD_MINI_N',2008,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','ELC_GEO_HENT_N',2007,'ELC_CEN',0.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','ELC_GEO_LENT_N',2007,'ELC_CEN',0.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_WIN','ELC_WIN_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_WIN','ELC_WIN_OFF_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_WIN','ELC_WIN_OFF_DEEP_N',2030,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_GRO_ITC_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_GRO_ITF_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_GRO_ITG_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_GRO_ITH_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_GRO_ITI_N',2007,'ELC_CEN',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_ROOF_ITC_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_ROOF_ITF_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_ROOF_ITG_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_ROOF_ITH_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_SOL','ELC_PV_ROOF_ITI_N',2007,'ELC_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','ELC_H2_PEMFC_N',2022,'ELC_DST',0.45,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','ELC_H2_PEMFC_N',2030,'ELC_DST',0.46,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_H2','ELC_H2_PEMFC_N',2040,'ELC_DST',0.47,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NUC','ELC_NUC_LWR_N',2035,'ELC_CEN',0.33,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NUC','ELC_NUC_SMR_N',2035,'ELC_CEN',0.33,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BMU','ELC_CHP_BMU_N',2007,'ELC_CEN',0.38,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BMU','ELC_CHP_BMU_N',2007,'HET',0.38,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2007,'ELC_CEN',0.77,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2007,'HET',0.77,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'ELC_CEN',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'HET',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_N',2007,'ELC_CEN',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CC_N',2007,'HET',0.90,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CP_N',2007,'ELC_CEN',0.84,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_CP_N',2007,'HET',0.84,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2007,'ELC_CEN',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'ELC_CEN',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'HET',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','HET_NGA_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_OIL','HET_OIL_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','HET_BIO_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','HET_COA_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','HET_GEO_N',2007,'HET',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_GEO','HET_GEO_SHA_N',2007,'HET',0.10,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','HET_GEO_SHA_N',2007,'HET',0.10,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','STG_ELC_HYD_PUM_E',2006,'ELC_CEN',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','STG_ELC_HYD_PUM_E',2050,'ELC_CEN',0.80,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','STG_ELC_CEN_BTT',2020,'ELC_CEN',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','STG_ELC_DST_BTT',2020,'ELC_DST',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','STG_ELC_CEN_VRFB',2020,'ELC_CEN',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','STG_ELC_DST_VRFB',2020,'ELC_DST',0.65,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','STG_H2_TNK',2014,'H2',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',0.48,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_ELC_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_ELC_NGA_LINKED',2020,'SNK_ELC_CO2',1.00,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','DISTR_ELC',2007,'ELC_DST',0.95,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','END_USES_ELC',2007,'ELC_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','END_USES_HET',2007,'HET_DEM',1.00,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'HYD',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'SOL',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'WIN',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'HET',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_BGS',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_BLQ',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_BMU',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_CEN',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_COA',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_DST',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_GASDER',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_GEO',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_HHC',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_HYD',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_NGA',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_OIL',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_SLB',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_SOL',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'ELC_WIN',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_IMP_TECH',2007,'SYN_NGA',1.0,'PJ/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'DMY_OUT/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','SNK_ELC_CO2','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'DMY_OUT/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_ALU',2007,'ALU',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_BOR',2007,'BOR',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CER',2007,'CER',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COB',2007,'COB',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_DYS',2007,'DYS',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_EUP',2007,'EUP',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_FLU',2007,'FLU',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GAD',2007,'GAD',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GAL',2007,'GAL',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GER',2007,'GER',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GRA',2007,'GRA',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_IND',2007,'IND',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_IRI',2007,'IRI',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LIT',2007,'LIT',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MAG',2007,'MAG',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MAN',2007,'MAN',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MOL',2007,'MOL',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NEO',2007,'NEO',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIO',2007,'NIO',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PAL',2007,'PAL',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PHO',2007,'PHO',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PLA',2007,'PLA',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PRA',2007,'PRA',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_SIL',2007,'SIL',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_SIV',2007,'SIV',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TAN',2007,'TAN',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TER',2007,'TER',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TIT',2007,'TIT',1.00,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_VAN',2007,'VAN',1.00,'t/(ethos)','');
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
INSERT INTO "elasticity" VALUES('IT',2007,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'DMY_OUT',0.00,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'DMY_OUT',0.00,NULL,NULL);

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
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','BIO_METH','ELC_FT_NGA',2007,'ELC_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','H2_BL','ELC_FT_NGA',2020,'ELC_NGA',-56.10,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-101.16/0.32*0.90,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',-101.16/0.35*0.90,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_CCS','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-(101.16/0.32*0.90),'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_CCS','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',-(101.16/0.35*0.90),'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-56.10/0.48*0.90,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',-56.10/0.55*0.90,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_CCS','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-(56.10/0.48*0.90),'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_CCS','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',-(56.10/0.55*0.90),'kt/(PJ)','');

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
INSERT INTO "existing_capacity" VALUES('IT','ELC_COA_COND_E',2006,4.60,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_COA_OIL_E',2006,2.38,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_DERGAS_CC_E',2006,0.71,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_NGA_CC_E',2006,14.86,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_NGA_OIL_E',2006,3.89,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_NGA_STM_REP_E',2006,3.29,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_NGA_TURB_E',2006,1.80,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_NGA_MIN_E',2006,1.48,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_DST_TURB_E',2006,0.67,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_OIL_STM_E',2006,6.99,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_BGS_E',2006,0.27,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_BIO_CEN_E',2006,0.23,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_BIO_DST_E',2006,0.26,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_GEO_E',2006,0.75,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_SOL_E',2006,0.02,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_WIN_E',2006,2.12,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_HYD_FLO_E',2006,2.69,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_HYD_FLO_L10MW_E',2006,2.05,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_HYD_RES_E',2006,9.55,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_GASDER_CC_E',2006,1.26,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_HHC_CC_E',2006,1.65,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_NGA_CC_E',2006,8.74,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2006,1.34,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',2006,1.34,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_NGA_STM_COND_E',2006,0.71,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',2006,0.34,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2006,0.93,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_BMU_E',2006,0.58,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_BGS_COG_E',2006,0.07,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_COA_IGCC_E',2006,0.83,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','ELC_CHP_BIO_CEN_E',2006,0.17,'GW','');
INSERT INTO "existing_capacity" VALUES('IT','HET_NGA_E',2006,12.10,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','HET_GEO_E',2006,17.83,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','STG_ELC_HYD_PUM_E',2006,7.09,'GW','TIMES-Italy');
INSERT INTO "existing_capacity" VALUES('IT','UPS_IMP_ELC_CEN',2006,7.63,'GW','TERNA');
INSERT INTO "existing_capacity" VALUES('IT','UPS_EXP_ELC_CEN',2006,4.10,'GW','TERNA');

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
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,12,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2014,13,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2022,16,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_MICRO_N',2030,20,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2007,15,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2014,18,'year','');
INSERT INTO "lifetime_process" VALUES('IT','RES_CHP_NGA_CC_N',2022,20,'year','');
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2007,20,'year','');
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2014,22,'year','');
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2030,25,'year','');

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
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_NGA_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_SLB_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_NGA_SOFC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','COM_CHP_H2_PEMFC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_NGA_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_NGA_TV_N',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_BLQ_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_CI_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_STR_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_NGA_SOFC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','RES_CHP_H2_PEMFC_N',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_BGS',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_BLQ',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_BMU',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_COA',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_DERGAS',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_GEO',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_HHC',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_HYD',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_NGA',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_OIL',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_SLB',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_SOL',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_WIN',60,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_FT_H2',20,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_WIN_E',2,'year','Fictitious');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_COA_STM_P',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_NGA_CC_P',25,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_CC_P',25,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_TURB_P',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_WIN_P',30,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_NGA_CT_N',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_NGA_CC_N',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_COA_STM_N',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_OIL_STM_N',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_BLQ_N',15,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_BIO_5C_N',15,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_BIO_12C_N',15,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_BGS_AGR_N',9,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_BGS_LAN_N',9,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_HYD_MICRO_N',30,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_HYD_MINI_N',30,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_GEO_HENT_N',15,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_GEO_LENT_N',15,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_WIN_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_WIN_OFF_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_WIN_OFF_DEEP_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_GRO_ITC_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_GRO_ITF_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_GRO_ITG_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_GRO_ITH_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_GRO_ITI_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_ROOF_ITC_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_ROOF_ITF_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_ROOF_ITG_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_ROOF_ITH_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_PV_ROOF_ITI_N',20,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_H2_PEMFC_N',15,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_NUC_LWR_N',60,'year','ATB 2022');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_NUC_SMR_N',60,'year','ATB 2022');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_BMU_N',20,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_TURB_N',25,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_CC_N',30,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_CP_N',35,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','ELC_CHP_NGA_TAP_N',35,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_NGA_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_OIL_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_BIO_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_COA_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_GEO_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','HET_GEO_SHA_N',60,'year','TIMES-Italy');
INSERT INTO "lifetime_tech" VALUES('IT','STG_ELC_CEN_BTT',15,'year','ATB 2022');
INSERT INTO "lifetime_tech" VALUES('IT','STG_ELC_DST_BTT',15,'year','ATB 2022');
INSERT INTO "lifetime_tech" VALUES('IT','STG_ELC_CEN_VRFB',12,'year','10.1016/j.mtener.2025.101805');
INSERT INTO "lifetime_tech" VALUES('IT','STG_ELC_DST_VRFB',12,'year','10.1016/j.mtener.2025.101805');
INSERT INTO "lifetime_tech" VALUES('IT','STG_H2_TNK',22,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_COA',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_COA_LINKED',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_NGA',30,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_NGA_LINKED',30,'year','NREL');

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
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_BLQ','ge',0.50*18.32,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_BLQ','ge',0.50*26.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_BLQ','ge',0.50*35.52,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_BLQ','ge',0.50*35.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_BLQ','ge',0.50*34.75,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_BLQ','ge',0.50*36.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_FT_BLQ','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_SLB','ge',0.50*74.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_SLB','ge',0.50*102.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_SLB','ge',0.50*74.67,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_SLB','ge',0.50*107.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_SLB','ge',0.50*106.45,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_SLB','ge',0.50*108.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_FT_SLB','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_FT_NGA','ge',1088.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_NGA','ge',1029.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_NGA','ge',803.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_FT_NGA','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_BIO_DST_E','ge',1.43,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_BIO_DST_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_BMU_E','ge',5.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_BMU_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_HHC_CC_E','ge',24.20,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_HHC_CC_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_CC_E','ge',90.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_CC_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_STM_COND_E','ge',6.20,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_STM_COND_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','ge',12.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_TURB_CEN_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_TURB_DST_E','ge',12.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_TURB_DST_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','ge',5.73,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_OIL_STM_COND_CEN_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','ge',9.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_OIL_STM_COND_DST_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_COA_COND_E','ge',73.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_COA_COND_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_COA_OIL_E','ge',20.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_COA_OIL_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_DERGAS_CC_E','ge',4.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_DERGAS_CC_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_DST_TURB_E','ge',0.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_DST_TURB_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_GEO_E','ge',19.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_GEO_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_OIL_E','ge',10.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_OIL_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_STM_REP_E','ge',18.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_NGA_STM_REP_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_TURB_E','ge',0.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_TURB_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_OIL_STM_E','ge',51.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_OIL_STM_E','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'STG_ELC_HYD_PUM_E','ge',20.38,'PJ','TIMES-Italy');
INSERT INTO "limit_activity" VALUES('IT',2008,'STG_ELC_HYD_PUM_E','ge',18.00,'PJ','TIMES-Italy');
INSERT INTO "limit_activity" VALUES('IT',2022,'STG_ELC_HYD_PUM_E','ge',0.00,'PJ','TIMES-Italy');
INSERT INTO "limit_activity" VALUES('IT',2007,'UPS_IMP_ELC_CEN','ge',0.90*193.77,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'UPS_IMP_ELC_CEN','ge',0.90*171.99,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'UPS_IMP_ELC_CEN','ge',0.90*182.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'UPS_IMP_ELC_CEN','ge',0.90*185.03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'UPS_IMP_ELC_CEN','ge',0.90*199.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'UPS_IMP_ELC_CEN','ge',0.90*194.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'UPS_IMP_ELC_CEN','ge',0.90*182.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'UPS_IMP_ELC_CEN','ge',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2027,'UPS_IMP_BIO_METH','le',50.00,'PJ','Assumption');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_BLQ','le',20.25,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_BLQ','le',29.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_BLQ','le',39.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_BLQ','le',38.84,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_BLQ','le',38.40,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_BLQ','le',43.66,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_SLB','le',82.02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_SLB','le',112.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_SLB','le',82.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_SLB','le',118.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_SLB','le',117.66,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_SLB','le',119.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_FT_COA','le',498.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_COA','le',447.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_COA','le',372.63,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_FT_COA','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_FT_COA','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_GEO','le',206.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_GEO','le',212.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_GEO','le',228.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_GEO','le',236.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_GEO','le',230.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_GEO','le',227.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_NGA','le',1172.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_FT_NGA','le',5*1172.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_BGS_E','le',3.91,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_BGS_E','le',3.91,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_BGS_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_BIO_CEN_E','le',4.67,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_BIO_CEN_E','le',4.67,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_BIO_CEN_E','le',3.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_BIO_CEN_E','le',3.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_BIO_CEN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_BIO_DST_E','le',5.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_BIO_DST_E','le',5.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_BIO_DST_E','le',2.58,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_BIO_DST_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_BGS_COG_E','le',2.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_BGS_COG_E','le',2.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_BGS_COG_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_BIO_CEN_E','le',6.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_BIO_CEN_E','le',6.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_BIO_CEN_E','le',4.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_CHP_BIO_CEN_E','le',1.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_BIO_CEN_E','le',1.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_BIO_CEN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_BMU_E','le',16.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_BMU_E','le',16.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_CHP_BMU_E','le',16.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_CHP_BMU_E','le',16.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_CHP_BMU_E','le',16.02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_CHP_BMU_E','le',6.30,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_CHP_BMU_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_COA_IGCC_E','le',21.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_COA_IGCC_E','le',21.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_COA_IGCC_E','le',20.77,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_CHP_COA_IGCC_E','le',19.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_COA_IGCC_E','le',16.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_COA_IGCC_E','le',16.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_COA_IGCC_E','le',16.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_COA_IGCC_E','le',15.32,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_CHP_COA_IGCC_E','le',14.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_CHP_COA_IGCC_E','le',2.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_CHP_COA_IGCC_E','le',0.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_CHP_COA_IGCC_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_GASDER_CC_E','le',49.89,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_GASDER_CC_E','le',45.05,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_CHP_GASDER_CC_E','le',45.05,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_HHC_CC_E','le',70.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_CHP_HHC_CC_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_CC_E','le',254.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_NGA_CC_E','le',250.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_NGA_CC_E','le',234.97,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_CHP_NGA_CC_E','le',220.76,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_NGA_CC_E','le',194.18,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_NGA_CC_E','le',178.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_CC_E','le',163.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_NGA_CC_E','le',159.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_CHP_NGA_CC_E','le',157.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_CHP_NGA_CC_E','le',141.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_CHP_NGA_CC_E','le',132.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_CHP_NGA_CC_E','le',24.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_CHP_NGA_CC_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_STM_COND_E','le',24.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_CHP_NGA_STM_COND_E','le',24.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_NGA_STM_COND_E','le',18.98,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_NGA_STM_COND_E','le',13.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_STM_COND_E','le',13.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_NGA_STM_COND_E','le',0.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_CHP_NGA_STM_COND_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','le',49.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_NGA_TURB_CEN_E','le',49.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_NGA_TURB_CEN_E','le',47.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_TURB_CEN_E','le',47.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_NGA_TURB_CEN_E','le',18.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_CHP_NGA_TURB_CEN_E','le',18.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_CHP_NGA_TURB_CEN_E','le',14.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_CHP_NGA_TURB_CEN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_NGA_TURB_DST_E','le',48.40,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_CHP_NGA_TURB_DST_E','le',48.40,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_CHP_NGA_TURB_DST_E','le',46.58,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_NGA_TURB_DST_E','le',46.58,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_NGA_TURB_DST_E','le',17.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_CHP_NGA_TURB_DST_E','le',17.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_CHP_NGA_TURB_DST_E','le',14.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_CHP_NGA_TURB_DST_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','le',11.75,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_CHP_OIL_STM_COND_CEN_E','le',11.75,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_CHP_OIL_STM_COND_CEN_E','le',5.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_OIL_STM_COND_CEN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','le',27.92,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_CHP_OIL_STM_COND_DST_E','le',27.92,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_CHP_OIL_STM_COND_DST_E','le',21.03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_CHP_OIL_STM_COND_DST_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_COA_COND_E','le',94.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_COA_COND_E','le',94.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_COA_COND_E','le',81.99,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_COA_COND_E','le',81.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_COA_COND_E','le',81.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_COA_COND_E','le',73.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_COA_COND_E','le',65.77,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_COA_COND_E','le',59.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_COA_COND_E','le',53.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_COA_COND_E','le',26.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_COA_COND_E','le',0.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_COA_COND_E','le',0.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_COA_COND_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_COA_OIL_E','le',37.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_COA_OIL_E','le',37.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_COA_OIL_E','le',31.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_COA_OIL_E','le',23.65,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_COA_OIL_E','le',15.77,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_COA_OIL_E','le',11.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_COA_OIL_E','le',7.73,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_COA_OIL_E','le',5.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_COA_OIL_E','le',3.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_COA_OIL_E','le',2.65,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_COA_OIL_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_DERGAS_CC_E','le',9.45,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_DERGAS_CC_E','le',5.99,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_DERGAS_CC_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_DST_TURB_E','le',0.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_DST_TURB_E','le',0.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_DST_TURB_E','le',0.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_DST_TURB_E','le',0.45,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_DST_TURB_E','le',0.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_DST_TURB_E','le',0.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_DST_TURB_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_GEO_E','le',19.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_GEO_E','le',19.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_GEO_E','le',16.76,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_GEO_E','le',15.76,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_GEO_E','le',13.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_GEO_E','le',10.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_GEO_E','le',8.44,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_GEO_E','le',6.05,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_GEO_E','le',1.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_GEO_E','le',0.25,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_GEO_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_HYD_FLO_E','le',34.89,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_HYD_FLO_E','le',48.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_HYD_FLO_E','le',48.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_HYD_FLO_E','le',38.91,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_HYD_FLO_E','le',48.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_HYD_FLO_L10MW_E','le',26.60,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_HYD_FLO_L10MW_E','le',33.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_HYD_FLO_L10MW_E','le',33.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_HYD_FLO_L10MW_E','le',27.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_HYD_FLO_L10MW_E','le',28.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_HYD_FLO_L10MW_E','le',29.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_HYD_RES_E','le',85.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_HYD_RES_E','le',107.98,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_HYD_RES_E','le',107.98,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_HYD_RES_E','le',91.98,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_HYD_RES_E','le',102.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_CC_E','le',256.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_NGA_CC_E','le',256.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_CC_E','le',256.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_NGA_CC_E','le',256.32,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_NGA_CC_E','le',256.32,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_NGA_CC_E','le',256.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_NGA_CC_E','le',247.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_NGA_CC_E','le',221.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_NGA_CC_E','le',27.20,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_NGA_CC_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_MIN_E','le',4.89,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_NGA_MIN_E','le',4.89,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_MIN_E','le',4.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_NGA_MIN_E','le',4.76,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_NGA_MIN_E','le',4.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_NGA_MIN_E','le',3.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_NGA_MIN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_OIL_E','le',16.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_NGA_OIL_E','le',16.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_NGA_OIL_E','le',15.13,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_NGA_OIL_E','le',13.60,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_OIL_E','le',13.60,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_NGA_OIL_E','le',10.88,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_NGA_OIL_E','le',9.52,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_NGA_OIL_E','le',4.87,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_NGA_OIL_E','le',4.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_NGA_OIL_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_STM_REP_E','le',36.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_NGA_STM_REP_E','le',36.29,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_NGA_STM_REP_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_NGA_TURB_E','le',1.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_NGA_TURB_E','le',0.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_NGA_TURB_E','le',0.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_NGA_TURB_E','le',0.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_NGA_TURB_E','le',0.50,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_NGA_TURB_E','le',0.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_NGA_TURB_E','le',0.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_NGA_TURB_E','le',0.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_NGA_TURB_E','le',0.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_NGA_TURB_E','le',0.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'ELC_NGA_TURB_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_OIL_STM_E','le',65.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_OIL_STM_E','le',53.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_OIL_STM_E','le',53.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_OIL_STM_E','le',29.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_OIL_STM_E','le',20.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_OIL_STM_E','le',20.74,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_OIL_STM_E','le',8.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_OIL_STM_E','le',8.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_OIL_STM_E','le',3.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_OIL_STM_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_SOL_E','le',0.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_SOL_E','le',0.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_SOL_E','le',0.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_SOL_E','le',0.11,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_SOL_E','le',0.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_SOL_E','le',0.07,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_SOL_E','le',0.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_SOL_E','le',0.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_SOL_E','le',0.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_SOL_E','le',0.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_SOL_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_WIN_E','le',10.70,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_WIN_E','le',11.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_WIN_E','le',10.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_WIN_E','le',11.20,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_WIN_E','le',9.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_WIN_E','le',7.17,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_WIN_E','le',6.80,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_WIN_E','le',1.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'ELC_WIN_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'HET_GEO_E','le',17.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'HET_GEO_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'HET_NGA_E','le',12.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'HET_NGA_E','le',0.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'STG_ELC_HYD_PUM_E','le',22.15,'PJ','TIMES-Italy');
INSERT INTO "limit_activity" VALUES('IT',2050,'STG_ELC_HYD_PUM_E','le',25.81,'PJ','TIMES-Italy');
INSERT INTO "limit_activity" VALUES('IT',2007,'UPS_IMP_ELC_CEN','le',193.77,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'UPS_IMP_ELC_CEN','le',171.99,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'UPS_IMP_ELC_CEN','le',182.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'UPS_IMP_ELC_CEN','le',185.03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'UPS_IMP_ELC_CEN','le',199.04,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'UPS_IMP_ELC_CEN','le',194.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'UPS_IMP_ELC_CEN','le',182.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'UPS_IMP_ELC_CEN','le',191.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'UPS_IMP_ELC_CEN','le',209.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'UPS_IMP_ELC_CEN','le',214.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'UPS_IMP_ELC_CEN','le',300.00,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'UPS_EXP_ELC_CEN','le',10.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2008,'UPS_EXP_ELC_CEN','le',13.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'UPS_EXP_ELC_CEN','le',7.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'UPS_EXP_ELC_CEN','le',10.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'UPS_EXP_ELC_CEN','le',16.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'UPS_EXP_ELC_CEN','le',23.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'UPS_EXP_ELC_CEN','le',23.30,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'UPS_EXP_ELC_CEN','le',23.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'UPS_EXP_ELC_CEN','le',22.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'UPS_EXP_ELC_CEN','le',24.10,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'UPS_EXP_ELC_CEN','le',26.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'UPS_EXP_ELC_CEN','le',28.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'UPS_EXP_ELC_CEN','le',30.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_FT_OIL_PROD_GRP','ge',377.82,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_FT_OIL_PROD_GRP','ge',285.35,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_FT_OIL_PROD_GRP','ge',206.18,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_FT_OIL_PROD_GRP','ge',173.34,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_FT_OIL_PROD_GRP','ge',168.67,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_FT_OIL_PROD_GRP','ge',155.46,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_FT_OIL_PROD_GRP','ge',139.33,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_BMU_GRP','ge',7.34/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_BMU_GRP','ge',8.82/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_BMU_GRP','ge',0.00/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_BIO_GRP','ge',60.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_BIO_GRP','ge',72.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_HYD_GRP','ge',0.50*158.72,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_HYD_GRP','ge',0.50*159.61,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_HYD_GRP','ge',0.50*164.06,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_HYD_GRP','ge',0.50*133.30,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_HYD_GRP','ge',0.50*159.82,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_HYD_GRP','ge',0.50*160.36,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_SOL_GRP','ge',15.25,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_SOL_GRP','ge',69.17,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_SOL_GRP','ge',77.38,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_SOL_GRP','ge',79.48,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_SOL_GRP','ge',79.25,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_SOL_GRP','ge',85.30,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_SOL_GRP','ge',90.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_SOL_GRP','ge',90.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_WIN_GRP','ge',0.75*27.57,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_WIN_GRP','ge',0.75*38.21,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_WIN_GRP','ge',0.75*60.79,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_WIN_GRP','ge',0.75*60.79,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_GEO_HET_GRP','le',32.0,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_GEO_HET_GRP','le',32.0,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_GEO_HET_GRP','le',50.2,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_GEO_HET_GRP','le',75.3,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2008,'ELC_BGS_GRP','le',6.05,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_BGS_GRP','le',8.98,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'ELC_BGS_GRP','le',22.81,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'ELC_BGS_GRP','le',31.02,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_BGS_GRP','le',31.29,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'ELC_BGS_GRP','le',31.33,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_BGS_GRP','le',30.87,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'ELC_BMU_GRP','le',8.08/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_BMU_GRP','le',9.70/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_BMU_GRP','le',11.64/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_BMU_GRP','le',17.46/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_BMU_GRP','le',26.20/0.50,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2007,'ELC_COA_GRP','le',207.19,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'ELC_COA_GRP','le',144.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'ELC_COA_GRP','le',170.29,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2025,'ELC_COA_GRP','le',46.83,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2030,'ELC_COA_GRP','le',0.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2050,'ELC_COA_GRP','le',0.00,NULL,'PJ');

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
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_ELC_COA',2020,'ELC_CEN','le',0.90,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_ELC_NGA',2020,'ELC_CEN','le',0.90,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_H2_PEMFC_N',2025,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_H2_PEMFC_N',2025,'HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CC_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CC_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_CI_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_MICRO_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_SOFC_N',2020,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_NGA_SOFC_N',2020,'HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_SLB_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','COM_CHP_SLB_CI_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_AGR_N',2007,'ELC_DST','le',0.58,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_AGR_N',2022,'ELC_DST','le',0.65,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_E',2006,'ELC_DST','le',0.51,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_E',2010,'ELC_DST','le',0.51,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_E',2020,'ELC_DST','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_LAN_N',2007,'ELC_DST','le',0.49,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BGS_LAN_N',2030,'ELC_DST','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_12C_N',2007,'ELC_CEN','le',0.57,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_5C_N',2007,'ELC_CEN','le',0.57,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_CEN_E',2006,'ELC_CEN','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_CEN_E',2010,'ELC_CEN','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_CEN_E',2020,'ELC_CEN','le',0.68,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_DST_E',2006,'ELC_DST','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_DST_E',2010,'ELC_DST','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BIO_DST_E',2020,'ELC_DST','le',0.68,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_BLQ_N',2007,'ELC_CEN','le',0.70,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BGS_COG_E',2006,'ELC_CEN','le',0.45,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BGS_COG_E',2006,'HET','le',0.45,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BGS_COG_E',2020,'ELC_CEN','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BGS_COG_E',2020,'HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BIO_CEN_E',2006,'ELC_CEN','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BIO_CEN_E',2006,'HET','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_E',2006,'ELC_CEN','le',0.44,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_E',2006,'HET','le',0.44,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_E',2020,'ELC_CEN','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_E',2020,'HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2007,'ELC_CEN','le',0.70,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2007,'HET','le',0.70,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2014,'ELC_CEN','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2014,'HET','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2022,'ELC_CEN','le',0.78,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2022,'HET','le',0.78,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2030,'ELC_CEN','le',0.80,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_BMU_N',2030,'HET','le',0.80,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_COA_IGCC_E',2006,'ELC_CEN','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_COA_IGCC_E',2006,'HET','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2006,'ELC_CEN','le',0.69,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2006,'HET','le',0.69,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2010,'ELC_CEN','le',0.69,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2010,'HET','le',0.69,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2020,'ELC_CEN','le',0.79,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_GASDER_CC_E',2020,'HET','le',0.79,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2006,'ELC_CEN','le',0.84,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2006,'HET','le',0.84,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2010,'ELC_CEN','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2010,'HET','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2020,'ELC_CEN','le',0.86,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_HHC_CC_E',2020,'HET','le',0.86,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2006,'ELC_CEN','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2006,'HET','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2010,'ELC_CEN','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2010,'HET','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2020,'ELC_CEN','le',0.77,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_E',2020,'HET','le',0.77,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_N',2007,'ELC_CEN','le',0.34,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_N',2007,'HET','le',0.34,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_P',2007,'ELC_CEN','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_P',2007,'HET','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_P',2030,'ELC_CEN','le',0.72,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CC_P',2030,'HET','le',0.72,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CP_N',2007,'ELC_CEN','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_CP_N',2007,'HET','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_STM_COND_E',2006,'ELC_CEN','le',0.55,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_STM_COND_E',2006,'HET','le',0.55,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_STM_COND_E',2020,'ELC_CEN','le',0.59,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_STM_COND_E',2020,'HET','le',0.59,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TAP_N',2007,'ELC_CEN','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TAP_N',2007,'HET','le',0.74,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2006,'ELC_CEN','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2006,'HET','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2010,'ELC_CEN','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2010,'HET','le',0.61,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2020,'ELC_CEN','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_CEN_E',2020,'HET','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',2006,'ELC_DST','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',2006,'HET','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',2020,'ELC_DST','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_DST_E',2020,'HET','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_N',2007,'ELC_CEN','le',0.57,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_N',2007,'HET','le',0.57,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_P',2007,'ELC_CEN','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_P',2007,'HET','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_P',2030,'ELC_CEN','le',0.62,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_NGA_TURB_P',2030,'HET','le',0.62,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',2006,'ELC_CEN','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',2006,'HET','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',2020,'ELC_CEN','le',0.62,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_CEN_E',2020,'HET','le',0.62,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2006,'ELC_DST','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2006,'HET','le',0.60,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2010,'ELC_DST','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2010,'HET','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2020,'ELC_DST','le',0.56,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_CHP_OIL_STM_COND_DST_E',2020,'HET','le',0.56,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_COND_E',2006,'ELC_CEN','le',0.65,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_COND_E',2020,'ELC_CEN','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_OIL_E',2006,'ELC_CEN','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_OIL_E',2020,'ELC_CEN','le',0.72,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_STM_N',2007,'ELC_CEN','le',0.76,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_STM_P',2007,'ELC_CEN','le',0.70,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_COA_STM_P',2030,'ELC_CEN','le',0.80,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_DERGAS_CC_E',2006,'ELC_CEN','le',0.38,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_DERGAS_CC_E',2020,'ELC_CEN','le',0.83,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_DST_TURB_E',2006,'ELC_CEN','le',0.03,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_DST_TURB_E',2010,'ELC_CEN','le',0.40,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_DST_TURB_E',2020,'ELC_CEN','le',0.80,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_FT_H2',2020,'ELC_H2','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_GEO_E',2006,'ELC_CEN','le',0.80,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_GEO_E',2020,'ELC_CEN','le',0.83,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_GEO_HENT_N',2007,'ELC_CEN','le',0.86,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_GEO_LENT_N',2007,'ELC_CEN','le',0.88,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_GEO_LENT_N',2040,'ELC_CEN','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_H2_PEMFC_N',2022,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_E',2006,'ELC_CEN','le',0.55,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_E',2010,'ELC_CEN','le',0.55,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_E',2020,'ELC_CEN','le',0.89,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_N',2007,'ELC_CEN','le',0.90,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_P',2007,'ELC_CEN','le',0.45,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CC_P',2030,'ELC_CEN','le',0.80,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_CT_N',2007,'ELC_CEN','le',0.95,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_MIN_E',2006,'ELC_CEN','le',0.11,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_MIN_E',2020,'ELC_CEN','le',0.66,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_OIL_E',2006,'ELC_CEN','le',0.16,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_OIL_E',2010,'ELC_CEN','le',0.16,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_OIL_E',2020,'ELC_CEN','le',0.83,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_STM_REP_E',2006,'ELC_CEN','le',0.35,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_STM_REP_E',2010,'ELC_CEN','le',0.35,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_STM_REP_E',2020,'ELC_CEN','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_TURB_E',2006,'ELC_CEN','le',0.03,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_TURB_E',2010,'ELC_CEN','le',0.03,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NGA_TURB_E',2020,'ELC_CEN','le',0.80,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NUC_LWR_N',2035,'ELC_CEN','le',0.94,'ATB 2022');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_NUC_SMR_N',2035,'ELC_CEN','le',0.94,'ATB 2022');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_OIL_STM_E',2006,'ELC_CEN','le',0.30,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_OIL_STM_E',2010,'ELC_CEN','le',0.40,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_OIL_STM_E',2020,'ELC_CEN','le',0.87,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','ELC_OIL_STM_N',2007,'ELC_CEN','le',0.85,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_BIO_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_COA_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_GEO_E',2006,'HET','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_GEO_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_GEO_SHA_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_NGA_E',2006,'HET','le',0.50,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_NGA_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','HET_OIL_N',2007,'HET','le',0.60,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_BLQ_CI_N',2014,'ELC_DST','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_BLQ_CI_N',2014,'HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_CI_N',2007,'ELC_DST','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_CI_N',2007,'HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TG_N',2007,'ELC_DST','le',0.74,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TG_N',2007,'HET','le',0.74,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TV_N',2007,'ELC_DST','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TV_N',2007,'HET','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_H2_PEMFC_N',2020,'HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CC_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CC_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CI_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_CI_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_MICRO_N',2007,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,'ELC_DST','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_SOFC_N',2020,'HET','le',0.90,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_STR_N',2022,'ELC_DST','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','RES_CHP_NGA_STR_N',2022,'HET','le',0.34,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','STG_ELC_HYD_PUM_E',2006,'ELC_CEN','le',0.11,'TIMES-Italy');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','STG_H2_TNK',2014,'H2','le',0.98,'JRC-EU-TIMES');

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
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_COA_STM_P','le',0.80,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2014,'ELC_COA_STM_P','le',2.00,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_NGA_CC_P','le',5.84,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_NGA_CC_P','le',8.50,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_NGA_CC_P','le',11.17,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2012,'ELC_NGA_CC_P','le',11.94,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_CHP_NGA_CC_P','le',1.64,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_CHP_NGA_CC_P','le',2.51,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_CHP_NGA_CC_P','le',3.25,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_CHP_NGA_TURB_P','le',0.10,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_WIN_P','le',0.60,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_WIN_P','le',1.62,'GW','');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_HYD_MICRO_N','le',0.500,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_HYD_MICRO_N','le',0.500,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_HYD_MICRO_N','le',0.837,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_HYD_MICRO_N','le',0.875,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_HYD_MINI_N','le',1.500,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_HYD_MINI_N','le',2.284,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_HYD_MINI_N','le',2.352,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_WIN_N','le',10.84,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_WIN_N','le',12.02,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2025,'ELC_WIN_N','le',14.42,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_WIN_N','le',17.30,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_WIN_N','le',55.65,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_WIN_OFF_N','le',0.00,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_WIN_OFF_N','le',0.00,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2025,'ELC_WIN_OFF_N','le',0.10,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_WIN_OFF_N','le',2.10,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_WIN_OFF_N','le',8.40,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_WIN_OFF_DEEP_N','le',0.00,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2040,'ELC_WIN_OFF_DEEP_N','le',1.26,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_WIN_OFF_DEEP_N','le',6.30,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_GRO_ITC_N','le',4.40,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_GRO_ITC_N','le',15.95,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_GRO_ITF_N','le',2.99,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_GRO_ITF_N','le',28.18,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_GRO_ITG_N','le',1.75,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_GRO_ITG_N','le',18.20,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_GRO_ITH_N','le',4.92,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_GRO_ITH_N','le',20.20,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_GRO_ITI_N','le',2.81,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_GRO_ITI_N','le',19.39,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_ROOF_ITC_N','le',0.87,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_ROOF_ITC_N','le',6.22,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_ROOF_ITF_N','le',3.78,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_ROOF_ITF_N','le',5.50,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_ROOF_ITG_N','le',1.20,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_ROOF_ITG_N','le',2.67,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_ROOF_ITH_N','le',1.41,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_ROOF_ITH_N','le',4.74,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_PV_ROOF_ITI_N','le',1.89,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_PV_ROOF_ITI_N','le',4.67,'GW','10.1016/j.esr.2019.100379');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_BGS_AGR_N','le',0.18,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_BGS_AGR_N','le',0.27,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_BGS_AGR_N','le',0.38,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_BGS_AGR_N','le',0.67,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_BGS_LAN_N','le',0.22,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_BGS_LAN_N','le',0.25,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_BGS_LAN_N','le',0.29,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_BGS_LAN_N','le',0.35,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_BGS_LAN_N','le',0.54,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_BGS_LAN_N','le',0.72,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_BIO_5C_N','le',0.73,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_BIO_5C_N','le',0.57,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_BIO_5C_N','le',0.83,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_BIO_5C_N','le',1.57,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_BIO_5C_N','le',2.56,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_BIO_12C_N','le',0.30,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_BIO_12C_N','le',0.24,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_BIO_12C_N','le',0.32,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_BIO_12C_N','le',0.83,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2040,'ELC_BIO_12C_N','le',0.61,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_BIO_12C_N','le',1.20,'GW','TIMES-Italy');
INSERT INTO "limit_capacity" VALUES('IT',2007,'UPS_IMP_ELC_CEN','le',7.63,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2016,'UPS_IMP_ELC_CEN','le',7.63,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2022,'UPS_IMP_ELC_CEN','le',9.93,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2050,'UPS_IMP_ELC_CEN','le',14.89,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2007,'UPS_EXP_ELC_CEN','le',4.10,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2016,'UPS_EXP_ELC_CEN','le',4.10,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2022,'UPS_EXP_ELC_CEN','le',5.69,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2050,'UPS_EXP_ELC_CEN','le',8.53,'GW','TERNA');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_BLQ_GRP','le',0.120,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_BLQ_GRP','le',0.801,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_BLQ_GRP','le',1.202,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_BLQ_GRP','le',1.954,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_HYD_N_GRP','le',0.10,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_HYD_N_GRP','le',0.80,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2016,'ELC_HYD_N_GRP','le',2.10,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_HYD_N_GRP','le',2.30,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_HYD_N_GRP','le',2.50,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2007,'ELC_GEO_GRP','le',0.81,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_GEO_GRP','le',0.77,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_GEO_GRP','le',1.00,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_GEO_GRP','le',1.15,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2040,'ELC_GEO_GRP','le',1.31,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_GEO_GRP','le',1.43,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2008,'ELC_WIN_GRP','le',3.74,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2010,'ELC_WIN_GRP','le',5.79,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2012,'ELC_WIN_GRP','le',8.10,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2016,'ELC_WIN_GRP','le',9.38,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2020,'ELC_WIN_GRP','le',10.68,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2025,'ELC_WIN_GRP','le',15.69,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2030,'ELC_WIN_GRP','le',19.41,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_WIN_GRP','le',70.35,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2035,'ELC_NUC_GRP','le',0.00,NULL,'GW');
INSERT INTO "limit_capacity" VALUES('IT',2050,'ELC_NUC_GRP','le',0.00,NULL,'GW');

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
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_COA','ELC_COA_OIL_E','ge',0.85,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_OIL','ELC_COA_OIL_E','ge',0.15,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_NGA','ELC_NGA_OIL_E','ge',0.37,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_OIL','ELC_NGA_OIL_E','ge',0.63,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_GEO','HET_GEO_SHA_N','ge',0.998,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_CEN','HET_GEO_SHA_N','ge',0.002,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_CEN','ELC_FT_H2','ge',0.06,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','ELC_FT_H2','ge',0.06,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_CEN','ELC_FT_H2','le',0.06,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','ELC_FT_H2','le',0.06,'');

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
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_PTC','ELC_FT_HHC','ge',0.89,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_PTC','ELC_FT_HHC','ge',0.79,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_BMU','ELC_FT_BMU','ge',0.95,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_BMU','ELC_FT_BMU','ge',0.90,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_BIN','ELC_FT_BMU','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_BIN','ELC_FT_BMU','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','ELC_FT_NGA','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','ELC_FT_NGA','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','ELC_FT_NGA','ge',0.025,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'COA_HCO','ELC_FT_COA','le',0.89,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'COA_OVC','ELC_FT_COA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'GAS_BFG','ELC_FT_COA','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'GAS_COG','ELC_FT_COA','le',0.04,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'COA_HCO','ELC_FT_COA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'COA_OVC','ELC_FT_COA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'GAS_BFG','ELC_FT_COA','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'GAS_COG','ELC_FT_COA','le',0.04,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_CRD','ELC_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_DST','ELC_FT_OIL','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_GSL','ELC_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_HFO','ELC_FT_OIL','le',0.99,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_KER','ELC_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_LPG','ELC_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_NAP','ELC_FT_OIL','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_CRD','ELC_FT_OIL','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_DST','ELC_FT_OIL','le',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_GSL','ELC_FT_OIL','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_HFO','ELC_FT_OIL','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_KER','ELC_FT_OIL','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_LPG','ELC_FT_OIL','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_NAP','ELC_FT_OIL','le',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','ELC_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'SYN_NGA','ELC_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','ELC_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','ELC_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','ELC_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','ELC_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','ELC_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','ELC_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','ELC_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','ELC_FT_NGA','le',0.06,'');

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
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.375E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CI_N','HET','ge',5.625E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.545E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CI_N','HET','ge',5.455E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CI_N','ELC_DST','ge',4.767E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CI_N','HET','ge',5.233E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CI_N','ELC_DST','ge',5.102E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CI_N','HET','ge',4.898E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',3.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_MICRO_N','HET','ge',6.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',3.780E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_MICRO_N','HET','ge',6.220E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',4.186E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_MICRO_N','HET','ge',5.814E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_MICRO_N','ELC_DST','ge',4.783E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_MICRO_N','HET','ge',5.217E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_NGA_CC_N','HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_NGA_CC_N','HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_NGA_CC_N','HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CC_N','ELC_DST','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_CC_N','HET','ge',5.000E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.375E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'COM_CHP_SLB_CI_N','HET','ge',5.625E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.545E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'COM_CHP_SLB_CI_N','HET','ge',5.455E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.767E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'COM_CHP_SLB_CI_N','HET','ge',5.233E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.926E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_SLB_CI_N','HET','ge',5.074E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_CHP_SLB_CI_N','ELC_DST','ge',4.762E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'COM_CHP_SLB_CI_N','HET','ge',5.238E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.65,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'COM_CHP_NGA_SOFC_N','HET','ge',0.35,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.69,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_NGA_SOFC_N','HET','ge',0.31,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N','ELC_DST','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_NGA_SOFC_N','HET','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N','ELC_DST','ge',0.54,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'COM_CHP_H2_PEMFC_N','HET','ge',0.46,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N','ELC_DST','ge',0.59,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'COM_CHP_H2_PEMFC_N','HET','ge',0.41,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.438,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.455,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.477,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.511,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.518,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.392,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.400,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.414,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.438,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.200,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.211,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.225,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.241,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.431,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.453,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.466,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.483,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_CI_N','HET','ge',0.562,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_CI_N','HET','ge',0.545,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_CI_N','HET','ge',0.523,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_CI_N','HET','ge',0.489,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_NGA_CI_N','HET','ge',0.482,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TG_N','HET','ge',0.608,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TG_N','HET','ge',0.600,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TG_N','HET','ge',0.586,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TG_N','HET','ge',0.562,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TV_N','HET','ge',0.800,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TV_N','HET','ge',0.789,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TV_N','HET','ge',0.775,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TV_N','HET','ge',0.759,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_BLQ_CI_N','HET','ge',0.569,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_BLQ_CI_N','HET','ge',0.547,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_BLQ_CI_N','HET','ge',0.534,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_BLQ_CI_N','HET','ge',0.517,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CI_N','ELC_DST','ge',4.375E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_CI_N','ELC_DST','ge',4.545E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_CI_N','ELC_DST','ge',4.767E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_CI_N','ELC_DST','ge',5.102E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CI_N','HET','ge',5.625E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_CI_N','HET','ge',5.455E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_CI_N','HET','ge',5.233E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_CI_N','HET','ge',4.898E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',3.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',3.780E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',4.186E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N','ELC_DST','ge',4.783E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_MICRO_N','HET','ge',6.500E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'RES_CHP_NGA_MICRO_N','HET','ge',6.220E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_MICRO_N','HET','ge',5.814E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_MICRO_N','HET','ge',5.217E-01,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CC_N','ELC_DST','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'RES_CHP_NGA_CC_N','HET','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_STR_N','ELC_DST','ge',0.80,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'RES_CHP_NGA_STR_N','HET','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_STR_N','ELC_DST','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_NGA_STR_N','HET','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N','ELC_DST','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_NGA_SOFC_N','HET','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N','ELC_DST','ge',0.61,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_NGA_SOFC_N','HET','ge',0.39,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.54,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2020,'RES_CHP_H2_PEMFC_N','HET','ge',0.46,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.53,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2025,'RES_CHP_H2_PEMFC_N','HET','ge',0.47,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N','ELC_DST','ge',0.58,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'RES_CHP_H2_PEMFC_N','HET','ge',0.42,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_GASDER_CC_E','ELC_CEN','ge',0.61,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_GASDER_CC_E','HET','ge',0.39,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_HHC_CC_E','ELC_CEN','ge',0.62,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_HHC_CC_E','HET','ge',0.38,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_E','ELC_CEN','ge',0.72,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_E','HET','ge',0.28,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','ELC_CEN','ge',0.52,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','HET','ge',0.48,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_DST_E','ELC_DST','ge',0.52,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_DST_E','HET','ge',0.48,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_STM_COND_E','ELC_CEN','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_STM_COND_E','HET','ge',0.50,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','ELC_CEN','ge',0.63,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','HET','ge',0.37,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','ELC_DST','ge',0.63,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','HET','ge',0.37,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BMU_E','ELC_CEN','ge',0.44,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BMU_E','HET','ge',0.56,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BGS_COG_E','ELC_CEN','ge',0.45,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BGS_COG_E','HET','ge',0.55,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_COA_IGCC_E','ELC_CEN','ge',0.79,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_COA_IGCC_E','HET','ge',0.21,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BIO_CEN_E','ELC_CEN','ge',0.47,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BIO_CEN_E','HET','ge',0.53,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_P','ELC_CEN','ge',0.80,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_P','HET','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'ELC_CHP_NGA_CC_P','ELC_CEN','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'ELC_CHP_NGA_CC_P','HET','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_P','ELC_CEN','ge',0.52,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_P','HET','ge',0.48,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'ELC_CHP_NGA_TURB_P','ELC_CEN','ge',0.25,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'ELC_CHP_NGA_TURB_P','HET','ge',0.75,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BMU_N','ELC_CEN','ge',0.67,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_BMU_N','HET','ge',0.33,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_N','ELC_CEN','ge',0.42,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TURB_N','HET','ge',0.58,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_TURB_N','ELC_CEN','ge',0.45,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_TURB_N','HET','ge',0.55,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_N','ELC_CEN','ge',0.62,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CC_N','HET','ge',0.38,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_CC_N','ELC_CEN','ge',0.71,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_CC_N','HET','ge',0.29,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CP_N','ELC_CEN','ge',0.20,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_CP_N','HET','ge',0.80,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TAP_N','ELC_CEN','ge',0.28,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'ELC_CHP_NGA_TAP_N','HET','ge',0.72,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_TAP_N','ELC_CEN','ge',0.30,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2040,'ELC_CHP_NGA_TAP_N','HET','ge',0.70,'');

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
INSERT INTO "linked_tech" VALUES('IT','CCUS_ELC_COA','SNK_CO2_CCS','CCUS_ELC_COA_LINKED','');
INSERT INTO "linked_tech" VALUES('IT','CCUS_ELC_NGA','SNK_CO2_CCS','CCUS_ELC_NGA_LINKED','');

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
INSERT INTO "loan_rate" VALUES('IT','ELC_NGA_CT_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_NGA_CC_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_COA_STM_N',2007,0.062,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_OIL_STM_N',2007,0.062,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_BLQ_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_BIO_5C_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_BIO_12C_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_BGS_AGR_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_BGS_LAN_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_HYD_MICRO_N',2007,0.052,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_HYD_MINI_N',2008,0.052,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_GEO_HENT_N',2007,0.052,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_GEO_LENT_N',2007,0.052,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_WIN_N',2007,0.076,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_WIN_OFF_N',2007,0.086,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_WIN_OFF_DEEP_N',2030,0.086,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_GRO_ITC_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_GRO_ITF_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_GRO_ITG_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_GRO_ITH_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_GRO_ITI_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_ROOF_ITC_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_ROOF_ITF_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_ROOF_ITG_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_ROOF_ITH_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_PV_ROOF_ITI_N',2007,0.057,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_H2_PEMFC_N',2022,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_NUC_LWR_N',2035,0.100,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_NUC_SMR_N',2035,0.100,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_CHP_BMU_N',2007,0.067,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_CHP_NGA_TURB_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_CHP_NGA_CC_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_CHP_NGA_CP_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','ELC_CHP_NGA_TAP_N',2007,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','STG_ELC_CEN_BTT',2020,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','STG_ELC_DST_BTT',2020,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','STG_ELC_CEN_VRFB',2020,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','STG_ELC_DST_VRFB',2020,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','STG_H2_TNK',2014,0.080,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_ELC_COA',2020,0.062,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_ELC_NGA',2020,0.027,'');

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
INSERT INTO "planning_reserve_margin" VALUES('IT',0.35,NULL);

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
INSERT INTO "tech_group" VALUES('ELC_FT_OIL_PROD_GRP','');
INSERT INTO "tech_group" VALUES('ELC_BGS_GRP','');
INSERT INTO "tech_group" VALUES('ELC_BMU_GRP','');
INSERT INTO "tech_group" VALUES('ELC_BLQ_GRP','');
INSERT INTO "tech_group" VALUES('ELC_BIO_GRP','');
INSERT INTO "tech_group" VALUES('ELC_COA_GRP','');
INSERT INTO "tech_group" VALUES('ELC_HYD_GRP','');
INSERT INTO "tech_group" VALUES('ELC_HYD_N_GRP','');
INSERT INTO "tech_group" VALUES('ELC_GEO_GRP','');
INSERT INTO "tech_group" VALUES('ELC_GEO_HET_GRP','');
INSERT INTO "tech_group" VALUES('ELC_SOL_GRP','');
INSERT INTO "tech_group" VALUES('ELC_WIN_GRP','');
INSERT INTO "tech_group" VALUES('ELC_NUC_GRP','');

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
INSERT INTO "storage_duration" VALUES('IT','STG_ELC_HYD_PUM_E',10,'ATB 2022');
INSERT INTO "storage_duration" VALUES('IT','STG_ELC_CEN_BTT',6,'ATB 2022');
INSERT INTO "storage_duration" VALUES('IT','STG_ELC_DST_BTT',6,'ATB 2022');
INSERT INTO "storage_duration" VALUES('IT','STG_ELC_CEN_VRFB',6,'10.1016/j.mtener.2025.101805');
INSERT INTO "storage_duration" VALUES('IT','STG_ELC_DST_VRFB',6,'10.1016/j.mtener.2025.101805');
INSERT INTO "storage_duration" VALUES('IT','STG_H2_TNK',6,'Assumption');

CREATE TABLE tech_group_member (
    group_name TEXT REFERENCES tech_group(group_name),
    tech       TEXT REFERENCES technology(tech),
    PRIMARY KEY(group_name, tech)
);
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','COM_CHP_SLB_CI_N');
INSERT INTO "tech_group_member" VALUES('ELC_BGS_GRP','ELC_BGS_AGR_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BGS_AGR_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BGS_E');
INSERT INTO "tech_group_member" VALUES('ELC_BGS_GRP','ELC_BGS_LAN_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BGS_LAN_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BIO_12C_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BIO_5C_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BIO_CEN_E');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BIO_DST_E');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_BLQ_N');
INSERT INTO "tech_group_member" VALUES('ELC_BLQ_GRP','ELC_BLQ_N');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_CHP_BGS_COG_E');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_CHP_BIO_CEN_E');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_CHP_BMU_E');
INSERT INTO "tech_group_member" VALUES('ELC_BMU_GRP','ELC_CHP_BMU_E');
INSERT INTO "tech_group_member" VALUES('ELC_BIO_GRP','ELC_CHP_BMU_N');
INSERT INTO "tech_group_member" VALUES('ELC_BMU_GRP','ELC_CHP_BMU_N');
INSERT INTO "tech_group_member" VALUES('ELC_COA_GRP','ELC_COA_COND_E');
INSERT INTO "tech_group_member" VALUES('ELC_COA_GRP','ELC_COA_OIL_E');
INSERT INTO "tech_group_member" VALUES('ELC_COA_GRP','ELC_COA_STM_N');
INSERT INTO "tech_group_member" VALUES('ELC_COA_GRP','ELC_COA_STM_P');
INSERT INTO "tech_group_member" VALUES('ELC_FT_OIL_PROD_GRP','ELC_FT_DERGAS');
INSERT INTO "tech_group_member" VALUES('ELC_FT_OIL_PROD_GRP','ELC_FT_HHC');
INSERT INTO "tech_group_member" VALUES('ELC_FT_OIL_PROD_GRP','ELC_FT_OIL');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_GRP','ELC_GEO_E');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_GRP','ELC_GEO_HENT_N');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_GRP','ELC_GEO_LENT_N');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_GRP','ELC_HYD_FLO_E');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_GRP','ELC_HYD_FLO_L10MW_E');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_GRP','ELC_HYD_MICRO_N');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_N_GRP','ELC_HYD_MICRO_N');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_GRP','ELC_HYD_MINI_N');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_N_GRP','ELC_HYD_MINI_N');
INSERT INTO "tech_group_member" VALUES('ELC_HYD_GRP','ELC_HYD_RES_E');
INSERT INTO "tech_group_member" VALUES('ELC_NUC_GRP','ELC_NUC_LWR_N');
INSERT INTO "tech_group_member" VALUES('ELC_NUC_GRP','ELC_NUC_SMR_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_GRO_ITC_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_GRO_ITF_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_GRO_ITG_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_GRO_ITH_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_GRO_ITI_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_ROOF_ITC_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_ROOF_ITF_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_ROOF_ITG_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_ROOF_ITH_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_PV_ROOF_ITI_N');
INSERT INTO "tech_group_member" VALUES('ELC_SOL_GRP','ELC_SOL_E');
INSERT INTO "tech_group_member" VALUES('ELC_WIN_GRP','ELC_WIN_E');
INSERT INTO "tech_group_member" VALUES('ELC_WIN_GRP','ELC_WIN_N');
INSERT INTO "tech_group_member" VALUES('ELC_WIN_GRP','ELC_WIN_OFF_DEEP_N');
INSERT INTO "tech_group_member" VALUES('ELC_WIN_GRP','ELC_WIN_OFF_N');
INSERT INTO "tech_group_member" VALUES('ELC_WIN_GRP','ELC_WIN_P');
INSERT INTO "tech_group_member" VALUES('ELC_BLQ_GRP','HET_BIO_N');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_HET_GRP','HET_GEO_E');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_HET_GRP','HET_GEO_N');
INSERT INTO "tech_group_member" VALUES('ELC_GEO_HET_GRP','HET_GEO_SHA_N');
INSERT INTO "tech_group_member" VALUES('ELC_BLQ_GRP','IND_CHP_BLQ_CI_N');

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
