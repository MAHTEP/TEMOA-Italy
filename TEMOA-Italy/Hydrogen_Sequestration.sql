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
INSERT INTO "commodity" VALUES('H2','p','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('H2_EL','p','Hydrogen from electrolysis','PJ');
INSERT INTO "commodity" VALUES('H2_EL_SOEC','p','Hydrogen from SOEC','PJ');
INSERT INTO "commodity" VALUES('H2_BL','p','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('H2_SF','p','Hydrogen for synfuels production','PJ');
INSERT INTO "commodity" VALUES('SNK_CO2','a','Captured CO2 for storage/utilization - Physical','kt');
INSERT INTO "commodity" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission','kt');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COB','a','Cobalt','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('IRI','a','Iridium','t');
INSERT INTO "commodity" VALUES('LAN','a','Lanthanum','t');
INSERT INTO "commodity" VALUES('MAN','a','Manganese','t');
INSERT INTO "commodity" VALUES('MOL','a','Molybdenum','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('NIO','a','Niobium','t');
INSERT INTO "commodity" VALUES('PAL','a','Palladium','t');
INSERT INTO "commodity" VALUES('PLA','a','Platinum','t');
INSERT INTO "commodity" VALUES('YTT','a','Yttrium','t');
INSERT INTO "commodity" VALUES('VAN','a','Vanadium','t');
INSERT INTO "commodity" VALUES('ZIR','a','Zirconium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('DMY_OUT','d','Dummy output commodity','DMY_OUT');
INSERT INTO "commodity" VALUES('BIO_SLB','s','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('COA_HCO','s','Hard coal','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','p','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_CO2','e','Power sector - CO2 emission','kt');
INSERT INTO "commodity" VALUES('ELC_COA','s','Coal','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','s','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('ELC_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_ETH','s','Ethane','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('HET','s','Heat','PJ');
INSERT INTO "commodity" VALUES('OIL_HFO','s','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('SNK_ELC_CO2','a','Power sector - Physical CO2 for storage/utilization','kt');
INSERT INTO "commodity" VALUES('SNK_IND_CO2','s','Industry - Physical CO2 for storage/utilization','kt');
INSERT INTO "commodity" VALUES('SNK_UPS_CO2','s','Upstream - Physical CO2 for storage/utilization','kt');
INSERT INTO "commodity" VALUES('SYN_DST','a','Synthetic diesel fuel','PJ');
INSERT INTO "commodity" VALUES('SYN_KER','a','Synthetic kerosene','PJ');
INSERT INTO "commodity" VALUES('SYN_MET','a','Synthetic methanol','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','a','Synthetic natural gas','PJ');
INSERT INTO "commodity" VALUES('TOT_CO2','e','Total CO2 emission','kt');
INSERT INTO "commodity" VALUES('GWP_100','e','Global warming potential - 100 years','kt');
INSERT INTO "commodity" VALUES('TRA_CO2','e','Transport - CO2 emission','kt');
INSERT INTO "commodity" VALUES('UPS_CO2','e','Upstream - CO2 emission','kt');

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
INSERT INTO "technology" VALUES('H2_SR_NGA','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Natural gas steam reforming');
INSERT INTO "technology" VALUES('H2_GS_COA','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Coal gasification');
INSERT INTO "technology" VALUES('H2_PO_OIL','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Heavy oil partial oxidation');
INSERT INTO "technology" VALUES('H2_SR_BIO','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Solid biomass steam reforming');
INSERT INTO "technology" VALUES('H2_GS_BIO','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Solid biomass gasification');
INSERT INTO "technology" VALUES('H2_SR_ETH','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Ethanol steam reforming, decentralized');
INSERT INTO "technology" VALUES('H2_EL_ALK','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - Alkaline electrolyzer');
INSERT INTO "technology" VALUES('H2_EL_PEM','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - PEM electrolyzer');
INSERT INTO "technology" VALUES('H2_EL_SOEC','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - SOEC');
INSERT INTO "technology" VALUES('H2_EL_AEM','p','H2','',NULL,0,0,0,0,0,0,0,0,'Hydrogen production - AEM electrolyzer');
INSERT INTO "technology" VALUES('H2_DMY','p','H2','',NULL,0,0,0,0,0,0,0,0,'Dummy - Hydrogen from electrolysis to Hydrogen');
INSERT INTO "technology" VALUES('H2_SF_DMY','p','H2','',NULL,0,0,0,0,0,0,0,0,'Dummy - Hydrogen to Hydrogen for synfuels');
INSERT INTO "technology" VALUES('H2_BL_DMY','p','H2','',NULL,0,0,0,0,0,0,0,0,'Fuel Tech - H2 Delivery from centralized production to blending (COMP+USTOR+TR+BLENDING+(nocosNATGASINF))-ALL');
INSERT INTO "technology" VALUES('CCUS_H2_SR_NGA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Natural Gas Steam Reforming w/CCUS');
INSERT INTO "technology" VALUES('CCUS_H2_SR_NGA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_H2_SR_NGA');
INSERT INTO "technology" VALUES('CCUS_H2_GS_COA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Coal Gasification w/CCUS');
INSERT INTO "technology" VALUES('CCUS_H2_GS_COA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_H2_GS_COA');
INSERT INTO "technology" VALUES('CCUS_H2_GS_BIO','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Biomass Gasification w/CCUS');
INSERT INTO "technology" VALUES('CCUS_H2_GS_BIO_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_H2_GS_BIO');
INSERT INTO "technology" VALUES('CCUS_ELC_COA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Coal power plant w/CCUS');
INSERT INTO "technology" VALUES('CCUS_ELC_COA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_ELC_COA');
INSERT INTO "technology" VALUES('CCUS_ELC_NGA','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Natural gas power plant w/CCUS');
INSERT INTO "technology" VALUES('CCUS_ELC_NGA_LINKED','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'LINKED tech for CCUS_ELC_NGA');
INSERT INTO "technology" VALUES('CCUS_DAC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Direct Air Capture (DAC) with chemical absorption');
INSERT INTO "technology" VALUES('SNK_ELC_CO2_AGG','p','CCUS','',NULL,1,1,0,0,0,0,0,0,'Aggregation of captured CO2 to SNK_CO2');
INSERT INTO "technology" VALUES('SNK_IND_CO2_AGG','p','CCUS','',NULL,1,1,0,0,0,0,0,0,'Aggregation of captured CO2 to SNK_CO2');
INSERT INTO "technology" VALUES('SNK_UPS_CO2_AGG','p','CCUS','',NULL,1,1,0,0,0,0,0,0,'Aggregation of captured CO2 to SNK_CO2');
INSERT INTO "technology" VALUES('SF_NGA_METH','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Methane production from H2C and CO2 (Methanation)');
INSERT INTO "technology" VALUES('SF_DST_HYDR','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Gas oil production from H2C and CO2 (Hydrogenation)');
INSERT INTO "technology" VALUES('SF_DST_COELC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Gas oil production from ELC_CEN and CO2 (Coelectrolysis)');
INSERT INTO "technology" VALUES('SF_KER_HYDR','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Kerosene production from H2C and CO2 (Hydrogenation)');
INSERT INTO "technology" VALUES('SF_KER_COELC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Kerosene production from ELC_CEN and CO2 (Coelectrolysis)');
INSERT INTO "technology" VALUES('SF_DSTKER_DAC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Gas oil/Kerosene production from ELC_CEN and CO2 (Coelectrolysis-DAC)');
INSERT INTO "technology" VALUES('SF_MEOH_HYDR','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Methanol production from H2C and CO2 (Hydrogenation)');
INSERT INTO "technology" VALUES('SF_MEOH_COELC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Methanol production from ELC_CEN and CO2 (Coelectrolysis)');
INSERT INTO "technology" VALUES('SF_MEOH_DAC','p','CCUS','',NULL,0,0,0,0,0,0,0,0,'Methanol production from ELC_CEN and CO2 (Coelectrolysis-DAC)');
INSERT INTO "technology" VALUES('CCUS_SNK_DGF_ON','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'CO2 physical storage in depleted gas field, onshore');
INSERT INTO "technology" VALUES('CCUS_SNK_DGF_OFF','p','CCUS','',NULL,0,1,0,0,0,0,0,0,'CO2 physical storage in depleted gas field, offhore');
INSERT INTO "technology" VALUES('DMY_H2_CCUS_TECH','p','UPS','',NULL,1,0,0,0,0,0,0,0,'Dummy technology to produce hydrogen');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COB','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Cobalt');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_IRI','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Iridium');
INSERT INTO "technology" VALUES('MAT_SUP_LAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lanthanum');
INSERT INTO "technology" VALUES('MAT_SUP_MAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Manganese');
INSERT INTO "technology" VALUES('MAT_SUP_MOL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Molybdenum');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_NIO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Niobium');
INSERT INTO "technology" VALUES('MAT_SUP_PAL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Palladium');
INSERT INTO "technology" VALUES('MAT_SUP_PLA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Platinum');
INSERT INTO "technology" VALUES('MAT_SUP_VAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Vanadium');
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
INSERT INTO "capacity_to_activity" VALUES('IT','CCUS_ELC_COA',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','CCUS_ELC_NGA',31.536,'PJ/(GW)','');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);

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
INSERT INTO "construction_input" VALUES('IT','NIC','H2_EL_ALK',2020,3.94,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ZIR','H2_EL_ALK',2020,0.49,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IRI','H2_EL_PEM',2020,0.000353,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PAL','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PLA','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','H2_EL_SOEC',2020,0.6,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','H2_EL_SOEC',2020,0.16,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','H2_EL_SOEC',2020,0.09,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','ZIR','H2_EL_SOEC',2020,0.01,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','CCUS_ELC_COA',2020,326.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','CCUS_ELC_COA',2020,7.5,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','CCUS_ELC_COA',2020,692.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','CCUS_ELC_COA',2020,3760.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','CCUS_ELC_COA',2020,7.5,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','CCUS_ELC_COA',2020,1150.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','CCUS_ELC_COA',2020,100.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','CCUS_ELC_COA',2020,100.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','CCUS_ELC_NGA',2020,326.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','CCUS_ELC_NGA',2020,7.5,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','CCUS_ELC_NGA',2020,692.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','CCUS_ELC_NGA',2020,3760.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','CCUS_ELC_NGA',2020,7.5,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','CCUS_ELC_NGA',2020,1150.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','CCUS_ELC_NGA',2020,100.0,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','CCUS_ELC_NGA',2020,100.0,'t/GW','10.1016/j.mtener.2025.101805');

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
INSERT INTO "cost_fixed" VALUES('IT',2014,'H2_SR_NGA',2014,0.78,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'H2_SR_NGA',2030,0.68,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2014,'H2_GS_COA',2014,0.66,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'H2_GS_COA',2030,0.58,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2014,'H2_PO_OIL',2014,0.68,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2014,'H2_SR_BIO',2014,0.66,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2014,'H2_GS_BIO',2014,2.31,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'H2_EL_ALK',2020,1.4,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'H2_EL_ALK',2030,0.85,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'H2_EL_ALK',2050,0.71,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'H2_EL_PEM',2020,1.88,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'H2_EL_PEM',2030,1.06,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2040,'H2_EL_PEM',2040,0.77,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'H2_EL_PEM',2050,0.68,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'H2_EL_SOEC',2020,2.72,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'H2_EL_SOEC',2030,1.41,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'H2_EL_SOEC',2050,0.98,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'H2_EL_AEM',2050,1.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'H2_BL_DMY',2020,0.2,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_H2_SR_NGA',2020,1.17,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_H2_GS_COA',2020,0.8,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_H2_GS_BIO',2020,2.07,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_ELC_COA',2020,125.0,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2035,'CCUS_ELC_COA',2035,108.0,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_ELC_NGA',2020,67.0,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2035,'CCUS_ELC_NGA',2035,60.0,'MEUR/(GW/year)','ATB 2022');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_DAC',2020,0.09,'MEUR/(kt/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'CCUS_DAC',2030,0.09,'MEUR/(kt/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2050,'CCUS_DAC',2050,0.09,'MEUR/(kt/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'SF_NGA_METH',2020,0.95,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_NGA_METH',2030,0.71,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2050,'SF_NGA_METH',2050,0.4,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_DST_HYDR',2025,2.85,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_DST_HYDR',2030,0.33,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_DST_COELC',2025,5.7,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_DST_COELC',2030,0.66,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_KER_HYDR',2025,2.85,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_KER_HYDR',2030,0.33,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_KER_COELC',2025,5.7,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_KER_COELC',2030,0.66,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_DSTKER_DAC',2025,22.81,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2030,'SF_DSTKER_DAC',2030,2.63,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_MEOH_HYDR',2025,1.72,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_MEOH_COELC',2025,3.26,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2025,'SF_MEOH_DAC',2025,13.06,'MEUR/(PJ/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_SNK_DGF_ON',2020,0.00017,'MEUR/(kt/year)','JRC-EU-TIMES');
INSERT INTO "cost_fixed" VALUES('IT',2020,'CCUS_SNK_DGF_OFF',2020,0.00035,'MEUR/(kt/year)','JRC-EU-TIMES');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "cost_invest" VALUES('IT','H2_SR_NGA',2014,23.52,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_SR_NGA',2025,21.03,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_SR_NGA',2030,16.15,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_GS_COA',2014,16.42,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_GS_COA',2025,16.42,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_GS_COA',2030,14.65,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_PO_OIL',2014,13.69,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_SR_BIO',2014,16.47,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_GS_BIO',2014,106.84,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_GS_BIO',2020,69.6,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_SR_ETH',2014,233.99,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_ALK',2020,46.63,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_ALK',2030,28.42,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_ALK',2050,23.57,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_PEM',2020,62.62,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_PEM',2030,35.28,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_PEM',2040,25.74,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_PEM',2050,22.54,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_SOEC',2020,90.54,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_SOEC',2025,47.06,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_SOEC',2030,36.58,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_SOEC',2050,32.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_EL_AEM',2050,35.92,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_BL_DMY',2020,2.7,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','H2_BL_DMY',2025,2.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','CCUS_H2_SR_NGA',2020,20.63,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_H2_GS_COA',2020,16.24,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_H2_GS_BIO',2020,41.51,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_COA',2020,5542.0,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_COA',2030,3416.0,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_NGA',2020,2630.0,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_ELC_NGA',2050,1582.0,'MEUR/(GW)','ATB 2022');
INSERT INTO "cost_invest" VALUES('IT','CCUS_DAC',2020,2.32,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_DAC',2030,1.86,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_DAC',2050,1.48,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_NGA_METH',2020,19.03,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_NGA_METH',2030,14.27,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_NGA_METH',2050,7.93,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DST_HYDR',2025,15.47,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DST_HYDR',2030,12.43,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DST_COELC',2025,31.57,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DST_COELC',2030,28.22,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_KER_HYDR',2025,15.47,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_KER_HYDR',2030,12.43,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_KER_COELC',2025,31.57,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_KER_COELC',2030,28.22,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DSTKER_DAC',2025,126.26,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_DSTKER_DAC',2030,112.86,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_MEOH_HYDR',2025,26.94,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_MEOH_COELC',2025,59.42,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','SF_MEOH_DAC',2025,237.68,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_SNK_DGF_ON',2020,0.0033,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_invest" VALUES('IT','CCUS_SNK_DGF_OFF',2020,0.007,'MEUR/(kt)','JRC-EU-TIMES');

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
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_SR_NGA',2014,0.23,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'H2_SR_NGA',2025,0.21,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2030,'H2_SR_NGA',2030,0.05,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_GS_COA',2014,0.19,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'H2_GS_COA',2025,0.19,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2030,'H2_GS_COA',2030,0.17,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_PO_OIL',2014,0.14,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_SR_BIO',2014,0.18,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_GS_BIO',2014,1.14,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2014,'H2_SR_ETH',2014,19.65,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_H2_SR_NGA',2020,0.06,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_H2_GS_COA',2020,0.19,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_H2_GS_BIO',2020,0.46,'MEUR/(PJ)','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_ELC_COA',2020,15.0,'MEUR/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_ELC_NGA',2020,6.0,'MEUR/(PJ)','ATB 2022');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_DAC',2020,8e-05,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2030,'CCUS_DAC',2030,6.4e-05,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2050,'CCUS_DAC',2050,5.1e-05,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2007,'SNK_IND_CO2_AGG',2007,0.15,'MEUR/(kt)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'SNK_UPS_CO2_AGG',2007,0.5,'MEUR/(kt)','');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_DST_HYDR',2025,0.27,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_DST_COELC',2025,0.33,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_KER_HYDR',2025,0.26,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_KER_COELC',2025,0.32,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_DSTKER_DAC',2025,0.46,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_MEOH_HYDR',2025,0.29,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_MEOH_COELC',2025,0.41,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2025,'SF_MEOH_DAC',2025,0.87,'MEUR/(PJ)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_SNK_DGF_ON',2020,0.00367,'MEUR/(kt)','JRC-EU-TIMES');
INSERT INTO "cost_variable" VALUES('IT',2020,'CCUS_SNK_DGF_OFF',2020,0.00627,'MEUR/(kt)','JRC-EU-TIMES');

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
INSERT INTO "currency_tech" VALUES('H2_SR_NGA','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_GS_COA','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_PO_OIL','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_SR_BIO','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_GS_BIO','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_SR_ETH','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('H2_BL_DMY','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_H2_SR_NGA','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_H2_GS_COA','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_H2_GS_BIO','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_ELC_COA','USD20',NULL);
INSERT INTO "currency_tech" VALUES('CCUS_ELC_NGA','USD20',NULL);
INSERT INTO "currency_tech" VALUES('SF_NGA_METH','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_DST_HYDR','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_DST_COELC','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_KER_HYDR','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_KER_COELC','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_DSTKER_DAC','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_MEOH_HYDR','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_MEOH_COELC','EUR10',NULL);
INSERT INTO "currency_tech" VALUES('SF_MEOH_DAC','EUR10',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2006,'DMY_OUT',1000000.0,'PJ','');

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
INSERT INTO "driver" VALUES('IT',2006,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'POP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'GDP',1.0,NULL,'');

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
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_SR_NGA',2014,'H2',0.63,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','H2_SR_NGA',2014,'H2',0.63,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_SR_NGA',2025,'H2',0.66,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','H2_SR_NGA',2025,'H2',0.66,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_SR_NGA',2030,'H2',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','H2_SR_NGA',2030,'H2',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_GS_COA',2014,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','H2_GS_COA',2014,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_GS_COA',2025,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','H2_GS_COA',2025,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_GS_COA',2030,'H2',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','H2_GS_COA',2030,'H2',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_PO_OIL',2014,'H2',0.73,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','H2_PO_OIL',2014,'H2',0.73,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_SR_BIO',2014,'H2',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','H2_SR_BIO',2014,'H2',0.71,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_GS_BIO',2014,'H2',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','H2_GS_BIO',2014,'H2',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_SR_ETH',2014,'H2',0.36,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_ETH','H2_SR_ETH',2014,'H2',0.36,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_ALK',2020,'H2_EL',0.62,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_ALK',2020,'H2_EL',0.62,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_ALK',2030,'H2_EL',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_ALK',2030,'H2_EL',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_ALK',2050,'H2_EL',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_ALK',2050,'H2_EL',0.67,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_PEM',2020,'H2_EL',0.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_PEM',2020,'H2_EL',0.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_PEM',2025,'H2_EL',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_PEM',2025,'H2_EL',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_PEM',2050,'H2_EL',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_PEM',2050,'H2_EL',0.68,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_SOEC',2020,'H2_EL_SOEC',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_SOEC',2020,'H2_EL_SOEC',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_SOEC',2030,'H2_EL_SOEC',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_SOEC',2030,'H2_EL_SOEC',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_SOEC',2050,'H2_EL_SOEC',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_SOEC',2050,'H2_EL_SOEC',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','H2_EL_AEM',2050,'H2_EL',0.59,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','H2_EL_AEM',2050,'H2_EL',0.59,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','H2_DMY',2014,'H2',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','H2_SF_DMY',2014,'H2_SF',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','H2_BL_DMY',2020,'H2_BL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','CCUS_H2_SR_NGA',2020,'H2',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','CCUS_H2_SR_NGA',2030,'H2',0.63,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',0.63,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','CCUS_H2_GS_COA',2020,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','CCUS_H2_GS_COA',2020,'H2',0.56,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','CCUS_H2_GS_COA',2030,'H2',0.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','CCUS_H2_GS_COA',2030,'H2',0.6,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','CCUS_H2_GS_BIO',2020,'H2',0.51,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',0.51,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_H2_SR_NGA_LINKED',2020,'SNK_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_H2_GS_COA_LINKED',2020,'SNK_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_H2_GS_BIO_LINKED',2020,'SNK_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',0.32,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',0.48,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',0.55,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_ELC_COA_LINKED',2020,'SNK_ELC_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','CCUS_ELC_NGA_LINKED',2020,'SNK_ELC_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_ELC_CO2','SNK_ELC_CO2_AGG',2007,'SNK_CO2',1.0,'kt/(kt)','');
INSERT INTO "efficiency" VALUES('IT','SNK_IND_CO2','SNK_IND_CO2_AGG',2007,'SNK_CO2',1.0,'kt/(kt)','');
INSERT INTO "efficiency" VALUES('IT','SNK_UPS_CO2','SNK_UPS_CO2_AGG',2007,'SNK_CO2',1.0,'kt/(kt)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_NGA_METH',2020,'SYN_NGA',0.01743,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_NGA_METH',2020,'SYN_NGA',0.01743,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_NGA_METH',2030,'SYN_NGA',0.01744,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_NGA_METH',2030,'SYN_NGA',0.01744,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_NGA_METH',2050,'SYN_NGA',0.01745,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_NGA_METH',2050,'SYN_NGA',0.01745,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_DST_HYDR',2025,'SYN_DST',0.01327,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_DST_HYDR',2025,'SYN_DST',0.01327,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_DST_COELC',2025,'SYN_DST',0.01309,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_DST_COELC',2025,'SYN_DST',0.01309,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_DST_COELC',2030,'SYN_DST',0.01318,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_DST_COELC',2030,'SYN_DST',0.01318,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_KER_HYDR',2025,'SYN_KER',0.01374,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_KER_HYDR',2025,'SYN_KER',0.01374,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_KER_COELC',2025,'SYN_KER',0.01354,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_KER_COELC',2025,'SYN_KER',0.01354,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_KER_COELC',2030,'SYN_KER',0.01364,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_KER_COELC',2030,'SYN_KER',0.01364,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',0.33,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',0.33,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_SF','SF_MEOH_HYDR',2025,'SYN_MET',0.01418,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_MEOH_HYDR',2025,'SYN_MET',0.01418,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_MEOH_COELC',2025,'SYN_MET',0.01399,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_MEOH_COELC',2025,'SYN_MET',0.01399,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_MEOH_COELC',2030,'SYN_MET',0.01408,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','SF_MEOH_COELC',2030,'SYN_MET',0.01408,'PJ/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',0.33,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','CCUS_SNK_DGF_ON',2020,'DMY_OUT',1.0,'DMY_OUT/(kt)','');
INSERT INTO "efficiency" VALUES('IT','SNK_CO2','CCUS_SNK_DGF_OFF',2020,'DMY_OUT',1.0,'DMY_OUT/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','H2','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL_SOEC','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_KER','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COB',2007,'COB',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_IRI',2007,'IRI',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MAN',2007,'MAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MOL',2007,'MOL',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIO',2007,'NIO',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PAL',2007,'PAL',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PLA',2007,'PLA',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_VAN',2007,'VAN',1.0,'t/(ethos)','');
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
INSERT INTO "elasticity" VALUES('IT',2007,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'DMY_OUT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'DMY_OUT',0.0,NULL,NULL);

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
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2014,'H2',89.04761904761905,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2025,'H2',85.0,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2030,'H2',79.01408450704226,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','COA_HCO','H2_GS_COA',2014,'H2',180.6428571428571,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','COA_HCO','H2_GS_COA',2025,'H2',180.6428571428571,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','COA_HCO','H2_GS_COA',2030,'H2',148.76470588235293,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','OIL_HFO','H2_PO_OIL',2014,'H2',108.97260273972603,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','BIO_SLB','H2_SR_BIO',2014,'H2',0.00014084507042253522,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','BIO_SLB','H2_GS_BIO',2014,'H2',0.00023809523809523812,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',20.400000000000002,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',81.60000000000001,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',17.80952380952381,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',71.23809523809524,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','COA_HCO','CCUS_H2_GS_COA',2020,'H2',36.128571428571426,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_GS_COA',2020,'H2',144.5142857142857,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','COA_HCO','CCUS_H2_GS_COA',2030,'H2',33.72,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_GS_COA',2030,'H2',134.88,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','UPS_CO2','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',-175.68627450980392,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',175.68627450980392,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-284.5125,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',-260.12571428571425,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',284.5125,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',260.12571428571425,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-105.18750000000001,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',-91.8,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',105.18750000000001,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',91.8,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TOT_CO2','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/(kt)','');
INSERT INTO "emission_activity" VALUES('IT','TOT_CO2','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/(kt)','');
INSERT INTO "emission_activity" VALUES('IT','GWP_100','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/(kt)','');
INSERT INTO "emission_activity" VALUES('IT','GWP_100','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/(kt)','');
INSERT INTO "emission_activity" VALUES('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-71.87,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','GWP_100','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','GWP_100','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-71.87,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TOT_CO2','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',-69.3,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','GWP_100','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',-69.3,'kt/(PJ)','');

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

CREATE TABLE lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_ALK',2020,8.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_ALK',2030,11.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_ALK',2050,14.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_PEM',2020,7.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_PEM',2030,8.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_PEM',2050,14.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_SOEC',2020,2.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_SOEC',2030,5.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_SOEC',2050,10.0,'year','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "lifetime_process" VALUES('IT','H2_EL_AEM',2050,10.0,'year','Elaboration of data from JRC-EU-TIMES');

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
INSERT INTO "lifetime_tech" VALUES('IT','H2_SR_NGA',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_GS_COA',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_PO_OIL',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_SR_BIO',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_GS_BIO',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_SR_ETH',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','H2_BL_DMY',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_SR_NGA',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_SR_NGA_LINKED',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_GS_COA',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_GS_COA_LINKED',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_GS_BIO',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_H2_GS_BIO_LINKED',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_COA',30.0,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_COA_LINKED',30.0,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_NGA',30.0,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_ELC_NGA_LINKED',30.0,'year','NREL');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_DAC',25.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_NGA_METH',25.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_DST_HYDR',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_DST_COELC',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_KER_HYDR',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_KER_COELC',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_DSTKER_DAC',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_MEOH_HYDR',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_MEOH_COELC',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','SF_MEOH_DAC',20.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_SNK_DGF_ON',10.0,'year','JRC-EU-TIMES');
INSERT INTO "lifetime_tech" VALUES('IT','CCUS_SNK_DGF_OFF',10.0,'year','JRC-EU-TIMES');

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
INSERT INTO "limit_activity" VALUES('IT',2025,'H2_GS_COA','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'CCUS_H2_GS_COA','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'SNK_IND_CO2_AGG','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2020,'SNK_IND_CO2_AGG','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'SNK_IND_CO2_AGG','le',20.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'SNK_IND_CO2_AGG','le',70.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2035,'SNK_IND_CO2_AGG','le',220.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2040,'SNK_IND_CO2_AGG','le',680.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2045,'SNK_IND_CO2_AGG','le',2080.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2050,'SNK_IND_CO2_AGG','le',6400.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'SNK_UPS_CO2_AGG','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'SNK_UPS_CO2_AGG','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'SNK_UPS_CO2_AGG','le',20.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2035,'SNK_UPS_CO2_AGG','le',70.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2040,'SNK_UPS_CO2_AGG','le',220.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2045,'SNK_UPS_CO2_AGG','le',680.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2050,'SNK_UPS_CO2_AGG','le',2100.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2020,'CCUS_SNK_DGF_ON','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'CCUS_SNK_DGF_ON','le',10.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'CCUS_SNK_DGF_ON','le',100.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2035,'CCUS_SNK_DGF_ON','le',760.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2040,'CCUS_SNK_DGF_ON','le',2830.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2045,'CCUS_SNK_DGF_ON','le',10510.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2050,'CCUS_SNK_DGF_ON','le',27000.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2020,'CCUS_SNK_DGF_OFF','le',0.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'CCUS_SNK_DGF_OFF','le',1.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'CCUS_SNK_DGF_OFF','le',20.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2035,'CCUS_SNK_DGF_OFF','le',160.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2040,'CCUS_SNK_DGF_OFF','le',870.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2045,'CCUS_SNK_DGF_OFF','le',4680.0,'kt','');
INSERT INTO "limit_activity" VALUES('IT',2050,'CCUS_SNK_DGF_OFF','le',18000.0,'kt','');

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
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_DAC',2020,'SNK_CO2','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_ELC_COA',2020,'ELC_CEN','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_ELC_NGA',2020,'ELC_CEN','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_H2_GS_BIO',2020,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_H2_GS_COA',2020,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','CCUS_H2_SR_NGA',2020,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_BL_DMY',2020,'H2_BL','le',0.7,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_EL_AEM',2050,'H2_EL','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_EL_ALK',2020,'H2_EL','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_EL_PEM',2020,'H2_EL','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_EL_SOEC',2020,'H2_EL_SOEC','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_GS_BIO',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_GS_COA',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_PO_OIL',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_SR_BIO',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_SR_ETH',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','H2_SR_NGA',2014,'H2','le',0.9,'Assumption');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_DSTKER_DAC',2025,'SYN_DST','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_DSTKER_DAC',2025,'SYN_KER','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_DST_COELC',2025,'SYN_DST','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_DST_HYDR',2025,'SYN_DST','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_KER_COELC',2025,'SYN_KER','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_KER_HYDR',2025,'SYN_KER','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_MEOH_COELC',2025,'SYN_MET','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_MEOH_DAC',2025,'SYN_MET','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_MEOH_HYDR',2025,'SYN_MET','le',0.9,'JRC-EU-TIMES');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','SF_NGA_METH',2020,'SYN_NGA','le',0.95,'JRC-EU-TIMES');

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
INSERT INTO "limit_resource" VALUES('IT','CCUS_SNK_DGF_ON','le',30000000.0,'kt','');
INSERT INTO "limit_resource" VALUES('IT','CCUS_SNK_DGF_OFF','le',10000.0,'kt','');

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
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'GAS_NGA','H2_SR_NGA','ge',0.97,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','H2_SR_NGA','ge',0.03,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'COA_HCO','H2_GS_COA','ge',0.85,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','H2_GS_COA','ge',0.15,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'OIL_HFO','H2_PO_OIL','ge',0.95,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','H2_PO_OIL','ge',0.05,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'BIO_SLB','H2_SR_BIO','ge',0.97,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','H2_SR_BIO','ge',0.03,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'BIO_SLB','H2_GS_BIO','ge',0.94,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_DST','H2_GS_BIO','ge',0.06,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'GAS_ETH','H2_SR_ETH','ge',0.94,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_DST','H2_SR_ETH','ge',0.06,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'GAS_NGA','CCUS_H2_SR_NGA','ge',0.97,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_CEN','CCUS_H2_SR_NGA','ge',0.03,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'COA_HCO','CCUS_H2_GS_COA','ge',0.99,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_CEN','CCUS_H2_GS_COA','ge',0.01,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'BIO_SLB','CCUS_H2_GS_BIO','ge',0.93,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_CEN','CCUS_H2_GS_BIO','ge',0.07,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'ELC_DST','CCUS_DAC','ge',0.1786,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2020,'HET','CCUS_DAC','ge',0.8214,'');

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
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_SF','SF_NGA_METH','ge',0.0223,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'SNK_CO2','SF_NGA_METH','ge',0.9777,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_SF','SF_NGA_METH','ge',0.0218,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SNK_CO2','SF_NGA_METH','ge',0.9782,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_SF','SF_NGA_METH','ge',0.0213,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SNK_CO2','SF_NGA_METH','ge',0.9787,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_SF','SF_DST_HYDR','ge',0.017,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_DST_HYDR','ge',0.983,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_DST_COELC','ge',0.0305,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'ELC_CEN','SF_DST_COELC','ge',0.9695,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SNK_CO2','SF_DST_COELC','ge',0.0241,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'ELC_CEN','SF_DST_COELC','ge',0.9759,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_SF','SF_KER_HYDR','ge',0.0176,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_KER_HYDR','ge',0.9824,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_KER_COELC','ge',0.0316,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'ELC_CEN','SF_KER_COELC','ge',0.9684,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SNK_CO2','SF_KER_COELC','ge',0.025,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'ELC_CEN','SF_KER_COELC','ge',0.975,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_SF','SF_MEOH_HYDR','ge',0.0173,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_MEOH_HYDR','ge',0.9827,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'ELC_CEN','SF_MEOH_COELC','ge',0.0305,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SNK_CO2','SF_MEOH_COELC','ge',0.9695,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'ELC_CEN','SF_MEOH_COELC','ge',0.0246,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SNK_CO2','SF_MEOH_COELC','ge',0.9754,'');

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
INSERT INTO "loan_rate" VALUES('IT','H2_SR_NGA',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_GS_COA',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_PO_OIL',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_SR_BIO',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_GS_BIO',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_SR_ETH',2014,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_EL_ALK',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_EL_PEM',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_EL_SOEC',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','H2_EL_AEM',2050,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_H2_SR_NGA',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_H2_GS_COA',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_H2_GS_BIO',2020,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_ELC_COA',2020,0.062,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_ELC_NGA',2020,0.027,'');
INSERT INTO "loan_rate" VALUES('IT','CCUS_DAC',2020,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','SF_DSTKER_DAC',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_DST_COELC',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_DST_HYDR',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_KER_COELC',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_KER_HYDR',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_MEOH_COELC',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_MEOH_DAC',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_MEOH_HYDR',2025,0.08,'');
INSERT INTO "loan_rate" VALUES('IT','SF_NGA_METH',2020,0.08,'');

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

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
