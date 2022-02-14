
CREATE TABLE "time_season" (
	"t_season"	text,
	PRIMARY KEY("t_season")
);
INSERT INTO "time_season" VALUES ('summer'); 
INSERT INTO "time_season" VALUES ('fall'); 
INSERT INTO "time_season" VALUES ('winter'); 
INSERT INTO "time_season" VALUES ('spring'); 

CREATE TABLE "time_periods" (
	"t_periods"	integer,
	"flag"	text,
	PRIMARY KEY("t_periods"),
	FOREIGN KEY("flag") REFERENCES "time_period_labels"("t_period_labels")
);
INSERT INTO "time_periods" VALUES (2006,'e');
INSERT INTO "time_periods" VALUES (2007,'f');
INSERT INTO "time_periods" VALUES (2008,'f');
INSERT INTO "time_periods" VALUES (2010,'f');
INSERT INTO "time_periods" VALUES (2012,'f');
INSERT INTO "time_periods" VALUES (2014,'f');
INSERT INTO "time_periods" VALUES (2016,'f');
INSERT INTO "time_periods" VALUES (2018,'f');
INSERT INTO "time_periods" VALUES (2020,'f');
INSERT INTO "time_periods" VALUES (2022,'f');
INSERT INTO "time_periods" VALUES (2025,'f');
INSERT INTO "time_periods" VALUES (2030,'f');
INSERT INTO "time_periods" VALUES (2040,'f');
INSERT INTO "time_periods" VALUES (2050,'f');
INSERT INTO "time_periods" VALUES (2060,'f');

CREATE TABLE "time_period_labels" (
	"t_period_labels"	text,
	"t_period_labels_desc"	text,
	PRIMARY KEY("t_period_labels")
);
INSERT INTO "time_period_labels" VALUES ('e','existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','future vintages');

CREATE TABLE "time_of_day" (
	"t_day"	text,
	PRIMARY KEY("t_day")
);
INSERT INTO "time_of_day" VALUES ('day');
INSERT INTO "time_of_day" VALUES ('night');
INSERT INTO "time_of_day" VALUES ('peak');

CREATE TABLE "technology_labels" (
	"tech_labels"	text,
	"tech_labels_desc"	text,
	PRIMARY KEY("tech_labels")
);
INSERT INTO "technology_labels" VALUES ('r','resource technology');
INSERT INTO "technology_labels" VALUES ('p','production technology');
INSERT INTO "technology_labels" VALUES ('pb','baseload production technology');
INSERT INTO "technology_labels" VALUES ('ps','storage production technology');

CREATE TABLE "technologies" (
	"tech"	text,
	"flag"	text,
	"sector"	text,
	"tech_desc"	text,
	"tech_category"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("flag") REFERENCES "technology_labels"("tech_labels"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('TRA_FT_AVG_E','p','TRA','Fuel technology - Aviation Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_AVG_N','p','TRA','Fuel technology - Aviation Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_DST_E','p','TRA','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_DST_N','p','TRA','Fuel technology - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_ELC_E','p','TRA','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_E','p','TRA','Fuel technology - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_N','p','TRA','Fuel technology - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_HFO_E','p','TRA','Fuel technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_HFO_N','p','TRA','Fuel technology - Heavy fuel Oil - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_HGN_N','p','TRA','Fuel technology - Hydrogen - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_HGN_ELCSYS_N','p','TRA','Fuel technology - Hydrogen from electrolysis - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_E','p','TRA','Fuel technology - Jet kerosene - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_N','p','TRA','Fuel technology - Jet kerosene - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_E','p','TRA','Fuel technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_N','p','TRA','Fuel technology - Liquified Petroleum Gas - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_E','p','TRA','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_N','p','TRA','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIODST_E','p','TRA','Fuel technology - Biodiesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIODST_N','p','TRA','Fuel technology - Biodiesel - New','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('TRA_AVI_DOM_E','p','TRA','Domestic Aircraft - Existing','');
INSERT INTO "technologies" VALUES ('TRA_AVI_INT_E','p','TRA','International Aircraft - Existing','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_E','p','TRA','Domestic Navigation - Existing','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_E','p','TRA','International Navigation - Existing','');
INSERT INTO "technologies" VALUES ('TRA_NEU_E','p','TRA','Non-energy uses - Existing','');
INSERT INTO "technologies" VALUES ('TRA_OTH_ELC_E','p','TRA','Other electric - Existing','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_FRG_E','p','TRA','Freight Trains - Existing','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_PAS_E','p','TRA','Passenger Trains - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_BIO_E','p','TRA','Buses - Biofuel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_DST_E','p','TRA','Buses - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_NGA_E','p','TRA','Buses - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_BIO_E','p','TRA','Cars - Biofuel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_DST_E','p','TRA','Cars - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_GSL_E','p','TRA','Cars - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_LPG_E','p','TRA','Cars - LPG - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_NGA_E','p','TRA','Cars - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_BIO_E','p','TRA','Medium trucks - Biofuel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_DST_E','p','TRA','Heavy trucks - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_BIO_E','p','TRA','Light commercial vehicles - Biofuel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_DST_E','p','TRA','Light commercial vehicle - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_GSL_E','p','TRA','Light commercial vehicle - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MCY_GSL_E','p','TRA','Motorcycles - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MOP_GSL_E','p','TRA','Mopeds - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_DST_E','p','TRA','Medium trucks - Diesel - Existing','');
-- New technologies
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_DST_N','p','TRA','Two-wheelers - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_ELC_N','p','TRA','Two-wheelers - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_GSL_N','p','TRA','Two-wheelers - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_HYBG_N','p','TRA','Two-wheelers - Gasoline hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_DST_N','p','TRA','Buses - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_ELC_N','p','TRA','Buses - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_FCELL_N','p','TRA','Buses - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_GSL_N','p','TRA','Buses - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_HYBD_N','p','TRA','Buses -Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_LPG_N','p','TRA','Buses - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_NGA_N','p','TRA','Buses - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_DST_N','p','TRA','Cars - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_ELC_N','p','TRA','Cars - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_FCELL_N','p','TRA','Cars - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_GSL_N','p','TRA','Cars - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_HYBG_N','p','TRA','Cars - Gasoline hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_LPG_N','p','TRA','Cars - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_NGA_N','p','TRA','Cars - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_PIHYB_N','p','TRA','Cars - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_DST_N','p','TRA','Heavy trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_ELC_N','p','TRA','Heavy trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_FCELL_N','p','TRA','Heavy trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_GSL_N','p','TRA','Heavy trucks - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_HYBD_N','p','TRA','Heavy trucks - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_LPG_N','p','TRA','Heavy trucks - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_NGA_N','p','TRA','Heavy trucks - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_DST_N','p','TRA','Light commercial vehicles - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_ELC_N','p','TRA','Light commercial vehicles - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_FCELL_N','p','TRA','Light commercial vehicles - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_GSL_N','p','TRA','Light commercial vehicles - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_HYBD_N','p','TRA','Light commercial vehicles - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_LPG_N','p','TRA','Light commercial vehicles - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_NGA_N','p','TRA','Light commercial vehicles - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_PIHYB_N','p','TRA','Light commercial vehicles - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_DST_N','p','TRA','Medium trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_ELC_N','p','TRA','Medium trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_FCELL_N','p','TRA','Medium trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_GSL_N','p','TRA','Medium trucks - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_HYBD_N','p','TRA','Medium trucks - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_LPG_N','p','TRA','Medium trucks - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_NGA_N','p','TRA','Medium trucks - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_OTH_ELC_N','p','TRA','Other electric - New','');


CREATE TABLE "tech_reserve" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_exchange" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "tech_curtailment" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "tech_annual" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Transport sector
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_E','');
INSERT INTO "tech_annual" VALUES ('TRA_NEU_E','');
INSERT INTO "tech_annual" VALUES ('TRA_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_BIO_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_NGA_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_BIO_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_LPG_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_NGA_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_BIO_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_BIO_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MCY_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MOP_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_DST_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_HYBG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_HYBG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_PIHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_PIHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_HYBD_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_OTH_ELC_N','');

CREATE TABLE "sector_labels" (
	"sector"	text,
	PRIMARY KEY("sector")
);
INSERT INTO "sector_labels" VALUES('AGR');
INSERT INTO "sector_labels" VALUES('COM');
INSERT INTO "sector_labels" VALUES('RES');
INSERT INTO "sector_labels" VALUES('TRA');
INSERT INTO "sector_labels" VALUES('IND');
INSERT INTO "sector_labels" VALUES('ELC');
INSERT INTO "sector_labels" VALUES('UPS');

CREATE TABLE "regions" (
	"regions"	TEXT,
	"region_note"	TEXT,
	PRIMARY KEY("regions")
);
INSERT INTO "regions" VALUES ('IT','Italy');

CREATE TABLE "commodity_labels" (
	"comm_labels"	text,
	"comm_labels_desc"	text,
	PRIMARY KEY("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','physical commodity');
INSERT INTO "commodity_labels" VALUES ('e','emissions commodity');
INSERT INTO "commodity_labels" VALUES ('d','service demand commodity');

CREATE TABLE "commodities" (
	"comm_name"	text,
	"flag"	text,
	"comm_desc"	text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("flag") REFERENCES "commodity_labels"("comm_labels")
);
-- Transport sector
INSERT INTO "commodities" VALUES('TRA_NEU','d','Non-energy uses [PJ]');
INSERT INTO "commodities" VALUES('TRA_AVI_DOM','d','Domestic aviation [PJ]');
INSERT INTO "commodities" VALUES('TRA_AVI_INT','d','International aviation [PJ]');
INSERT INTO "commodities" VALUES('TRA_ROA_BUS','d','Buses [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_LCV','d','Light commercial vehicles [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_OTH','d','Others [PJ]');
INSERT INTO "commodities" VALUES('TRA_ROA_HTR','d','Heavy trucks [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_MTR','d','Medium trucks [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_CAR','d','Cars [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_ROA_2WH','d','Two-wheelers [Bvkm]');
INSERT INTO "commodities" VALUES('TRA_RAIL_FRG','d','Rail - Freight [PJ]');
INSERT INTO "commodities" VALUES('TRA_RAIL_PSG','d','Rail - Passengers [PJ]');
INSERT INTO "commodities" VALUES('TRA_NAV_DOM','d','Domestic navigation [PJ]');
INSERT INTO "commodities" VALUES('TRA_NAV_INT','d','International navigation [PJ]');
INSERT INTO "commodities" VALUES('TRA_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('TRA_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('TRA_AVG','p','Aviation gasoline');
INSERT INTO "commodities" VALUES('TRA_DST','p','Diesel');
INSERT INTO "commodities" VALUES('TRA_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('TRA_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('TRA_JTK','p','Jet kerosene');
INSERT INTO "commodities" VALUES('TRA_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('TRA_BIO_DST','p','Biodiesel');
INSERT INTO "commodities" VALUES('TRA_HGN','p','Hydrogen');
INSERT INTO "commodities" VALUES('TRA_CH4','e','CH4');
INSERT INTO "commodities" VALUES('TRA_CO2','e','CO2');
INSERT INTO "commodities" VALUES('TRA_N2O','e','N2O');
-- Input commodities
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('UPS_BIO_DST','p','');
INSERT INTO "commodities" VALUES('UPS_HGN_DST','p','');
INSERT INTO "commodities" VALUES('UPS_HGN_ELCSYS_DST','p','');
INSERT INTO "commodities" VALUES('UPS_NGA','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_AVG','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_DST','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_GSL','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_HFO','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_JTK','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_LPG','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_NSP','p','');

CREATE TABLE "TechOutputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"tech"	TEXT,
	"output_comm"	text,
	"to_split"	real,
	"to_split_notes"	text,
	PRIMARY KEY("regions","periods","tech","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "TechInputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"input_comm"	text,
	"tech"	text,
	"ti_split"	real,
	"ti_split_notes"	text,
	PRIMARY KEY("regions","periods","input_comm","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','TRA_FT_ELC_E',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','TRA_FT_ELC_E',0.50,'');
-- Base year technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_JTK','TRA_AVI_DOM_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_AVG','TRA_AVI_DOM_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_NAV_INT_E',0.18,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_HFO','TRA_NAV_INT_E',0.82,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_RAIL_PAS_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_ELC','TRA_RAIL_PAS_E',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'TRA_DST','TRA_RAIL_PAS_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'TRA_ELC','TRA_RAIL_PAS_E',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_RAIL_FRG_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_ELC','TRA_RAIL_FRG_E',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'TRA_DST','TRA_RAIL_FRG_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'TRA_ELC','TRA_RAIL_FRG_E',0.85,'');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'TRA_GSL','TRA_ROA_CAR_PIHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'TRA_ELC','TRA_ROA_CAR_PIHYB_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_DST','TRA_ROA_LCV_PIHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_ELC','TRA_ROA_LCV_PIHYB_N',0.45,'');

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);
CREATE TABLE "SegFrac" (
	"season_name"	text,
	"time_of_day_name"	text,
	"segfrac"	real CHECK("segfrac" >= 0 AND "segfrac" <= 1),
	"segfrac_notes"	text,
	PRIMARY KEY("season_name","time_of_day_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
INSERT INTO "SegFrac" VALUES ('summer','day'  ,0.125,'');
INSERT INTO "SegFrac" VALUES ('summer','night',0.115,'');
INSERT INTO "SegFrac" VALUES ('summer','peak' ,0.01, '');
INSERT INTO "SegFrac" VALUES ('fall'  ,'day'  ,0.125,'');
INSERT INTO "SegFrac" VALUES ('fall'  ,'night',0.115,'');
INSERT INTO "SegFrac" VALUES ('fall'  ,'peak' ,0.01, '');
INSERT INTO "SegFrac" VALUES ('winter','day'  ,0.105,'');
INSERT INTO "SegFrac" VALUES ('winter','night',0.135,'');
INSERT INTO "SegFrac" VALUES ('winter','peak' ,0.01, '');
INSERT INTO "SegFrac" VALUES ('spring','day'  ,0.115,'');
INSERT INTO "SegFrac" VALUES ('spring','night',0.125,'');
INSERT INTO "SegFrac" VALUES ('spring','peak' ,0.01, '');

CREATE TABLE "PlanningReserveMargin" (
	`regions`	text,
	`reserve_margin`	REAL,
	PRIMARY KEY(regions),
	FOREIGN KEY(`regions`) REFERENCES regions
);
CREATE TABLE "Output_V_Capacity" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"tech"	text,
	"vintage"	integer,
	"capacity"	real,
	PRIMARY KEY("regions","scenario","tech","vintage"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "Output_VFlow_Out" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_out"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_VFlow_In" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_in"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_Objective" (
	"scenario"	text,
	"objective_name"	text,
	"total_system_cost"	real
);
CREATE TABLE "Output_Emissions" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"emissions_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods","emissions_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emissions_comm") REFERENCES "EmissionActivity"("emis_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "Output_Curtailment" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"curtailment"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day")
);
CREATE TABLE "Output_Costs" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"output_name"	text,
	"tech"	text,
	"vintage"	integer,
	"output_cost"	real,
	PRIMARY KEY("regions","scenario","output_name","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_Duals" (
	"constraint_name"	text,
	"scenario"	text,
	"dual"	real,
	PRIMARY KEY("constraint_name","scenario")
);
CREATE TABLE "Output_CapacityByPeriodAndTech" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"tech"	text,
	"capacity"	real,
	PRIMARY KEY("regions","scenario","t_periods","tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "MyopicBaseyear" (
	"year"	real,
	"notes"	text
);

CREATE TABLE "tech_groups" (
	`tech`	text,
	`notes`	text,
	PRIMARY KEY(tech)
);
-- Transport sector
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_BIO_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_HYBG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_PIHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_BUS_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_BUS_NGA_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Transport sector
INSERT INTO "groups" VALUES ('TRA_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_CAR_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_CAR_NGA_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_BUS_NGA_GRP','');

CREATE TABLE "MinInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_min_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
CREATE TABLE "MinInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_min"	      real,
	"gi_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);
CREATE TABLE "MaxOutputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"go_max_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
CREATE TABLE "MaxOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	  text,
	"group_name" 	  text,
	"go_max"	      real,
	"go_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);
CREATE TABLE "MaxInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_max_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Transport sector
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_BIO_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_DST_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_GSL_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_LPG_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_DST_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_ELC_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_FCELL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_GSL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_HYBG_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_LPG_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','TRA_ROA_CAR_PIHYB_N','TRA_ROA_CAR_GRP',1.0,'');

CREATE TABLE "MaxInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_max"	      real,
	"gi_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);
-- Transport sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'TRA_GSL','TRA_ROA_CAR_GRP',0.54,''); -- Modified from 0.50 to include the efficiency
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_GSL','TRA_ROA_CAR_GRP',0.54,''); -- Modified from 0.50 to include the efficiency
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'TRA_ELC','TRA_ROA_CAR_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'TRA_ELC','TRA_ROA_CAR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'TRA_ELC','TRA_ROA_CAR_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2040,'TRA_ELC','TRA_ROA_CAR_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_ELC','TRA_ROA_CAR_GRP',0.15,'');

CREATE TABLE "MinGenGroupWeight" (
	"regions"	text,
	"tech"	text,
	"group_name"	text,
	"act_fraction"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Transport sector
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_FT_LPG_E','TRA_FT_LPG_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_FT_LPG_N','TRA_FT_LPG_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_E','TRA_ROA_CAR_NGA_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_N','TRA_ROA_CAR_NGA_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_ROA_BUS_NGA_E','TRA_ROA_BUS_NGA_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','TRA_ROA_BUS_NGA_N','TRA_ROA_BUS_NGA_GRP',1.0,'');

CREATE TABLE "MinGenGroupTarget" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Transport sector
INSERT INTO "MinGenGroupTarget" VALUES (2010,'TRA_FT_LPG_GRP',52.3,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2020,'TRA_FT_LPG_GRP',49.6,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2030,'TRA_FT_LPG_GRP',47.2,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2050,'TRA_FT_LPG_GRP',47.2,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2010,'TRA_ROA_CAR_NGA_GRP',0.357*26.0,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_CAR_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2020,'TRA_ROA_CAR_NGA_GRP',0.357*27.3,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_CAR_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2030,'TRA_ROA_CAR_NGA_GRP',0.357*28.7,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_CAR_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2050,'TRA_ROA_CAR_NGA_GRP',0.357*28.7,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_CAR_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2010,'TRA_ROA_BUS_NGA_GRP',0.045*3.0,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_BUS_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2020,'TRA_ROA_BUS_NGA_GRP',0.045*3.2,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_BUS_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2030,'TRA_ROA_BUS_NGA_GRP',0.045*3.3,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_BUS_NGA_N [Bvkm/PJ]
INSERT INTO "MinGenGroupTarget" VALUES (2050,'TRA_ROA_BUS_NGA_GRP',0.045*3.3,'Bvkm'); -- Multiplied by the efficiency of TRA_ROA_BUS_NGA_N [Bvkm/PJ]

CREATE TABLE "MaxGenGroupWeight" (
	"regions"	text,
	"tech"	text,
	"max_group_name"	text,
	"act_fraction"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","max_group_name","regions")
);
CREATE TABLE "MaxGenGroupLimit" (
	"periods"	integer,
	"max_group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","max_group_name")
);

CREATE TABLE "MinCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"mincap"	real,
	"mincap_units"	text,
	"mincap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "MinActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"minact"	real,
	"minact_units"	text,
	"minact_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "MaxCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxcap"	real,
	"maxcap_units"	text,
	"maxcap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "MaxActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxact"	real,
	"maxact_units"	text,
	"maxact_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_AVG_E',6.73E-01,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_DST_E',1.01E+03,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_GSL_E',5.32E+02,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_HFO_E',1.13E+02,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_JTK_E',1.59E+02,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_LPG_E',4.34E+01,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_NGA_E',1.66E+01,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_BIODST_E',6.44E+00,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_AVG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_GSL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_JTK_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_BIODST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_NGA_N',8.81E+00,'PJ','5.26% of 2025');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'TRA_FT_NGA_N',1.67E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_NGA_N',1.00E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_LPG_N',1.06E+01,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_LPG_N',4.68E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_GSL_N',1.30E+02,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_GSL_N',5.72E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_AVG_N',1.65E-01,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_AVG_N',7.25E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_JTK_N',3.89E+01,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_JTK_N',1.71E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_DST_N',2.48E+02,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_DST_N',1.09E+04,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_HFO_N',2.76E+01,'PJ','2.27% of 2050');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_HFO_N',1.21E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_BIODST_N',3.31E+00,'PJ','5.26% of 2025');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'TRA_FT_BIODST_N',6.28E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_BIODST_N',4.20E+02,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_CAR_GSL_E',1.31E+02,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_CAR_DST_E',1.00E+02,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_CAR_LPG_E',1.04E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_CAR_NGA_E',3.96E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_CAR_BIO_E',8.07E-01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_CAR_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_CAR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_CAR_LPG_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_CAR_NGA_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_CAR_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_MOP_GSL_E',2.58E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_MCY_GSL_E',4.28E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_MOP_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_MCY_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_BUS_BIO_E',2.07E-03,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_BUS_DST_E',3.28E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_BUS_NGA_E',3.50E-02,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_BUS_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_BUS_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_BUS_NGA_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_HTR_BIO_E',1.30E-03,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_HTR_DST_E',1.11E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_HTR_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_HTR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_BIO_E',1.01E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_DST_E',7.07E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_GSL_E',3.73E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_MTR_DST_E',9.39E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_MTR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_OTH_ELC_E',1.96E+01,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_OTH_ELC_E',0.0,'PJ','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_AVG_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_DST_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_GSL_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_HFO_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_JTK_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_LPG_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_NGA_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_BIODST_E',14,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_AVG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_HFO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_JTK_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_BIODST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_GSL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_HGN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_HGN_ELCSYS_N',20,'');
-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_OTH_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_BIO_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_DST_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_NGA_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_BIO_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_DST_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_GSL_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_LPG_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_NGA_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_BIO_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_DST_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_BIO_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_DST_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_GSL_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MCY_GSL_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MOP_GSL_E',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_DST_E',12,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_HYBG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_HYBG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_LPG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_NGA_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_PIHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_HYBD_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_LPG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_NGA_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_PIHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_HYBD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_OTH_ELC_N',10,'');

CREATE TABLE "LifetimeProcess" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"life_process"	real,
	"life_process_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "LifetimeLoanTech" (
	"regions"	text,
	"tech"	text,
	"loan"	real,
	"loan_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GrowthRateSeed" (
	"regions"	text,
	"tech"	text,
	"growthrate_seed"	real,
	"growthrate_seed_units"	text,
	"growthrate_seed_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GrowthRateMax" (
	"regions"	text,
	"tech"	text,
	"growthrate_max"	real,
	"growthrate_max_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "GlobalDiscountRate" (
	"rate"	real
);
INSERT INTO "GlobalDiscountRate" VALUES (0.05);

CREATE TABLE "ExistingCapacity" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"exist_cap"	real,
	"exist_cap_units"	text,
	"exist_cap_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_AVG_E',2006,0.73,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_DST_E',2006,1091.21,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_GSL_E',2006,572.44,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_HFO_E',2006,121.29,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_JTK_E',2006,170.96,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_LPG_E',2006,46.76,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_NGA_E',2006,17.83,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_BIODST_E',2006,6.93,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_ELC_E',2006,40.00,'','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_GSL_E',2006,1.415E+02,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_DST_E',2006,1.079E+02,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_LPG_E',2006,1.120E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_NGA_E',2006,4.267E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_BIO_E',2006,8.696E-01,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MOP_GSL_E',2006,2.782E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MCY_GSL_E',2006,4.614E+01,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_BIO_E',2006,2.23E-03,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_DST_E',2006,3.53E+00,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_NGA_E',2006,6.55E-02,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_HTR_BIO_E',2006,0.0014,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_HTR_DST_E',2006,11.989,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_BIO_E',2006,1.092,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_DST_E',2006,76.173,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_GSL_E',2006,4.021,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MTR_DST_E',2006,10.10,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_OTH_ELC_E',2006,21.055,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_AVI_DOM_E',2006,3.221,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_AVI_INT_E',2006,134.5,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NAV_DOM_E',2006,10.05,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NAV_INT_E',2006,143.73,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NEU_E',2006,14.21,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_RAIL_FRG_E',2006,13.76,'','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_RAIL_PAS_E',2006,6.78,'','');

CREATE TABLE "EmissionLimit" (
	"regions"	text,
	"periods"	integer,
	"emis_comm"	text,
	"emis_limit"	real,
	"emis_limit_units"	text,
	"emis_limit_notes"	text,
	PRIMARY KEY("periods","emis_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "EmissionActivity" (
	"regions"	text,
	"emis_comm"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"emis_act"	real,
	"emis_act_units"	text,
	"emis_act_notes"	text,
	PRIMARY KEY("regions","emis_comm","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "CommodityEmissionFactor" (
	"input_comm"    text,
	"emis_comm"     text,
	"ef"            real,
	"emis_unit"     text,
	"ef_notes"      text,
	PRIMARY KEY("input_comm","ef","emis_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- Transport sector
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CO2',5.610E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CO2',6.307E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CO2',6.930E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_CO2',6.930E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CO2',7.150E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_CO2',7.407E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_CO2',7.737E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CH4',1.100E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CH4',1.180E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CH4',6.920E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_CH4',6.000E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CH4',5.530E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_CH4',1.320E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_CH4',7.200E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_N2O',1.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_N2O',9.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_N2O',6.600E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_N2O',6.860E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_N2O',6.100E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_N2O',3.360E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_N2O',3.110E+00,'kt/PJ','');

CREATE TABLE "Efficiency" (
	"regions"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"efficiency"	real CHECK("efficiency" > 0),
	"eff_notes"	text,
	PRIMARY KEY("regions","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_AVG','TRA_FT_AVG_E',2006,'TRA_AVG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_AVG','TRA_FT_AVG_N',2007,'TRA_AVG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','TRA_FT_DST_E',2006,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','TRA_FT_DST_N',2007,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','TRA_FT_ELC_E',2006,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','TRA_FT_ELC_E',2006,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_GSL','TRA_FT_GSL_E',2006,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_GSL','TRA_FT_GSL_N',2007,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_HFO','TRA_FT_HFO_E',2006,'TRA_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_HFO','TRA_FT_HFO_N',2007,'TRA_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_HGN_DST','TRA_FT_HGN_N',2007,'TRA_HGN',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_HGN_ELCSYS_DST','TRA_FT_HGN_ELCSYS_N',2007,'TRA_HGN',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_JTK','TRA_FT_JTK_E',2006,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_JTK','TRA_FT_JTK_N',2007,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','TRA_FT_LPG_E',2006,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','TRA_FT_LPG_N',2007,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','TRA_FT_NGA_E',2006,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','TRA_FT_NGA_N',2007,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_DST','TRA_FT_BIODST_E',2006,'TRA_BIO_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_DST','TRA_FT_BIODST_N',2007,'TRA_BIO_DST',1.0,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AVG','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_DOM_E',2016,'TRA_AVI_DOM',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AVG','TRA_AVI_DOM_E',2016,'TRA_AVI_DOM',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_DOM_E',2050,'TRA_AVI_DOM',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AVG','TRA_AVI_DOM_E',2050,'TRA_AVI_DOM',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_INT_E',2006,'TRA_AVI_INT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_INT_E',2016,'TRA_AVI_INT',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_INT_E',2050,'TRA_AVI_INT',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_E',2006,'TRA_NAV_DOM',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_E',2010,'TRA_NAV_DOM',1.02,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_E',2050,'TRA_NAV_DOM',1.25,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_E',2006,'TRA_NAV_INT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_E',2006,'TRA_NAV_INT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_E',2010,'TRA_NAV_INT',1.04,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_E',2010,'TRA_NAV_INT',1.04,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_E',2050,'TRA_NAV_INT',1.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_E',2050,'TRA_NAV_INT',1.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_NSP','TRA_NEU_E',2006,'TRA_NEU',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_OTH_ELC_E',2006,'TRA_OTH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_BUS_BIO_E',2006,'TRA_ROA_BUS',0.056,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_E',2006,'TRA_ROA_BUS',0.052,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_BUS_NGA_E',2006,'TRA_ROA_BUS',0.038,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_CAR_BIO_E',2006,'TRA_ROA_CAR',0.442,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_E',2006,'TRA_ROA_CAR',0.362,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_E',2006,'TRA_ROA_CAR',0.299,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_CAR_LPG_E',2006,'TRA_ROA_CAR',0.247,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_CAR_NGA_E',2006,'TRA_ROA_CAR',0.274,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_HTR_BIO_E',2006,'TRA_ROA_HTR',0.027,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_E',2006,'TRA_ROA_HTR',0.045,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_LCV_BIO_E',2006,'TRA_ROA_LCV',0.276,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_E',2006,'TRA_ROA_LCV',0.276,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_E',2006,'TRA_ROA_LCV',0.241,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MOP_GSL_E',2006,'TRA_ROA_2WH',1.315,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MCY_GSL_E',2006,'TRA_ROA_2WH',1.026,'Bvm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_E',2006,'TRA_ROA_MTR',0.090,'Bvm/PJ');
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2007,'TRA_ROA_2WH',0.946,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2050,'TRA_ROA_2WH',1.259,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_2WH_DST_N',2007,'TRA_ROA_2WH',1.117,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_2WH_DST_N',2050,'TRA_ROA_2WH',1.487,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2016,'TRA_ROA_2WH',3.468,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2050,'TRA_ROA_2WH',4.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_HYBG_N',2020,'TRA_ROA_2WH',1.609,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_HYBG_N',2050,'TRA_ROA_2WH',2.188,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2007,'TRA_ROA_BUS',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2020,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2050,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2007,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2020,'TRA_ROA_BUS',0.059,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2050,'TRA_ROA_BUS',0.069,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_BUS_LPG_N',2007,'TRA_ROA_BUS',0.043,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_BUS_NGA_N',2007,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2016,'TRA_ROA_BUS',0.148,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2020,'TRA_ROA_BUS',0.148,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2050,'TRA_ROA_BUS',0.172,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_HYBD_N',2016,'TRA_ROA_BUS',0.053,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_HYBD_N',2020,'TRA_ROA_BUS',0.055,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_HYBD_N',2050,'TRA_ROA_BUS',0.075,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_BUS_FCELL_N',2020,'TRA_ROA_BUS',0.094,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_BUS_FCELL_N',2050,'TRA_ROA_BUS',0.127,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2007,'TRA_ROA_CAR',0.313,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2020,'TRA_ROA_CAR',0.358,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2050,'TRA_ROA_CAR',0.416,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2007,'TRA_ROA_CAR',0.375,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2020,'TRA_ROA_CAR',0.429,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2050,'TRA_ROA_CAR',0.500,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_CAR_LPG_N',2007,'TRA_ROA_CAR',0.337,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_CAR_NGA_N',2007,'TRA_ROA_CAR',0.357,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2007,'TRA_ROA_CAR',1.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2020,'TRA_ROA_CAR',1.234,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2050,'TRA_ROA_CAR',1.369,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_HYBG_N',2007,'TRA_ROA_CAR',0.453,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_HYBG_N',2020,'TRA_ROA_CAR',0.507,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_HYBG_N',2050,'TRA_ROA_CAR',0.690,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_CAR_FCELL_N',2016,'TRA_ROA_CAR',0.637,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_CAR_FCELL_N',2020,'TRA_ROA_CAR',0.637,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_CAR_FCELL_N',2050,'TRA_ROA_CAR',0.936,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2016,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PIHYB_N',2016,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2020,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PIHYB_N',2020,'TRA_ROA_CAR',0.760,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PIHYB_N',2050,'TRA_ROA_CAR',1.030,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PIHYB_N',2050,'TRA_ROA_CAR',1.030,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_HTR_GSL_N',2007,'TRA_ROA_HTR',0.032,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_HTR_GSL_N',2020,'TRA_ROA_HTR',0.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_HTR_GSL_N',2050,'TRA_ROA_HTR',0.043,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2007,'TRA_ROA_HTR',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2020,'TRA_ROA_HTR',0.044,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2050,'TRA_ROA_HTR',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_HTR_LPG_N',2007,'TRA_ROA_HTR',0.035,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_HTR_NGA_N',2007,'TRA_ROA_HTR',0.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2025,'TRA_ROA_HTR',0.122,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2050,'TRA_ROA_HTR',0.142,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_HYBD_N',2016,'TRA_ROA_HTR',0.044,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_HYBD_N',2020,'TRA_ROA_HTR',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_HYBD_N',2050,'TRA_ROA_HTR',0.061,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_HTR_FCELL_N',2025,'TRA_ROA_HTR',0.077,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_HTR_FCELL_N',2050,'TRA_ROA_HTR',0.105,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2007,'TRA_ROA_LCV',0.237,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2020,'TRA_ROA_LCV',0.271,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2050,'TRA_ROA_LCV',0.316,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2007,'TRA_ROA_LCV',0.272,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2020,'TRA_ROA_LCV',0.311,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2050,'TRA_ROA_LCV',0.362,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_LCV_LPG_N',2007,'TRA_ROA_LCV',0.274,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_LCV_NGA_N',2007,'TRA_ROA_LCV',0.258,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2016,'TRA_ROA_LCV',1.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2020,'TRA_ROA_LCV',1.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2050,'TRA_ROA_LCV',1.262,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_HYBD_N',2016,'TRA_ROA_LCV',0.288,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_HYBD_N',2020,'TRA_ROA_LCV',0.298,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_HYBD_N',2050,'TRA_ROA_LCV',0.405,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_LCV_FCELL_N',2025,'TRA_ROA_LCV',0.575,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_LCV_FCELL_N',2050,'TRA_ROA_LCV',0.782,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_PIHYB_N',2020,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_PIHYB_N',2020,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_PIHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_PIHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MTR_GSL_N',2007,'TRA_ROA_MTR',0.074,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MTR_GSL_N',2020,'TRA_ROA_MTR',0.085,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MTR_GSL_N',2050,'TRA_ROA_MTR',0.099,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2007,'TRA_ROA_MTR',0.089,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2020,'TRA_ROA_MTR',0.102,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2050,'TRA_ROA_MTR',0.118,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_MTR_LPG_N',2007,'TRA_ROA_MTR',0.080,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_MTR_NGA_N',2007,'TRA_ROA_MTR',0.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2020,'TRA_ROA_MTR',0.279,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2050,'TRA_ROA_MTR',0.324,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_HYBD_N',2016,'TRA_ROA_MTR',0.100,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_HYBD_N',2020,'TRA_ROA_MTR',0.103,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_HYBD_N',2050,'TRA_ROA_MTR',0.140,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_MTR_FCELL_N',2025,'TRA_ROA_MTR',0.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HGN','TRA_ROA_MTR_FCELL_N',2050,'TRA_ROA_MTR',0.239,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_OTH_ELC_N',2007,'TRA_OTH',1.000,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_OTH_ELC_N',2050,'TRA_OTH',1.300,'PJ/PJ');

CREATE TABLE "DiscountRate" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"tech_rate"	real,
	"tech_rate_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "DemandSpecificDistribution" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"demand_name"	text,
	"dds"	real CHECK("dds" >= 0 AND "dds" <= 1),
	"dds_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","demand_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("demand_name") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Driver" (
    "regions"       text,
    "periods"   	integer,
	"driver_name"	text,
	"driver"        real,
	"driver_notes"  text,
	PRIMARY KEY("regions", "periods", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
INSERT INTO "Driver" VALUES ('IT',2006,'POP',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'POP',1.006,'');
INSERT INTO "Driver" VALUES ('IT',2008,'POP',1.014,'');
INSERT INTO "Driver" VALUES ('IT',2010,'POP',1.025,'');
INSERT INTO "Driver" VALUES ('IT',2012,'POP',1.037,'');
INSERT INTO "Driver" VALUES ('IT',2014,'POP',1.045,'');
INSERT INTO "Driver" VALUES ('IT',2016,'POP',1.053,'');
INSERT INTO "Driver" VALUES ('IT',2018,'POP',1.063,'');
INSERT INTO "Driver" VALUES ('IT',2020,'POP',1.073,'');
INSERT INTO "Driver" VALUES ('IT',2022,'POP',1.080,'');
INSERT INTO "Driver" VALUES ('IT',2025,'POP',1.091,'');
INSERT INTO "Driver" VALUES ('IT',2030,'POP',1.110,'');
INSERT INTO "Driver" VALUES ('IT',2040,'POP',1.134,'');
INSERT INTO "Driver" VALUES ('IT',2050,'POP',1.159,'');
INSERT INTO "Driver" VALUES ('IT',2006,'GDP',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'GDP',1.015,'');
INSERT INTO "Driver" VALUES ('IT',2008,'GDP',1.004,'');
INSERT INTO "Driver" VALUES ('IT',2010,'GDP',0.965,'');
INSERT INTO "Driver" VALUES ('IT',2012,'GDP',0.943,'');
INSERT INTO "Driver" VALUES ('IT',2014,'GDP',0.928,'');
INSERT INTO "Driver" VALUES ('IT',2016,'GDP',0.946,'');
INSERT INTO "Driver" VALUES ('IT',2018,'GDP',0.972,'');
INSERT INTO "Driver" VALUES ('IT',2020,'GDP',0.999,'');
INSERT INTO "Driver" VALUES ('IT',2022,'GDP',1.023,'');
INSERT INTO "Driver" VALUES ('IT',2025,'GDP',1.059,'');
INSERT INTO "Driver" VALUES ('IT',2030,'GDP',1.123,'');
INSERT INTO "Driver" VALUES ('IT',2040,'GDP',1.249,'');
INSERT INTO "Driver" VALUES ('IT',2050,'GDP',1.388,'');
INSERT INTO "Driver" VALUES ('IT',2006,'GDPP',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'GDPP',1.012,'');
INSERT INTO "Driver" VALUES ('IT',2008,'GDPP',0.994,'');
INSERT INTO "Driver" VALUES ('IT',2010,'GDPP',0.947,'');
INSERT INTO "Driver" VALUES ('IT',2012,'GDPP',0.922,'');
INSERT INTO "Driver" VALUES ('IT',2014,'GDPP',0.886,'');
INSERT INTO "Driver" VALUES ('IT',2016,'GDPP',0.906,'');
INSERT INTO "Driver" VALUES ('IT',2018,'GDPP',0.915,'');
INSERT INTO "Driver" VALUES ('IT',2020,'GDPP',0.920,'');
INSERT INTO "Driver" VALUES ('IT',2022,'GDPP',0.953,'');
INSERT INTO "Driver" VALUES ('IT',2025,'GDPP',1.025,'');
INSERT INTO "Driver" VALUES ('IT',2030,'GDPP',1.097,'');
INSERT INTO "Driver" VALUES ('IT',2040,'GDPP',1.242,'');
INSERT INTO "Driver" VALUES ('IT',2050,'GDPP',1.322,'');
INSERT INTO "Driver" VALUES ('IT',2006,'GDPPHOU',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'GDPPHOU',0.999,'');
INSERT INTO "Driver" VALUES ('IT',2008,'GDPPHOU',0.972,'');
INSERT INTO "Driver" VALUES ('IT',2010,'GDPPHOU',0.905,'');
INSERT INTO "Driver" VALUES ('IT',2012,'GDPPHOU',0.878,'');
INSERT INTO "Driver" VALUES ('IT',2014,'GDPPHOU',0.864,'');
INSERT INTO "Driver" VALUES ('IT',2016,'GDPPHOU',0.874,'');
INSERT INTO "Driver" VALUES ('IT',2018,'GDPPHOU',0.895,'');
INSERT INTO "Driver" VALUES ('IT',2020,'GDPPHOU',0.917,'');
INSERT INTO "Driver" VALUES ('IT',2022,'GDPPHOU',0.931,'');
INSERT INTO "Driver" VALUES ('IT',2025,'GDPPHOU',0.954,'');
INSERT INTO "Driver" VALUES ('IT',2030,'GDPPHOU',0.993,'');
INSERT INTO "Driver" VALUES ('IT',2040,'GDPPHOU',1.066,'');
INSERT INTO "Driver" VALUES ('IT',2050,'GDPPHOU',1.146,'');
INSERT INTO "Driver" VALUES ('IT',2006,'HOU',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'HOU',1.015,'');
INSERT INTO "Driver" VALUES ('IT',2008,'HOU',1.030,'');
INSERT INTO "Driver" VALUES ('IT',2010,'HOU',1.060,'');
INSERT INTO "Driver" VALUES ('IT',2012,'HOU',1.070,'');
INSERT INTO "Driver" VALUES ('IT',2014,'HOU',1.079,'');
INSERT INTO "Driver" VALUES ('IT',2016,'HOU',1.089,'');
INSERT INTO "Driver" VALUES ('IT',2018,'HOU',1.098,'');
INSERT INTO "Driver" VALUES ('IT',2020,'HOU',1.107,'');
INSERT INTO "Driver" VALUES ('IT',2022,'HOU',1.112,'');
INSERT INTO "Driver" VALUES ('IT',2025,'HOU',1.118,'');
INSERT INTO "Driver" VALUES ('IT',2030,'HOU',1.145,'');
INSERT INTO "Driver" VALUES ('IT',2040,'HOU',1.203,'');
INSERT INTO "Driver" VALUES ('IT',2050,'HOU',1.265,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PAGR',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PAGR',1.002,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PAGR',0.875,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PAGR',0.880,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PAGR',0.864,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PAGR',0.858,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PAGR',0.872,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PAGR',0.886,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PAGR',0.900,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PAGR',0.914,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PAGR',0.936,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PAGR',0.973,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PAGR',1.051,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PAGR',1.136,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PSER',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PSER',1.019,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PSER',1.012,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PSER',0.995,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PSER',0.989,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PSER',0.983,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PSER',1.007,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PSER',1.037,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PSER',1.068,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PSER',1.096,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PSER',1.140,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PSER',1.218,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PSER',1.370,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PSER',1.542,'');
INSERT INTO "Driver" VALUES ('IT',2006,'DRH3',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'DRH3',1.050,'');
INSERT INTO "Driver" VALUES ('IT',2008,'DRH3',1.103,'');
INSERT INTO "Driver" VALUES ('IT',2010,'DRH3',1.216,'');
INSERT INTO "Driver" VALUES ('IT',2012,'DRH3',1.340,'');
INSERT INTO "Driver" VALUES ('IT',2014,'DRH3',1.477,'');
INSERT INTO "Driver" VALUES ('IT',2016,'DRH3',1.629,'');
INSERT INTO "Driver" VALUES ('IT',2018,'DRH3',1.711,'');
INSERT INTO "Driver" VALUES ('IT',2020,'DRH3',1.798,'');
INSERT INTO "Driver" VALUES ('IT',2022,'DRH3',1.871,'');
INSERT INTO "Driver" VALUES ('IT',2025,'DRH3',1.985,'');
INSERT INTO "Driver" VALUES ('IT',2030,'DRH3',2.192,'');
INSERT INTO "Driver" VALUES ('IT',2040,'DRH3',2.544,'');
INSERT INTO "Driver" VALUES ('IT',2050,'DRH3',2.952,'');
INSERT INTO "Driver" VALUES ('IT',2006,'DRH4',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'DRH4',1.100,'');
INSERT INTO "Driver" VALUES ('IT',2008,'DRH4',1.210,'');
INSERT INTO "Driver" VALUES ('IT',2010,'DRH4',1.464,'');
INSERT INTO "Driver" VALUES ('IT',2012,'DRH4',1.772,'');
INSERT INTO "Driver" VALUES ('IT',2014,'DRH4',2.144,'');
INSERT INTO "Driver" VALUES ('IT',2016,'DRH4',2.594,'');
INSERT INTO "Driver" VALUES ('IT',2018,'DRH4',2.860,'');
INSERT INTO "Driver" VALUES ('IT',2020,'DRH4',3.153,'');
INSERT INTO "Driver" VALUES ('IT',2022,'DRH4',3.410,'');
INSERT INTO "Driver" VALUES ('IT',2025,'DRH4',3.836,'');
INSERT INTO "Driver" VALUES ('IT',2030,'DRH4',4.667,'');
INSERT INTO "Driver" VALUES ('IT',2040,'DRH4',6.908,'');
INSERT INTO "Driver" VALUES ('IT',2050,'DRH4',10.225,'');

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("driver_name") REFERENCES "Driver"("driver_name")
);
INSERT INTO "Allocation" VALUES ('IT','AGR_DEM','PAGR','');
INSERT INTO "Allocation" VALUES ('IT','COM_SC','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_CK','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_SH','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_WH','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_LG','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_OE','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_RF','PSER','');
INSERT INTO "Allocation" VALUES ('IT','RES_CD','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_CK','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_CW','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_DW','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_LG','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_OE','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_RF','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SC','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MN','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MO','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SN','DRH3','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SO','DRH4','');
INSERT INTO "Allocation" VALUES ('IT','RES_WH','POP','');
INSERT INTO "Allocation" VALUES ('IT','IND_CH','PCHEM','');
INSERT INTO "Allocation" VALUES ('IT','IND_IS','PIS','');
INSERT INTO "Allocation" VALUES ('IT','IND_PP','PLP','');
INSERT INTO "Allocation" VALUES ('IT','IND_NF','PISNF','');
INSERT INTO "Allocation" VALUES ('IT','IND_NM','PNM','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH','POI','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH_NEU','GDP','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH_NSP','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_NEU','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_AVI_DOM','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_AVI_INT','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_BUS','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_LCV','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_OTH','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_HTR','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_MTR','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_CAR','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_ROA_2WH','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_RAIL_FRG','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_RAIL_PSG','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_NAV_DOM','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_NAV_INT','GDP','');

CREATE TABLE "Elasticity" (
    "regions"       text,
    "periods"   	integer,
	"demand_comm"	text,
	"elasticity"    real,
	"elaticity_notes"  text,
	PRIMARY KEY("regions", "periods", "demand_comm"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
INSERT INTO "Elasticity" VALUES ('IT',2007,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'AGR_DEM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'AGR_DEM',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'AGR_DEM',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_SC',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_SC',-1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_SC',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_CK',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_CK',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_CK',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_CK',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_CK',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_CK',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_CK',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_SH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_SH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_SH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_SH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_WH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_WH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_WH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_LG',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_LG',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_LG',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_LG',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_OE',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_OE',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_RF',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_RF',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_RF',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_RF',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_CH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_CH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_CH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_CH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_CH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_CH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_CH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_CH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_CH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_CH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_IS',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_IS',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_IS',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_IS',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_IS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_IS',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_IS',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_IS',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_IS',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_IS',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_PP',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_PP',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_PP',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_PP',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_PP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_PP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_PP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_PP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_PP',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_PP',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_NF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_NF',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_NF',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_NF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_NF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_NF',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_NF',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_NF',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_NF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_NF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_NM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_NM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_NM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_NM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_NM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_NM',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_NM',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_NM',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_NM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_NM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH_NEU',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH_NEU',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH_NEU',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH_NEU',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH_NEU',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH_NEU',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NEU',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NEU',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NEU',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NEU',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NEU',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NEU',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NEU',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NEU',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH_NSP',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH_NSP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH_NSP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH_NSP',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH_NSP',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH_NSP',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH_NSP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH_NSP',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH_NSP',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH_NSP',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH_NSP',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SC',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SC',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CD',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CD',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_DW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_DW',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_OE',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_MN',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_MO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_SN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_SN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_SN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_SN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_SN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_SN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_SN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_SN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_SN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_SN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_SN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_SN',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_SN',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_SO',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_SO',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_SO',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_SO',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_SO',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_SO',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_SO',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_SO',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_SO',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_SO',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_SO',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_LG',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_LG',0.90,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_RF',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_RF',0.90,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_AVI_DOM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_AVI_DOM',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_AVI_DOM',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_AVI_DOM',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_AVI_DOM',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_AVI_DOM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_AVI_DOM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_AVI_DOM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_AVI_DOM',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_AVI_DOM',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_AVI_DOM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_AVI_DOM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_AVI_DOM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_AVI_INT',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_AVI_INT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_AVI_INT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_AVI_INT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_AVI_INT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_AVI_INT',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_AVI_INT',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_AVI_INT',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_AVI_INT',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_AVI_INT',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_AVI_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_AVI_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_AVI_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_BUS',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_BUS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_BUS',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_BUS',0.90,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_BUS',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_BUS',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_LCV',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_LCV',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_LCV',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_LCV',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_HTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_HTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_HTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_HTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_MTR',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_MTR',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_MTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_MTR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_OTH',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_OTH',-0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_OTH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_CAR',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_CAR',0.70,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_CAR',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_CAR',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_CAR',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_2WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_2WH',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_2WH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_2WH',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_2WH',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_2WH',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_2WH',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_RAIL_FRG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_RAIL_FRG',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_RAIL_FRG',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_RAIL_FRG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_RAIL_FRG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_RAIL_FRG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_RAIL_FRG',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_RAIL_FRG',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_RAIL_PSG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_RAIL_PSG',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_RAIL_PSG',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_RAIL_PSG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_RAIL_PSG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_RAIL_PSG',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_RAIL_PSG',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_RAIL_PSG',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NAV_DOM',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NAV_DOM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NAV_DOM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NAV_DOM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NAV_DOM',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NAV_DOM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NAV_DOM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NAV_DOM',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NAV_DOM',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NAV_DOM',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NAV_DOM',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NAV_DOM',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NAV_DOM',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NAV_INT',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NAV_INT',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NAV_INT',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NAV_INT',0.80,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NAV_INT',0.60,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NAV_INT',0.60,'');

CREATE TABLE "Demand" (
	"regions"	text,
	"periods"	integer,
	"demand_comm"	text,
	"demand"	real,
	"demand_units"	text,
	"demand_notes"	text,
	PRIMARY KEY("regions","periods","demand_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Transport sector
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_HTR',1.198E+01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_MTR',1.016E+01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_CAR',2.655E+02,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_2WH',7.388E+01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_BUS',3.595E+00,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_LCV',8.121E+01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_AVI_DOM',3.221E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_AVI_INT',1.345E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NEU',1.420E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_OTH',2.103E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_RAIL_FRG',1.375E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_RAIL_PSG',6.774E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NAV_DOM',1.005E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NAV_INT',1.437E+02,'PJ','');

CREATE TABLE "CostVariable" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_variable"	real,
	"cost_variable_units"	text,
	"cost_variable_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_AVG_N',2007,0.1,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_DST_N',2007,1.0,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_GSL_N',2007,1.0,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_HFO_N',2007,0.5,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_JTK_N',2007,0.1,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_LPG_N',2007,2.0,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_NGA_N',2007,3.0,'','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_BIODST_N',2007,1.0,'','');

CREATE TABLE "CostInvest" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cost_invest"	real,
	"cost_invest_units"	text,
	"cost_invest_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Transport sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_AVG_N',2007,5.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_DST_N',2007,10.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_GSL_N',2007,10.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_HFO_N',2007,5.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_JTK_N',2007,5.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_LPG_N',2007,30.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_NGA_N',2007,100.0,'','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_BIODST_N',2007,10.0,'','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_GSL_N',2007,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_DST_N',2007,1098.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2016,2477.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2050,1283.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_HYBG_N',2020,1401.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_HYBG_N',2050,1323.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_GSL_N',2007,1014.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_GSL_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_DST_N',2007,1032.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_DST_N',2020,1018.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_LPG_N',2007,1063.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_NGA_N',2007,1063.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2016,2061.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2030,1789.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2040,1672.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2050,1602.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2020,3605.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2030,3161.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2040,2948.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2050,2793.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_HYBD_N',2016,1198.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_HYBD_N',2030,1162.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_HYBD_N',2040,1146.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_HYBD_N',2050,1137.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_GSL_N',2007,1014.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_GSL_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_DST_N',2007,1096.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_DST_N',2020,1081.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_LPG_N',2007,1081.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_NGA_N',2007,1081.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2007,2202.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2020,1949.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2030,1409.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2040,1317.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2050,1262.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_HYBG_N',2007,1284.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_HYBG_N',2020,1208.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_HYBG_N',2030,1168.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_HYBG_N',2040,1150.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_HYBG_N',2050,1140.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2016,4095.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2030,2054.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2040,1915.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2050,1814.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PIHYB_N',2016,1900.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PIHYB_N',2030,1440.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PIHYB_N',2040,1369.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PIHYB_N',2050,1321.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_GSL_N',2007,1014.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_GSL_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_DST_N',2007,1077.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_DST_N',2020,1063.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_LPG_N',2007,1056.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_NGA_N',2007,1056.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2025,2050.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2030,1779.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2040,1663.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2050,1593.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2025,2929.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2030,2569.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2040,2395.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2050,2269.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_HYBD_N',2016,1214.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_HYBD_N',2020,1190.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_HYBD_N',2030,1154.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_HYBD_N',2040,1138.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_HYBD_N',2050,1129.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_GSL_N',2007,1014.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_GSL_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_DST_N',2007,1013.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_DST_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_LPG_N',2007,1161.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_NGA_N',2007,1161.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2016,2493.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2030,1803.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2040,1685.4,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2050,1615.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2025,2811.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2030,2054.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2040,1916.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2050,1815.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_HYBD_N',2016,1193.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_HYBD_N',2030,1156.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_HYBD_N',2040,1141.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_HYBD_N',2050,1132,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PIHYB_N',2020,1902.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PIHYB_N',2030,1449.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PIHYB_N',2040,1382.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PIHYB_N',2050,1336.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_GSL_N',2007,1014.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_GSL_N',2020,1000.0,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_DST_N',2007,1080.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_DST_N',2020,1066.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_LPG_N',2007,1053.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_NGA_N',2007,1053.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2020,2050.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2030,1779.7,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2040,1663.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2050,1593.8,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_HYBD_N',2016,1186.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_HYBD_N',2030,1150.9,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_HYBD_N',2040,1135.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_HYBD_N',2050,1126.2,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2025,2928.6,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2030,2568.5,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2040,2395.3,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2050,2269.1,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_OTH_ELC_N',2007,1.0,'M€/PJ','');

CREATE TABLE "CostFixed" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_fixed"	real,
	"cost_fixed_units"	text,
	"cost_fixed_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Transport sector
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_2WH_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_2WH_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_2WH_ELC_N',2016,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_2WH_HYBG_N',2020,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_BUS_ELC_N',2016,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_BUS_HYBD_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_BUS_FCELL_N',2020,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_ELC_N',2007,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_HYBG_N',2007,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_CAR_FCELL_N',2016,70.03,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_CAR_PIHYB_N',2016,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_HTR_ELC_N',2025,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_HTR_HYBD_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_HTR_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_LCV_ELC_N',2016,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_LCV_HYBD_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_LCV_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_LCV_PIHYB_N',2020,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_MTR_ELC_N',2020,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_MTR_HYBD_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_MTR_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_OTH_ELC_N',2007,1.0,'M€/PJ','');

CREATE TABLE "CapacityFactor" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cf"	real,
	"cf_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "CapacityFactorTech" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"cf_tech"	real CHECK("cf_tech" >= 0 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "CapacityFactorProcess" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"vintage"	integer,
	"cf_process"	real CHECK("cf_process" >= 0 AND "cf_process" <= 1),
	"cf_process_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
CREATE TABLE "CapacityCredit" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"vintage" integer,
	"cf_tech"	real CHECK("cf_tech" >= 0 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage")
);

COMMIT;