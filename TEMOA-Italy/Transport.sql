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
INSERT INTO "commodity" VALUES('TRA_NEU','d','Non-energy uses','PJ');
INSERT INTO "commodity" VALUES('TRA_AVI_DOM','d','Domestic aviation','Bvkm');
INSERT INTO "commodity" VALUES('TRA_AVI_INT','d','International aviation','Bvkm');
INSERT INTO "commodity" VALUES('TRA_ROA_BUS','d','Buses','Bvkm');
INSERT INTO "commodity" VALUES('TRA_ROA_LCV','d','Light commercial vehicles','Bvkm');
INSERT INTO "commodity" VALUES('TRA_OTH','d','Others','PJ');
INSERT INTO "commodity" VALUES('TRA_ROA_HTR','d','Heavy trucks','Bvkm');
INSERT INTO "commodity" VALUES('TRA_ROA_MTR','d','Medium trucks','Bvkm');
INSERT INTO "commodity" VALUES('TRA_ROA_CAR','d','Cars','Bvkm');
INSERT INTO "commodity" VALUES('TRA_ROA_2WH','d','Two-wheelers','Bvkm');
INSERT INTO "commodity" VALUES('TRA_RAIL_FRG','d','Rail - Freight','Bvkm');
INSERT INTO "commodity" VALUES('TRA_RAIL_PSG','d','Rail - Passengers','Bvkm');
INSERT INTO "commodity" VALUES('TRA_NAV_DOM','d','Domestic navigation','Bvkm');
INSERT INTO "commodity" VALUES('TRA_NAV_INT','d','International navigation','Bvkm');
INSERT INTO "commodity" VALUES('TRA_AMM','a','Ammonia','PJ');
INSERT INTO "commodity" VALUES('TRA_AVG','a','Aviation gasoline','PJ');
INSERT INTO "commodity" VALUES('TRA_DST','a','Diesel','PJ');
INSERT INTO "commodity" VALUES('TRA_ELC','a','Electricity','PJ');
INSERT INTO "commodity" VALUES('TRA_GSL','a','Gasoline','PJ');
INSERT INTO "commodity" VALUES('TRA_H2G','a','Hydrogen - Gas','PJ');
INSERT INTO "commodity" VALUES('TRA_H2L','a','Hydrogen - Liquid','PJ');
INSERT INTO "commodity" VALUES('TRA_HFO','a','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('TRA_JTK','a','Jet kerosene','PJ');
INSERT INTO "commodity" VALUES('TRA_LNG','a','Liquified natural gas','PJ');
INSERT INTO "commodity" VALUES('TRA_LPG','a','Liquified petroleum gas','PJ');
INSERT INTO "commodity" VALUES('TRA_MET','a','Methanol','PJ');
INSERT INTO "commodity" VALUES('TRA_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('TRA_CH4','e','Transport - CH4 emission','t');
INSERT INTO "commodity" VALUES('TRA_CO2','e','Transport - CO2 emission','kt');
INSERT INTO "commodity" VALUES('TRA_N2O','e','Transport - N2O emission','t');
INSERT INTO "commodity" VALUES('CER','a','Cerium','t');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COB','a','Cobalt','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('DYS','a','Dysprosium','t');
INSERT INTO "commodity" VALUES('EUP','a','Europium','t');
INSERT INTO "commodity" VALUES('GAD','a','Gadolinium','t');
INSERT INTO "commodity" VALUES('GAL','a','Gallium','t');
INSERT INTO "commodity" VALUES('GER','a','Germanium','t');
INSERT INTO "commodity" VALUES('GRA','a','Graphite','t');
INSERT INTO "commodity" VALUES('IND','a','Indium','t');
INSERT INTO "commodity" VALUES('LAN','a','Lanthanum','t');
INSERT INTO "commodity" VALUES('LIT','a','Lithium','t');
INSERT INTO "commodity" VALUES('MAG','a','Magnesium','t');
INSERT INTO "commodity" VALUES('MAN','a','Manganese','t');
INSERT INTO "commodity" VALUES('MOL','a','Molybdenum','t');
INSERT INTO "commodity" VALUES('NEO','a','Neodymium','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('NIO','a','Niobium','t');
INSERT INTO "commodity" VALUES('PAL','a','Palladium','t');
INSERT INTO "commodity" VALUES('PLA','a','Platinum','t');
INSERT INTO "commodity" VALUES('PRA','a','Praseodymium','t');
INSERT INTO "commodity" VALUES('SIV','a','Silver','t');
INSERT INTO "commodity" VALUES('TAN','a','Tantalum','t');
INSERT INTO "commodity" VALUES('TER','a','Terbium','t');
INSERT INTO "commodity" VALUES('VAN','a','Vanadium','t');
INSERT INTO "commodity" VALUES('YTT','a','Yttrium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('BIO_DST1','s','Bio diesel from 1st generation refinery','PJ');
INSERT INTO "commodity" VALUES('BIO_DST2','s','Bio diesel from 2st generation refinery','PJ');
INSERT INTO "commodity" VALUES('BIO_ETBE','s','Bio ETBE','PJ');
INSERT INTO "commodity" VALUES('BIO_ETH','s','Bio ethanol','PJ');
INSERT INTO "commodity" VALUES('BIO_HEFA','s','Hydroprocessed esters and fatty acids','PJ');
INSERT INTO "commodity" VALUES('BIO_HVO','s','Hydrotreated vegetable oil','PJ');
INSERT INTO "commodity" VALUES('BIO_KER','s','Bio kerosene','PJ');
INSERT INTO "commodity" VALUES('BIO_METH','s','Biomethane','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','s','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','s','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('GAS_LNG','s','Liquid natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('H2','s','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('H2_EL','s','Hydrogen from electrolysis','PJ');
INSERT INTO "commodity" VALUES('H2_BL','s','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('IND_CH_AMM','s','Ammonia','Mt');
INSERT INTO "commodity" VALUES('IND_CH_MTH','s','Methanol','Mt');
INSERT INTO "commodity" VALUES('OIL_AVG','s','Aviation gas','PJ');
INSERT INTO "commodity" VALUES('OIL_DST','s','Distillates','PJ');
INSERT INTO "commodity" VALUES('OIL_GSL','s','Gasoline','PJ');
INSERT INTO "commodity" VALUES('OIL_HFO','s','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('OIL_JTK','s','Jet kerosene','PJ');
INSERT INTO "commodity" VALUES('OIL_LPG','s','Liquid petroleum gas','PJ');
INSERT INTO "commodity" VALUES('OIL_NSP','s','Non specified oil','PJ');
INSERT INTO "commodity" VALUES('SYN_DST','s','Synthetic diesel fuel','PJ');
INSERT INTO "commodity" VALUES('SYN_KER','s','Synthetic kerosene','PJ');
INSERT INTO "commodity" VALUES('SYN_MET','s','Synthetic methanol','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','s','Synthetic natural gas','PJ');

CREATE TABLE allocation (
    demand_comm TEXT REFERENCES commodity(name),
    driver_name TEXT,
    notes       TEXT,
    PRIMARY KEY(demand_comm, driver_name)
);
INSERT INTO "allocation" VALUES('TRA_NEU','GDP','');
INSERT INTO "allocation" VALUES('TRA_AVI_DOM','GDP','');
INSERT INTO "allocation" VALUES('TRA_AVI_INT','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_BUS','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_LCV','GDP','');
INSERT INTO "allocation" VALUES('TRA_OTH','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_HTR','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_MTR','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_CAR','GDP','');
INSERT INTO "allocation" VALUES('TRA_ROA_2WH','GDP','');
INSERT INTO "allocation" VALUES('TRA_RAIL_FRG','GDP','');
INSERT INTO "allocation" VALUES('TRA_RAIL_PSG','GDP','');
INSERT INTO "allocation" VALUES('TRA_NAV_DOM','GDP','');
INSERT INTO "allocation" VALUES('TRA_NAV_INT','GDP','');

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
INSERT INTO "technology" VALUES('TRA_FT_AMM','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Ammonia from industry');
INSERT INTO "technology" VALUES('TRA_FT_AVG','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Aviation Gasoline');
INSERT INTO "technology" VALUES('TRA_FT_DST','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Diesel');
INSERT INTO "technology" VALUES('TRA_FT_ELC','p','TRA','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Electricity');
INSERT INTO "technology" VALUES('TRA_FT_GSL','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Gasoline');
INSERT INTO "technology" VALUES('TRA_FT_HFO','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Heavy fuel Oil');
INSERT INTO "technology" VALUES('TRA_FT_JTK','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Jet kerosene');
INSERT INTO "technology" VALUES('TRA_FT_LNG','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - LNG');
INSERT INTO "technology" VALUES('TRA_FT_LPG','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - LPG');
INSERT INTO "technology" VALUES('TRA_FT_MET','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Methanol');
INSERT INTO "technology" VALUES('TRA_FT_NGA','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Fuel technology - Natural gas');
INSERT INTO "technology" VALUES('TRA_FT_H2G','p','TRA','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydrogen (Gas)');
INSERT INTO "technology" VALUES('TRA_FT_H2L','p','TRA','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydrogen (Liquid)');
INSERT INTO "technology" VALUES('TRA_AVI_DOM_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Aircraft - Existing');
INSERT INTO "technology" VALUES('TRA_AVI_INT_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Aircraft - Existing');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation - Existing');
INSERT INTO "technology" VALUES('TRA_NAV_INT_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation - Existing');
INSERT INTO "technology" VALUES('TRA_NEU_E','p','TRA','',NULL,1,1,0,0,0,0,0,0,'Non-energy uses - Existing');
INSERT INTO "technology" VALUES('TRA_OTH_ELC_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Other electric - Existing');
INSERT INTO "technology" VALUES('TRA_RAIL_FRG_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Freight Trains - Existing');
INSERT INTO "technology" VALUES('TRA_RAIL_PAS_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Passenger Trains - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_DST_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Diesel - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_NGA_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Natural gas - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_DST_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Diesel - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_GSL_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Gasoline - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_LPG_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - LPG - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_NGA_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Natural gas - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_DST_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - Diesel - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_DST_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicle - Diesel - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_GSL_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicle - Gasoline - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_MCY_GSL_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Motorcycles - Gasoline - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_MOP_GSL_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Mopeds - Gasoline - Existing');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_DST_E','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - Diesel - Existing');
INSERT INTO "technology" VALUES('TRA_AVI_INT_JTK_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Aircraft – Jet kerosene - New');
INSERT INTO "technology" VALUES('TRA_AVI_INT_H2L_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Aircraft – Hydrogen - New');
INSERT INTO "technology" VALUES('TRA_AVI_DOM_JTK_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Aircraft – Jet kerosene - New');
INSERT INTO "technology" VALUES('TRA_AVI_DOM_H2L_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Aircraft – Hydrogen - New');
INSERT INTO "technology" VALUES('TRA_RAIL_PAS_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Passenger Trains – Diesel - New');
INSERT INTO "technology" VALUES('TRA_RAIL_PAS_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Passenger Trains – Electricity - New');
INSERT INTO "technology" VALUES('TRA_RAIL_PAS_H2G_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Passenger Trains – Hydrogen - New');
INSERT INTO "technology" VALUES('TRA_RAIL_FRG_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Freight Trains – Diesel - New');
INSERT INTO "technology" VALUES('TRA_RAIL_FRG_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Freight Trains – Electricity - New');
INSERT INTO "technology" VALUES('TRA_RAIL_FRG_H2G_MNL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Freight Trains – Hydrogen – Mainland - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – Diesel - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_HFO_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – HFO - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_LNG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – LNG - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_DUAL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – Dual fuel - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_AMM_ICE_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – Ammonia - ICE - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_MET_ICE_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – Methanol - ICE - New');
INSERT INTO "technology" VALUES('TRA_NAV_DOM_H2L_ICE_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Domestic Navigation – Hydrogen - ICE - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – Diesel - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_HFO_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – HFO - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_LNG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – LNG - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_DUAL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – Dual fuel - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_AMM_ICE_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – Ammonia - ICE - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_MET_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – Methanol - New');
INSERT INTO "technology" VALUES('TRA_NAV_INT_H2L_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'International Navigation – Hydrogen – New');
INSERT INTO "technology" VALUES('TRA_ROA_2WH_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Two-wheelers - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_2WH_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Two-wheelers - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_2WH_GSL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Two-wheelers - Gasoline - New');
INSERT INTO "technology" VALUES('TRA_ROA_2WH_FULHYB_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Two-wheelers - Gasoline hybrid - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_GSL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Gasoline - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_LPG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - LPG - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_NGA_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Natural gas - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_BUS_FCELL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Buses - Fuel cell - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_GSL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Gasoline - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_LPG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - LPG - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_NGA_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Natural gas - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_FULHYB_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Full-hybrid - New');
INSERT INTO "technology" VALUES('TRA_ROA_CAR_FCELL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Cars - Fuel cell - New');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_FCELL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - Fuel cell - New');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_LPG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - LPG - New');
INSERT INTO "technology" VALUES('TRA_ROA_HTR_NGA_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Heavy trucks - Natural gas - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_FCELL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Fuel cell - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_GSL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Gasoline - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_FULHYB_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Diesel hybrid - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_LPG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - LPG - New');
INSERT INTO "technology" VALUES('TRA_ROA_LCV_NGA_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Light commercial vehicles - Natural gas - New');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_DST_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - Diesel - New');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - Full-electric - New');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_FCELL_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - Fuel cell - New');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_LPG_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - LPG - New');
INSERT INTO "technology" VALUES('TRA_ROA_MTR_NGA_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Medium trucks - Natural gas - New');
INSERT INTO "technology" VALUES('TRA_OTH_ELC_N','p','TRA','',NULL,0,1,0,0,0,0,0,0,'Other electric - New');
INSERT INTO "technology" VALUES('MAT_SUP_CER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Cerium');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COB','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Cobalt');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_DYS','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Dysprosium');
INSERT INTO "technology" VALUES('MAT_SUP_EUP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Europium');
INSERT INTO "technology" VALUES('MAT_SUP_GAD','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Gadolinium');
INSERT INTO "technology" VALUES('MAT_SUP_GAL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Gallium');
INSERT INTO "technology" VALUES('MAT_SUP_GER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Germanium');
INSERT INTO "technology" VALUES('MAT_SUP_GRA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Graphite');
INSERT INTO "technology" VALUES('MAT_SUP_IND','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Indium');
INSERT INTO "technology" VALUES('MAT_SUP_LAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lanthanum');
INSERT INTO "technology" VALUES('MAT_SUP_LIT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Lithium');
INSERT INTO "technology" VALUES('MAT_SUP_MAG','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Magnesium');
INSERT INTO "technology" VALUES('MAT_SUP_MAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Manganese');
INSERT INTO "technology" VALUES('MAT_SUP_MOL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Molybdenum');
INSERT INTO "technology" VALUES('MAT_SUP_NEO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Neodymium');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_NIO','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Niobium');
INSERT INTO "technology" VALUES('MAT_SUP_PAL','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Palladium');
INSERT INTO "technology" VALUES('MAT_SUP_PLA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Platinum');
INSERT INTO "technology" VALUES('MAT_SUP_PRA','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Praseodymium');
INSERT INTO "technology" VALUES('MAT_SUP_SIV','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Silver');
INSERT INTO "technology" VALUES('MAT_SUP_TAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Tantalum');
INSERT INTO "technology" VALUES('MAT_SUP_TER','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Terbium');
INSERT INTO "technology" VALUES('MAT_SUP_VAN','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Vanadium');
INSERT INTO "technology" VALUES('MAT_SUP_YTT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Yttrium');

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
INSERT INTO "capacity_to_activity" VALUES('IT','TRA_FT_H2G',0.75,NULL,'');
INSERT INTO "capacity_to_activity" VALUES('IT','TRA_FT_H2L',0.75,NULL,'');
INSERT INTO "capacity_to_activity" VALUES('IT','TRA_RAIL_FRG_H2G_MNL_N',0.97,NULL,'');
INSERT INTO "capacity_to_activity" VALUES('IT','TRA_RAIL_PAS_H2G_N',0.97,NULL,'');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_NGA',56.1,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_LPG',63.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_GSL',69.3,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_AVG',69.3,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_JTK',71.5,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_DST',74.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_HFO',77.37,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_MET',69.3,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CO2','TRA_LNG',56.1,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_NGA',1.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_LPG',5.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_GSL',6.92,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_AVG',60.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_JTK',5.53,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_DST',1.32,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_HFO',0.72,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_MET',6.92,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_CH4','TRA_LNG',1.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_NGA',1.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_LPG',0.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_GSL',6.6,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_AVG',6.86,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_JTK',6.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_DST',3.36,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_HFO',3.11,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_MET',6.6,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('TRA_N2O','TRA_LNG',1.0,'t/(PJ)','');

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
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_DST_E',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_DST_E',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_GSL_E',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_GSL_E',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_LPG_E',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_LPG_E',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_NGA_E',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_NGA_E',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_DST_N',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_DST_N',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_GSL_N',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_GSL_N',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_LPG_N',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_LPG_N',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_NGA_N',2007,1894.45,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_NGA_N',2007,951.47,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CER','TRA_ROA_CAR_ELC_N',2007,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','TRA_ROA_CAR_ELC_N',2007,841.88,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','TRA_ROA_CAR_ELC_N',2007,1129.87,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_ELC_N',2007,4519.49,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','TRA_ROA_CAR_ELC_N',2007,13.68,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','EUP','TRA_ROA_CAR_ELC_N',2007,0.02,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAD','TRA_ROA_CAR_ELC_N',2007,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','TRA_ROA_CAR_ELC_N',2007,0.08,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GER','TRA_ROA_CAR_ELC_N',2007,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','TRA_ROA_CAR_ELC_N',2007,5632.37,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','TRA_ROA_CAR_ELC_N',2007,0.02,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','TRA_ROA_CAR_ELC_N',2007,0.59,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LIT','TRA_ROA_CAR_ELC_N',2007,756.08,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAG','TRA_ROA_CAR_ELC_N',2007,16.99,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_ELC_N',2007,2081.34,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','TRA_ROA_CAR_ELC_N',2007,155.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','TRA_ROA_CAR_ELC_N',2007,46.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','TRA_ROA_CAR_ELC_N',2007,3389.61,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','TRA_ROA_CAR_ELC_N',2007,36.19,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PAL','TRA_ROA_CAR_ELC_N',2007,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','TRA_ROA_CAR_ELC_N',2007,6.54,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','TRA_ROA_CAR_ELC_N',2007,1.95,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TAN','TRA_ROA_CAR_ELC_N',2007,0.68,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','TRA_ROA_CAR_ELC_N',2007,2.21,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','TRA_ROA_CAR_ELC_N',2007,67.11,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','TRA_ROA_CAR_ELC_N',2007,0.03,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CER','TRA_ROA_CAR_FULHYB_N',2020,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','TRA_ROA_CAR_FULHYB_N',2020,908.65,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','TRA_ROA_CAR_FULHYB_N',2020,46.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_FULHYB_N',2020,1972.6,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','TRA_ROA_CAR_FULHYB_N',2020,7.19,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','EUP','TRA_ROA_CAR_FULHYB_N',2020,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAD','TRA_ROA_CAR_FULHYB_N',2020,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAL','TRA_ROA_CAR_FULHYB_N',2020,0.07,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GER','TRA_ROA_CAR_FULHYB_N',2020,0.004,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GRA','TRA_ROA_CAR_FULHYB_N',2020,112.65,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','IND','TRA_ROA_CAR_FULHYB_N',2020,0.02,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LAN','TRA_ROA_CAR_FULHYB_N',2020,0.59,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LIT','TRA_ROA_CAR_FULHYB_N',2020,46.49,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAG','TRA_ROA_CAR_FULHYB_N',2020,16.99,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_FULHYB_N',2020,988.0,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MOL','TRA_ROA_CAR_FULHYB_N',2020,155.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','TRA_ROA_CAR_FULHYB_N',2020,68.3,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','TRA_ROA_CAR_FULHYB_N',2020,260.97,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIO','TRA_ROA_CAR_FULHYB_N',2020,36.19,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PAL','TRA_ROA_CAR_FULHYB_N',2020,0.01,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','TRA_ROA_CAR_FULHYB_N',2020,6.54,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','SIV','TRA_ROA_CAR_FULHYB_N',2020,2.38,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TAN','TRA_ROA_CAR_FULHYB_N',2020,0.76,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','TRA_ROA_CAR_FULHYB_N',2020,0.74,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','TRA_ROA_CAR_FULHYB_N',2020,72.38,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','TRA_ROA_CAR_FULHYB_N',2020,0.02,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CER','TRA_ROA_CAR_FCELL_N',2025,62.87,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','TRA_ROA_CAR_FCELL_N',2025,47.57,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COB','TRA_ROA_CAR_FCELL_N',2025,57.51,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','TRA_ROA_CAR_FCELL_N',2025,2524.8,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','DYS','TRA_ROA_CAR_FCELL_N',2025,2.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','GAD','TRA_ROA_CAR_FCELL_N',2025,0.42,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','LIT','TRA_ROA_CAR_FCELL_N',2025,16.31,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAG','TRA_ROA_CAR_FCELL_N',2025,16.99,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','MAN','TRA_ROA_CAR_FCELL_N',2025,880.03,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NEO','TRA_ROA_CAR_FCELL_N',2025,48.93,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','TRA_ROA_CAR_FCELL_N',2025,3399.72,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PLA','TRA_ROA_CAR_FCELL_N',2025,1.19,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','PRA','TRA_ROA_CAR_FCELL_N',2025,2.12,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TER','TRA_ROA_CAR_FCELL_N',2025,0.02,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','VAN','TRA_ROA_CAR_FCELL_N',2025,4353.83,'t/(Bvkm)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','YTT','TRA_ROA_CAR_FCELL_N',2025,203.89,'t/(Bvkm)','10.1016/j.mtener.2025.101805');

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
INSERT INTO "cost_fixed" VALUES('IT',2014,'TRA_FT_H2G',2014,3.25,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2014,'TRA_FT_H2L',2014,2.98,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_AVI_INT_JTK_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2040,'TRA_AVI_INT_H2L_N',2040,29.4,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_AVI_DOM_JTK_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2035,'TRA_AVI_DOM_H2L_N',2035,29.4,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_RAIL_PAS_DST_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_RAIL_PAS_ELC_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_RAIL_FRG_DST_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_RAIL_FRG_ELC_N',2007,20.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_RAIL_FRG_H2G_MNL_N',2030,32.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_NAV_DOM_DST_N',2007,24600.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_NAV_DOM_HFO_N',2007,26800.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_NAV_DOM_LNG_N',2025,48200.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_NAV_DOM_DUAL_N',2025,28100.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_DOM_AMM_ICE_N',2030,35900.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_DOM_MET_ICE_N',2030,30400.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_DOM_H2L_ICE_N',2030,69000.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_NAV_INT_DST_N',2007,62900.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_NAV_INT_HFO_N',2007,68400.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_NAV_INT_LNG_N',2025,123000.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_NAV_INT_DUAL_N',2025,71800.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_INT_AMM_ICE_N',2030,91700.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_INT_MET_N',2030,77600.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'TRA_NAV_INT_H2L_N',2030,176000.0,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_2WH_GSL_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_2WH_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'TRA_ROA_2WH_ELC_N',2010,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'TRA_ROA_2WH_FULHYB_N',2020,61.76,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_BUS_GSL_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_BUS_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_BUS_LPG_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_BUS_NGA_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2012,'TRA_ROA_BUS_ELC_N',2012,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'TRA_ROA_BUS_FCELL_N',2020,60.89,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_CAR_GSL_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_CAR_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_CAR_LPG_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_CAR_NGA_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_CAR_ELC_N',2007,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'TRA_ROA_CAR_FULHYB_N',2020,61.76,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_ROA_CAR_FCELL_N',2025,70.03,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_HTR_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_HTR_LPG_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_HTR_NGA_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2012,'TRA_ROA_HTR_ELC_N',2012,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_ROA_HTR_FCELL_N',2025,60.89,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_LCV_GSL_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_LCV_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_LCV_LPG_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_LCV_NGA_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2012,'TRA_ROA_LCV_ELC_N',2012,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2016,'TRA_ROA_LCV_FULHYB_N',2016,61.76,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_ROA_LCV_FCELL_N',2025,60.89,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_MTR_DST_N',2007,62.63,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_MTR_LPG_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_ROA_MTR_NGA_N',2007,64.37,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2012,'TRA_ROA_MTR_ELC_N',2012,51.33,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'TRA_ROA_MTR_FCELL_N',2025,60.89,'MEUR/(Bvkm/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'TRA_OTH_ELC_N',2007,1.0,'MEUR/(PJ/year)','');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_AVG',2007,5.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_DST',2007,10.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_GSL',2007,10.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_HFO',2007,5.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_JTK',2007,5.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_LNG',2007,50.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_LPG',2007,30.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_MET',2025,20.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_NGA',2007,100.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_H2G',2014,52.12,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_FT_H2L',2014,51.24,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_AVI_INT_JTK_N',2007,115000.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_AVI_INT_H2L_N',2040,160000.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_AVI_DOM_JTK_N',2007,92000.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_AVI_DOM_H2L_N',2035,120000.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_PAS_DST_N',2007,24000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_PAS_ELC_N',2007,33000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_PAS_H2G_N',2030,50000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_FRG_DST_N',2007,23000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_FRG_ELC_N',2007,25000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,47000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_DST_N',2007,352000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_HFO_N',2007,297000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_LNG_N',2025,535000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_DUAL_N',2025,312000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_AMM_ICE_N',2030,326000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_MET_ICE_N',2030,304000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_DOM_H2L_ICE_N',2030,575000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_DST_N',2007,898000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_HFO_N',2007,760000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_LNG_N',2025,1370000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_DUAL_N',2025,798000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_AMM_ICE_N',2030,833000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_MET_N',2030,776000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_NAV_INT_H2L_N',2030,1470000.0,'MEUR/(Bvkm)','Assumption');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_GSL_N',2007,1500.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_DST_N',2007,1730.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_ELC_N',2010,2870.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_ELC_N',2020,2540.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_ELC_N',2030,2200.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_ELC_N',2050,1970.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_FULHYB_N',2020,1830.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_FULHYB_N',2030,1770.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_2WH_FULHYB_N',2050,1730.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_GSL_N',2007,2010.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_DST_N',2007,2480.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_LPG_N',2007,2360.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_NGA_N',2007,3040.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_ELC_N',2012,4790.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_ELC_N',2020,4160.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_ELC_N',2030,3350.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_ELC_N',2050,2990.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_FCELL_N',2020,3770.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_FCELL_N',2030,3310.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_BUS_FCELL_N',2050,2920.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_GSL_N',2007,1500.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_DST_N',2007,1730.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_LPG_N',2007,1530.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_NGA_N',2007,1620.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_ELC_N',2007,2870.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_ELC_N',2020,2540.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_ELC_N',2030,2200.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_ELC_N',2050,1970.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FULHYB_N',2020,1830.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FULHYB_N',2030,1770.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FULHYB_N',2050,1730.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FCELL_N',2025,3770.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FCELL_N',2030,3310.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_CAR_FCELL_N',2050,2920.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_DST_N',2007,2480.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_LPG_N',2007,2360.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_NGA_N',2007,3040.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_ELC_N',2012,4790.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_ELC_N',2020,4160.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_ELC_N',2030,3350.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_ELC_N',2050,2990.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_FCELL_N',2025,5400.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_FCELL_N',2030,4740.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_HTR_FCELL_N',2050,4180.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_GSL_N',2007,1150.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_DST_N',2007,1420.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_LPG_N',2007,1350.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_NGA_N',2007,1743.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_ELC_N',2012,2690.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_ELC_N',2020,2380.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_ELC_N',2030,2070.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_ELC_N',2050,1850.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FULHYB_N',2016,1760.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FULHYB_N',2030,1710.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FULHYB_N',2050,1670.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FCELL_N',2025,3090.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FCELL_N',2030,2710.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_LCV_FCELL_N',2050,2390.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_DST_N',2007,2290.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_LPG_N',2007,2180.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_NGA_N',2007,2810.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_ELC_N',2012,4420.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_ELC_N',2020,3840.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_ELC_N',2030,3090.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_ELC_N',2050,2760.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_FCELL_N',2025,4980.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_FCELL_N',2030,4370.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_ROA_MTR_FCELL_N',2050,3860.0,'MEUR/(Bvkm)','');
INSERT INTO "cost_invest" VALUES('IT','TRA_OTH_ELC_N',2007,1.0,'MEUR/(PJ)','');

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
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_ELC',2006,2.78,'MEUR/(PJ)','Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_AVG',2006,10.19,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_DST',2006,17.36,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_GSL',2006,23.28,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_HFO',2006,16.86,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_JTK',2006,10.19,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2007,'TRA_FT_LNG',2007,1.1,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_LPG',2006,7.81,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'TRA_FT_NGA',2006,3.1,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2025,'TRA_FT_MET',2025,27.28,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2025,'TRA_FT_AMM',2025,22.28,'MEUR/(PJ)','Excise');
INSERT INTO "cost_variable" VALUES('IT',2014,'TRA_FT_H2G',2014,0.28,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2014,'TRA_FT_H2L',2014,0.83,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2010,'TRA_ROA_2WH_ELC_N',2010,7.03,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_2WH_ELC_N',2020,7.03,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_2WH_ELC_N',2050,6.04,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2012,'TRA_ROA_BUS_ELC_N',2012,668.54,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_BUS_ELC_N',2020,668.54,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_BUS_ELC_N',2050,575.25,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2007,'TRA_ROA_CAR_ELC_N',2007,20.74,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_CAR_ELC_N',2020,20.74,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_CAR_ELC_N',2050,17.82,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2012,'TRA_ROA_HTR_ELC_N',2012,1129.77,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_HTR_ELC_N',2020,1129.77,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_HTR_ELC_N',2050,970.65,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2012,'TRA_ROA_LCV_ELC_N',2012,91.28,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_LCV_ELC_N',2020,91.28,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_LCV_ELC_N',2050,78.4,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2012,'TRA_ROA_MTR_ELC_N',2012,494.02,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2020,'TRA_ROA_MTR_ELC_N',2020,494.02,'MEUR/(Bvkm)','Recharging - Cost of Power');
INSERT INTO "cost_variable" VALUES('IT',2050,'TRA_ROA_MTR_ELC_N',2050,425.41,'MEUR/(Bvkm)','Recharging - Cost of Power');

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
INSERT INTO "currency_tech" VALUES('TRA_FT_H2G','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('TRA_FT_H2L','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_2WH_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_2WH_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_2WH_GSL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_2WH_FULHYB_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_GSL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_LPG_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_NGA_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_BUS_FCELL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_GSL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_LPG_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_NGA_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_FULHYB_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_CAR_FCELL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_HTR_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_HTR_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_HTR_FCELL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_HTR_LPG_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_HTR_NGA_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_FCELL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_GSL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_FULHYB_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_LPG_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_LCV_NGA_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_MTR_DST_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_MTR_ELC_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_MTR_FCELL_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_MTR_LPG_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_ROA_MTR_NGA_N','EUR19',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_DST_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_HFO_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_LNG_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_DUAL_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_AMM_ICE_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_MET_ICE_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_DOM_H2L_ICE_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_DST_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_HFO_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_LNG_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_DUAL_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_AMM_ICE_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_MET_N','USD22',NULL);
INSERT INTO "currency_tech" VALUES('TRA_NAV_INT_H2L_N','USD22',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_HTR',8.94,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_ROA_HTR',9.09,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_ROA_HTR',8.96,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_ROA_HTR',8.45,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_ROA_HTR',6.96,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_ROA_HTR',6.68,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_ROA_HTR',6.91,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_ROA_HTR',7.82,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_ROA_HTR',7.89,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_ROA_HTR',8.56,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_ROA_HTR',8.7,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_ROA_HTR',10.17,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_ROA_HTR',11.47,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_ROA_HTR',12.52,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_ROA_HTR',13.36,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_ROA_HTR',14.16,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_MTR',9.44,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_ROA_MTR',9.6,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_ROA_MTR',9.46,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_ROA_MTR',8.92,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_ROA_MTR',7.35,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_ROA_MTR',7.05,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_ROA_MTR',7.29,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_ROA_MTR',8.26,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_ROA_MTR',8.33,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_ROA_MTR',9.03,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_ROA_MTR',9.18,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_ROA_MTR',10.74,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_ROA_MTR',12.11,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_ROA_MTR',13.22,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_ROA_MTR',14.1,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_ROA_MTR',14.95,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_CAR',265.48,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_ROA_CAR',266.22,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_ROA_CAR',266.18,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_ROA_CAR',276.52,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_ROA_CAR',260.56,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_ROA_CAR',282.58,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_ROA_CAR',304.73,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_ROA_CAR',308.22,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_ROA_CAR',235.09,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_ROA_CAR',289.32,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_ROA_CAR',328.99,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_ROA_CAR',328.86,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_ROA_CAR',338.98,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_ROA_CAR',352.98,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_ROA_CAR',360.44,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_ROA_CAR',368.96,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_BUS',3.57,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_2WH',73.88,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_ROA_LCV',78.25,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_ROA_LCV',84.75,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_ROA_LCV',84.36,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_ROA_LCV',90.42,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_ROA_LCV',79.4,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_ROA_LCV',69.96,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_ROA_LCV',64.6,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_ROA_LCV',71.5,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_ROA_LCV',69.01,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_ROA_LCV',71.97,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_ROA_LCV',70.11,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_ROA_LCV',76.2,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_ROA_LCV',80.6,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_ROA_LCV',83.34,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_ROA_LCV',85.85,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_ROA_LCV',88.54,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_AVI_DOM',0.238,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_AVI_DOM',0.262,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_AVI_DOM',0.253,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_AVI_DOM',0.275,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_AVI_DOM',0.287,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_AVI_DOM',0.304,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_AVI_DOM',0.335,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_AVI_DOM',0.374,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_AVI_DOM',0.132,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_AVI_DOM',0.402,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_AVI_DOM',0.42,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_AVI_DOM',0.475,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_AVI_DOM',0.527,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_AVI_DOM',0.584,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_AVI_DOM',0.629,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_AVI_DOM',0.65,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_AVI_INT',0.418,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_AVI_INT',0.465,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_AVI_INT',0.456,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_AVI_INT',0.473,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_AVI_INT',0.499,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_AVI_INT',0.529,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_AVI_INT',0.598,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_AVI_INT',0.637,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_AVI_INT',0.447,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_AVI_INT',0.692,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_AVI_INT',0.74,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_AVI_INT',0.839,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_AVI_INT',0.933,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_AVI_INT',1.03,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_AVI_INT',1.11,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_AVI_INT',1.15,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_NEU',14.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_OTH',21.03,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_RAIL_FRG',0.104,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_RAIL_PSG',0.08,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_RAIL_PSG',0.0841,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_RAIL_PSG',0.0877,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_RAIL_PSG',0.0919,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_RAIL_PSG',0.0936,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_RAIL_PSG',0.0949,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_RAIL_PSG',0.097,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_RAIL_PSG',0.1,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_RAIL_PSG',0.101,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_RAIL_PSG',0.105,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2025,'TRA_RAIL_PSG',0.111,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2030,'TRA_RAIL_PSG',0.125,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2035,'TRA_RAIL_PSG',0.129,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2040,'TRA_RAIL_PSG',0.131,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2045,'TRA_RAIL_PSG',0.135,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2050,'TRA_RAIL_PSG',0.137,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_NAV_DOM',0.00381,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2006,'TRA_NAV_INT',0.0167,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_NAV_DOM',0.00953,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2007,'TRA_NAV_INT',0.0172,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_NAV_DOM',0.0101,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2008,'TRA_NAV_INT',0.018,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_NAV_DOM',0.00808,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2010,'TRA_NAV_INT',0.0213,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_NAV_DOM',0.007,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2012,'TRA_NAV_INT',0.0177,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_NAV_DOM',0.00694,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2014,'TRA_NAV_INT',0.0137,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_NAV_DOM',0.00687,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2016,'TRA_NAV_INT',0.0158,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_NAV_DOM',0.00451,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2018,'TRA_NAV_INT',0.019,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_NAV_DOM',0.00399,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2020,'TRA_NAV_INT',0.0175,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_NAV_DOM',0.00381,'Bvkm','');
INSERT INTO "demand" VALUES('IT',2022,'TRA_NAV_INT',0.0177,'Bvkm','');

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
INSERT INTO "driver" VALUES('IT',2006,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'GDP',1.015,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'GDP',1.004,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'GDP',0.965,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'GDP',0.943,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'GDP',0.928,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'GDP',0.947,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'GDP',0.971,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'GDP',0.933,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'GDP',0.98,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'GDP',1.024,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'GDP',1.046,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'GDP',1.065,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'GDP',1.084,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'GDP',1.141,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'GDP',1.198,NULL,'');

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
INSERT INTO "efficiency" VALUES('IT','IND_CH_AMM','TRA_FT_AMM',2025,'TRA_AMM',18.6,'PJ/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','OIL_AVG','TRA_FT_AVG',2006,'TRA_AVG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','TRA_FT_AVG',2006,'TRA_AVG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','TRA_FT_DST',2006,'TRA_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','TRA_FT_DST',2006,'TRA_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_DST1','TRA_FT_DST',2006,'TRA_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_DST2','TRA_FT_DST',2020,'TRA_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_HVO','TRA_FT_DST',2016,'TRA_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','TRA_FT_ELC',2006,'TRA_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','TRA_FT_ELC',2006,'TRA_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','TRA_FT_GSL',2006,'TRA_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','TRA_FT_GSL',2006,'TRA_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_ETH','TRA_FT_GSL',2006,'TRA_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_ETBE','TRA_FT_GSL',2006,'TRA_GSL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','TRA_FT_HFO',2006,'TRA_HFO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_JTK','TRA_FT_JTK',2006,'TRA_JTK',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_KER','TRA_FT_JTK',2020,'TRA_JTK',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_HEFA','TRA_FT_JTK',2016,'TRA_JTK',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_KER','TRA_FT_JTK',2006,'TRA_JTK',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_LNG','TRA_FT_LNG',2007,'TRA_LNG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','TRA_FT_LPG',2006,'TRA_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','TRA_FT_MET',2025,'TRA_MET',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MTH','TRA_FT_MET',2025,'TRA_MET',19.9,'PJ/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','TRA_FT_NGA',2006,'TRA_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','TRA_FT_NGA',2006,'TRA_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','TRA_FT_NGA',2006,'TRA_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','TRA_FT_NGA',2020,'TRA_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','TRA_FT_H2G',2014,'TRA_H2G',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','TRA_FT_H2G',2014,'TRA_H2G',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','TRA_FT_H2G',2014,'TRA_H2G',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','TRA_FT_H2L',2014,'TRA_H2L',0.77,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','TRA_FT_H2L',2014,'TRA_H2L',0.77,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','TRA_FT_H2L',2014,'TRA_H2L',0.77,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_JTK','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',0.0074,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AVG','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',0.0074,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_JTK','TRA_AVI_INT_E',2006,'TRA_AVI_INT',0.00311,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_DOM_E',2006,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_E',2006,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_INT_E',2006,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_E',2006,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','TRA_NEU_E',2006,'TRA_NEU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_OTH_ELC_E',2006,'TRA_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',0.00753,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',0.00753,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',0.0118,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',0.0118,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_BUS_DST_E',2006,'TRA_ROA_BUS',0.052,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_BUS_NGA_E',2006,'TRA_ROA_BUS',0.038,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_CAR_DST_E',2006,'TRA_ROA_CAR',0.362,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_GSL_E',2006,'TRA_ROA_CAR',0.299,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_CAR_LPG_E',2006,'TRA_ROA_CAR',0.247,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_CAR_NGA_E',2006,'TRA_ROA_CAR',0.274,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_HTR_DST_E',2006,'TRA_ROA_HTR',0.045,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_DST_E',2006,'TRA_ROA_LCV',0.276,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_LCV_GSL_E',2006,'TRA_ROA_LCV',0.241,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_MOP_GSL_E',2006,'TRA_ROA_2WH',1.315,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_MCY_GSL_E',2006,'TRA_ROA_2WH',1.026,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_MTR_DST_E',2006,'TRA_ROA_MTR',0.09,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_JTK','TRA_AVI_INT_JTK_N',2007,'TRA_AVI_INT',0.00335,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_AVI_INT_H2L_N',2040,'TRA_AVI_INT',0.00236,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_JTK','TRA_AVI_DOM_JTK_N',2007,'TRA_AVI_DOM',0.00787,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_AVI_DOM_H2L_N',2035,'TRA_AVI_DOM',0.00818,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2007,'TRA_RAIL_PSG',0.0121,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2020,'TRA_RAIL_PSG',0.0139,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2050,'TRA_RAIL_PSG',0.0172,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2007,'TRA_RAIL_PSG',0.0121,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2020,'TRA_RAIL_PSG',0.0139,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2050,'TRA_RAIL_PSG',0.0172,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_RAIL_PAS_H2G_N',2030,'TRA_RAIL_PSG',0.0139,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_RAIL_PAS_H2G_N',2050,'TRA_RAIL_PSG',0.0172,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2007,'TRA_RAIL_FRG',0.00764,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2020,'TRA_RAIL_FRG',0.00911,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2050,'TRA_RAIL_FRG',0.0112,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2007,'TRA_RAIL_FRG',0.00764,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2020,'TRA_RAIL_FRG',0.00911,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2050,'TRA_RAIL_FRG',0.0112,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_RAIL_FRG_H2G_MNL_N',2030,'TRA_RAIL_FRG',0.00911,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_RAIL_FRG_H2G_MNL_N',2050,'TRA_RAIL_FRG',0.0112,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_DOM_DST_N',2007,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_DOM_DST_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_DOM_DST_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2007,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_DOM_LNG_N',2025,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_DOM_LNG_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_DOM_LNG_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_DUAL_N',2025,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_DOM_DUAL_N',2025,'TRA_NAV_DOM',0.00022,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_DUAL_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_DOM_DUAL_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_DOM_DUAL_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_DOM_DUAL_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_DOM_AMM_ICE_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_DOM_AMM_ICE_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_DOM_MET_ICE_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_DOM_MET_ICE_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_NAV_DOM_H2L_ICE_N',2030,'TRA_NAV_DOM',0.00023,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_NAV_DOM_H2L_ICE_N',2050,'TRA_NAV_DOM',0.0003,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_INT_DST_N',2007,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_INT_DST_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_NAV_INT_DST_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2007,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_INT_LNG_N',2025,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_INT_LNG_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LNG','TRA_NAV_INT_LNG_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_DUAL_N',2025,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_INT_DUAL_N',2025,'TRA_NAV_INT',0.0001,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_DUAL_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_INT_DUAL_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_HFO','TRA_NAV_INT_DUAL_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_INT_DUAL_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_INT_AMM_ICE_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_AMM','TRA_NAV_INT_AMM_ICE_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_INT_MET_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_MET','TRA_NAV_INT_MET_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_NAV_INT_H2L_N',2030,'TRA_NAV_INT',0.00011,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2L','TRA_NAV_INT_H2L_N',2050,'TRA_NAV_INT',0.00015,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2007,'TRA_ROA_2WH',0.946,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2050,'TRA_ROA_2WH',1.259,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_2WH_DST_N',2007,'TRA_ROA_2WH',1.117,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_2WH_DST_N',2050,'TRA_ROA_2WH',1.487,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2010,'TRA_ROA_2WH',3.468,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2020,'TRA_ROA_2WH',3.468,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2050,'TRA_ROA_2WH',4.037,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_2WH_FULHYB_N',2020,'TRA_ROA_2WH',1.609,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_2WH_FULHYB_N',2050,'TRA_ROA_2WH',2.188,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2007,'TRA_ROA_BUS',0.039,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2020,'TRA_ROA_BUS',0.045,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2050,'TRA_ROA_BUS',0.052,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_BUS_DST_N',2007,'TRA_ROA_BUS',0.052,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_BUS_DST_N',2020,'TRA_ROA_BUS',0.059,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_BUS_DST_N',2050,'TRA_ROA_BUS',0.069,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_BUS_LPG_N',2007,'TRA_ROA_BUS',0.043,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_BUS_NGA_N',2007,'TRA_ROA_BUS',0.045,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2012,'TRA_ROA_BUS',0.148,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2020,'TRA_ROA_BUS',0.148,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2050,'TRA_ROA_BUS',0.172,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_BUS_FCELL_N',2020,'TRA_ROA_BUS',0.094,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_BUS_FCELL_N',2050,'TRA_ROA_BUS',0.127,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2007,'TRA_ROA_CAR',0.313,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2020,'TRA_ROA_CAR',0.358,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2050,'TRA_ROA_CAR',0.416,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_CAR_DST_N',2007,'TRA_ROA_CAR',0.375,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_CAR_DST_N',2020,'TRA_ROA_CAR',0.429,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_CAR_DST_N',2050,'TRA_ROA_CAR',0.5,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_CAR_LPG_N',2007,'TRA_ROA_CAR',0.337,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_CAR_NGA_N',2007,'TRA_ROA_CAR',0.357,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2007,'TRA_ROA_CAR',1.176,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2020,'TRA_ROA_CAR',1.176,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2050,'TRA_ROA_CAR',1.369,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_FULHYB_N',2020,'TRA_ROA_CAR',0.507,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_CAR_FULHYB_N',2050,'TRA_ROA_CAR',0.69,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_CAR_FCELL_N',2025,'TRA_ROA_CAR',0.637,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_CAR_FCELL_N',2050,'TRA_ROA_CAR',0.936,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_HTR_DST_N',2007,'TRA_ROA_HTR',0.039,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_HTR_DST_N',2020,'TRA_ROA_HTR',0.044,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_HTR_DST_N',2050,'TRA_ROA_HTR',0.052,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_HTR_LPG_N',2007,'TRA_ROA_HTR',0.035,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_HTR_NGA_N',2007,'TRA_ROA_HTR',0.037,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2012,'TRA_ROA_HTR',0.122,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2020,'TRA_ROA_HTR',0.122,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2050,'TRA_ROA_HTR',0.142,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_HTR_FCELL_N',2025,'TRA_ROA_HTR',0.077,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_HTR_FCELL_N',2050,'TRA_ROA_HTR',0.105,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2007,'TRA_ROA_LCV',0.237,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2020,'TRA_ROA_LCV',0.271,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2050,'TRA_ROA_LCV',0.316,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_DST_N',2007,'TRA_ROA_LCV',0.272,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_DST_N',2020,'TRA_ROA_LCV',0.311,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_DST_N',2050,'TRA_ROA_LCV',0.362,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_LCV_LPG_N',2007,'TRA_ROA_LCV',0.274,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_LCV_NGA_N',2007,'TRA_ROA_LCV',0.258,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2012,'TRA_ROA_LCV',1.084,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2020,'TRA_ROA_LCV',1.084,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2050,'TRA_ROA_LCV',1.262,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2016,'TRA_ROA_LCV',0.266,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2020,'TRA_ROA_LCV',0.298,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2050,'TRA_ROA_LCV',0.405,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_LCV_FCELL_N',2025,'TRA_ROA_LCV',0.575,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_LCV_FCELL_N',2050,'TRA_ROA_LCV',0.782,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_MTR_DST_N',2007,'TRA_ROA_MTR',0.089,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_MTR_DST_N',2020,'TRA_ROA_MTR',0.102,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_DST','TRA_ROA_MTR_DST_N',2050,'TRA_ROA_MTR',0.118,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_LPG','TRA_ROA_MTR_LPG_N',2007,'TRA_ROA_MTR',0.08,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_NGA','TRA_ROA_MTR_NGA_N',2007,'TRA_ROA_MTR',0.084,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2012,'TRA_ROA_MTR',0.279,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2020,'TRA_ROA_MTR',0.279,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2050,'TRA_ROA_MTR',0.324,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_MTR_FCELL_N',2025,'TRA_ROA_MTR',0.176,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_H2G','TRA_ROA_MTR_FCELL_N',2050,'TRA_ROA_MTR',0.239,'Bvkm/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_OTH_ELC_N',2007,'TRA_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','TRA_ELC','TRA_OTH_ELC_N',2050,'TRA_OTH',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CER',2007,'CER',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COB',2007,'COB',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_DYS',2007,'DYS',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_EUP',2007,'EUP',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GAD',2007,'GAD',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GAL',2007,'GAL',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GER',2007,'GER',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_GRA',2007,'GRA',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_IND',2007,'IND',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_LIT',2007,'LIT',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MAG',2007,'MAG',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MAN',2007,'MAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_MOL',2007,'MOL',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NEO',2007,'NEO',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIO',2007,'NIO',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PAL',2007,'PAL',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PLA',2007,'PLA',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_PRA',2007,'PRA',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_SIV',2007,'SIV',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TAN',2007,'TAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TER',2007,'TER',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_VAN',2007,'VAN',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_YTT',2007,'YTT',1.0,'t/(ethos)','');

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
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_NEU',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_NEU',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_NEU',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_NEU',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_NEU',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_AVI_DOM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_AVI_DOM',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_AVI_DOM',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_AVI_DOM',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_AVI_DOM',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_AVI_DOM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_AVI_DOM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_AVI_DOM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_AVI_DOM',0.6,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_AVI_DOM',0.6,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_AVI_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_AVI_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_AVI_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_AVI_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_AVI_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_AVI_INT',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_AVI_INT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_AVI_INT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_AVI_INT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_AVI_INT',0.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_AVI_INT',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_AVI_INT',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_AVI_INT',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_AVI_INT',0.6,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_AVI_INT',0.6,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_AVI_INT',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_AVI_INT',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_AVI_INT',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_AVI_INT',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_AVI_INT',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_BUS',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_BUS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_BUS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_BUS',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_BUS',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_BUS',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_BUS',0.425,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_BUS',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_BUS',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_BUS',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_LCV',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_LCV',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_LCV',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_LCV',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_LCV',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_LCV',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_LCV',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_LCV',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_LCV',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_LCV',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_LCV',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_LCV',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_LCV',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_LCV',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_LCV',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_HTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_HTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_HTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_HTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_HTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_HTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_HTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_HTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_HTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_HTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_HTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_HTR',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_HTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_HTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_HTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_MTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_MTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_MTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_MTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_MTR',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_MTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_MTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_MTR',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_MTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_MTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_MTR',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_MTR',0.45,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_MTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_MTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_MTR',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_OTH',2.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_OTH',-0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_OTH',-0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_OTH',-0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_OTH',-0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_OTH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_OTH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_OTH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_OTH',0.75,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_CAR',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_CAR',0.7,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_CAR',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_CAR',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_CAR',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_CAR',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_CAR',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_CAR',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_CAR',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_ROA_2WH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_ROA_2WH',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_ROA_2WH',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_ROA_2WH',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_ROA_2WH',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_ROA_2WH',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_ROA_2WH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_ROA_2WH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_ROA_2WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_ROA_2WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_ROA_2WH',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_ROA_2WH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_ROA_2WH',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_ROA_2WH',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_ROA_2WH',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_RAIL_FRG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_RAIL_FRG',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_RAIL_FRG',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_RAIL_FRG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_RAIL_FRG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_RAIL_FRG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_RAIL_FRG',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_RAIL_FRG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_RAIL_FRG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_RAIL_FRG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_RAIL_PSG',1.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_RAIL_PSG',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_RAIL_PSG',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_RAIL_PSG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_RAIL_PSG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_RAIL_PSG',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_RAIL_PSG',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_RAIL_PSG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_RAIL_PSG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_RAIL_PSG',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_NAV_DOM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_NAV_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_NAV_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_NAV_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_NAV_DOM',0.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_NAV_DOM',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_NAV_DOM',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_NAV_DOM',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_NAV_DOM',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_NAV_DOM',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_NAV_DOM',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_NAV_DOM',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_NAV_DOM',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_NAV_DOM',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_NAV_DOM',0.2,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'TRA_NAV_INT',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'TRA_NAV_INT',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'TRA_NAV_INT',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'TRA_NAV_INT',0.4,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'TRA_NAV_INT',0.35,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'TRA_NAV_INT',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'TRA_NAV_INT',0.3,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'TRA_NAV_INT',0.3,NULL,NULL);

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
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_METH','TRA_FT_NGA',2007,'TRA_NGA',-56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','H2_BL','TRA_FT_NGA',2020,'TRA_NGA',-56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_ETH','TRA_FT_GSL',2007,'TRA_GSL',-69.3,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_ETBE','TRA_FT_GSL',2007,'TRA_GSL',-74.0821,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_DST1','TRA_FT_DST',2007,'TRA_DST',-74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_DST2','TRA_FT_DST',2020,'TRA_DST',-74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_HVO','TRA_FT_DST',2016,'TRA_DST',-74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_KER','TRA_FT_JTK',2020,'TRA_JTK',-71.5,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','TRA_CO2','BIO_HEFA','TRA_FT_JTK',2016,'TRA_JTK',-71.5,'kt/(PJ)','');

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
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_AVG',2006,0.73,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_DST',2006,1098.14,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_GSL',2006,572.44,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_HFO',2006,121.29,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_JTK',2006,170.96,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_LPG',2006,46.76,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_NGA',2006,17.83,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_FT_ELC',2006,40.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_CAR_GSL_E',2006,141.5,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_CAR_DST_E',2006,108.76960000000001,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_CAR_LPG_E',2006,11.2,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_CAR_NGA_E',2006,4.267,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_MOP_GSL_E',2006,27.82,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_MCY_GSL_E',2006,46.14,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_BUS_DST_E',2006,3.5322299999999998,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_BUS_NGA_E',2006,0.0655,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_HTR_DST_E',2006,8.951049999999999,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_LCV_DST_E',2006,74.475,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_LCV_GSL_E',2006,3.88,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_ROA_MTR_DST_E',2006,9.42,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_OTH_ELC_E',2006,21.055,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_AVI_DOM_E',2006,0.238,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_AVI_INT_E',2006,0.418,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_NAV_DOM_E',2006,0.00381,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_NAV_INT_E',2006,0.0167,'Bvkm','');
--INSERT INTO "existing_capacity" VALUES('IT','TRA_NEU_E',2006,14.21,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_RAIL_FRG_E',2006,0.104,'Bvkm','');
INSERT INTO "existing_capacity" VALUES('IT','TRA_RAIL_PAS_E',2006,0.08,'Bvkm','');

CREATE TABLE lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);

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
INSERT INTO "lifetime_tech" VALUES('IT','TRA_OTH_ELC_E',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_DST_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_NGA_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_DST_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_GSL_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_LPG_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_NGA_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_DST_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_DST_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_GSL_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MCY_GSL_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MOP_GSL_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_DST_E',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_AVI_INT_JTK_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_AVI_INT_H2L_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_AVI_DOM_JTK_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_AVI_DOM_H2L_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_PAS_DST_N',40.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_PAS_ELC_N',40.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_PAS_H2G_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_FRG_DST_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_FRG_ELC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_RAIL_FRG_H2G_MNL_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_DST_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_HFO_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_LNG_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_DUAL_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_AMM_ICE_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_MET_ICE_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_DOM_H2L_ICE_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_DST_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_HFO_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_LNG_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_DUAL_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_AMM_ICE_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_MET_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_NAV_INT_H2L_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_2WH_DST_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_2WH_ELC_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_2WH_GSL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_2WH_FULHYB_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_DST_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_ELC_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_GSL_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_FCELL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_LPG_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_BUS_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_DST_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_ELC_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_GSL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_LPG_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_NGA_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_FULHYB_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_CAR_FCELL_N',10.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_DST_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_ELC_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_FCELL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_LPG_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_HTR_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_DST_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_ELC_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_FCELL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_GSL_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_FULHYB_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_LPG_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_LCV_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_DST_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_ELC_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_FCELL_N',12.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_LPG_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_ROA_MTR_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','TRA_OTH_ELC_N',10.0,'year','');

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
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_DST','ge',967.1,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_DST','ge',916.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_DST','ge',942.79,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_DST','ge',909.25,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_DST','ge',929.38,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_DST','ge',774.36,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_DST','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_ELC','ge',36.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_ELC','ge',36.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_ELC','ge',36.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_ELC','ge',38.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_ELC','ge',39.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_ELC','ge',34.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_ELC','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_GSL','ge',417.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_GSL','ge',345.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_GSL','ge',332.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_GSL','ge',301.25,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_GSL','ge',306.56,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_GSL','ge',242.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_GSL','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_HFO','ge',113.9,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_HFO','ge',97.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_HFO','ge',82.02,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_HFO','ge',94.14,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_HFO','ge',99.57,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_HFO','ge',87.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_HFO','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_LPG','ge',52.1,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_LPG','ge',63.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_LPG','ge',70.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_LPG','ge',71.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_LPG','ge',71.38,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_LPG','ge',57.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_LPG','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_NGA','ge',28.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_NGA','ge',38.12,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_NGA','ge',42.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_NGA','ge',43.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_NGA','ge',44.56,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_NGA','ge',38.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'TRA_FT_NGA','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_DST','le',1099.4,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_DST','le',1012.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_DST','le',1042.03,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_DST','le',1004.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_DST','le',1030.21,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_DST','le',945.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_DST','le',1891.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_ELC','le',42.23,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_ELC','le',41.09,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_ELC','le',41.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_ELC','le',43.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_ELC','le',44.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_ELC','le',41.51,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_ELC','le',1000.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_GSL','le',461.16,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_GSL','le',381.33,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_GSL','le',367.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_GSL','le',332.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_GSL','le',338.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_GSL','le',283.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_GSL','le',566.84,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_HFO','le',155.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_HFO','le',133.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_HFO','le',112.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_HFO','le',128.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_HFO','le',139.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_HFO','le',119.91,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_HFO','le',239.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_LPG','le',57.59,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_LPG','le',69.72,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_LPG','le',77.71,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_LPG','le',78.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_LPG','le',78.9,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_LPG','le',66.26,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_LPG','le',331.3,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'TRA_FT_NGA','le',31.49,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'TRA_FT_NGA','le',42.13,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'TRA_FT_NGA','le',47.47,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'TRA_FT_NGA','le',47.69,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'TRA_FT_NGA','le',49.25,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_FT_NGA','le',44.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'TRA_FT_NGA','le',222.7,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_CAR_GSL_E','le',131.0,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_CAR_DST_E','le',100.807,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_CAR_LPG_E','le',10.4,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_CAR_NGA_E','le',3.96,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_CAR_GSL_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_CAR_DST_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_CAR_LPG_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_CAR_NGA_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_MOP_GSL_E','le',25.8,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_MCY_GSL_E','le',42.8,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_MOP_GSL_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_MCY_GSL_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_BUS_DST_E','le',3.2820699999999996,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_BUS_NGA_E','le',0.035,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_BUS_DST_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_BUS_NGA_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_HTR_DST_E','le',8.310971,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_HTR_DST_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_LCV_DST_E','le',69.105,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_LCV_GSL_E','le',3.6,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_LCV_DST_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_LCV_GSL_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_ROA_MTR_DST_E','le',8.74,'Bvkm','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_ROA_MTR_DST_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_RAIL_PAS_E','le',0.08,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_RAIL_PAS_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_RAIL_FRG_E','le',0.104,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_RAIL_FRG_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_AVI_DOM_E','le',0.238,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_AVI_DOM_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_AVI_INT_E','le',0.418,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_AVI_INT_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_NAV_DOM_E','le',0.00503,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_NAV_DOM_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_NAV_INT_E','le',0.0719,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_NAV_INT_E','le',0.0,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2007,'TRA_OTH_ELC_E','le',19.6,'Bvkm','');
INSERT INTO "limit_activity" VALUES('IT',2020,'TRA_OTH_ELC_E','le',0.0,'Bvkm','');

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
INSERT INTO "limit_activity_share" VALUES('IT',2020,'TRA_ROA_CAR_ICE_DST_GRP','TRA_ROA_CAR_ICE_GRP','ge',0.45,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'TRA_ROA_CAR_ICE_GSL_GRP','TRA_ROA_CAR_ICE_GRP','ge',0.35,'');
INSERT INTO "limit_activity_share" VALUES('IT',2020,'TRA_ROA_CAR_ICE_LPG_GRP','TRA_ROA_CAR_ICE_GRP','ge',0.10,'');
INSERT INTO "limit_activity_share" VALUES('IT',2010,'TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_TRK_ICE_GRP','ge',0.90,'');
INSERT INTO "limit_activity_share" VALUES('IT',2012,'TRA_ROA_MTR_ELC_N','TRA_ROA_MTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'TRA_ROA_MTR_ELC_N','TRA_ROA_MTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'TRA_ROA_MTR_ELC_N','TRA_ROA_MTR_GRP','le',1.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'TRA_ROA_MTR_FCELL_N','TRA_ROA_MTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'TRA_ROA_MTR_FCELL_N','TRA_ROA_MTR_GRP','le',1.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2012,'TRA_ROA_HTR_ELC_N','TRA_ROA_HTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'TRA_ROA_HTR_ELC_N','TRA_ROA_HTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'TRA_ROA_HTR_ELC_N','TRA_ROA_HTR_GRP','le',1.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2025,'TRA_ROA_HTR_FCELL_N','TRA_ROA_HTR_GRP','le',0.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'TRA_ROA_HTR_FCELL_N','TRA_ROA_HTR_GRP','le',1.00,'');

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
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','TRA_FT_H2G',2014,'TRA_H2G','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','TRA_FT_H2L',2014,'TRA_H2L','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,'TRA_RAIL_FRG','le',0.97,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','TRA_RAIL_PAS_H2G_N',2030,'TRA_RAIL_PSG','le',0.97,'');

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
INSERT INTO "limit_tech_input_split" VALUES('IT',2007,'ELC_CEN','TRA_FT_ELC','ge',0.7,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','TRA_FT_ELC','ge',0.3,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','TRA_FT_H2G','ge',0.13,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','TRA_FT_H2G','ge',0.13,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','TRA_FT_H2L','ge',0.23,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','TRA_FT_H2L','ge',0.23,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','TRA_FT_H2G','le',0.13,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','TRA_FT_H2G','le',0.13,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2014,'ELC_CEN','TRA_FT_H2L','le',0.23,'');
INSERT INTO "limit_tech_input_split" VALUES('IT',2050,'ELC_CEN','TRA_FT_H2L','le',0.23,'');

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
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_JTK','TRA_AVI_DOM_E','ge',0.98,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_AVG','TRA_AVI_DOM_E','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_DST','TRA_NAV_DOM_E','ge',0.54,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_HFO','TRA_NAV_DOM_E','ge',0.46,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_DST','TRA_NAV_DOM_E','ge',0.25,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_HFO','TRA_NAV_DOM_E','ge',0.25,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_DST','TRA_NAV_INT_E','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_HFO','TRA_NAV_INT_E','ge',0.95,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_HFO','TRA_NAV_INT_E','ge',0.8,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_DST','TRA_RAIL_PAS_E','ge',0.23,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_ELC','TRA_RAIL_PAS_E','ge',0.77,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_DST','TRA_RAIL_PAS_E','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_ELC','TRA_RAIL_PAS_E','ge',0.7,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_DST','TRA_RAIL_FRG_E','ge',0.23,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'TRA_ELC','TRA_RAIL_FRG_E','ge',0.77,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_DST','TRA_RAIL_FRG_E','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'TRA_ELC','TRA_RAIL_FRG_E','ge',0.7,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'TRA_HFO','TRA_NAV_DOM_DUAL_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'TRA_MET','TRA_NAV_DOM_DUAL_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'TRA_HFO','TRA_NAV_INT_DUAL_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'TRA_AMM','TRA_NAV_INT_DUAL_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'BIO_ETBE','TRA_FT_GSL','ge',0.011,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'BIO_ETH','TRA_FT_GSL','ge',0.001,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_ETBE','TRA_FT_GSL','ge',0.0031,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_ETH','TRA_FT_GSL','ge',0.0002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_ETBE','TRA_FT_GSL','ge',0.0031,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_ETH','TRA_FT_GSL','ge',0.0002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'BIO_DST1','TRA_FT_DST','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_DST1','TRA_FT_DST','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_DST1','TRA_FT_DST','ge',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','TRA_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','TRA_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','TRA_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','TRA_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','TRA_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','TRA_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','TRA_FT_NGA','le',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','TRA_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','TRA_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','TRA_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','TRA_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','TRA_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','TRA_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','TRA_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_MET','TRA_FT_GSL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_MET','TRA_FT_GSL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_MET','TRA_FT_GSL','le',0.015,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_MET','TRA_FT_GSL','le',0.015,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'BIO_ETBE','TRA_FT_GSL','le',0.037,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_ETBE','TRA_FT_GSL','le',0.037,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_ETBE','TRA_FT_GSL','le',0.152,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'BIO_ETH','TRA_FT_GSL','le',0.013,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_ETH','TRA_FT_GSL','le',0.013,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_ETH','TRA_FT_GSL','le',0.053,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_MET','TRA_FT_AVG','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_MET','TRA_FT_AVG','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_MET','TRA_FT_AVG','le',0.015,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_MET','TRA_FT_AVG','le',0.015,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_KER','TRA_FT_JTK','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_KER','TRA_FT_JTK','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_KER','TRA_FT_JTK','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_KER','TRA_FT_JTK','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_KER','TRA_FT_JTK','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_KER','TRA_FT_JTK','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_KER','TRA_FT_JTK','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'BIO_HEFA','TRA_FT_JTK','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_HEFA','TRA_FT_JTK','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_HEFA','TRA_FT_JTK','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_DST','TRA_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_DST','TRA_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_DST','TRA_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_DST','TRA_FT_DST','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_DST1','TRA_FT_DST','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_DST1','TRA_FT_DST','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_DST1','TRA_FT_DST','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_DST2','TRA_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_DST2','TRA_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_DST2','TRA_FT_DST','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'BIO_HVO','TRA_FT_DST','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_HVO','TRA_FT_DST','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_HVO','TRA_FT_DST','le',1.0,'');

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
INSERT INTO "loan_rate" VALUES('IT','TRA_AVI_INT_JTK_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_AVI_INT_H2L_N',2040,0.32,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_AVI_DOM_JTK_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_AVI_DOM_H2L_N',2035,0.32,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_PAS_DST_N',2007,0.042,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_PAS_ELC_N',2007,0.042,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_PAS_H2G_N',2030,0.32,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_FRG_DST_N',2007,0.042,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_FRG_ELC_N',2007,0.042,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,0.32,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_DST_N',2007,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_HFO_N',2007,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_LNG_N',2025,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_DUAL_N',2025,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_AMM_ICE_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_MET_ICE_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_DOM_H2L_ICE_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_DST_N',2007,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_HFO_N',2007,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_LNG_N',2025,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_DUAL_N',2025,0.058,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_AMM_ICE_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_MET_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_NAV_INT_H2L_N',2030,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_2WH_GSL_N',2007,0.049,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_2WH_DST_N',2007,0.049,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_2WH_ELC_N',2010,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_2WH_FULHYB_N',2020,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_GSL_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_DST_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_ELC_N',2012,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_LPG_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_NGA_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_BUS_FCELL_N',2020,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_GSL_N',2007,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_DST_N',2007,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_LPG_N',2007,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_NGA_N',2007,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_ELC_N',2007,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_FULHYB_N',2020,0.073,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_CAR_FCELL_N',2025,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_HTR_DST_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_HTR_LPG_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_HTR_NGA_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_HTR_ELC_N',2012,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_HTR_FCELL_N',2025,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_GSL_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_DST_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_LPG_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_NGA_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_ELC_N',2012,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_FULHYB_N',2016,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_LCV_FCELL_N',2025,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_MTR_DST_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_MTR_LPG_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_MTR_NGA_N',2007,0.06,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_MTR_ELC_N',2012,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','TRA_ROA_MTR_FCELL_N',2025,0.15,'');

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
INSERT INTO "tech_group" VALUES('TRA_ROA_CAR_ICE_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_CAR_ICE_DST_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_CAR_ICE_GSL_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_CAR_ICE_LPG_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_TRK_ICE_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_TRK_ICE_DST_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_MTR_GRP','');
INSERT INTO "tech_group" VALUES('TRA_ROA_HTR_GRP','');

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
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_FULHYB_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_GSL_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_GSL_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_LPG_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_NGA_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GRP','TRA_ROA_CAR_NGA_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_DST_GRP','TRA_ROA_CAR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_DST_GRP','TRA_ROA_CAR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GSL_GRP','TRA_ROA_CAR_FULHYB_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GSL_GRP','TRA_ROA_CAR_GSL_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_GSL_GRP','TRA_ROA_CAR_GSL_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_LPG_GRP','TRA_ROA_CAR_LPG_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_CAR_ICE_LPG_GRP','TRA_ROA_CAR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_HTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_HTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_HTR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_HTR_NGA_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_FULHYB_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_GSL_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_GSL_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_LCV_NGA_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_MTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_MTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_MTR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_GRP','TRA_ROA_MTR_NGA_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_HTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_HTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_LCV_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_LCV_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_MTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_TRK_ICE_DST_GRP','TRA_ROA_MTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_ELC_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_FCELL_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_HTR_GRP','TRA_ROA_HTR_NGA_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_DST_E');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_DST_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_ELC_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_FCELL_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_LPG_N');
INSERT INTO "tech_group_member" VALUES('TRA_ROA_MTR_GRP','TRA_ROA_MTR_NGA_N');

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
