
CREATE TABLE "regions" (
	"regions"	TEXT,
	"region_note"	TEXT,
	PRIMARY KEY("regions")
);
INSERT INTO "regions" VALUES ('IT','Italy');

CREATE TABLE "time_period_labels" (
	"t_period_labels"	text,
	"t_period_labels_desc"	text,
	PRIMARY KEY("t_period_labels")
);
INSERT INTO "time_period_labels" VALUES ('e','existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','future vintages');

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
INSERT INTO "time_periods" VALUES (2035,'f');
INSERT INTO "time_periods" VALUES (2040,'f');
INSERT INTO "time_periods" VALUES (2045,'f');
INSERT INTO "time_periods" VALUES (2050,'f');
INSERT INTO "time_periods" VALUES (2060,'f');

CREATE TABLE "MyopicBaseyear" (
	"year"	real,
	"notes"	text
);

CREATE TABLE "time_season" (
	"t_season"	text,
	PRIMARY KEY("t_season")
);
INSERT INTO "time_season" VALUES ('winter'); --January/March
INSERT INTO "time_season" VALUES ('spring'); --April/June
INSERT INTO "time_season" VALUES ('summer'); --July/September
INSERT INTO "time_season" VALUES ('fall'); --October/December

CREATE TABLE "time_of_day" (
	"t_day"	text,
	PRIMARY KEY("t_day")
);
INSERT INTO "time_of_day" VALUES ('night'); --20:00/04:59
INSERT INTO "time_of_day" VALUES ('morning'); --05:00/10:59
INSERT INTO "time_of_day" VALUES ('noon'); --11:00/13:59
INSERT INTO "time_of_day" VALUES ('afternoon'); --14:00/19:59

CREATE TABLE "SegFrac" (
	"season_name"	text,
	"time_of_day_name"	text,
	"segfrac"	real CHECK("segfrac" >= 0 AND "segfrac" <= 1),
	"segfrac_notes"	text,
	PRIMARY KEY("season_name","time_of_day_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
INSERT INTO "SegFrac" VALUES ('winter','night',0.0925,'');
INSERT INTO "SegFrac" VALUES ('winter','morning',0.0617,'');
INSERT INTO "SegFrac" VALUES ('winter','noon',0.0308,'');
INSERT INTO "SegFrac" VALUES ('winter','afternoon',0.0617,'');
INSERT INTO "SegFrac" VALUES ('spring','night',0.0935,'');
INSERT INTO "SegFrac" VALUES ('spring','morning',0.0623,'');
INSERT INTO "SegFrac" VALUES ('spring','noon',0.0312,'');
INSERT INTO "SegFrac" VALUES ('spring','afternoon',0.0623,'');
INSERT INTO "SegFrac" VALUES ('summer','night',0.0945,'');
INSERT INTO "SegFrac" VALUES ('summer','morning',0.0630,'');
INSERT INTO "SegFrac" VALUES ('summer','noon',0.0315,'');
INSERT INTO "SegFrac" VALUES ('summer','afternoon',0.0630,'');
INSERT INTO "SegFrac" VALUES ('fall','night',0.0945,'');
INSERT INTO "SegFrac" VALUES ('fall','morning',0.0630,'');
INSERT INTO "SegFrac" VALUES ('fall','noon',0.0315,'');
INSERT INTO "SegFrac" VALUES ('fall','afternoon',0.0630,'');

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
INSERT INTO "sector_labels" VALUES ('H2');
INSERT INTO "sector_labels" VALUES ('CCUS');

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
INSERT INTO "technologies" VALUES ('TRA_FT_AMM_IND_N','p','TRA','Fuel technology - Ammonia from industry - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_AVG_E','p','TRA','Fuel technology - Aviation Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_AVG_N','p','TRA','Fuel technology - Aviation Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_DST_E','p','TRA','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_DST_N','p','TRA','Fuel technology - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_ELC_E','p','TRA','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_E','p','TRA','Fuel technology - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_GSL_N','p','TRA','Fuel technology - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_HFO_E','p','TRA','Fuel technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_HFO_N','p','TRA','Fuel technology - Heavy fuel Oil - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_E','p','TRA','Fuel technology - Jet kerosene - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_JTK_N','p','TRA','Fuel technology - Jet kerosene - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_LNG_N','p','TRA','Fuel technology - LNG - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_E','p','TRA','Fuel technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_LPG_N','p','TRA','Fuel technology - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_MET_N','p','TRA','Fuel technology - Methanol - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_MET_IND_N','p','TRA','Fuel technology - Methanol from industry - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_E','p','TRA','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_NGA_N','p','TRA','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIODST_E','p','TRA','Fuel technology - Biodiesel - Existing','');
INSERT INTO "technologies" VALUES ('TRA_FT_BIODST_N','p','TRA','Fuel technology - Biodiesel - New','');
INSERT INTO "technologies" VALUES ('TRA_FT_H2G_N','p','TRA','Fuel technology - Hydrogen (Gas)','');
INSERT INTO "technologies" VALUES ('TRA_FT_H2L_N','p','TRA','Fuel technology - Hydrogen (Liquid)','');
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
INSERT INTO "technologies" VALUES ('TRA_AVI_INT_JTK_N','p','TRA','International Aircraft – Jet kerosene - New','');
INSERT INTO "technologies" VALUES ('TRA_AVI_INT_H2L_N','p','TRA','International Aircraft – Hydrogen - New','');
INSERT INTO "technologies" VALUES ('TRA_AVI_DOM_JTK_N','p','TRA','Domestic Aircraft – Jet kerosene - New','');
INSERT INTO "technologies" VALUES ('TRA_AVI_DOM_H2L_N','p','TRA','Domestic Aircraft – Hydrogen - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_PAS_DST_N','p','TRA','Passenger Trains – Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_PAS_ELC_N','p','TRA','Passenger Trains – Electricity - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_PAS_H2G_N','p','TRA','Passenger Trains – Hydrogen - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_FRG_DST_N','p','TRA','Freight Trains – Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_FRG_ELC_N','p','TRA','Freight Trains – Electricity - New','');
INSERT INTO "technologies" VALUES ('TRA_RAIL_FRG_H2G_MNL_N','p','TRA','Freight Trains – Hydrogen – Mainland - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_DST_N','p','TRA','Domestic Navigation – Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_HFO_N','p','TRA','Domestic Navigation – HFO - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_LNG_N','p','TRA','Domestic Navigation – LNG - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_DUAL_N','p','TRA','Domestic Navigation – Dual fuel - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_MET_ICE_N','p','TRA','Domestic Navigation – Methanol - ICE - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_H2L_ICE_N','p','TRA','Domestic Navigation – Hydrogen - ICE - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_MET_FCELL_N','p','TRA','Domestic Navigation – Methanol – Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_DOM_H2L_FCELL_N','p','TRA','Domestic Navigation – Hydrogen – Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_DST_N','p','TRA','International Navigation – Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_HFO_N','p','TRA','International Navigation – HFO - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_LNG_N','p','TRA','International Navigation – LNG - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_DUAL_N','p','TRA','International Navigation – Dual fuel - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_AMM_ICE_N','p','TRA','International Navigation – Ammonia - ICE - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_MET_N','p','TRA','International Navigation – Methanol - New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_H2L_N','p','TRA','International Navigation – Hydrogen – New','');
INSERT INTO "technologies" VALUES ('TRA_NAV_INT_AMM_FCELL_N','p','TRA','International Navigation – Ammonia – Fuel cell – New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_DST_N','p','TRA','Two-wheelers - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_ELC_N','p','TRA','Two-wheelers - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_GSL_N','p','TRA','Two-wheelers - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_2WH_FULHYB_N','p','TRA','Two-wheelers - Gasoline hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_GSL_N','p','TRA','Buses - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_DST_N','p','TRA','Buses - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_LPG_N','p','TRA','Buses - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_NGA_N','p','TRA','Buses - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_ELC_N','p','TRA','Buses - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_PLGHYB_N','p','TRA','Buses - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_BUS_FCELL_N','p','TRA','Buses - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_DST_N','p','TRA','Cars - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_ELC_N','p','TRA','Cars - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_GSL_N','p','TRA','Cars - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_LPG_N','p','TRA','Cars - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_NGA_N','p','TRA','Cars - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_MILHYB_N','p','TRA','Cars - Mild-hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_FULHYB_N','p','TRA','Cars - Full-hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_PLGHYB_N','p','TRA','Cars - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_CAR_FCELL_N','p','TRA','Cars - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_DST_N','p','TRA','Heavy trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_ELC_N','p','TRA','Heavy trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_FCELL_N','p','TRA','Heavy trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_PLGHYB_N','p','TRA','Heavy trucks - Plu-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_LPG_N','p','TRA','Heavy trucks - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_HTR_NGA_N','p','TRA','Heavy trucks - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_DST_N','p','TRA','Light commercial vehicles - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_ELC_N','p','TRA','Light commercial vehicles - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_FCELL_N','p','TRA','Light commercial vehicles - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_GSL_N','p','TRA','Light commercial vehicles - Gasoline - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_FULHYB_N','p','TRA','Light commercial vehicles - Diesel hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_LPG_N','p','TRA','Light commercial vehicles - LPG - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_NGA_N','p','TRA','Light commercial vehicles - Natural gas - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_LCV_PLGHYB_N','p','TRA','Light commercial vehicles - Plug-in hybrid - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_DST_N','p','TRA','Medium trucks - Diesel - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_ELC_N','p','TRA','Medium trucks - Full-electric - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_FCELL_N','p','TRA','Medium trucks - Fuel cell - New','');
INSERT INTO "technologies" VALUES ('TRA_ROA_MTR_PLGHYB_N','p','TRA','Medium trucks - Diesel hybrid - New','');
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
-- Fuel technologies
INSERT INTO "tech_annual" VALUES ('TRA_FT_AMM_IND_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_AVG_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_AVG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_DST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_GSL_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_HFO_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_HFO_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_JTK_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_JTK_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_LNG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_MET_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_MET_IND_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_BIODST_E','');
INSERT INTO "tech_annual" VALUES ('TRA_FT_BIODST_N','');
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
INSERT INTO "tech_annual" VALUES ('TRA_AVI_INT_JTK_N','');
INSERT INTO "tech_annual" VALUES ('TRA_AVI_INT_H2L_N','');
INSERT INTO "tech_annual" VALUES ('TRA_AVI_DOM_JTK_N','');
INSERT INTO "tech_annual" VALUES ('TRA_AVI_DOM_H2L_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_PAS_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_PAS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_PAS_H2G_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_FRG_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_FRG_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_RAIL_FRG_H2G_MNL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_HFO_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_LNG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_DUAL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_MET_ICE_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_H2L_ICE_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_MET_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_DOM_H2L_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_HFO_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_LNG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_DUAL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_AMM_ICE_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_MET_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_H2L_N','');
INSERT INTO "tech_annual" VALUES ('TRA_NAV_INT_AMM_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_2WH_FULHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_PLGHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_BUS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_MILHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_FULHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_PLGHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_PLGHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_HTR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_GSL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_FULHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_LCV_PLGHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_DST_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_ELC_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_FCELL_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_PLGHYB_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_LPG_N','');
INSERT INTO "tech_annual" VALUES ('TRA_ROA_MTR_NGA_N','');
INSERT INTO "tech_annual" VALUES ('TRA_OTH_ELC_N','');

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
INSERT INTO "commodities" VALUES('TRA_AMM','p','Ammonia');
INSERT INTO "commodities" VALUES('TRA_AVG','p','Aviation gasoline');
INSERT INTO "commodities" VALUES('TRA_BIO_DST','p','Biodiesel');
INSERT INTO "commodities" VALUES('TRA_DST','p','Diesel');
INSERT INTO "commodities" VALUES('TRA_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('TRA_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('TRA_H2G','p','Hydrogen - Gas');
INSERT INTO "commodities" VALUES('TRA_H2L','p','Hydrogen - Liquid');
INSERT INTO "commodities" VALUES('TRA_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('TRA_JTK','p','Jet kerosene');
INSERT INTO "commodities" VALUES('TRA_LNG','p','Liquified natural gas');
INSERT INTO "commodities" VALUES('TRA_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('TRA_MET','p','Methanol');
INSERT INTO "commodities" VALUES('TRA_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('TRA_CH4','e','Transport - CH4 emission');
INSERT INTO "commodities" VALUES('TRA_CO2','e','Transport - CO2 emission');
INSERT INTO "commodities" VALUES('TRA_N2O','e','Transport - N2O emission');
-- Input commodities
INSERT INTO "commodities" VALUES('BIO_DST','p','');
INSERT INTO "commodities" VALUES('BIO_ETH','p','');
INSERT INTO "commodities" VALUES('BIO_METH','p','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('GAS_LNG','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('H2','p','');
INSERT INTO "commodities" VALUES('H2_EL','p','');
INSERT INTO "commodities" VALUES('H2_BL','p','');
INSERT INTO "commodities" VALUES('IND_CH_AMM','p','');
INSERT INTO "commodities" VALUES('IND_CH_MTH','p','');
INSERT INTO "commodities" VALUES('OIL_AVG','p','');
INSERT INTO "commodities" VALUES('OIL_DST','p','');
INSERT INTO "commodities" VALUES('OIL_GSL','p','');
INSERT INTO "commodities" VALUES('OIL_HFO','p','');
INSERT INTO "commodities" VALUES('OIL_JTK','p','');
INSERT INTO "commodities" VALUES('OIL_LPG','p','');
INSERT INTO "commodities" VALUES('OIL_NSP','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
INSERT INTO "commodities" VALUES('SYN_KER','p','');
INSERT INTO "commodities" VALUES('SYN_MET','p','');
INSERT INTO "commodities" VALUES('SYN_NGA','p','');

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
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','TRA_FT_ELC_E',0.30,'');
-- Base year technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_JTK','TRA_AVI_DOM_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_AVG','TRA_AVI_DOM_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_NAV_DOM_E',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_HFO','TRA_NAV_DOM_E',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_DST','TRA_NAV_DOM_E',0.25,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_HFO','TRA_NAV_DOM_E',0.25,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_NAV_INT_E',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_HFO','TRA_NAV_INT_E',0.95,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_HFO','TRA_NAV_INT_E',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_RAIL_PAS_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_ELC','TRA_RAIL_PAS_E',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_DST','TRA_RAIL_PAS_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_ELC','TRA_RAIL_PAS_E',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_DST','TRA_RAIL_FRG_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'TRA_ELC','TRA_RAIL_FRG_E',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_DST','TRA_RAIL_FRG_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'TRA_ELC','TRA_RAIL_FRG_E',0.70,'');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'TRA_HFO','TRA_NAV_DOM_DUAL_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'TRA_MET','TRA_NAV_DOM_DUAL_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'TRA_HFO','TRA_NAV_INT_DUAL_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'TRA_AMM','TRA_NAV_INT_DUAL_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2012,'TRA_GSL','TRA_ROA_CAR_PLGHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2012,'TRA_ELC','TRA_ROA_CAR_PLGHYB_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2018,'TRA_DST','TRA_ROA_HTR_PLGHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2018,'TRA_ELC','TRA_ROA_HTR_PLGHYB_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2018,'TRA_DST','TRA_ROA_LCV_PLGHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2018,'TRA_ELC','TRA_ROA_LCV_PLGHYB_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'TRA_DST','TRA_ROA_MTR_PLGHYB_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'TRA_ELC','TRA_ROA_MTR_PLGHYB_N',0.45,'');

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);

CREATE TABLE "PlanningReserveMargin" (
	"regions"	text,
	"reserve_margin"	REAL,
	PRIMARY KEY(regions),
	FOREIGN KEY("regions") REFERENCES regions
);

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY(tech)
);
-- Transport sector
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_GSL_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_GSL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_AVG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_AVG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_JTK_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_JTK_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_BIODST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_HFO_E','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_HFO_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_LNG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_H2G_N','');
INSERT INTO "tech_groups" VALUES ('TRA_FT_H2L_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_BIO_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_ELC_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_GSL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_MILHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_FULHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_PLGHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_CAR_FCELL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_ELC_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_FCELL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_PLGHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_MTR_NGA_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_BIO_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_DST_E','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_DST_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_ELC_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_FCELL_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_PLGHYB_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_LPG_N','');
INSERT INTO "tech_groups" VALUES ('TRA_ROA_HTR_NGA_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Transport sector
INSERT INTO "groups" VALUES ('TRA_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_GSL_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_AVG_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_JTK_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_HFO_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_H2G_GRP','');
INSERT INTO "groups" VALUES ('TRA_FT_H2L_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_CAR_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_MTR_GRP','');
INSERT INTO "groups" VALUES ('TRA_ROA_HTR_GRP','');

CREATE TABLE "TechGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"weight"        	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Transport sector
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_AVG_E','TRA_FT_AVG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_AVG_N','TRA_FT_AVG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_BIODST_E','TRA_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_DST_E','TRA_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_DST_N','TRA_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_ELC_E','TRA_FT_ELC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_GSL_E','TRA_FT_GSL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_GSL_N','TRA_FT_GSL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_HFO_E','TRA_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_HFO_N','TRA_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_JTK_E','TRA_FT_JTK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_JTK_N','TRA_FT_JTK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_LPG_E','TRA_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_LPG_N','TRA_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_NGA_E','TRA_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_NGA_N','TRA_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_H2G_N','TRA_FT_H2G_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_FT_H2L_N','TRA_FT_H2L_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_BIO_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_DST_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_DST_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_ELC_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_FCELL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_FULHYB_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_GSL_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_GSL_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_LPG_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_LPG_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_MILHYB_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_E','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_NGA_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N','TRA_ROA_CAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_DST_E','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_DST_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_ELC_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_FCELL_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_LPG_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_MTR_NGA_N','TRA_ROA_MTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_BIO_E','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_DST_E','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_DST_N','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_ELC_N','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_FCELL_N','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_LPG_N','TRA_ROA_HTR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','TRA_ROA_HTR_NGA_N','TRA_ROA_HTR_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Transport sector
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_DST_GRP',967.10,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_DST_GRP',916.06,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_DST_GRP',942.79,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_DST_GRP',909.25,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_DST_GRP',929.38,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_DST_GRP',774.36,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_ELC_GRP',36.47,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_ELC_GRP',36.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_ELC_GRP',36.46,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_ELC_GRP',38.55,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_ELC_GRP',39.47,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_ELC_GRP',34.59,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_GSL_GRP',417.24,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_GSL_GRP',345.01,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_GSL_GRP',332.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_GSL_GRP',301.25,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_GSL_GRP',306.56,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_GSL_GRP',242.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_HFO_GRP',113.90,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_HFO_GRP',97.53,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_HFO_GRP',82.02,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_HFO_GRP',94.14,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_HFO_GRP',99.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_HFO_GRP',87.62,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_LPG_GRP',52.10,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_LPG_GRP',63.08,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_LPG_GRP',70.31,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_LPG_GRP',71.35,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_LPG_GRP',71.38,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_LPG_GRP',57.22,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'TRA_FT_NGA_GRP',28.49,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'TRA_FT_NGA_GRP',38.12,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'TRA_FT_NGA_GRP',42.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'TRA_FT_NGA_GRP',43.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'TRA_FT_NGA_GRP',44.56,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'TRA_FT_NGA_GRP',38.47,'PJ');

CREATE TABLE "MaxActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Transport sector
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_DST_GRP',1068.90,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_DST_GRP',1012.48,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_DST_GRP',1042.03,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_DST_GRP',1004.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_DST_GRP',1027.21,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_DST_GRP',945.53,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_ELC_GRP',40.89,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_ELC_GRP',41.09,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_ELC_GRP',41.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_ELC_GRP',43.42,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_ELC_GRP',44.46,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_ELC_GRP',41.51,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_GSL_GRP',461.16,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_GSL_GRP',381.33,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_GSL_GRP',367.55,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_GSL_GRP',332.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_GSL_GRP',338.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_GSL_GRP',283.42,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_HFO_GRP',155.86,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_HFO_GRP',133.46,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_HFO_GRP',112.24,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_HFO_GRP',128.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_HFO_GRP',136.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_HFO_GRP',119.91,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_LPG_GRP',57.59,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_LPG_GRP',69.72,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_LPG_GRP',77.71,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_LPG_GRP',78.86,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_LPG_GRP',78.90,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_LPG_GRP',66.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'TRA_FT_NGA_GRP',31.49,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'TRA_FT_NGA_GRP',42.13,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'TRA_FT_NGA_GRP',47.47,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'TRA_FT_NGA_GRP',47.69,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'TRA_FT_NGA_GRP',49.25,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'TRA_FT_NGA_GRP',44.54,'PJ');

CREATE TABLE "MinCapacityGroup" (
	"periods"	integer,
	"group_name"	text,
	"min_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);

CREATE TABLE "MaxCapacityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
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
-- Transport sector
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'BIO_ETH','TRA_FT_GSL_GRP',3.0E-03,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'BIO_ETH','TRA_FT_GSL_GRP',3.0E-02,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'BIO_DST','TRA_FT_DST_GRP',6.5E-02,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'BIO_DST','TRA_FT_DST_GRP',1.0E-01,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2014,'ELC_CEN','TRA_FT_H2G_GRP',0.13,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2014,'ELC_CEN','TRA_FT_H2L_GRP',0.23,'');

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
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','TRA_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','TRA_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','TRA_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','TRA_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','TRA_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','TRA_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','TRA_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','TRA_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','TRA_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','TRA_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','TRA_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','TRA_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','TRA_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','TRA_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_MET','TRA_FT_GSL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_MET','TRA_FT_GSL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_MET','TRA_FT_GSL_GRP',0.015,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_MET','TRA_FT_GSL_GRP',0.015,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_ETH','TRA_FT_GSL_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_ETH','TRA_FT_GSL_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_ETH','TRA_FT_GSL_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_MET','TRA_FT_AVG_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_MET','TRA_FT_AVG_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_MET','TRA_FT_AVG_GRP',0.015,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_MET','TRA_FT_AVG_GRP',0.015,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_KER','TRA_FT_JTK_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_KER','TRA_FT_JTK_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_KER','TRA_FT_JTK_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_KER','TRA_FT_JTK_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_DST','TRA_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_DST','TRA_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_DST','TRA_FT_DST_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_DST','TRA_FT_DST_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_DST','TRA_FT_DST_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_DST','TRA_FT_DST_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_DST','TRA_FT_DST_GRP',0.30,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'ELC_CEN','TRA_FT_H2G_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'ELC_CEN','TRA_FT_H2L_GRP',0.23,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'TRA_GSL','TRA_ROA_CAR_GRP',0.40,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_GSL','TRA_ROA_CAR_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'TRA_ELC','TRA_ROA_CAR_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'TRA_ELC','TRA_ROA_CAR_GRP',0.02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_ELC','TRA_ROA_CAR_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'TRA_ELC','TRA_ROA_MTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'TRA_ELC','TRA_ROA_MTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_ELC','TRA_ROA_MTR_GRP',0.05,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'TRA_H2G','TRA_ROA_MTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_H2G','TRA_ROA_MTR_GRP',0.05,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'TRA_ELC','TRA_ROA_HTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'TRA_ELC','TRA_ROA_HTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_ELC','TRA_ROA_HTR_GRP',0.05,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'TRA_H2G','TRA_ROA_HTR_GRP',0.00,''); -- Different from TIMES-Italy
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'TRA_H2G','TRA_ROA_HTR_GRP',0.05,''); -- Different from TIMES-Italy

CREATE TABLE "MinOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	text,
	"group_name" 	text,
	"go_min"	      real,
	"go_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
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
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_ELC_E',50.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_ELC_E',800.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_NGA_N',6.36,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_NGA_N',89.15,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_NGA_N',445.77,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_LNG_N',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_LNG_N',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_LNG_N',200.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_LPG_N',6.68,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_LPG_N',93.53,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_LPG_N',467.64,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_GSL_N',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_GSL_N',572.44,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_GSL_N',858.65,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_AVG_N',0.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_AVG_N',7.25,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_JTK_N',30.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_JTK_N',341.92,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_JTK_N',683.84,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_DST_N',77.94,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_DST_N',1091.21,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_DST_N',1636.81,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_HFO_N',17.33,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_HFO_N',242.59,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'TRA_FT_HFO_N',485.18,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_FT_BIODST_N',4.95,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_FT_BIODST_N',69.34,'PJ','');
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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_HTR_BIO_E',9.71E-04,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_HTR_DST_E',8.31E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_HTR_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_HTR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_BIO_E',9.05E-01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_DST_E',6.82E+01,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_LCV_GSL_E',3.60E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_BIO_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_LCV_GSL_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_ROA_MTR_DST_E',8.74E+00,'Bvkm','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_ROA_MTR_DST_E',0.0,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_RAIL_PAS_E',8.00E-02,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_RAIL_PAS_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_RAIL_FRG_E',1.04E-01,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_RAIL_FRG_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_AVI_DOM_E',2.38E-01,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_AVI_DOM_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_AVI_INT_E',4.18E-01,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_AVI_INT_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_NAV_DOM_E',5.03E-03,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_NAV_DOM_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_NAV_INT_E',7.19E-02,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_NAV_INT_E',0.00,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'TRA_OTH_ELC_E',1.96E+01,'Bvkm','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'TRA_OTH_ELC_E',0.00,'Bvkm','');

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
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_AMM_IND_N',25,'');
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
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_LNG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_MET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_MET_IND_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_BIODST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_GSL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_H2G_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_FT_H2L_N',20,'');
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
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_AVI_INT_JTK_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_AVI_INT_H2L_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_AVI_DOM_JTK_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_AVI_DOM_H2L_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_PAS_DST_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_PAS_ELC_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_PAS_H2G_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_FRG_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_FRG_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_RAIL_FRG_H2G_MNL_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_HFO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_LNG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_DUAL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_MET_ICE_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_H2L_ICE_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_MET_FCELL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_DOM_H2L_FCELL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_HFO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_LNG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_DUAL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_AMM_ICE_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_MET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_H2L_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_NAV_INT_AMM_FCELL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_2WH_FULHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_PLGHYB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_BUS_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_DST_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_GSL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_LPG_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_NGA_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_FULHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_CAR_FCELL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_HTR_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_GSL_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_FULHYB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_LCV_PLGHYB_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_ELC_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_FCELL_N',12,'');
INSERT INTO "LifetimeTech" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N',15,'');
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
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_AVG_E',2006,0.73,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_DST_E',2006,1091.21,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_GSL_E',2006,572.44,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_HFO_E',2006,121.29,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_JTK_E',2006,170.96,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_LPG_E',2006,46.76,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_NGA_E',2006,17.83,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_BIODST_E',2006,6.93,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_FT_ELC_E',2006,40.00,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_GSL_E',2006,1.415E+02,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_DST_E',2006,1.079E+02,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_LPG_E',2006,1.120E+01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_NGA_E',2006,4.267E+00,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_CAR_BIO_E',2006,8.696E-01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MOP_GSL_E',2006,2.782E+01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MCY_GSL_E',2006,4.614E+01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_BIO_E',2006,2.23E-03,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_DST_E',2006,3.53E+00,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_BUS_NGA_E',2006,6.55E-02,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_HTR_BIO_E',2006,1.05E-03,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_HTR_DST_E',2006,8.95E+00,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_BIO_E',2006,9.75E-01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_DST_E',2006,7.35E+01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_LCV_GSL_E',2006,3.88E+00,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_ROA_MTR_DST_E',2006,9.42E+00,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_OTH_ELC_E',2006,21.055,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_AVI_DOM_E',2006,2.38E-01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_AVI_INT_E',2006,4.18E-01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NAV_DOM_E',2006,5.03E-03,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NAV_INT_E',2006,7.19E-02,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_NEU_E',2006,14.21,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_RAIL_FRG_E',2006,1.04E-01,'Bvkm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','TRA_RAIL_PAS_E',2006,8.00E-02,'Bvkm','');

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
-- Transport sector
INSERT INTO "EmissionActivity" VALUES ('IT','TRA_CO2','BIO_METH','TRA_FT_NGA_N',2007,'TRA_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','TRA_CO2','H2_BL','TRA_FT_NGA_N',2020,'TRA_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','TRA_CO2','BIO_ETH','TRA_FT_GSL_N',2007,'TRA_GSL',-69.30,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','TRA_CO2','BIO_DST','TRA_FT_DST_N',2007,'TRA_DST',-74.07,'[kt/PJ]','');

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
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CO2',63.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CO2',69.30,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_CO2',69.30,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CO2',71.50,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_CO2',74.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_CO2',77.37,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_MET','TRA_CO2',69.30,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_CH4',1.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_CH4',6.92,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_CH4',60.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_CH4',5.53,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_CH4',1.32,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_CH4',0.72,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_MET','TRA_CH4',6.92,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_NGA','TRA_N2O',1.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_LPG','TRA_N2O',0.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_GSL','TRA_N2O',6.60,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_AVG','TRA_N2O',6.86,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_JTK','TRA_N2O',6.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_DST','TRA_N2O',3.36,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_HFO','TRA_N2O',3.11,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('TRA_MET','TRA_N2O',6.60,'[t/PJ]','');

CREATE TABLE "EmissionAggregation" (
	"emis_comm"	        text,
    "emis_agg"          text,
    "emis_agg_weight"   real,
    "emis_agg_units"     text,
    "emis_agg_notes"    text,
    PRIMARY KEY("emis_comm","emis_agg","emis_agg_weight")
);
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
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_AMM','TRA_FT_AMM_IND_N',2025,'TRA_AMM',18.60,'PJ/Mt');
INSERT INTO "Efficiency" VALUES ('IT','OIL_AVG','TRA_FT_AVG_E',2006,'TRA_AVG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_AVG','TRA_FT_AVG_N',2007,'TRA_AVG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','TRA_FT_AVG_N',2007,'TRA_AVG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','TRA_FT_DST_E',2006,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','TRA_FT_DST_N',2007,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','TRA_FT_DST_N',2007,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_DST','TRA_FT_DST_N',2007,'TRA_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','TRA_FT_ELC_E',2006,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','TRA_FT_ELC_E',2006,'TRA_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','TRA_FT_GSL_E',2006,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','TRA_FT_GSL_N',2007,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','TRA_FT_GSL_N',2007,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_ETH','TRA_FT_GSL_N',2007,'TRA_GSL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','TRA_FT_HFO_E',2006,'TRA_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','TRA_FT_HFO_N',2007,'TRA_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_JTK','TRA_FT_JTK_E',2006,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_JTK','TRA_FT_JTK_N',2007,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_KER','TRA_FT_JTK_N',2007,'TRA_JTK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_LNG','TRA_FT_LNG_N',2007,'TRA_LNG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','TRA_FT_LPG_E',2006,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','TRA_FT_LPG_N',2007,'TRA_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','TRA_FT_MET_N',2025,'TRA_MET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MTH','TRA_FT_MET_IND_N',2025,'TRA_MET',19.90,'PJ/Mt');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','TRA_FT_NGA_E',2006,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','TRA_FT_NGA_N',2007,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','TRA_FT_NGA_N',2007,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','TRA_FT_NGA_N',2007,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','TRA_FT_NGA_N',2020,'TRA_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_DST','TRA_FT_BIODST_E',2006,'TRA_BIO_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_DST','TRA_FT_BIODST_N',2007,'TRA_BIO_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2','TRA_FT_H2G_N',2014,'TRA_H2G',0.87,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','TRA_FT_H2G_N',2014,'TRA_H2G',0.87,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','TRA_FT_H2G_N',2014,'TRA_H2G',0.87,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2','TRA_FT_H2L_N',2014,'TRA_H2L',0.77,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','TRA_FT_H2L_N',2014,'TRA_H2L',0.77,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','TRA_FT_H2L_N',2014,'TRA_H2L',0.77,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',7.40E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AVG','TRA_AVI_DOM_E',2006,'TRA_AVI_DOM',7.40E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_INT_E',2006,'TRA_AVI_INT',3.11E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_E',2006,'TRA_NAV_DOM',5.00E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_E',2006,'TRA_NAV_DOM',5.00E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_E',2006,'TRA_NAV_INT',5.00E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_E',2006,'TRA_NAV_INT',5.00E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','TRA_NEU_E',2006,'TRA_NEU',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_OTH_ELC_E',2006,'TRA_OTH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',7.53E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_FRG_E',2006,'TRA_RAIL_FRG',7.53E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',1.18E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_PAS_E',2006,'TRA_RAIL_PSG',1.18E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_BUS_BIO_E',2006,'TRA_ROA_BUS',0.056,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_E',2006,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_BUS_NGA_E',2006,'TRA_ROA_BUS',0.038,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_CAR_BIO_E',2006,'TRA_ROA_CAR',0.442,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_E',2006,'TRA_ROA_CAR',0.362,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_E',2006,'TRA_ROA_CAR',0.299,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_CAR_LPG_E',2006,'TRA_ROA_CAR',0.247,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_CAR_NGA_E',2006,'TRA_ROA_CAR',0.274,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_HTR_BIO_E',2006,'TRA_ROA_HTR',0.027,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_E',2006,'TRA_ROA_HTR',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_BIO_DST','TRA_ROA_LCV_BIO_E',2006,'TRA_ROA_LCV',0.276,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_E',2006,'TRA_ROA_LCV',0.276,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_E',2006,'TRA_ROA_LCV',0.241,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MOP_GSL_E',2006,'TRA_ROA_2WH',1.315,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_MCY_GSL_E',2006,'TRA_ROA_2WH',1.026,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_E',2006,'TRA_ROA_MTR',0.090,'Bvkm/PJ');
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_INT_JTK_N',2007,'TRA_AVI_INT',3.35E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_AVI_INT_H2L_N',2040,'TRA_AVI_INT',2.36E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_JTK','TRA_AVI_DOM_JTK_N',2007,'TRA_AVI_DOM',7.87E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_AVI_DOM_H2L_N',2035,'TRA_AVI_DOM',8.18E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2007,'TRA_RAIL_PSG',1.21E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2020,'TRA_RAIL_PSG',1.39E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_PAS_DST_N',2050,'TRA_RAIL_PSG',1.72E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2007,'TRA_RAIL_PSG',1.21E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2020,'TRA_RAIL_PSG',1.39E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_PAS_ELC_N',2050,'TRA_RAIL_PSG',1.72E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_RAIL_PAS_H2G_N',2030,'TRA_RAIL_PSG',1.39E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_RAIL_PAS_H2G_N',2050,'TRA_RAIL_PSG',1.72E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2007,'TRA_RAIL_FRG',7.64E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2020,'TRA_RAIL_FRG',9.11E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_RAIL_FRG_DST_N',2050,'TRA_RAIL_FRG',1.12E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2007,'TRA_RAIL_FRG',7.64E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2020,'TRA_RAIL_FRG',9.11E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_RAIL_FRG_ELC_N',2050,'TRA_RAIL_FRG',1.12E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_RAIL_FRG_H2G_MNL_N',2030,'TRA_RAIL_FRG',9.11E-03,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_RAIL_FRG_H2G_MNL_N',2050,'TRA_RAIL_FRG',1.12E-02,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_DST_N',2007,'TRA_NAV_DOM',5.06E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_DST_N',2030,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_DOM_DST_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2007,'TRA_NAV_DOM',5.06E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2030,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_HFO_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LNG','TRA_NAV_DOM_LNG_N',2025,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LNG','TRA_NAV_DOM_LNG_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_DUAL_N',2025,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_DUAL_N',2025,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_DOM_DUAL_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_DUAL_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_MET_ICE_N',2030,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_MET_ICE_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_DOM_H2L_ICE_N',2030,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_DOM_H2L_ICE_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_MET_FCELL_N',2030,'TRA_NAV_DOM',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_DOM_MET_FCELL_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_DOM_H2L_FCELL_N',2030,'TRA_NAV_DOM',5.06E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_DOM_H2L_FCELL_N',2050,'TRA_NAV_DOM',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_DST_N',2007,'TRA_NAV_INT',5.06E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_DST_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_NAV_INT_DST_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2007,'TRA_NAV_INT',5.06E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_HFO_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LNG','TRA_NAV_INT_LNG_N',2025,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LNG','TRA_NAV_INT_LNG_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_DUAL_N',2025,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_DUAL_N',2025,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_HFO','TRA_NAV_INT_DUAL_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_DUAL_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_AMM_ICE_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_AMM_ICE_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_INT_MET_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_MET','TRA_NAV_INT_MET_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_INT_H2L_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2L','TRA_NAV_INT_H2L_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_AMM_FCELL_N',2030,'TRA_NAV_INT',5.50E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_AMM','TRA_NAV_INT_AMM_FCELL_N',2050,'TRA_NAV_INT',5.96E-04,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2007,'TRA_ROA_2WH',0.946,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_GSL_N',2050,'TRA_ROA_2WH',1.259,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_2WH_DST_N',2007,'TRA_ROA_2WH',1.117,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_2WH_DST_N',2050,'TRA_ROA_2WH',1.487,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2010,'TRA_ROA_2WH',3.468,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2020,'TRA_ROA_2WH',3.468,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_2WH_ELC_N',2050,'TRA_ROA_2WH',4.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_FULHYB_N',2020,'TRA_ROA_2WH',1.609,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_2WH_FULHYB_N',2050,'TRA_ROA_2WH',2.188,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2007,'TRA_ROA_BUS',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2020,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_BUS_GSL_N',2050,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2007,'TRA_ROA_BUS',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2020,'TRA_ROA_BUS',0.059,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_DST_N',2050,'TRA_ROA_BUS',0.069,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_BUS_LPG_N',2007,'TRA_ROA_BUS',0.043,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_BUS_NGA_N',2007,'TRA_ROA_BUS',0.045,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2012,'TRA_ROA_BUS',0.148,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2020,'TRA_ROA_BUS',0.148,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_BUS_ELC_N',2050,'TRA_ROA_BUS',0.172,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_PLGHYB_N',2016,'TRA_ROA_BUS',0.099,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_BUS_PLGHYB_N',2020,'TRA_ROA_BUS',0.116,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_BUS_FCELL_N',2020,'TRA_ROA_BUS',0.094,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_BUS_FCELL_N',2050,'TRA_ROA_BUS',0.127,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2007,'TRA_ROA_CAR',0.313,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2020,'TRA_ROA_CAR',0.358,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_GSL_N',2050,'TRA_ROA_CAR',0.416,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2007,'TRA_ROA_CAR',0.375,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2020,'TRA_ROA_CAR',0.429,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_CAR_DST_N',2050,'TRA_ROA_CAR',0.500,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_CAR_LPG_N',2007,'TRA_ROA_CAR',0.337,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_CAR_NGA_N',2007,'TRA_ROA_CAR',0.357,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2007,'TRA_ROA_CAR',1.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2020,'TRA_ROA_CAR',1.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_ELC_N',2050,'TRA_ROA_CAR',1.369,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_MILHYB_N',2012,'TRA_ROA_CAR',0.402,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_MILHYB_N',2020,'TRA_ROA_CAR',0.432,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_MILHYB_N',2050,'TRA_ROA_CAR',0.553,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_FULHYB_N',2020,'TRA_ROA_CAR',0.507,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_FULHYB_N',2050,'TRA_ROA_CAR',0.690,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PLGHYB_N',2012,'TRA_ROA_CAR',0.755,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PLGHYB_N',2012,'TRA_ROA_CAR',0.755,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PLGHYB_N',2020,'TRA_ROA_CAR',0.830,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PLGHYB_N',2020,'TRA_ROA_CAR',0.830,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_CAR_PLGHYB_N',2050,'TRA_ROA_CAR',1.027,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_CAR_PLGHYB_N',2050,'TRA_ROA_CAR',1.027,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_CAR_FCELL_N',2025,'TRA_ROA_CAR',0.637,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_CAR_FCELL_N',2050,'TRA_ROA_CAR',0.936,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2007,'TRA_ROA_HTR',0.039,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2020,'TRA_ROA_HTR',0.044,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_DST_N',2050,'TRA_ROA_HTR',0.052,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_HTR_LPG_N',2007,'TRA_ROA_HTR',0.035,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_HTR_NGA_N',2007,'TRA_ROA_HTR',0.037,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2012,'TRA_ROA_HTR',0.122,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2020,'TRA_ROA_HTR',0.122,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_ELC_N',2050,'TRA_ROA_HTR',0.142,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_PLGHYB_N',2018,'TRA_ROA_HTR',0.079,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_PLGHYB_N',2018,'TRA_ROA_HTR',0.079,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_HTR_PLGHYB_N',2050,'TRA_ROA_HTR',0.092,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_HTR_PLGHYB_N',2050,'TRA_ROA_HTR',0.092,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_HTR_FCELL_N',2025,'TRA_ROA_HTR',0.077,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_HTR_FCELL_N',2050,'TRA_ROA_HTR',0.105,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2007,'TRA_ROA_LCV',0.237,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2020,'TRA_ROA_LCV',0.271,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','TRA_ROA_LCV_GSL_N',2050,'TRA_ROA_LCV',0.316,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2007,'TRA_ROA_LCV',0.272,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2020,'TRA_ROA_LCV',0.311,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_DST_N',2050,'TRA_ROA_LCV',0.362,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_LCV_LPG_N',2007,'TRA_ROA_LCV',0.274,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_LCV_NGA_N',2007,'TRA_ROA_LCV',0.258,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2012,'TRA_ROA_LCV',1.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2020,'TRA_ROA_LCV',1.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_ELC_N',2050,'TRA_ROA_LCV',1.262,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2016,'TRA_ROA_LCV',0.266,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2020,'TRA_ROA_LCV',0.298,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_FULHYB_N',2050,'TRA_ROA_LCV',0.405,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_PLGHYB_N',2018,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_PLGHYB_N',2018,'TRA_ROA_LCV',0.723,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_LCV_PLGHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_LCV_PLGHYB_N',2050,'TRA_ROA_LCV',0.984,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_LCV_FCELL_N',2025,'TRA_ROA_LCV',0.575,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_LCV_FCELL_N',2050,'TRA_ROA_LCV',0.782,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2007,'TRA_ROA_MTR',0.089,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2020,'TRA_ROA_MTR',0.102,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_DST_N',2050,'TRA_ROA_MTR',0.118,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_LPG','TRA_ROA_MTR_LPG_N',2007,'TRA_ROA_MTR',0.080,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_NGA','TRA_ROA_MTR_NGA_N',2007,'TRA_ROA_MTR',0.084,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2012,'TRA_ROA_MTR',0.279,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2020,'TRA_ROA_MTR',0.279,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_ELC_N',2050,'TRA_ROA_MTR',0.324,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_PLGHYB_N',2016,'TRA_ROA_MTR',0.181,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_PLGHYB_N',2016,'TRA_ROA_MTR',0.181,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_DST','TRA_ROA_MTR_PLGHYB_N',2050,'TRA_ROA_MTR',0.211,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_ELC','TRA_ROA_MTR_PLGHYB_N',2050,'TRA_ROA_MTR',0.211,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_MTR_FCELL_N',2025,'TRA_ROA_MTR',0.176,'Bvkm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','TRA_H2G','TRA_ROA_MTR_FCELL_N',2050,'TRA_ROA_MTR',0.239,'Bvkm/PJ');
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
-- Transport sector
INSERT INTO "DiscountRate" VALUES ('IT','TRA_AVI_INT_JTK_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_AVI_INT_H2L_N',2040,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_AVI_DOM_JTK_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_AVI_DOM_H2L_N',2035,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_PAS_DST_N',2007,0.042,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_PAS_ELC_N',2007,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_PAS_H2G_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_FRG_DST_N',2007,0.042,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_FRG_ELC_N',2007,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_DST_N',2007,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_HFO_N',2007,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_LNG_N',2025,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_DUAL_N',2025,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_MET_ICE_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_H2L_ICE_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_MET_FCELL_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_DOM_H2L_FCELL_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_DST_N',2007,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_HFO_N',2007,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_LNG_N',2025,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_DUAL_N',2025,0.058,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_AMM_ICE_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_MET_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_H2L_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_NAV_INT_AMM_FCELL_N',2030,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_2WH_GSL_N',2007,0.049,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_2WH_DST_N',2007,0.049,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_2WH_ELC_N',2010,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_2WH_FULHYB_N',2020,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_GSL_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_DST_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_ELC_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_LPG_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_NGA_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_PLGHYB_N',2016,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2020,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_GSL_N',2007,0.073,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_DST_N',2007,0.073,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_LPG_N',2007,0.073,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_NGA_N',2007,0.073,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_ELC_N',2007,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_FULHYB_N',2020,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2025,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_DST_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_LPG_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_NGA_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_ELC_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N',2018,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2025,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_GSL_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_DST_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_LPG_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_NGA_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_ELC_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_FULHYB_N',2016,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_PLGHYB_N',2018,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2025,0.320,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_DST_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_LPG_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_NGA_N',2007,0.060,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_ELC_N',2012,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N',2016,0.240,'');
INSERT INTO "DiscountRate" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2025,0.320,'');

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
INSERT INTO "Driver" VALUES ('IT',2006,'GDP',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'GDP',1.015,'');
INSERT INTO "Driver" VALUES ('IT',2008,'GDP',1.004,'');
INSERT INTO "Driver" VALUES ('IT',2010,'GDP',0.965,'');
INSERT INTO "Driver" VALUES ('IT',2012,'GDP',0.943,'');
INSERT INTO "Driver" VALUES ('IT',2014,'GDP',0.928,'');
INSERT INTO "Driver" VALUES ('IT',2016,'GDP',0.947,'');
INSERT INTO "Driver" VALUES ('IT',2018,'GDP',0.971,'');
INSERT INTO "Driver" VALUES ('IT',2020,'GDP',0.933,'');
INSERT INTO "Driver" VALUES ('IT',2022,'GDP',0.980,'');
INSERT INTO "Driver" VALUES ('IT',2025,'GDP',1.024,'');
INSERT INTO "Driver" VALUES ('IT',2030,'GDP',1.046,'');
INSERT INTO "Driver" VALUES ('IT',2035,'GDP',1.065,'');
INSERT INTO "Driver" VALUES ('IT',2040,'GDP',1.084,'');
INSERT INTO "Driver" VALUES ('IT',2045,'GDP',1.141,'');
INSERT INTO "Driver" VALUES ('IT',2050,'GDP',1.198,'');

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Transport sector
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
-- Transport sector
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NEU',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NEU',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NEU',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NEU',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_NEU',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_AVI_DOM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_AVI_DOM',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_AVI_DOM',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_AVI_DOM',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_AVI_DOM',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_AVI_DOM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_AVI_DOM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_AVI_DOM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_AVI_DOM',0.600,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_AVI_DOM',0.600,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_AVI_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_AVI_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_AVI_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_AVI_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_AVI_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_AVI_INT',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_AVI_INT',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_AVI_INT',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_AVI_INT',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_AVI_INT',0.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_AVI_INT',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_AVI_INT',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_AVI_INT',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_AVI_INT',0.600,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_AVI_INT',0.600,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_AVI_INT',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_AVI_INT',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_AVI_INT',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_AVI_INT',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_AVI_INT',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_BUS',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_BUS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_BUS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_BUS',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_BUS',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_BUS',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_BUS',0.425,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_BUS',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_BUS',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_BUS',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_LCV',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_LCV',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_LCV',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_LCV',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_LCV',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_LCV',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_LCV',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_LCV',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_LCV',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_LCV',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_LCV',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_LCV',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_LCV',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_LCV',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_LCV',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_HTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_HTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_HTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_HTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_HTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_HTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_HTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_HTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_HTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_HTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_HTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_HTR',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_HTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_HTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_HTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_MTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_MTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_MTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_MTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_MTR',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_MTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_MTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_MTR',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_MTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_MTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_MTR',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_MTR',0.450,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_MTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_MTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_MTR',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_OTH',2.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_OTH',-0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_OTH',-0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_OTH',-0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_OTH',-0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_OTH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_OTH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_OTH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_OTH',0.750,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_CAR',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_CAR',0.700,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_CAR',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_CAR',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_CAR',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_CAR',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_CAR',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_CAR',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_CAR',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_ROA_2WH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_ROA_2WH',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_ROA_2WH',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_ROA_2WH',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_ROA_2WH',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_ROA_2WH',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_ROA_2WH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_ROA_2WH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_ROA_2WH',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_ROA_2WH',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_ROA_2WH',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_ROA_2WH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_ROA_2WH',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_ROA_2WH',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_ROA_2WH',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_RAIL_FRG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_RAIL_FRG',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_RAIL_FRG',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_RAIL_FRG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_RAIL_FRG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_RAIL_FRG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_RAIL_FRG',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_RAIL_FRG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_RAIL_FRG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_RAIL_FRG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_RAIL_PSG',1.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_RAIL_PSG',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_RAIL_PSG',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_RAIL_PSG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_RAIL_PSG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_RAIL_PSG',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_RAIL_PSG',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_RAIL_PSG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_RAIL_PSG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_RAIL_PSG',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NAV_DOM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NAV_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NAV_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NAV_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NAV_DOM',0.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NAV_DOM',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NAV_DOM',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NAV_DOM',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NAV_DOM',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NAV_DOM',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NAV_DOM',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_NAV_DOM',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NAV_DOM',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_NAV_DOM',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NAV_DOM',0.200,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_NAV_INT',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_NAV_INT',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_NAV_INT',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_NAV_INT',0.400,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'TRA_NAV_INT',0.350,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_NAV_INT',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'TRA_NAV_INT',0.300,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_NAV_INT',0.300,'');

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
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_HTR',8.94,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_ROA_HTR',9.09,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_ROA_HTR',8.96,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_ROA_HTR',8.45,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_ROA_HTR',6.96,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_ROA_HTR',6.68,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_ROA_HTR',6.91,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_ROA_HTR',7.82,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_ROA_HTR',7.89,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_ROA_HTR',8.56,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_ROA_HTR',8.70,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_ROA_HTR',10.17,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_ROA_HTR',11.47,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_ROA_HTR',12.52,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_ROA_HTR',13.36,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_ROA_HTR',14.16,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_MTR',9.44,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_ROA_MTR',9.60,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_ROA_MTR',9.46,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_ROA_MTR',8.92,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_ROA_MTR',7.35,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_ROA_MTR',7.05,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_ROA_MTR',7.29,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_ROA_MTR',8.26,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_ROA_MTR',8.33,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_ROA_MTR',9.03,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_ROA_MTR',9.18,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_ROA_MTR',10.74,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_ROA_MTR',12.11,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_ROA_MTR',13.22,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_ROA_MTR',14.10,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_ROA_MTR',14.95,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_CAR',265.48,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_ROA_CAR',266.22,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_ROA_CAR',266.18,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_ROA_CAR',276.52,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_ROA_CAR',260.56,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_ROA_CAR',282.58,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_ROA_CAR',304.73,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_ROA_CAR',308.22,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_ROA_CAR',235.09,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_ROA_CAR',289.32,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_ROA_CAR',328.99,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_ROA_CAR',328.86,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_ROA_CAR',338.98,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_ROA_CAR',352.98,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_ROA_CAR',360.44,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_ROA_CAR',368.96,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_BUS',3.57,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_2WH',73.88,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_ROA_LCV',78.25,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_ROA_LCV',84.75,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_ROA_LCV',84.36,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_ROA_LCV',90.42,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_ROA_LCV',79.40,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_ROA_LCV',69.96,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_ROA_LCV',64.60,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_ROA_LCV',71.50,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_ROA_LCV',69.01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_ROA_LCV',71.97,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_ROA_LCV',70.11,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_ROA_LCV',76.20,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_ROA_LCV',80.60,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_ROA_LCV',83.34,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_ROA_LCV',85.85,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_ROA_LCV',88.54,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_AVI_DOM',2.38E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_AVI_DOM',2.62E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_AVI_DOM',2.53E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_AVI_DOM',2.75E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_AVI_DOM',2.87E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_AVI_DOM',3.04E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_AVI_DOM',3.35E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_AVI_DOM',3.74E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_AVI_DOM',1.32E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_AVI_DOM',4.02E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_AVI_DOM',4.20E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_AVI_DOM',4.75E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_AVI_DOM',5.27E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_AVI_DOM',5.84E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_AVI_DOM',6.29E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_AVI_DOM',6.60E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_AVI_INT',4.18E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2007,'TRA_AVI_INT',4.65E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2008,'TRA_AVI_INT',4.56E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2010,'TRA_AVI_INT',4.73E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2012,'TRA_AVI_INT',4.99E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2014,'TRA_AVI_INT',5.29E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2016,'TRA_AVI_INT',5.98E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2018,'TRA_AVI_INT',6.37E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2020,'TRA_AVI_INT',4.47E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2022,'TRA_AVI_INT',6.92E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2025,'TRA_AVI_INT',7.40E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2030,'TRA_AVI_INT',8.39E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2035,'TRA_AVI_INT',9.33E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2040,'TRA_AVI_INT',1.03E+00,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2045,'TRA_AVI_INT',1.11E+00,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2050,'TRA_AVI_INT',1.17E+00,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NEU',1.420E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_OTH',2.103E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_RAIL_FRG',1.04E-01,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_RAIL_PSG',8.00E-02,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NAV_DOM',5.03E-03,'Bvkm','');
INSERT INTO "Demand" VALUES ('IT',2006,'TRA_NAV_INT',7.19E-02,'Bvkm','');

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
INSERT INTO "CostVariable" VALUES ('IT',2006,'TRA_FT_ELC_E',2006,2.78,'M€/PJ','Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_AVG_N',2007,0.1,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_AVG_N',2007,0.1+10.09,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_BIODST_N',2007,1.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_BIODST_N',2007,1.0+16.36,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_DST_N',2007,1.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_DST_N',2007,1.0+16.36,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_GSL_N',2007,1.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_GSL_N',2007,1.0+22.28,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_HFO_N',2007,0.5,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_HFO_N',2007,0.5+16.36,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_JTK_N',2007,0.1,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_JTK_N',2007,0.1+10.09,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_LNG_N',2007,1.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_LNG_N',2007,1.0+0.10,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_LPG_N',2007,2.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_LPG_N',2007,2.0+5.81,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_NGA_N',2007,3.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'TRA_FT_NGA_N',2007,3.0+0.10,'M€/PJ','Distribution + Excise');
--INSERT INTO "CostVariable" VALUES ('IT',2025,'TRA_FT_MET_N',2025,5.0,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2025,'TRA_FT_MET_N',2025,5.0+22.28,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2025,'TRA_FT_AMM_IND_N',2025,22.28,'M€/PJ','Excise');
INSERT INTO "CostVariable" VALUES ('IT',2025,'TRA_FT_MET_IND_N',2025,22.28,'M€/PJ','Excise');
INSERT INTO "CostVariable" VALUES ('IT',2014,'TRA_FT_H2G_N',2014,0.28,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2014,'TRA_FT_H2L_N',2014,0.83,'M€/PJ','Distribution');

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
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_AVG_N',2007,5.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_DST_N',2007,10.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_GSL_N',2007,10.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_HFO_N',2007,5.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_JTK_N',2007,5.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_LNG_N',2007,50.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_LPG_N',2007,30.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_MET_N',2025,20.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_NGA_N',2007,100.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_BIODST_N',2007,10.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_H2G_N',2014,52.12,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_FT_H2L_N',2014,51.24,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','TRA_AVI_INT_JTK_N',2007,115000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_AVI_INT_H2L_N',2040,160000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_AVI_DOM_JTK_N',2007,92000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_AVI_DOM_H2L_N',2035,120000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_PAS_DST_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_PAS_ELC_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_PAS_H2G_N',2030,1300,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_FRG_DST_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_FRG_ELC_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,1600,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_DST_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_HFO_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_LNG_N',2025,1100,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_DUAL_N',2025,1200,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_MET_ICE_N',2030,1500,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_H2L_ICE_N',2030,1800,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_MET_FCELL_N',2030,1900,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_DOM_H2L_FCELL_N',2030,2100,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_DST_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_HFO_N',2007,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_LNG_N',2025,1000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_DUAL_N',2025,1200,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_AMM_ICE_N',2030,1300,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_MET_N',2030,1600,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_H2L_N',2030,2000,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_NAV_INT_AMM_FCELL_N',2030,2200,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_GSL_N',2007,1500,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_DST_N',2007,1730,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2010,2870,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2020,2540,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2030,2200,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_ELC_N',2050,1970,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_FULHYB_N',2020,1830,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_FULHYB_N',2030,1770,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_2WH_FULHYB_N',2050,1730,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_GSL_N',2007,2010,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_DST_N',2007,2480,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_LPG_N',2007,2360,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_NGA_N',2007,3040,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2012,4790,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2020,4160,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2030,3350,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_ELC_N',2050,2990,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_PLGHYB_N',2016,2780,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_PLGHYB_N',2030,2540,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_PLGHYB_N',2050,2340,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2020,3770,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2030,3310,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_BUS_FCELL_N',2050,2920,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_GSL_N',2007,1500,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_DST_N',2007,1730,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_LPG_N',2007,1530,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_NGA_N',2007,1620,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2007,2870,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2020,2540,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2030,2200,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_ELC_N',2050,1970,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',2012,1790,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',2020,1670,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',2030,1640,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_MILHYB_N',2050,1620,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FULHYB_N',2020,1830,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FULHYB_N',2030,1770,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FULHYB_N',2050,1730,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',2012,2560,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',2020,2410,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',2030,2330,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_PLGHYB_N',2050,2280,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2025,3770,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2030,3310,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_CAR_FCELL_N',2050,2920,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_DST_N',2007,2480,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_LPG_N',2007,2360,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_NGA_N',2007,3040,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2012,4790,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2020,4160,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2030,3350,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_ELC_N',2050,2990,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2025,5400,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2030,4740,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_FCELL_N',2050,4180,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N',2018,2780,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N',2030,2540,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_HTR_PLGHYB_N',2050,2340,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_GSL_N',2007,1150,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_DST_N',2007,1420,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_LPG_N',2007,1350,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_NGA_N',2007,1743,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2012,2690,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2020,2380,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2030,2070,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_ELC_N',2050,1850,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FULHYB_N',2016,1760,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FULHYB_N',2030,1710,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FULHYB_N',2050,1670,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PLGHYB_N',2018,1590,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PLGHYB_N',2030,1570,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_PLGHYB_N',2050,1550,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2025,3090,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2030,2710,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_LCV_FCELL_N',2050,2390,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_DST_N',2007,2290,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_LPG_N',2007,2180,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_NGA_N',2007,2810,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2012,4420,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2020,3840,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2030,3090,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_ELC_N',2050,2760,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N',2016,2560,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N',2030,2340,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_PLGHYB_N',2050,2160,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2025,4980,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2030,4370,'M€/Bvkm','');
INSERT INTO "CostInvest" VALUES ('IT','TRA_ROA_MTR_FCELL_N',2050,3860,'M€/Bvkm','');
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
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2014,'TRA_FT_H2G_N',2014,3.25,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'TRA_FT_H2L_N',2014,2.98,'M€/PJ','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_AVI_INT_JTK_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2040,'TRA_AVI_INT_H2L_N',2040,29.40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_AVI_DOM_JTK_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2035,'TRA_AVI_DOM_H2L_N',2035,29.40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_RAIL_PAS_DST_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_RAIL_PAS_ELC_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_RAIL_FRG_DST_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_RAIL_FRG_ELC_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_RAIL_FRG_H2G_MNL_N',2030,32.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_NAV_DOM_DST_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_NAV_DOM_HFO_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_NAV_DOM_LNG_N',2025,22.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_NAV_DOM_DUAL_N',2025,24.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_DOM_MET_ICE_N',2030,30.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_DOM_H2L_ICE_N',2030,36.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_DOM_MET_FCELL_N',2030,38.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_DOM_H2L_FCELL_N',2030,42.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_NAV_INT_DST_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_NAV_INT_HFO_N',2007,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_NAV_INT_LNG_N',2025,20.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_NAV_INT_DUAL_N',2025,24.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_INT_AMM_ICE_N',2030,26.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_INT_MET_N',2030,32.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_INT_H2L_N',2030,40.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'TRA_NAV_INT_AMM_FCELL_N',2030,44.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_2WH_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_2WH_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'TRA_ROA_2WH_ELC_N',2010,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_2WH_FULHYB_N',2020,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_BUS_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_BUS_ELC_N',2012,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_BUS_PLGHYB_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_BUS_FCELL_N',2020,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_CAR_ELC_N',2007,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_CAR_MILHYB_N',2012,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'TRA_ROA_CAR_FULHYB_N',2020,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_CAR_PLGHYB_N',2012,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_CAR_FCELL_N',2025,70.03,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_HTR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_HTR_ELC_N',2012,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2018,'TRA_ROA_HTR_PLGHYB_N',2018,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_HTR_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_GSL_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_LCV_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_LCV_ELC_N',2012,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_LCV_FULHYB_N',2016,61.76,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2018,'TRA_ROA_LCV_PLGHYB_N',2018,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_LCV_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_DST_N',2007,62.63,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_LPG_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_ROA_MTR_NGA_N',2007,64.37,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2012,'TRA_ROA_MTR_ELC_N',2012,51.33,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'TRA_ROA_MTR_PLGHYB_N',2016,60.00,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'TRA_ROA_MTR_FCELL_N',2025,60.89,'M€/Bvkm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'TRA_OTH_ELC_N',2007,1.0,'M€/PJ','');

CREATE TABLE "Currency" (
	"curr"	text,
	"value"	real,
	"ref"   text,
	PRIMARY KEY("curr","value")
);
INSERT INTO "Currency" VALUES ('EUR00',1.45,'');
INSERT INTO "Currency" VALUES ('EUR01',1.40,'');
INSERT INTO "Currency" VALUES ('EUR02',1.36,'');
INSERT INTO "Currency" VALUES ('EUR03',1.33,'');
INSERT INTO "Currency" VALUES ('EUR04',1.30,'');
INSERT INTO "Currency" VALUES ('EUR05',1.27,'');
INSERT INTO "Currency" VALUES ('EUR06',1.24,'');
INSERT INTO "Currency" VALUES ('EUR07',1.21,'');
INSERT INTO "Currency" VALUES ('EUR08',1.17,'');
INSERT INTO "Currency" VALUES ('EUR09',1.16,'');
INSERT INTO "Currency" VALUES ('EUR10',1.14,'');
INSERT INTO "Currency" VALUES ('EUR11',1.11,'');
INSERT INTO "Currency" VALUES ('EUR12',1.08,'');
INSERT INTO "Currency" VALUES ('EUR13',1.06,'');
INSERT INTO "Currency" VALUES ('EUR14',1.06,'');
INSERT INTO "Currency" VALUES ('EUR15',1.06,'');
INSERT INTO "Currency" VALUES ('EUR16',1.06,'');
INSERT INTO "Currency" VALUES ('EUR17',1.04,'');
INSERT INTO "Currency" VALUES ('EUR18',1.02,'');
INSERT INTO "Currency" VALUES ('EUR19',1.01,'');
INSERT INTO "Currency" VALUES ('EUR20',1.00,'REF');
INSERT INTO "Currency" VALUES ('EUR21',0.97,'');
INSERT INTO "Currency" VALUES ('EUR22',0.92,'');
INSERT INTO "Currency" VALUES ('USD00',1.57,'');
INSERT INTO "Currency" VALUES ('USD06',0.98,'');
INSERT INTO "Currency" VALUES ('USD07',0.88,'');
INSERT INTO "Currency" VALUES ('USD08',0.79,'');
INSERT INTO "Currency" VALUES ('USD10',0.85,'');
INSERT INTO "Currency" VALUES ('USD11',0.80,'');
INSERT INTO "Currency" VALUES ('USD12',0.83,'');
INSERT INTO "Currency" VALUES ('USD13',0.80,'');
INSERT INTO "Currency" VALUES ('USD14',0.80,'');
INSERT INTO "Currency" VALUES ('USD16',0.95,'');

CREATE TABLE "CurrencyTech" (
	"tech"	text,
	"curr"	text,
	PRIMARY KEY("tech","curr")
);
-- Transport sector
INSERT INTO "CurrencyTech" VALUES ('TRA_FT_H2G_N','EUR12');
INSERT INTO "CurrencyTech" VALUES ('TRA_FT_H2L_N','EUR12');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_2WH_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_2WH_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_2WH_GSL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_2WH_FULHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_GSL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_LPG_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_NGA_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_PLGHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_BUS_FCELL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_GSL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_LPG_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_NGA_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_MILHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_FULHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_PLGHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_CAR_FCELL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_FCELL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_PLGHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_LPG_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_HTR_NGA_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_FCELL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_GSL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_FULHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_LPG_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_NGA_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_LCV_PLGHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_DST_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_ELC_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_FCELL_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_PLGHYB_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_LPG_N','EUR19');
INSERT INTO "CurrencyTech" VALUES ('TRA_ROA_MTR_NGA_N','EUR19');

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
-- Transport sector
-- Fuel technologies
INSERT INTO "CapacityFactor" VALUES ('IT','TRA_FT_H2G_N',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','TRA_FT_H2L_N',2014,0.75,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('IT','TRA_RAIL_PAS_H2G_N',2030,0.97,'');
INSERT INTO "CapacityFactor" VALUES ('IT','TRA_RAIL_FRG_H2G_MNL_N',2030,0.97,'');

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