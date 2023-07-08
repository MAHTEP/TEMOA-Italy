
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
INSERT INTO "time_periods" VALUES (2055,'f');

CREATE TABLE "MyopicBaseyear" (
	"year"	real,
	"notes"	text
);

CREATE TABLE "time_season" (
	"t_season"	text,
	PRIMARY KEY("t_season")
);
INSERT INTO "time_season" VALUES ('summer');
INSERT INTO "time_season" VALUES ('fall');
INSERT INTO "time_season" VALUES ('winter');
INSERT INTO "time_season" VALUES ('spring');

CREATE TABLE "time_of_day" (
	"t_day"	text,
	PRIMARY KEY("t_day")
);
INSERT INTO "time_of_day" VALUES ('day');
INSERT INTO "time_of_day" VALUES ('night');
INSERT INTO "time_of_day" VALUES ('peak');

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
INSERT INTO "SegFrac" VALUES ('summer','peak' ,0.010,'');
INSERT INTO "SegFrac" VALUES ('fall'  ,'day'  ,0.125,'');
INSERT INTO "SegFrac" VALUES ('fall'  ,'night',0.115,'');
INSERT INTO "SegFrac" VALUES ('fall'  ,'peak' ,0.010,'');
INSERT INTO "SegFrac" VALUES ('winter','day'  ,0.105,'');
INSERT INTO "SegFrac" VALUES ('winter','night',0.135,'');
INSERT INTO "SegFrac" VALUES ('winter','peak' ,0.010,'');
INSERT INTO "SegFrac" VALUES ('spring','day'  ,0.115,'');
INSERT INTO "SegFrac" VALUES ('spring','night',0.125,'');
INSERT INTO "SegFrac" VALUES ('spring','peak' ,0.010,'');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('RES_FT_NGA_E','p','RES','Fuel technology - Natural gas mix - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_DST_E','p','RES','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_HFO_E','p','RES','Fuel technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_KER_E','p','RES','Fuel technology - Kerosene - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_COA_E','p','RES','Fuel technology - Coal - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_LPG_E','p','RES','Fuel technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_BIO_E','p','RES','Fuel technology - Biofuels - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_GEO_E','p','RES','Fuel technology - Geothermal - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_SOL_E','p','RES','Fuel technology - Solar - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_HET_E','p','RES','Fuel technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('RES_FT_NGA_N','p','RES','Fuel technology - Natural gas mix - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_DST_N','p','RES','Fuel technology - Diesel - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_HFO_N','p','RES','Fuel technology - Heavy fuel oil - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_KER_N','p','RES','Fuel technology - Kerosene - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_COA_N','p','RES','Fuel technology - Coal - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_LPG_N','p','RES','Fuel technology - Liquefied Petroleum Gas - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_BIO_N','p','RES','Fuel technology - Biofuels - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_SOL_N','p','RES','Fuel technology - Solar energy - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_GEO_1_N','p','RES','Fuel technology - Geothermal energy 1 - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_GEO_2_N','p','RES','Fuel technology - Geothermal energy 2 - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_GEO_3_N','p','RES','Fuel technology - Geothermal energy 3 - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_HET_N','p','RES','Fuel technology - Heat - New ','');
INSERT INTO "technologies" VALUES ('RES_FT_ELC_E','p','RES','Fuel technology - Electricity - Existing','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_SO_E','p','RES','Space heating - Burner - Natural gas - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_NGA_SO_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_SO_E','p','RES','Space heating - Burner - Diesel - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_SO_E','p','RES','Space heating - Burner - Heavy fuel oil - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_KER_SO_E','p','RES','Space heating - Burner - Kerosene - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_COA_SO_E','p','RES','Space heating - Burner - Coal - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_SO_E','p','RES','Space heating - Burner - LPG - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_SO_E','p','RES','Space heating - Woodstove - Biomass - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_SO_E','p','RES','Space heating - Electric heater - Electricity - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_ELC_SO_E','p','RES','Space heating - Air-coupled heat pump - Electricity - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_SO_E','p','RES','Space heating - Heat exchanger - heat - SF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_GEO_SO_E','p','RES','Space heating - Heat pump - Geothermal energy - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_MO_E','p','RES','Space heating - Burner - Natural gas - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_NGA_MO_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_MO_E','p','RES','Space heating - Burner - Diesel - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_MO_E','p','RES','Space heating - Burner - Heavy fuel oil - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_KER_MO_E','p','RES','Space heating - Burner - Kerosene - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_COA_MO_E','p','RES','Space heating - Burner - Coal - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_MO_E','p','RES','Space heating - Burner - LPG - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_MO_E','p','RES','Space heating - Woodstove - Biomass - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_MO_E','p','RES','Space heating - Electric heater - Electricity - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_MO_E','p','RES','Space heating - Air-coupled heat pump - Electricity - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_MO_E','p','RES','Space heating - Heat exchanger - heat - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_GEO_MO_E','p','RES','Space heating - Heat pump - Geothermal energy - MF-old - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_SN_E','p','RES','Space heating - Burner - Natural gas - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_NGA_SN_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_DST_SN_E','p','RES','Space heating - Burner - Diesel - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_HFO_SN_E','p','RES','Space heating - Burner - Heavy fuel oil - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_KER_SN_E','p','RES','Space heating - Burner - Kerosene - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_COA_SN_E','p','RES','Space heating - Burner - Coal - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_LPG_SN_E','p','RES','Space heating - Burner - LPG - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_SN_E','p','RES','Space heating - Woodstove - Biomass - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HT_ELC_SN_E','p','RES','Space heating - Electric heater - Electricity - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_SN_E','p','RES','Space heating - Air-coupled heat pump - Electricity - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_SN_E','p','RES','Space heating - Heat exchanger - Heat - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_GEO_SN_E','p','RES','Space heating - Burner - Natural gas - SF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_BUR_NGA_MN_E','p','RES','Space heating - Burner - Natural gas - MF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_NGA_MN_E','p','RES','Space heating - Air-coupled heat pump - Natural gas - MF-new - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_E','p','RES','Space cooling - Central cooling - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_EHP_E','p','RES','Space cooling - Air-coupled heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_E','p','RES','Space cooling - Room cooling - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_E','p','RES','Water heating - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_HFO_E','p','RES','Water heating - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_E','p','RES','Water heating - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_E','p','RES','Water heating - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_BIO_E','p','RES','Water heating - Biomass - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_ELC_E','p','RES','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_HET_E','p','RES','Water heating - Heat - Existing','');
INSERT INTO "technologies" VALUES ('RES_WH_SOL_E','p','RES','Water heating - Solar energy - Existing','');
INSERT INTO "technologies" VALUES ('RES_RF_TECH','p','RES','Refrigeration technology','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_ELC_E','p','RES','Refrigeration - Refrigerator - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_ELC_E','p','RES','Refrigeration - Freezer - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_E','p','RES','Cloth washing - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_E','p','RES','Cloth drying - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_E','p','RES','Dish washing - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_NGA_E','p','RES','Cooking - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_LPG_E','p','RES','Cooking - LPG - Existing','');
INSERT INTO "technologies" VALUES ('RES_CK_ELC_E','p','RES','Cooking - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_OE_EQP_E','p','RES','Other electric - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_LFL_E','p','RES','Lighting - Large fluorescent light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_E','p','RES','Lighting - Small fluorescent light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_LHAL_E','p','RES','Lighting - Large halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_IMP_E','p','RES','Lighting - Small improved halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_E','p','RES','Lighting - Small halogen light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_MIN_E','p','RES','Lighting - Medium incandescence light - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('RES_LG_SIN_E','p','RES','Lighting - Small incandescence light - Electricity - Existing','');
-- New technologies
INSERT INTO "technologies" VALUES ('RES_RF_RFG_CLB_N','p','RES','Refrigeration - Class B refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_CLA_N','p','RES','Refrigeration - Class A refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_CLA+_N','p','RES','Refrigeration - Class A+ refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_CLA++_N','p','RES','Refrigeration - Class A++ refrigerator - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_2010_N','p','RES','Refrigeration - New refrigerator 2010 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_RFG_2020_N','p','RES','Refrigeration - New refrigerator 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLB_N','p','RES','Refrigeration - Class B freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLA_N','p','RES','Refrigeration - Class A freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_CLA++_N','p','RES','Refrigeration - Class A++ freezer - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_2010_N','p','RES','Refrigeration - New freezer 2010 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_RF_FRZ_2020_N','p','RES','Refrigeration - New freezer 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_N','p','RES','Water heating - Diesel - New','');
INSERT INTO "technologies" VALUES ('RES_WH_DST_COND_N','p','RES','Water heating - Diesel (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_N','p','RES','Water heating - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_WH_NGA_COND_N','p','RES','Water heating - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_N','p','RES','Water heating - LPG - New','');
INSERT INTO "technologies" VALUES ('RES_WH_LPG_COND_N','p','RES','Water heating - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('RES_WH_WPL_BIO_N','p','RES','Water heating - Biomass wood pellet water heater - New','');
INSERT INTO "technologies" VALUES ('RES_WH_ELC_RES_N','p','RES','Water heating - Resistance - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_AHP_ELC_N','p','RES','Water heating - Air-coupled heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_WH_HNS_ELC_N','p','RES','Water heating - Heat pump coupled near surface - Electricity  - New','');
INSERT INTO "technologies" VALUES ('RES_WH_SOL_N','p','RES','Water heating - Solar energy - New','');
INSERT INTO "technologies" VALUES ('RES_WH_PDC_ACS_N','p','RES','Water heating - Heat pump sanitary water- Heat pump','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_N','p','RES','Cloth washing - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_IMP_N','p','RES','Cloth washing - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_CW_ELC_ADV_N','p','RES','Cloth washing - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_CW_2010_ELC_N','p','RES','Cloth washing - New electric cloth washing machine 2010 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CW_2020_ELC_N','p','RES','Cloth washing - New electric cloth washing machine 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_N','p','RES','Cloth drying - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_ADV_N','p','RES','Cloth drying - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_CD_ELC_NEW_N','p','RES','Cloth drying - Electricity (new) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_STD_N','p','RES','Dish washing - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_IMP_N','p','RES','Dish washing - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_ELC_ADV_N','p','RES','Dish washing - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_DW_2010_ELC_N','p','RES','Dish washing - New dish washer 2010 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_DW_2020_ELC_N','p','RES','Dish washing - New dish washer 2020 - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CK_NGA_N','p','RES','Cooking - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_CK_COA_N','p','RES','Cooking - Coal - New','');
INSERT INTO "technologies" VALUES ('RES_CK_LPG_N','p','RES','Cooking - LPG - New','');
INSERT INTO "technologies" VALUES ('RES_CK_ELC_N','p','RES','Cooking - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_CK_BIO_N','p','RES','Cooking - Biomass - New','');
INSERT INTO "technologies" VALUES ('RES_LG_BFL_IMP_N','p','RES','Lighting - Big fluorescent compact energy-saver light - Electricity  - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_IMP_N','p','RES','Lighting - Small fluorescent compact energy-saver light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_EFL_N','p','RES','Lighting - Electrodeless fluorescent induction light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LFL_N','p','RES','Lighting - Large fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SFL_N','p','RES','Lighting - Small fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LHAL_N','p','RES','Lighting - Large standard halogen light 220 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_IMP_N','p','RES','Lighting - Small improved halogen 12 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SHAL_N','p','RES','Lighting - Small standard halogen 12 V - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_MIN_N','p','RES','Lighting - Incandescent medium light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_SIN_N','p','RES','Lighting - Incandescent small light - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_LG_KER_N','p','RES','Lighting - Kerosene lamp - Kerosene - New','');
INSERT INTO "technologies" VALUES ('RES_LG_LED_ELC_N','p','RES','Lighting - LED lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_SO_N','p','RES','Space heating - Diesel - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_SO_N','p','RES','Space heating - Diesel (condensing) - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_SO_N','p','RES','Space heating - Natural gas - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_SO_N','p','RES','Space heating - Natural gas (condensing) - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_SO_N','p','RES','Space heating - LPG - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_SO_N','p','RES','Space heating - LPG (condensing) - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_SO_N','p','RES','Space heating - Wood stove - Biomass - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_SO_N','p','RES','Space heating - Wood pellet - Biomass - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_SO_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_SO_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_SO_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_SO_N','p','RES','Space heating - Heat exchanger - Heat - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_SO_N','p','RES','Space heating - Heat pump - Heat - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_SO_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_DST_SO_N','p','RES','Space heating - Solar + Diesel - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_LPG_SO_N','p','RES','Space heating - Solar + LPG heating - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_NGA_SO_N','p','RES','Space heating - Solar + NGA heating - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_ROOF_INS_SO_N','p','RES','Space heating - Roof insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_INT_INS_SO_N','p','RES','Space heating - Internal insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_BASE_INS_SO_N','p','RES','Space heating - Base floor insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WIN_INS_SO_N','p','RES','Space heating - Windows insulation - SF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_MO_N','p','RES','Space heating - Diesel - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_MO_N','p','RES','Space heating - Diesel (condensing) - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_MO_N','p','RES','Space heating - Natural gas - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_MO_N','p','RES','Space heating - Natural gas (condensing) - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_MO_N','p','RES','Space heating - LPG - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_MO_N','p','RES','Space heating - LPG (condensing) - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_MO_N','p','RES','Space heating - Wood stove - Biomass - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_MO_N','p','RES','Space heating - Wood pellet - Biomass - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_MO_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity  - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_MO_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_MO_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_MO_N','p','RES','Space heating - Heat exchanger - Heat  - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_MO_N','p','RES','Space heating - Heat pump - Heat - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_MO_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_DST_MO_N','p','RES','Space heating - Solar + Diesel - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_LPG_MO_N','p','RES','Space heating - Solar + LPG heating - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_NGA_MO_N','p','RES','Space heating - Solar + NGA heating - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_ROOF_INS_MO_N','p','RES','Space heating - Roof insulation - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_INT_INS_MO_N','p','RES','Space heating - Internal insulation - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_BASE_INS_MO_N','p','RES','Space heating - Base floor insulation - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WIN_INS_MO_N','p','RES','Space heating - Windows insulation - MF-old - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_SN_N','p','RES','Space heating - Diesel (condensing) - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_SN_N','p','RES','Space heating - Natural gas (condensing) - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_SN_N','p','RES','Space heating - LPG (condensing) - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_SN_N','p','RES','Space heating - Wood stove - Biomass - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_SN_N','p','RES','Space heating - Wood pellet - Biomass - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_SN_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_SN_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_SN_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_SN_N','p','RES','Space heating - Heat exchanger - Heat - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HP_HET_SN_N','p','RES','Space heating - Heat pump - Heat - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_SN_N','p','RES','Space heating - Heat-pump electricity-to-service transformation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPTS_GEO_SN_N','p','RES','Space heating - Geothermal heat-pump electricity-to-service transformation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_DST_SN_N','p','RES','Space heating - Solar + Diesel - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_LPG_SN_N','p','RES','Space heating - Solar + LPG heating - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_SOL_NGA_SN_N','p','RES','Space heating - Solar + NGA heating - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_ROOF_INS_SN_N','p','RES','Space heating - Roof insulation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_INT_INS_SN_N','p','RES','Space heating - Internal insulation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_BASE_INS_SN_N','p','RES','Space heating - Base floor insulation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WIN_INS_SN_N','p','RES','Space heating - Windows insulation - SF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_MN_N','p','RES','Space heating - Diesel - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_DST_COND_MN_N','p','RES','Space heating - Diesel (condensing) - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_MN_N','p','RES','Space heating - Natural gas - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_NGA_COND_MN_N','p','RES','Space heating - Natural gas (condensing) - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_MN_N','p','RES','Space heating - LPG - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_LPG_COND_MN_N','p','RES','Space heating - LPG (condensing) - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WST_BIO_MN_N','p','RES','Space heating - Wood stove - Biomass - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_WPL_BIO_MN_N','p','RES','Space heating - Wood pellet - Biomass - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_AHP_ELC_MN_N','p','RES','Space heating - Air-coupled heat pump heating - Electricity - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HNS_ELC_MN_N','p','RES','Space heating - Heat pump coupled near surface - Electricity - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HPP_ELC_MN_N','p','RES','Space heating - Heat pump coupled with probe - Electricity - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SH_HEX_HET_MN_N','p','RES','Space heating - Heat exchanger - Heat - MF-new - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_STD_N','p','RES','Space cooling - Air-coupled heat pump cooling - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_IMP_N','p','RES','Space cooling - Air-coupled heat pump cooling - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_N','p','RES','Space cooling - Central - New','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_N','p','RES','Space cooling - Room - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_ELC_ADV_N','p','RES','Space cooling - Air-coupled heat pump - Electricity (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_GEO_N','p','RES','Space cooling - Heat pump - Geothermal energy - New','');
INSERT INTO "technologies" VALUES ('RES_SC_ROOM_ELC_NEW_N','p','RES','Space cooling - Room - Electricity (new) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_GEO_IMP_N','p','RES','Space cooling - Heat pump - Geothermal (improved) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_NGA_ADV_N','p','RES','Space cooling - Air-coupled heat pump - Natural gas (advanced) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_CEN_NGA_N','p','RES','Space cooling - Central - Natural gas - New','');
INSERT INTO "technologies" VALUES ('RES_SC_AHP_NGA_N','p','RES','Space cooling - Air-coupled heat pump - Natural gas (new) - New','');
INSERT INTO "technologies" VALUES ('RES_SC_HP_N','p','RES','Space cooling - Heat pump - New','');
INSERT INTO "technologies" VALUES ('RES_MISC_EQP_N','p','RES','Miscellaneous equipment - New','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CI_N','p','RES','mCHP - Residential - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_MICRO_N','p','RES','mCHP - Residential - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CC_N','p','RES','mCHP - Residential - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_STR_N','p','RES','mCHP - Residential - Stirling engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_SOFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_H2_PEMFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Hydrogen','');

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
-- Residential sector
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_BIO_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HET_E','');
INSERT INTO "tech_annual" VALUES ('RES_WH_SOL_E','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_NGA_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_LPG_E','');
INSERT INTO "tech_annual" VALUES ('RES_CK_ELC_E','');
INSERT INTO "tech_annual" VALUES ('RES_OE_EQP_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LFL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LHAL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_IMP_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_MIN_E','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SIN_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_CLB_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_CLA_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_CLA+_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_CLA++_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_2010_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_RFG_2020_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLB_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLA_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_CLA++_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_2010_N','');
INSERT INTO "tech_annual" VALUES ('RES_RF_FRZ_2020_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_DST_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_NGA_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_LPG_COND_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_WPL_BIO_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_ELC_RES_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_AHP_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_HNS_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_WH_SOL_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_2010_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CW_2020_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_CD_ELC_NEW_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_STD_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_ELC_ADV_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_2010_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_DW_2020_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_NGA_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_COA_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_LPG_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_CK_BIO_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_BFL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_EFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SFL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LHAL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SHAL_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_MIN_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_SIN_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_KER_N','');
INSERT INTO "tech_annual" VALUES ('RES_LG_LED_ELC_N','');
INSERT INTO "tech_annual" VALUES ('RES_MISC_EQP_N','');

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
-- Residential sector
INSERT INTO "commodities" VALUES('RES_CD','d','Clothes drying');
INSERT INTO "commodities" VALUES('RES_CK','d','Cooking');
INSERT INTO "commodities" VALUES('RES_CW','d','Clothes washing');
INSERT INTO "commodities" VALUES('RES_DW','d','Dish washing');
INSERT INTO "commodities" VALUES('RES_LG','d','Lighting');
INSERT INTO "commodities" VALUES('RES_OE','d','Other electric');
INSERT INTO "commodities" VALUES('RES_RF','d','Refrigeration');
INSERT INTO "commodities" VALUES('RES_SC','d','Space cooling');
INSERT INTO "commodities" VALUES('RES_SH_SO','d','Space heating - SF-Old');
INSERT INTO "commodities" VALUES('RES_SH_MO','d','Space heating - MF-Old');
INSERT INTO "commodities" VALUES('RES_SH_SN','d','Space heating - SF-New');
INSERT INTO "commodities" VALUES('RES_SH_MN','d','Space heating - MF-New');
INSERT INTO "commodities" VALUES('RES_WH','d','Water heating');
INSERT INTO "commodities" VALUES('RES_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('RES_COA','p','Coal');
INSERT INTO "commodities" VALUES('RES_DST','p','Diesel');
INSERT INTO "commodities" VALUES('RES_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('RES_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('RES_HET','p','Heat');
INSERT INTO "commodities" VALUES('RES_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('RES_KER','p','Kerosene');
INSERT INTO "commodities" VALUES('RES_LPG','p','LPG');
INSERT INTO "commodities" VALUES('RES_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('RES_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('RES_INS_C','p','Insulation - Cooling');
INSERT INTO "commodities" VALUES('RES_INS_MO','p','Insulation - MF-Old');
INSERT INTO "commodities" VALUES('RES_INS_SN','p','Insulation - SF-New');
INSERT INTO "commodities" VALUES('RES_INS_SO','p','Insulation - SF-Old');
INSERT INTO "commodities" VALUES('RES_PC_MO','p','Cooling from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PC_SN','p','Cooling from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_PC_SO','p','Cooling from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_PH_MO','p','Heating from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PH_SN','p','Heating from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_PH_SO','p','Heating from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_PW_MO','p','Hot water from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PW_SN','p','Hot water from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_PW_SO','p','Hot water from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_RF_FRZ','p','Refrigeration - Freezers');
INSERT INTO "commodities" VALUES('RES_RF_RFG','p','Refrigeration - Refrigerators');
INSERT INTO "commodities" VALUES('RES_CH4','e','Residential - CH4 emission');
INSERT INTO "commodities" VALUES('RES_CO2','e','Residential - CO2 emission');
INSERT INTO "commodities" VALUES('RES_N2O','e','Residential - N2O emission');
-- Input commodities
INSERT INTO "commodities" VALUES('BIO_METH','p','');
INSERT INTO "commodities" VALUES('BIO_GAS','p','');
INSERT INTO "commodities" VALUES('BIO_SLB','p','');
INSERT INTO "commodities" VALUES('COA_HCO','p','');
INSERT INTO "commodities" VALUES('COA_OVC','p','');
INSERT INTO "commodities" VALUES('CRT_EFF','p','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_H2','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('GAS_COG','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('GEO','p','');
INSERT INTO "commodities" VALUES('H2_BL','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('OIL_DST','p','');
INSERT INTO "commodities" VALUES('OIL_HFO','p','');
INSERT INTO "commodities" VALUES('OIL_KER','p','');
INSERT INTO "commodities" VALUES('OIL_LPG','p','');
INSERT INTO "commodities" VALUES('OIL_NSP','p','');
INSERT INTO "commodities" VALUES('SOL','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
INSERT INTO "commodities" VALUES('SYN_KER','p','');
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
-- Residential sector
-- New technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SO_N','RES_PH_SO',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SO_N','RES_PC_SO',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SO_N','RES_PW_SO',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SO_N','RES_PH_SO',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SO_N','RES_PC_SO',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SO_N','RES_PW_SO',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SO_N','RES_PH_SO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SO_N','RES_PC_SO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SO_N','RES_PW_SO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PH_MO',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PC_MO',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PW_MO',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_MO_N','RES_PH_MO',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_MO_N','RES_PC_MO',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_MO_N','RES_PW_MO',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_MO_N','RES_PH_MO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_MO_N','RES_PC_MO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_MO_N','RES_PW_MO',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PW_SN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_SN_N','RES_PW_SN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SN_N','RES_PH_SN',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SN_N','RES_PC_SN',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_SN_N','RES_PW_SN',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN',0.00,'');
-- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','RES_HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','RES_HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','RES_HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','RES_HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','RES_HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','RES_HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','RES_HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','RES_HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','RES_HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','RES_HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','RES_HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','RES_HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','ELC_DST',0.61,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','RES_HET',0.39,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','RES_HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','ELC_DST',0.53,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','RES_HET',0.47,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','ELC_DST',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','RES_HET',0.42,'');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'GAS_NGA','RES_FT_NGA_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'GAS_NGA','RES_FT_NGA_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'OIL_DST','RES_FT_DST_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'OIL_DST','RES_FT_DST_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_SLB','RES_FT_BIO_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_GAS','RES_FT_BIO_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_SLB','RES_FT_BIO_E',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_GAS','RES_FT_BIO_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','RES_FT_ELC_E',0.70,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_DST','RES_FT_ELC_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','RES_FT_ELC_E',0.65,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','RES_FT_ELC_E',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','RES_FT_ELC_E',0.35,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_DST','RES_FT_ELC_E',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_SLB','RES_FT_BIO_N',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_GAS','RES_FT_BIO_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_SLB','RES_FT_BIO_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_GAS','RES_FT_BIO_N',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COA_HCO','RES_FT_COA_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'COA_HCO','RES_FT_COA_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COA_HCO','RES_FT_COA_N',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'COA_HCO','RES_FT_COA_N',0.00,'');
-- Existing technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_RF_RFG','RES_RF_TECH',0.80,'User constraint');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_DST_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_DST_COND_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_NGA_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_NGA_COND_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_LPG_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_LPG_COND_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WST_BIO_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WPL_BIO_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_AHP_ELC_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HNS_ELC_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HPP_ELC_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_HET','RES_SH_HEX_HET_SO_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_DST_SO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_LPG_SO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_NGA_SO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_SOL_DST_SO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_SOL_LPG_SO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_SOL_NGA_SO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_DST_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_DST_COND_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_NGA_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_NGA_COND_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_LPG_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_LPG_COND_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WST_BIO_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WPL_BIO_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_AHP_ELC_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HNS_ELC_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HPP_ELC_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_HET','RES_SH_HEX_HET_MO_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_DST_MO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_LPG_MO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_NGA_MO_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_SOL_DST_MO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_SOL_LPG_MO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_SOL_NGA_MO_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_DST_COND_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_NGA_COND_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_LPG_COND_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WST_BIO_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_BIO','RES_SH_WPL_BIO_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_AHP_ELC_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HNS_ELC_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SH_HPP_ELC_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_HET','RES_SH_HEX_HET_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_DST_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_LPG_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_SOL','RES_SH_SOL_NGA_SN_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_DST','RES_SH_SOL_DST_SN_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_LPG','RES_SH_SOL_LPG_SN_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SH_SOL_NGA_SN_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_AHP_ELC_STD_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_AHP_ELC_IMP_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_CEN_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_ROOM_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_AHP_ELC_ADV_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_GEO_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_ELC','RES_SC_ROOM_ELC_NEW_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_GEO','RES_SC_GEO_IMP_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SC_AHP_NGA_ADV_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_NGA','RES_SC_CEN_NGA_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'RES_NGA','RES_SC_AHP_NGA_N',0.50,'');

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);

CREATE TABLE "PlanningReserveMargin" (
	`regions`	text,
	`reserve_margin`	REAL,
	PRIMARY KEY(regions),
	FOREIGN KEY(`regions`) REFERENCES regions
);

CREATE TABLE "tech_groups" (
	`tech`	text,
	`notes`	text,
	PRIMARY KEY(tech)
);
-- Residential sector
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_1_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_2_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_3_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_KER_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_KER_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_SOL_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_SOL_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_DST_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_LPG_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_NGA_SO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_DST_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_LPG_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_NGA_MO_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_DST_COND_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_NGA_COND_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_LPG_COND_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WST_BIO_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_WPL_BIO_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_AHP_ELC_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HNS_ELC_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HPP_ELC_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HEX_HET_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_HP_HET_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_DST_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_LPG_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_SH_SOL_NGA_SN_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_BIO_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HET_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_SOL_E','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_DST_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_NGA_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_LPG_COND_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_WPL_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_ELC_RES_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_AHP_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_HNS_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_SOL_N','');
INSERT INTO "tech_groups" VALUES ('RES_WH_PDC_ACS_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_NGA_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_LPG_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_CK_NGA_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_COA_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_LPG_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_ELC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CK_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_LG_LHAL_E','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SHAL_IMP_E','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SHAL_E','');
INSERT INTO "tech_groups" VALUES ('RES_LG_MIN_E','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SIN_E','');
INSERT INTO "tech_groups" VALUES ('RES_LG_LHAL_N','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SHAL_IMP_N','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SHAL_N','');
INSERT INTO "tech_groups" VALUES ('RES_LG_MIN_N','');
INSERT INTO "tech_groups" VALUES ('RES_LG_SIN_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_STR_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_H2_PEMFC_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Residential sector
INSERT INTO "groups" VALUES ('RES_FT_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_BIO_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_HET_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_KER_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_SO_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_MO_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_SN_GRP','');
INSERT INTO "groups" VALUES ('RES_WH_GRP','');
INSERT INTO "groups" VALUES ('RES_CK_GRP','');
INSERT INTO "groups" VALUES ('RES_LG_HAL_IN_GRP','');

CREATE TABLE "TechGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"weight"	        real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Residential sector
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_BIO_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_COA_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_ELC_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_ELC_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_LPG_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_LPG_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_NGA_E','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CK_NGA_N','RES_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_BIO_E','RES_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_BIO_N','RES_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_DST_E','RES_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_DST_N','RES_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_ELC_E','RES_FT_ELC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_HET_E','RES_FT_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_HET_N','RES_FT_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_NGA_CI_N','RES_FT_HET_GRP',0.55,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_NGA_MICRO_N','RES_FT_HET_GRP',0.62,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_NGA_CC_N','RES_FT_HET_GRP',0.50,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_NGA_STR_N','RES_FT_HET_GRP',0.20,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_NGA_SOFC_N','RES_FT_HET_GRP',0.50,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_CHP_H2_PEMFC_N','RES_FT_HET_GRP',0.46,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_KER_E','RES_FT_KER_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_KER_N','RES_FT_KER_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_LPG_E','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_LPG_N','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_NGA_E','RES_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_NGA_N','RES_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_SOL_E','RES_FT_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_FT_SOL_N','RES_FT_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_LHAL_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_LHAL_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_MIN_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_MIN_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SHAL_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SHAL_IMP_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SHAL_IMP_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SHAL_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SIN_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_LG_SIN_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_DST_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_DST_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HEX_HET_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HP_HET_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_LPG_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_LPG_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_NGA_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_NGA_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_DST_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WST_BIO_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_DST_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_DST_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HEX_HET_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HP_HET_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_LPG_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_LPG_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_NGA_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_NGA_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_DST_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WST_BIO_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_DST_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HEX_HET_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_HP_HET_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_LPG_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_NGA_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_DST_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_SH_WST_BIO_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_AHP_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_BIO_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_DST_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_DST_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_DST_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_ELC_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_ELC_RES_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_HET_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_HFO_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_HNS_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_LPG_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_LPG_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_LPG_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_NGA_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_NGA_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_NGA_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_PDC_ACS_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_SOL_E','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_SOL_N','RES_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','RES_WH_WPL_BIO_N','RES_WH_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Residential sector
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_BIO_GRP',253.83,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_BIO_GRP',263.91,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_BIO_GRP',240.02,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_BIO_GRP',257.16,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_BIO_GRP',248.48,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_BIO_GRP',239.16,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_DST_GRP',79.71,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_DST_GRP',61.53,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_DST_GRP',48.62,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_DST_GRP',41.86,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_DST_GRP',38.52,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_DST_GRP',30.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_ELC_GRP',237.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_ELC_GRP',233.31,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_ELC_GRP',223.06,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_ELC_GRP',221.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_ELC_GRP',223.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_ELC_GRP',226.44,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_HET_GRP',9.84,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_HET_GRP',32.31,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_HET_GRP',34.34,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_HET_GRP',36.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_HET_GRP',39.37,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_HET_GRP',34.59,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_LPG_GRP',53.01,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_LPG_GRP',47.70,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_LPG_GRP',43.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_LPG_GRP',45.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_LPG_GRP',44.44,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_LPG_GRP',43.78,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_NGA_GRP',709.42,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_NGA_GRP',719.71,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_NGA_GRP',639.11,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_NGA_GRP',683.36,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_NGA_GRP',649.47,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_NGA_GRP',635.35,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_FT_SOL_GRP',3.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'RES_FT_SOL_GRP',4.76,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'RES_FT_SOL_GRP',5.44,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'RES_FT_SOL_GRP',6.02,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'RES_FT_SOL_GRP',6.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'RES_FT_SOL_GRP',7.17,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'RES_LG_HAL_IN_GRP',100.00,'Glm');
INSERT INTO "MinActivityGroup" VALUES (2050,'RES_LG_HAL_IN_GRP',50.00,'Glm');

CREATE TABLE "MaxActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Residential sector
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_BIO_GRP',280.55,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_BIO_GRP',291.69,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_BIO_GRP',265.28,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_BIO_GRP',284.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_BIO_GRP',274.64,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_BIO_GRP',264.34,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_DST_GRP',88.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_DST_GRP',68.01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_DST_GRP',53.74,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_DST_GRP',46.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_DST_GRP',42.57,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_DST_GRP',33.79,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_ELC_GRP',262.85,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_ELC_GRP',257.87,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_ELC_GRP',246.54,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_ELC_GRP',245.31,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_ELC_GRP',247.07,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_ELC_GRP',250.28,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_HET_GRP',10.87,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_HET_GRP',35.72,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_HET_GRP',37.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_HET_GRP',40.70,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_HET_GRP',43.51,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_HET_GRP',38.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_NGA_GRP',784.09,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_NGA_GRP',795.47,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_NGA_GRP',706.38,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_NGA_GRP',755.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_NGA_GRP',717.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_NGA_GRP',702.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'RES_FT_SOL_GRP',3.95,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'RES_FT_SOL_GRP',5.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'RES_FT_SOL_GRP',6.01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'RES_FT_SOL_GRP',6.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'RES_FT_SOL_GRP',7.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'RES_FT_SOL_GRP',7.92,'PJ');

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
-- Residential sector
INSERT INTO "MinInputGroup" VALUES ('IT',2012,'RES_BIO','RES_SH_SO_GRP',0.06,''); -- Da TIMES (RH1BIO005 + RH1WPL005): 0.05 + 0.01
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'RES_BIO','RES_SH_SO_GRP',0.20,''); -- Da TIMES (RH1BIO005 + RH1WPL005): 0.20 + 0.00
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_SO_GRP',0.35,''); -- Da TIMES (RH1BIO005 + RH1WPL005): 0.30 + 0.05
INSERT INTO "MinInputGroup" VALUES ('IT',2012,'RES_BIO','RES_SH_MO_GRP',0.01,''); -- Da TIMES (RH2BIO005 + RH2WPL005): 0.01 + 0.00
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'RES_BIO','RES_SH_MO_GRP',0.12,''); -- Da TIMES (RH2BIO005 + RH2WPL005): 0.12 + 0.00
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_MO_GRP',0.25,''); -- Da TIMES (RH2BIO005 + RH2WPL005): 0.20 + 0.05
INSERT INTO "MinInputGroup" VALUES ('IT',2012,'RES_BIO','RES_SH_SN_GRP',0.01,''); -- Da TIMES (RH3BIO005 + RH3WPL005): 0.01 + 0.00
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'RES_BIO','RES_SH_SN_GRP',0.25,''); -- Da TIMES (RH3BIO005 + RH3WPL005): 0.25 + 0.00
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_SN_GRP',0.55,''); -- Da TIMES (RH3BIO005 + RH3WPL005): 0.50 + 0.05
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'RES_ELC','RES_WH_GRP',0.25,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'RES_ELC','RES_WH_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_ELC','RES_WH_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'RES_ELC','RES_CK_GRP',0.24,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2030,'RES_ELC','RES_CK_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_ELC','RES_CK_GRP',0.20,'');

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
-- Residential sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_DST','RES_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_DST','RES_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_DST','RES_FT_DST_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_DST','RES_FT_DST_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_KER','RES_FT_KER_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_KER','RES_FT_KER_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_KER','RES_FT_KER_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_KER','RES_FT_KER_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','RES_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','RES_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','RES_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','RES_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','RES_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','RES_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','RES_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','RES_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','RES_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','RES_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','RES_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','RES_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','RES_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','RES_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_SO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_SO_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_SO_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_SO','RES_SH_SO_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'RES_PH_SO','RES_SH_SO_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_SO','RES_SH_SO_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_MO_GRP',0.66,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_MO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_MO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_MO','RES_SH_MO_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'RES_PH_MO','RES_SH_MO_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_MO','RES_SH_MO_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_SN_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_SN_GRP',0.90,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_SN_GRP',0.90,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_SN','RES_SH_SN_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'RES_PH_SN','RES_SH_SN_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_SN','RES_SH_SN_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_WH_GRP',0.50,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_NGA','RES_WH_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_WH_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_BIO','RES_CK_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_BIO','RES_CK_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_LPG','RES_CK_GRP',0.30,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_LPG','RES_CK_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_LPG','RES_CK_GRP',0.13,'');
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
-- Residential sector
-- Base year technologies
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SO_E',3.89E+02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SO_E',5.94E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SO_E',6.84E+01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SO_E',2.25E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SO_E',4.18E-02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SO_E',1.35E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SO_E',2.56E+01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SO_E',4.00E+01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SO_E',1.56E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_ELC_SO_E',6.60E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_E',3.21E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SO_E',3.12E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_NGA_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_AHP_NGA_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_DST_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_HFO_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_KER_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_COA_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_LPG_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_WST_BIO_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HT_ELC_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_ELC_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HEX_HET_SO_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_GEO_SO_E',3.12E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MO_E',2.00E+01*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MO_E',3.06E-01*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_MO_E',3.52E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_MO_E',1.54E-01*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_MO_E',2.15E-03*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_MO_E',6.95E-03*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_MO_E',1.39E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_MO_E',2.06E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_MO_E',8.02E-02*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_MO_E',3.39E-02*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_E',1.65E-01*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_MO_E',1.61E-02*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_NGA_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_NGA_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_DST_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_HFO_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_KER_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_COA_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_LPG_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_WST_BIO_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HT_ELC_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_AHP_ELC_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HEX_HET_MO_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_GEO_MO_E',1.61E-02*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SN_E',4.36E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SN_E',6.65E-02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SN_E',8.49E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SN_E',4.19E-02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SN_E',4.66E-04*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SN_E',1.51E-03*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SN_E',3.01E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SN_E',4.47E-01*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SN_E',1.74E-02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_SN_E',7.37E-03*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_E',3.58E-02*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SN_E',3.49E-03*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_NGA_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_AHP_NGA_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_DST_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_HFO_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_KER_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_COA_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_LPG_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_WST_BIO_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HT_ELC_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_AHP_ELC_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HEX_HET_SN_E',0.00E+00*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_GEO_SN_E',3.49E-03*3.1949,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MN_E',4.36E-01*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MN_E',6.65E-03*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_NGA_MN_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_HP_NGA_MN_E',0.00E+00*3.0303,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_CEN_E',1.66E+01*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_EHP_E',1.51E+00*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_ROOM_E',1.30E+01*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_CEN_E',0.00E+00*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_EHP_E',0.00E+00*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_ROOM_E',0.00E+00*8.5705,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_NGA_E',3.135E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_HFO_E',1.505E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_DST_E',4.114E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_LPG_E',2.904E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_BIO_E',4.586E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_ELC_E',2.271E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_HET_E',6.348E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_WH_SOL_E',1.122E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_HFO_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_DST_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_BIO_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_HET_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_WH_SOL_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_RF_RFG_ELC_E',6.469E+00,'Gl','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_RF_FRZ_ELC_E',1.651E+00,'Gl','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_RF_RFG_ELC_E',0.000E+00,'Gl','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_RF_FRZ_ELC_E',0.000E+00,'Gl','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CW_ELC_E',5.419E+00,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_CW_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CD_ELC_E',7.459E-02,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_CD_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_DW_ELC_E',2.496E+00,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_DW_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CK_NGA_E',9.645E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CK_LPG_E',4.037E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CK_ELC_E',7.898E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_CK_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_CK_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_CK_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_OE_EQP_E',47.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2010,'RES_OE_EQP_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_LFL_E',8.54E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SFL_E',8.86E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_LHAL_E',2.36E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SHAL_IMP_E',3.60E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SHAL_E',4.99E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_MIN_E',7.21E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SIN_E',6.10E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_LFL_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SFL_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_LHAL_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SHAL_IMP_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SHAL_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_MIN_E',0.00E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SIN_E',0.00E+00,'Glm','');

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
-- Residential sector
-- New technologies
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_SO_N',94.90,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_SO_N',45.39,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_SO_N',33.01,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_SO_N',16.50,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_MO_N',15.84,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_MO_N',40.49,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_MO_N',15.84,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_MO_N',14.08,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_SN_N',73.96,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_SN_N',35.37,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_SN_N',25.73,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_SN_N',12.86,'PJ','');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_NGA_E',6.96E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_DST_E',1.28E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HFO_E',6.25E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_KER_E',7.55E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_COA_E',2.85E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_LPG_E',5.83E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_BIO_E',1.90E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_E',9.50E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_SOL_E',1.43E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HET_E',1.42E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_KER_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_COA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_GEO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_FT_SOL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_NGA_N',1.67E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_DST_N',3.00E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HFO_N',1.50E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_KER_N',1.80E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_COA_N',7.00E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_LPG_N',1.40E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_BIO_N',4.30E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_1_N',0.23E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_2_N',0.11E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_3_N',0.11E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HET_N',3.76E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_NGA_N',7.351E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_DST_N',1.351E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_HFO_N',6.59E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_KER_N',7.97E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_COA_N',3.01E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_LPG_N',6.16E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_FT_BIO_N',6.02E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_BIO_N',2.005E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_1_N',1.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_2_N',0.50E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_3_N',0.50E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_FT_HET_N',5.26E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_HET_N',5.79E+01,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SO_E',2.23E+03*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SO_E',3.41E+01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SO_E',4.36E+02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SO_E',2.15E+01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SO_E',2.39E-01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SO_E',7.75E-01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SO_E',1.54E+02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SO_E',2.29E+02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SO_E',8.94E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_ELC_SO_E',3.78E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_E',1.84E+01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SO_E',1.79E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_AHP_NGA_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_DST_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_HFO_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_KER_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_COA_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_WST_BIO_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HT_ELC_SO_E',3.50E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_ELC_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HEX_HET_SO_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_GEO_SO_E',1.93E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MO_E',1.19E+02*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MO_E',1.81E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_MO_E',2.32E+01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_MO_E',1.14E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_MO_E',1.27E-02*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_MO_E',4.12E-02*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_MO_E',8.21E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_MO_E',1.22E+01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_MO_E',4.75E-01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_MO_E',2.01E-01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_E',9.78E-01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_MO_E',9.52E-02*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_NGA_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_DST_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_HFO_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_KER_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_COA_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_WST_BIO_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HT_ELC_MO_E',1.50E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_AHP_ELC_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HEX_HET_MO_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_GEO_MO_E',1.02E-01*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SN_E',2.50E+01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SN_E',3.81E-01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SN_E',4.87E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SN_E',2.40E-01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SN_E',2.67E-03*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SN_E',8.66E-03*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SN_E',1.72E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SN_E',2.56E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SN_E',9.98E-02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_SN_E',4.23E-02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_E',2.05E-01*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SN_E',2.00E-02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_AHP_NGA_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_DST_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_HFO_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_KER_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_COA_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_WST_BIO_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HT_ELC_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_AHP_ELC_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HEX_HET_SN_E',0.00E+00*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_GEO_SN_E',2.15E-02*0.18*3.1949,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MN_E',2.50E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MN_E',3.81E-02*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_MN_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_HP_NGA_MN_E',0.00E+00*0.18*3.0303,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_CEN_E',1.35E+02*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_EHP_E',1.22E+01*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_ROOM_E',1.06E+02*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_CEN_E',0.00E+00*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_EHP_E',0.00E+00*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_ROOM_E',0.00E+00*0.18*8.5707,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_NGA_E',0.91*3.483E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_HFO_E',0.91*1.672E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_DST_E',0.91*4.571E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_LPG_E',0.91*3.227E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_BIO_E',0.91*5.096E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_ELC_E',0.91*2.523E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_HET_E',0.91*7.053E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_WH_SOL_E',0.91*1.247E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_HFO_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_WH_DST_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_BIO_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_HET_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_WH_SOL_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_RF_RFG_ELC_E',0.91*7.187E+00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_RF_FRZ_ELC_E',0.91*1.834E+00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_RF_RFG_ELC_E',0.000E+00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_RF_FRZ_ELC_E',0.000E+00,'Gl','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CW_ELC_E',0.91*6.021E+00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CW_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CD_ELC_E',0.91*8.288E-02,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CD_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_DW_ELC_E',0.91*2.773E+00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_DW_ELC_E',0.000E+00,'Glav','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CK_NGA_E',0.91*1.072E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CK_LPG_E',0.91*4.486E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CK_ELC_E',0.91*8.776E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_OE_EQP_E',6.850E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'RES_OE_EQP_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_LFL_E',8.81E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SFL_E',9.14E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_LHAL_E',2.43E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SHAL_IMP_E',3.72E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SHAL_E',5.15E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_MIN_E',7.44E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SIN_E',6.29E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_LFL_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SFL_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_LHAL_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SHAL_IMP_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SHAL_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_MIN_E',0.00E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SIN_E',0.00E+00,'Glm','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Residential sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_HFO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_KER_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_COA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_BIO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_GEO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_SOL_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_DST_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_HFO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_KER_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_COA_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_LPG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_SOL_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_GEO_1_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_GEO_2_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_GEO_3_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_FT_HET_N',100,'');
-- Base year
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_NGA_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_NGA_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_DST_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_HFO_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_KER_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_COA_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_LPG_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HT_ELC_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_ELC_SO_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_SO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_GEO_SO_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_NGA_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_NGA_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_DST_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_HFO_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_KER_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_COA_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_LPG_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HT_ELC_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_MO_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_MO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_GEO_MO_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_NGA_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_NGA_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_DST_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_HFO_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_KER_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_COA_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_LPG_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HT_ELC_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_SN_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_SN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_GEO_SN_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BUR_NGA_MN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_NGA_MN_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_CEN_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_EHP_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_ROOM_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_HFO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_BIO_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_HET_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_SOL_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CD_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_ELC_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_NGA_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_LPG_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_OE_EQP_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_LFL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SFL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_LHAL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SHAL_IMP_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SHAL_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_MIN_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SIN_E',10,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_CLB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_CLA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_CLA+_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_CLA++_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_2010_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_RFG_2020_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_CLB_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_CLA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_CLA++_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_2010_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_RF_FRZ_2020_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_DST_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_NGA_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_LPG_COND_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_WPL_BIO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_ELC_RES_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_AHP_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_HNS_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_WH_PDC_ACS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_ELC_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_2010_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CW_2020_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CD_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CD_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CD_ELC_NEW_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_ELC_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_ELC_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_ELC_ADV_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_2010_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_DW_2020_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_NGA_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_COA_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_LPG_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_ELC_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CK_BIO_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_BFL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SFL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_EFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_LFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SFL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_LHAL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SHAL_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SHAL_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_MIN_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_SIN_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_KER_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_LG_LED_ELC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_COND_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_COND_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_COND_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_SO_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WPL_BIO_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HNS_ELC_SO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPP_ELC_SO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_HET_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPTS_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_DST_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_LPG_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_NGA_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_ROOF_INS_SO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_INT_INS_SO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BASE_INS_SO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WIN_INS_SO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_COND_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_COND_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_COND_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_MO_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WPL_BIO_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HNS_ELC_MO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPP_ELC_MO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_HET_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPTS_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_DST_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_LPG_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_NGA_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_ROOF_INS_MO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_INT_INS_MO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BASE_INS_MO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WIN_INS_MO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_COND_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_COND_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_COND_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_SN_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WPL_BIO_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HNS_ELC_SN_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPP_ELC_SN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_HET_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPTS_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPTS_GEO_SN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_DST_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_LPG_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_SOL_NGA_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_ROOF_INS_SN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_INT_INS_SN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_BASE_INS_SN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WIN_INS_SN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_DST_COND_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_NGA_COND_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_LPG_COND_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WST_BIO_MN_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_WPL_BIO_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_AHP_ELC_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HNS_ELC_MN_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HPP_ELC_MN_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HEX_HET_MN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_AHP_ELC_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_CEN_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_ROOM_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_GEO_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_GEO_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_CEN_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_AHP_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SC_HP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_MISC_EQP_N',10,'');
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_STR_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_H2_PEMFC_N',20,'');

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
-- Residential sector
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2022,20,'');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_NGA_E',2006,7.351E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_DST_E',2006,1.351E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_HFO_E',2006,6.592E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_KER_E',2006,7.972E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_COA_E',2006,3.012E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_LPG_E',2006,8.784E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_BIO_E',2006,2.005E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_GEO_E',2006,0.100E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_SOL_E',2006,1.509E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_HET_E',2006,1.503E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_ELC_E',2006,3.000E+02,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_SO_E',2006,2.40E+03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_NGA_SO_E',2006,3.67E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_SO_E',2006,4.69E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_SO_E',2006,2.31E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_SO_E',2006,2.58E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_SO_E',2006,8.35E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_SO_E',2006,1.66E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_SO_E',2006,2.47E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_SO_E',2006,9.62E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_ELC_SO_E',2006,4.07E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_SO_E',2006,1.98E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_SO_E',2006,1.93E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_MO_E',2006,1.28E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_NGA_MO_E',2006,1.95E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_MO_E',2006,2.50E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_MO_E',2006,1.23E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_MO_E',2006,1.37E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_MO_E',2006,4.44E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_MO_E',2006,8.84E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_MO_E',2006,1.31E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_MO_E',2006,5.12E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_ELC_MO_E',2006,2.17E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_MO_E',2006,1.05E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_MO_E',2006,1.02E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_SN_E',2006,2.69E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_NGA_SN_E',2006,4.10E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_SN_E',2006,5.24E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_SN_E',2006,2.58E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_SN_E',2006,2.88E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_SN_E',2006,9.32E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_SN_E',2006,1.86E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_SN_E',2006,2.76E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_SN_E',2006,1.08E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_ELC_SN_E',2006,4.55E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_SN_E',2006,2.21E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_SN_E',2006,2.15E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_MN_E',2006,2.69E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_NGA_MN_E',2006,4.10E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_CEN_E',2006,1.45E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_EHP_E',2006,1.32E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_ROOM_E',2006,1.14E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_NGA_E',2006,3.48E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_HFO_E',2006,1.67E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_DST_E',2006,4.57E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_LPG_E',2006,3.23E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_BIO_E',2006,5.10E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_ELC_E',2006,2.52E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_HET_E',2006,7.05E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_WH_SOL_E',2006,1.25E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_RF_TECH',2006,9.01E+00,'Gl','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_RF_RFG_ELC_E',2006,7.19E+00,'Gl','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_RF_FRZ_ELC_E',2006,1.83E+00,'Gl','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_CW_ELC_E',2006,6.02E+00,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_CD_ELC_E',2006,8.29E-02,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_DW_ELC_E',2006,2.77E+00,'Glav','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_CK_NGA_E',2006,1.07E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_CK_LPG_E',2006,6.40E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_CK_ELC_E',2006,8.78E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_OE_EQP_E',2006,6.85E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_LFL_E',2006,9.49E+01,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SFL_E',2006,9.84E+01,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_LHAL_E',2006,2.62E+00,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SHAL_IMP_E',2006,4.01E+00,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SHAL_E',2006,5.55E+00,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_MIN_E',2006,8.01E+01,'Glm','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SIN_E',2006,6.78E+01,'Glm','');

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
-- Residential sector
INSERT INTO "EmissionActivity" VALUES ('IT','RES_CO2','BIO_METH','RES_FT_NGA_N',2007,'RES_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','RES_CO2','H2_BL','RES_FT_NGA_N',2020,'RES_NGA',-56.10,'[kt/PJ]','');

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
-- Residential sector
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CO2',74.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CO2',77.37,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_CO2',71.87,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_CO2',98.27,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CO2',63.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CO2',0.0001,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CH4',1.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CH4',1.32,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CH4',0.72,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_CH4',5.53,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_CH4',0.54,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CH4',5.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CH4',300.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_N2O',1.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_N2O',3.36,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_N2O',3.11,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_N2O',6.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_N2O',1.81,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_N2O',0.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_N2O',4.00,'[kt/PJ]','');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','RES_FT_NGA_E',2006,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_COG','RES_FT_NGA_E',2006,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','RES_FT_DST_E',2006,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','RES_FT_DST_E',2006,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','RES_FT_HFO_E',2006,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','RES_FT_KER_E',2006,'RES_KER',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','RES_FT_COA_E',2006,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_OVC','RES_FT_COA_E',2006,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','RES_FT_LPG_E',2006,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','RES_FT_BIO_E',2006,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_GAS','RES_FT_BIO_E',2006,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SOL','RES_FT_SOL_E',2006,'RES_SOL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','RES_FT_GEO_E',2006,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','RES_FT_ELC_E',2006,'RES_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','RES_FT_ELC_E',2006,'RES_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','RES_FT_ELC_E',2050,'RES_ELC',0.95,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','RES_FT_ELC_E',2050,'RES_ELC',0.95,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','RES_FT_HET_E',2006,'RES_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_COG','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','RES_FT_NGA_N',2020,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','RES_FT_DST_N',2007,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','RES_FT_DST_N',2007,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','RES_FT_HFO_N',2007,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','RES_FT_KER_N',2007,'RES_KER',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_KER','RES_FT_KER_N',2007,'RES_KER',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','RES_FT_COA_N',2007,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_OVC','RES_FT_COA_N',2007,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','RES_FT_LPG_N',2007,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','RES_FT_BIO_N',2007,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_GAS','RES_FT_BIO_N',2007,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SOL','RES_FT_SOL_N',2007,'RES_SOL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','RES_FT_GEO_1_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','RES_FT_GEO_2_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','RES_FT_GEO_3_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','RES_FT_HET_N',2007,'RES_HET',1.0,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_SO_E',2006,'RES_SH_SO',0.73*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_AHP_NGA_SO_E',2006,'RES_SH_SO',1.10*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_SO_E',2006,'RES_SH_SO',0.73*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_SO_E',2006,'RES_SH_SO',0.73*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_SO_E',2006,'RES_SH_SO',0.06*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_SO_E',2006,'RES_SH_SO',0.55*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_SO_E',2006,'RES_SH_SO',0.68*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_E',2006,'RES_SH_SO',0.25*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_SO_E',2006,'RES_SH_SO',0.90*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HP_ELC_SO_E',2006,'RES_SH_SO',2.00*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SO_E',2006,'RES_SH_SO',0.90*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_SO_E',2006,'RES_SH_SO',3.80*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_MO_E',2006,'RES_SH_MO',0.73*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_HP_NGA_MO_E',2006,'RES_SH_MO',1.10*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_MO_E',2006,'RES_SH_MO',0.73*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_MO_E',2006,'RES_SH_MO',0.73*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_MO_E',2006,'RES_SH_MO',0.06*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_MO_E',2006,'RES_SH_MO',0.55*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_MO_E',2006,'RES_SH_MO',0.68*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MO_E',2006,'RES_SH_MO',0.25*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_MO_E',2006,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_E',2006,'RES_SH_MO',2.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MO_E',2006,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_MO_E',2006,'RES_SH_MO',3.80*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_SN_E',2006,'RES_SH_SN',0.76*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_AHP_NGA_SN_E',2006,'RES_SH_SN',1.16*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_SN_E',2006,'RES_SH_SN',0.76*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_SN_E',2006,'RES_SH_SN',0.76*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_SN_E',2006,'RES_SH_SN',0.07*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_SN_E',2006,'RES_SH_SN',0.57*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_SN_E',2006,'RES_SH_SN',0.72*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SN_E',2006,'RES_SH_SN',0.26*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_SN_E',2006,'RES_SH_SN',0.95*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_E',2006,'RES_SH_SN',2.10*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SN_E',2006,'RES_SH_SN',0.95*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_SN_E',2006,'RES_SH_SN',3.99*3.1945,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_MN_E',2006,'RES_SH_MN',0.76*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_HP_NGA_MN_E',2006,'RES_SH_MN',1.16*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_CEN_E',2006,'RES_SC',2.40*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_EHP_E',2006,'RES_SC',2.80*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_E',2006,'RES_SC',2.40*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_E',2006,'RES_WH',0.650,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_WH_HFO_E',2006,'RES_WH',0.580,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_E',2006,'RES_WH',0.580,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_E',2006,'RES_WH',0.540,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_WH_BIO_E',2006,'RES_WH',0.250,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_ELC_E',2006,'RES_WH',0.900,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_WH_HET_E',2006,'RES_WH',0.850,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_WH_SOL_E',2006,'RES_WH',1.000,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_RF_RFG','RES_RF_TECH',2006,'RES_RF',1.00,'Gl/Gl');
INSERT INTO "Efficiency" VALUES ('IT','RES_RF_FRZ','RES_RF_TECH',2006,'RES_RF',1.00,'Gl/Gl');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_ELC_E',2006,'RES_RF_RFG',0.210,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_ELC_E',2006,'RES_RF_FRZ',0.190,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_ELC_E',2006,'RES_CW',0.260,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CD_ELC_E',2006,'RES_CD',0.068,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_ELC_E',2006,'RES_DW',0.175,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_CK_NGA_E',2006,'RES_CK',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_CK_LPG_E',2006,'RES_CK',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CK_ELC_E',2006,'RES_CK',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_OE_EQP_E',2006,'RES_OE',1.000,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LFL_E',2006,'RES_LG',38.617,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SFL_E',2006,'RES_LG',31.157,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LHAL_E',2006,'RES_LG',7.460,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_IMP_E',2006,'RES_LG',11.410,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_E',2006,'RES_LG',7.899,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_MIN_E',2006,'RES_LG',5.705,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SIN_E',2006,'RES_LG',4.827,'Glm/PJ');
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_CLB_N',2007,'RES_RF_RFG',2.200E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_CLA_N',2007,'RES_RF_RFG',2.778E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_CLA+_N',2007,'RES_RF_RFG',3.968E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_CLA++_N',2007,'RES_RF_RFG',4.630E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_2010_N',2010,'RES_RF_RFG',5.556E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_RFG_2020_N',2020,'RES_RF_RFG',6.944E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_CLB_N',2007,'RES_RF_FRZ',1.984E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_CLA_N',2007,'RES_RF_FRZ',2.778E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_CLA++_N',2007,'RES_RF_FRZ',4.630E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_2010_N',2010,'RES_RF_FRZ',5.556E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_RF_FRZ_2020_N',2020,'RES_RF_FRZ',6.944E-01,'Gl/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_N',2007,'RES_WH',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_N',2020,'RES_WH',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_N',2050,'RES_WH',0.98,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_COND_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_COND_N',2020,'RES_WH',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_WH_DST_COND_N',2050,'RES_WH',1.09,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_N',2007,'RES_WH',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_N',2020,'RES_WH',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_N',2050,'RES_WH',0.98,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_COND_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_COND_N',2020,'RES_WH',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_WH_NGA_COND_N',2050,'RES_WH',1.09,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_N',2007,'RES_WH',0.80,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_N',2020,'RES_WH',0.84,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_N',2050,'RES_WH',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_COND_N',2007,'RES_WH',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_COND_N',2020,'RES_WH',0.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_WH_LPG_COND_N',2050,'RES_WH',0.74,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_WH_WPL_BIO_N',2007,'RES_WH',0.75,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_WH_WPL_BIO_N',2020,'RES_WH',0.78,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_WH_WPL_BIO_N',2050,'RES_WH',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_ELC_RES_N',2007,'RES_WH',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_AHP_ELC_N',2007,'RES_WH',3.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_AHP_ELC_N',2020,'RES_WH',3.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_AHP_ELC_N',2050,'RES_WH',3.19,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_HNS_ELC_N',2007,'RES_WH',3.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_HNS_ELC_N',2020,'RES_WH',4.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_WH_HNS_ELC_N',2050,'RES_WH',4.18,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_WH_SOL_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PW_SO','RES_WH_PDC_ACS_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PW_MO','RES_WH_PDC_ACS_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PW_SN','RES_WH_PDC_ACS_N',2007,'RES_WH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_ELC_N',2007,'RES_CW',3.100E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_ELC_IMP_N',2007,'RES_CW',4.000E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_ELC_ADV_N',2007,'RES_CW',4.600E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_2010_ELC_N',2010,'RES_CW',5.100E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CW_2020_ELC_N',2020,'RES_CW',6.200E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CD_ELC_N',2007,'RES_CD',6.800E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CD_ELC_ADV_N',2010,'RES_CD',6.944E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CD_ELC_NEW_N',2020,'RES_CD',7.937E-02,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_ELC_STD_N',2007,'RES_DW',2.100E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_ELC_IMP_N',2007,'RES_DW',2.671E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_ELC_ADV_N',2007,'RES_DW',3.086E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_2010_ELC_N',2010,'RES_DW',3.268E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_DW_2020_ELC_N',2020,'RES_DW',3.704E-01,'Glav/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_CK_NGA_N',2007,'RES_CK',5.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_CK_COA_N',2007,'RES_CK',1.500E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_CK_LPG_N',2007,'RES_CK',5.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_CK_ELC_N',2007,'RES_CK',8.000E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_CK_BIO_N',2007,'RES_CK',1.500E-01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_BFL_IMP_N',2007,'RES_LG',3.460E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SFL_IMP_N',2007,'RES_LG',2.437E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_EFL_N',2007,'RES_LG',3.899E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LFL_N',2007,'RES_LG',4.288E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SFL_N',2007,'RES_LG',3.460E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LHAL_N',2007,'RES_LG',8.285E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_IMP_N',2007,'RES_LG',1.267E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_N',2007,'RES_LG',8.772E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_MIN_N',2007,'RES_LG',6.335E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SIN_N',2007,'RES_LG',5.361E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_LG_KER_N',2007,'RES_LG',3.655E+00,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LED_ELC_N',2007,'RES_LG',1.511E+01,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_MISC_EQP_N',2007,'RES_OE',1.000E+0,'PJ/PJ');
-- Space heating single-famili old
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_SO_N',2007,'RES_SH_SO',0.81*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_SO_N',2007,'RES_SH_SO',0.81*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_SO_N',2007,'RES_SH_SO',0.78*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_SO_N',2007,'RES_SH_SO',0.78*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',0.85*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',0.85*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',0.92*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',0.92*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_SO_N',2007,'RES_SH_SO',0.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_SO_N',2007,'RES_SH_SO',0.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_SO_N',2020,'RES_SH_SO',0.81*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_SO_N',2020,'RES_SH_SO',0.81*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',0.85*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',0.85*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2020,'RES_SH_SO',0.35*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2020,'RES_SH_SO',0.35*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2050,'RES_SH_SO',0.45*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2050,'RES_SH_SO',0.45*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',0.76*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',0.76*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',0.79*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',0.79*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',0.83*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',0.83*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',3.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',3.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',4.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',4.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',4.71*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',4.71*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',4.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',4.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',5.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',5.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PH_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PC_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PW_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PH_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PC_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PW_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PH_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PC_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PW_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_SO','RES_SH_HP_HET_SO_N',2007,'RES_SH_SO',1.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating multi-family old
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_MO_N',2007,'RES_SH_MO',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_MO_N',2007,'RES_SH_MO',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MO_N',2007,'RES_SH_MO',0.78*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_MO_N',2007,'RES_SH_MO',0.78*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',0.85*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',0.85*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_MO_N',2007,'RES_SH_MO',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_MO_N',2007,'RES_SH_MO',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.30*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.30*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MO_N',2020,'RES_SH_MO',0.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WST_BIO_MO_N',2020,'RES_SH_MO',0.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',0.76*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',0.76*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',0.79*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',0.79*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',0.83*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',0.83*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',3.30*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',3.30*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',4.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',4.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',4.71*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',4.71*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',4.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',4.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',5.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',5.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',4.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',4.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',5.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',5.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PH_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PC_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PW_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PH_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PC_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PW_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PH_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PC_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PW_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_MO','RES_SH_HP_HET_MO_N',2007,'RES_SH_MO',1.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',0.82*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',0.86*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating single-family new
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',0.94*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',0.98*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SN_N',2020,'RES_SH_SN',0.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WST_BIO_SN_N',2020,'RES_SH_SN',0.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',0.76*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',0.76*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',0.79*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',0.79*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',0.83*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',0.83*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',3.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',3.30*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',4.71*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',4.71*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',4.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',5.50*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',5.75*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PH_SN',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PC_SN',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2007,'RES_PW_SN',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PH_SN',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PC_SN',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2020,'RES_PW_SN',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PH_SN',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PC_SN',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SN_N',2050,'RES_PW_SN',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PH_SN',3.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PC_SN',3.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_GEO_SN_N',2007,'RES_PW_SN',3.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_SN','RES_SH_HP_HET_SN_N',2007,'RES_SH_SN',1.00*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',0.82*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',0.86*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',0.90*3.1949,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating multi-family new
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_MN_N',2007,'RES_SH_MN',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2007,'RES_SH_MN',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2020,'RES_SH_MN',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2050,'RES_SH_MN',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MN_N',2007,'RES_SH_MN',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2007,'RES_SH_MN',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2020,'RES_SH_MN',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2050,'RES_SH_MN',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_MN_N',2007,'RES_SH_MN',0.81*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2007,'RES_SH_MN',0.90*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2020,'RES_SH_MN',0.94*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2050,'RES_SH_MN',0.98*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MN_N',2007,'RES_SH_MN',1.00*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2007,'RES_SH_MN',0.76*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2020,'RES_SH_MN',0.79*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2050,'RES_SH_MN',0.83*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2007,'RES_SH_MN',3.30*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2020,'RES_SH_MN',4.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2050,'RES_SH_MN',4.71*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2007,'RES_SH_MN',4.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2020,'RES_SH_MN',5.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2050,'RES_SH_MN',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2007,'RES_SH_MN',4.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2020,'RES_SH_MN',5.50*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2050,'RES_SH_MN',5.75*3.0303,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MN_N',2007,'RES_SH_MN',0.90*3.0303,'Mm2/PJ');
-- Space cooling
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',3.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',3.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',3.52*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',3.52*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_CEN_N',2007,'RES_SC',2.93*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_CEN_N',2007,'RES_SC',2.93*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_N',2007,'RES_SC',3.43*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_ROOM_N',2007,'RES_SC',3.43*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',4.31*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',4.31*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_GEO_N',2007,'RES_SC',4.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_GEO_N',2007,'RES_SC',4.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',3.52*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',3.52*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SC_GEO_IMP_N',2007,'RES_SC',4.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_GEO_IMP_N',2007,'RES_SC',4.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',1.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',1.10*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_CEN_NGA_N',2007,'RES_SC',1.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_CEN_NGA_N',2007,'RES_SC',1.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_AHP_NGA_N',2016,'RES_SC',1.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_NGA_N',2016,'RES_SC',1.20*8.5707,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PC_SO','RES_SC_HP_N',2007,'RES_SC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PC_MO','RES_SC_HP_N',2007,'RES_SC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PC_SN','RES_SC_HP_N',2007,'RES_SC',1.00,'PJ/PJ');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'RES_HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'RES_HET',0.432,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'RES_HET',0.520,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'RES_HET',0.510,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'RES_HET',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'RES_HET',0.480,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'RES_HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'ELC_DST',0.16,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'RES_HET',0.64,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.20,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'RES_HET',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'RES_HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'ELC_DST',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'RES_HET',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'RES_HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'RES_HET',0.96,'PJ/PJ');

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
-- Residential sector
INSERT INTO "DiscountRate" VALUES ('IT','RES_FT_NGA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_FT_GEO_1_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_FT_GEO_2_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_FT_GEO_3_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_FT_HET_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_CLB_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_CLA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_CLA+_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_CLA++_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_2010_N',2010,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_RFG_2020_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_FRZ_CLB_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_FRZ_CLA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_FRZ_CLA++_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_FRZ_2010_N',2010,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_RF_FRZ_2020_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_DST_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_DST_COND_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_NGA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_NGA_COND_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_LPG_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_LPG_COND_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_WPL_BIO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_ELC_RES_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_AHP_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_HNS_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_SOL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_WH_PDC_ACS_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CW_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CW_ELC_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CW_ELC_ADV_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CW_2010_ELC_N',2010,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CW_2020_ELC_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CD_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CD_ELC_ADV_N',2010,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CD_ELC_NEW_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_DW_ELC_STD_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_DW_ELC_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_DW_ELC_ADV_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_DW_2010_ELC_N',2010,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_DW_2020_ELC_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CK_NGA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CK_COA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CK_LPG_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CK_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_CK_BIO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_BFL_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_SFL_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_EFL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_LFL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_SFL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_LHAL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_SHAL_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_SHAL_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_MIN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_SIN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_KER_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_LG_LED_ELC_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_COND_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_COND_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_COND_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WST_BIO_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WPL_BIO_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_AHP_ELC_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HNS_ELC_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPP_ELC_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HP_HET_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPTS_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_DST_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_LPG_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_NGA_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_ROOF_INS_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_INT_INS_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_BASE_INS_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WIN_INS_SO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_COND_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_COND_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_COND_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WST_BIO_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WPL_BIO_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_AHP_ELC_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HNS_ELC_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPP_ELC_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HP_HET_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPTS_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_DST_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_ROOF_INS_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_INT_INS_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_BASE_INS_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WIN_INS_MO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_COND_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_COND_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_COND_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WST_BIO_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WPL_BIO_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_AHP_ELC_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HNS_ELC_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPP_ELC_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_SN_N',2020,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_SN_N',2050,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HP_HET_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPTS_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPTS_GEO_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_DST_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_LPG_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_SOL_NGA_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_ROOF_INS_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_INT_INS_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_BASE_INS_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WIN_INS_SN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_DST_COND_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_NGA_COND_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_LPG_COND_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WST_BIO_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_WPL_BIO_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_AHP_ELC_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HNS_ELC_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HPP_ELC_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SH_HEX_HET_MN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_AHP_ELC_STD_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_CEN_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_ROOM_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_GEO_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_GEO_IMP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_CEN_NGA_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_AHP_NGA_N',2016,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_SC_HP_N',2007,0.60,'');
INSERT INTO "DiscountRate" VALUES ('IT','RES_MISC_EQP_N',2007,0.60,'');

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
-- Residential sector
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','RES_SC',0.700,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','RES_SC',0.100,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','RES_SC',0.110,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','RES_SC',0.075,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','RES_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','RES_SC',0.015,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','RES_SH_SO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','RES_SH_SO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','RES_SH_SO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','RES_SH_SO',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','RES_SH_SO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','RES_SH_SO',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','RES_SH_SO',0.520,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','RES_SH_SO',0.068,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','RES_SH_SO',0.052,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','RES_SH_SO',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','RES_SH_SO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','RES_SH_SO',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','RES_SH_MO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','RES_SH_MO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','RES_SH_MO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','RES_SH_MO',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','RES_SH_MO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','RES_SH_MO',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','RES_SH_MO',0.520,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','RES_SH_MO',0.068,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','RES_SH_MO',0.052,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','RES_SH_MO',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','RES_SH_MO',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','RES_SH_MO',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','RES_SH_SN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','RES_SH_SN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','RES_SH_SN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','RES_SH_SN',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','RES_SH_SN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','RES_SH_SN',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','RES_SH_SN',0.520,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','RES_SH_SN',0.068,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','RES_SH_SN',0.052,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','RES_SH_SN',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','RES_SH_SN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','RES_SH_SN',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','RES_SH_MN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','RES_SH_MN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','RES_SH_MN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','RES_SH_MN',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','RES_SH_MN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','RES_SH_MN',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','RES_SH_MN',0.520,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','RES_SH_MN',0.068,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','RES_SH_MN',0.052,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','RES_SH_MN',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','RES_SH_MN',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','RES_SH_MN',0.042,'');

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
INSERT INTO "Driver" VALUES ('IT',2007,'POP',1.003,'');
INSERT INTO "Driver" VALUES ('IT',2008,'POP',1.010,'');
INSERT INTO "Driver" VALUES ('IT',2010,'POP',1.019,'');
INSERT INTO "Driver" VALUES ('IT',2012,'POP',1.023,'');
INSERT INTO "Driver" VALUES ('IT',2014,'POP',1.047,'');
INSERT INTO "Driver" VALUES ('IT',2016,'POP',1.045,'');
INSERT INTO "Driver" VALUES ('IT',2018,'POP',1.042,'');
INSERT INTO "Driver" VALUES ('IT',2020,'POP',1.027,'');
INSERT INTO "Driver" VALUES ('IT',2022,'POP',1.022,'');
INSERT INTO "Driver" VALUES ('IT',2025,'POP',1.029,'');
INSERT INTO "Driver" VALUES ('IT',2030,'POP',1.037,'');
INSERT INTO "Driver" VALUES ('IT',2035,'POP',1.033,'');
INSERT INTO "Driver" VALUES ('IT',2040,'POP',1.030,'');
INSERT INTO "Driver" VALUES ('IT',2045,'POP',1.021,'');
INSERT INTO "Driver" VALUES ('IT',2050,'POP',1.013,'');
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
INSERT INTO "Driver" VALUES ('IT',2035,'DRH3',2.368,'');
INSERT INTO "Driver" VALUES ('IT',2040,'DRH3',2.544,'');
INSERT INTO "Driver" VALUES ('IT',2045,'DRH3',2.748,'');
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
INSERT INTO "Driver" VALUES ('IT',2035,'DRH4',5.787,'');
INSERT INTO "Driver" VALUES ('IT',2040,'DRH4',6.908,'');
INSERT INTO "Driver" VALUES ('IT',2045,'DRH4',8.567,'');
INSERT INTO "Driver" VALUES ('IT',2050,'DRH4',10.225,'');

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Residential sector
INSERT INTO "Allocation" VALUES ('IT','RES_CD','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_CK','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_CW','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_DW','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_LG','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_OE','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_RF','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SC','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SO','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MO','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SN','DRH3','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MN','DRH4','');
INSERT INTO "Allocation" VALUES ('IT','RES_WH','POP','');

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
-- Residential sector
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SC',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SC',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CD',5.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CD',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CD',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_CD',1.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CD',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_CD',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CD',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CW',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CW',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_DW',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_DW',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_DW',0.63,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_DW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_DW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_DW',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_OE',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_OE',0.63,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_OE',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_OE',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_OE',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_SO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_SO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_MO',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_MO',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_SN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_SN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_SN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_SN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_SN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_SN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_SN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_SN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_SN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_SN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_SN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_SH_SN',0.84,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_SN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_SH_SN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_SN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_MN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_MN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_MN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_MN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_MN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_MN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_MN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_MN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_MN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_MN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_MN',0.94,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_SH_MN',0.84,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_MN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_SH_MN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_MN',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_WH',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_WH',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_CK',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_CK',0.15,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_LG',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_LG',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_LG',0.48,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_LG',0.45,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_RF',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_RF',1.20,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'RES_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'RES_RF',0.48,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_RF',0.45,'');

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
-- Residential sector
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CD',8.28E-02,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CK',2.40E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_CK',2.39E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_CK',2.32E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_CK',2.39E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_CK',2.41E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_CK',2.52E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_CK',2.60E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_CK',2.63E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_CK',2.61E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_CK',2.60E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_CK',2.58E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_CK',2.49E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_CK',2.38E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_CK',2.27E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_CK',2.20E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_CK',2.17E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CW',6.015E+00,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_DW',2.770E+00,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_LG',3.53E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_LG',3.59E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_LG',3.66E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_LG',3.78E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_LG',3.96E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_LG',4.13E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_LG',4.20E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_LG',4.28E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_LG',4.34E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_LG',4.40E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_LG',4.46E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_LG',4.52E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_LG',4.56E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_LG',4.60E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_LG',4.65E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_LG',4.69E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_OE',6.843E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_RF',9.013E+00,'Gl','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SC',3.03E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_SC',2.72E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_SC',3.54E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_SC',3.93E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_SC',6.99E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_SC',6.26E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_SC',8.16E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_SC',9.03E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_SC',8.49E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_SC',9.06E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_SC',9.37E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_SC',9.77E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_SC',1.00E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_SC',1.04E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_SC',1.10E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_SC',1.15E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_SO',1.94E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_SH_SO',1.83E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_SH_SO',1.89E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_SH_SO',1.95E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_SH_SO',1.94E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_SH_SO',1.71E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_SH_SO',1.82E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_SH_SO',1.77E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_SH_SO',1.78E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_SH_SO',1.81E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_MO',9.81E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_SH_MO',8.56E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_SH_MO',9.22E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_SH_MO',9.93E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_SH_MO',9.74E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_SH_MO',7.26E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_SH_MO',8.41E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_SH_MO',7.93E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_SH_MO',7.95E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_SH_MO',8.31E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_SN',2.17E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_SH_SN',4.53E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_SH_SN',7.15E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_SH_SN',1.17E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_SH_SN',1.71E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_SH_SN',2.07E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_SH_SN',2.37E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_SH_SN',2.46E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_SH_SN',2.55E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_SH_SN',2.65E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_SH_SN',2.71E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_SH_SN',2.76E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_SH_SN',2.79E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_SH_SN',2.81E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_SH_SN',2.84E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_SH_SN',2.86E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_MN',1.49E+00,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_SH_MN',4.11E+00,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_SH_MN',7.02E+00,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_SH_MN',1.21E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_SH_MN',1.81E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_SH_MN',2.21E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_SH_MN',2.54E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_SH_MN',2.65E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_SH_MN',2.74E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_SH_MN',2.85E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_SH_MN',2.91E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_SH_MN',2.98E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_SH_MN',3.00E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_SH_MN',3.02E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_SH_MN',3.07E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_SH_MN',3.09E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_WH',7.12E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'RES_WH',7.10E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'RES_WH',7.16E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'RES_WH',7.19E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'RES_WH',7.12E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'RES_WH',6.98E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'RES_WH',7.10E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'RES_WH',7.27E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'RES_WH',7.33E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'RES_WH',7.37E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'RES_WH',7.40E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'RES_WH',7.45E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'RES_WH',7.49E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'RES_WH',7.57E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'RES_WH',7.66E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'RES_WH',7.73E+01,'PJ','');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_NGA_N',2007,2.07,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_DST_N',2007,3.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_HFO_N',2007,3.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_KER_N',2007,3.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_COA_N',2007,3.52,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_LPG_N',2007,3.11,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_BIO_N',2007,1.55,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_SOL_N',2007,0.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'RES_FT_ELC_E',2006,15.00,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_CHP_NGA_CI_N',2007,4.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'RES_CHP_NGA_CI_N',2014,3.75,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'RES_CHP_NGA_CI_N',2022,3.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'RES_CHP_NGA_CI_N',2030,2.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N',2007,2.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N',2014,2.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N',2022,1.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N',2030,1.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_CHP_NGA_CC_N',2007,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'RES_CHP_NGA_CC_N',2014,0.44,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'RES_CHP_NGA_CC_N',2022,0.42,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'RES_CHP_NGA_STR_N',2022,5.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'RES_CHP_NGA_STR_N',2030,2.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N',2020,27.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N',2025,22.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'RES_CHP_NGA_SOFC_N',2030,6.94,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N',2020,20.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N',2025,13.89,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N',2030,6.94,'M€/PJ','');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','RES_FT_NGA_N',2007,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_FT_GEO_1_N',2007,1.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_FT_GEO_2_N',2007,1.50E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_FT_GEO_3_N',2007,3.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_FT_HET_N',2007,5.07E+00,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_CLB_N',2007,1600.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_CLA_N',2007,2200.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_CLA+_N',2007,2700.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_CLA++_N',2007,3700.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_2010_N',2010,5000.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_RFG_2020_N',2020,7700.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_FRZ_CLB_N',2007,1100.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_FRZ_CLA_N',2007,1500.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_FRZ_CLA++_N',2007,1900.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_FRZ_2010_N',2010,2568.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_RF_FRZ_2020_N',2020,3954.0,'M€/Gl','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_DST_N',2007,2.42,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_DST_COND_N',2007,3.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_NGA_N',2007,2.06,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_NGA_COND_N',2007,2.82,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_LPG_N',2007,2.26,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_LPG_COND_N',2007,2.89,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_WPL_BIO_N',2007,5.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_ELC_RES_N',2007,1.70,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_AHP_ELC_N',2007,19.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_HNS_ELC_N',2007,20.94,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_SOL_N',2007,29.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_SOL_N',2020,27.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_SOL_N',2050,26.51,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_WH_PDC_ACS_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CW_ELC_N',2007,1.466E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CW_ELC_IMP_N',2007,2.256E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CW_ELC_ADV_N',2007,2.707E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CW_2010_ELC_N',2010,3.158E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CW_2020_ELC_N',2020,3.835E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CD_ELC_N',2007,6.000E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CD_ELC_ADV_N',2010,7.500E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CD_ELC_NEW_N',2020,9.000E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_DW_ELC_STD_N',2007,2.400E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_DW_ELC_IMP_N',2007,2.800E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_DW_ELC_ADV_N',2007,3.400E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_DW_2010_ELC_N',2010,3.900E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_DW_2020_ELC_N',2020,5.300E+03,'M€/Glav','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CK_NGA_N',2007,9.199E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CK_COA_N',2007,6.618E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CK_LPG_N',2007,1.380E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CK_ELC_N',2007,1.840E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CK_BIO_N',2007,6.618E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_BFL_IMP_N',2007,2.378E+01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_SFL_IMP_N',2007,7.930E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_EFL_N',2007,5.074E+01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_LFL_N',2007,3.960E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_SFL_N',2007,1.306E+01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_LHAL_N',2007,1.060E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_SHAL_IMP_N',2007,5.440E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_SHAL_N',2007,1.270E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_MIN_N',2007,4.200E-01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_SIN_N',2007,7.900E-01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_KER_N',2007,1.000E+00,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_LG_LED_ELC_N',2007,6.342E+01,'M€/Glm','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_SO_N',2007,5.87,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_COND_SO_N',2007,8.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_SO_N',2007,4.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_COND_SO_N',2007,6.84,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_SO_N',2007,5.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_COND_SO_N',2007,7.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_SO_N',2007,2.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_SO_N',2020,3.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_SO_N',2050,4.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WPL_BIO_SO_N',2007,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_AHP_ELC_SO_N',2007,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HNS_ELC_SO_N',2007,50.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPP_ELC_SO_N',2007,66.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SO_N',2007,2.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SO_N',2020,2.75,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SO_N',2050,2.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HP_HET_SO_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_SO_N',2007,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SO_N',2007,23.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SO_N',2020,22.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SO_N',2050,21.48,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SO_N',2007,23.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SO_N',2020,21.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SO_N',2050,21.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SO_N',2007,22.49,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SO_N',2020,21.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SO_N',2050,20.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_ROOF_INS_SO_N',2007,481.32,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_INT_INS_SO_N',2007,859.34,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_BASE_INS_SO_N',2007,1493.51,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WIN_INS_SO_N',2007,2767.65,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_MO_N',2007,5.87,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_COND_MO_N',2007,8.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_MO_N',2007,4.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_COND_MO_N',2007,6.84,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_MO_N',2007,5.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_COND_MO_N',2007,7.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_MO_N',2007,2.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WPL_BIO_MO_N',2007,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_AHP_ELC_MO_N',2007,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HNS_ELC_MO_N',2007,50.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPP_ELC_MO_N',2007,66.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MO_N',2007,2.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MO_N',2020,2.75,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MO_N',2050,2.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HP_HET_MO_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_MO_N',2007,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_MO_N',2007,23.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_MO_N',2020,22.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_MO_N',2050,21.48,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2007,23.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2020,21.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2050,21.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2007,22.49,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2020,21.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2050,20.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_ROOF_INS_MO_N',2007,377.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_INT_INS_MO_N',2007,406.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_BASE_INS_MO_N',2007,431.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WIN_INS_MO_N',2007,923.76,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_COND_SN_N',2007,8.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_COND_SN_N',2007,6.84,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_COND_SN_N',2007,7.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_SN_N',2007,2.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WPL_BIO_SN_N',2007,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_AHP_ELC_SN_N',2007,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HNS_ELC_SN_N',2007,50.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPP_ELC_SN_N',2007,66.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SN_N',2007,2.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SN_N',2020,2.75,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_SN_N',2050,2.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HP_HET_SN_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_SN_N',2007,43.24,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_SN_N',2020,41.18,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_SN_N',2050,39.22,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPTS_GEO_SN_N',2007,60.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SN_N',2007,23.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SN_N',2020,22.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_DST_SN_N',2050,21.48,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SN_N',2007,23.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SN_N',2020,21.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_LPG_SN_N',2050,21.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SN_N',2007,22.49,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SN_N',2020,21.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_SOL_NGA_SN_N',2050,20.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_ROOF_INS_SN_N',2007,262.64,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_INT_INS_SN_N',2007,264.20,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_BASE_INS_SN_N',2007,559.32,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WIN_INS_SN_N',2007,1953.37,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_MN_N',2007,5.87,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_DST_COND_MN_N',2007,8.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_MN_N',2007,4.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_NGA_COND_MN_N',2007,6.84,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_MN_N',2007,5.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_LPG_COND_MN_N',2007,7.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WST_BIO_MN_N',2007,2.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_WPL_BIO_MN_N',2007,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_AHP_ELC_MN_N',2007,43.24,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HNS_ELC_MN_N',2007,50.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HPP_ELC_MN_N',2007,66.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MN_N',2007,2.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MN_N',2020,2.75,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SH_HEX_HET_MN_N',2050,2.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_AHP_ELC_STD_N',2007,31.55,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',2007,40.39,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_CEN_N',2007,48.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_ROOM_N',2007,47.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',2007,50.49,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_GEO_N',2007,60.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',2007,57.52,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_GEO_IMP_N',2007,91.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',2007,40.39,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_CEN_NGA_N',2007,54.53,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_AHP_NGA_N',2016,60.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_SC_HP_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','RES_MISC_EQP_N',2007,1.26,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2007,1100,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2014,1050,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2022,980,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2030,900,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2014,1350,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2022,1160,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2030,1000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2007,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2014,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2022,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_STR_N',2022,2180,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_STR_N',2030,2100,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2020,10000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2025,8000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2030,3500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2020,6000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2025,5000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2030,4000,'M€/GW','');

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
-- Residential sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_NGA_N',2007,4.10,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_DST_N',2007,6.15,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_HFO_N',2007,6.15,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_KER_N',2007,6.15,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_COA_N',2007,6.97,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_LPG_N',2007,6.15,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_BIO_N',2007,3.08,'M€/PJ','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_RFG_CLB_N',2007,20.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_RFG_CLA_N',2007,20.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_RFG_CLA+_N',2007,30.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_RFG_CLA++_N',2007,40.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'RES_RF_RFG_2010_N',2010,50.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'RES_RF_RFG_2020_N',2020,80.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_FRZ_CLB_N',2007,10.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_FRZ_CLA_N',2007,10.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_RF_FRZ_CLA++_N',2007,20.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'RES_RF_FRZ_2010_N',2010,25.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'RES_RF_FRZ_2020_N',2020,40.0,'M€/Gl','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_DST_N',2007,0.024,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_DST_COND_N',2007,0.036,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_NGA_N',2007,0.021,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_NGA_COND_N',2007,0.028,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_LPG_N',2007,0.023,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_LPG_COND_N',2007,0.029,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_WPL_BIO_N',2007,0.050,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_ELC_RES_N',2007,0.034,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_AHP_ELC_N',2007,0.196,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_HNS_ELC_N',2007,0.209,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_WH_SOL_N',2007,0.010,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CW_ELC_N',2007,10,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CW_ELC_IMP_N',2007,20,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CW_ELC_ADV_N',2007,20,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'RES_CW_2010_ELC_N',2010,30,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'RES_CW_2020_ELC_N',2020,30,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CD_ELC_N',2007,20,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'RES_CD_ELC_ADV_N',2010,30,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'RES_CD_ELC_NEW_N',2020,40,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_DW_ELC_STD_N',2007,20,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_DW_ELC_IMP_N',2007,30,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_DW_ELC_ADV_N',2007,30,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'RES_DW_2010_ELC_N',2010,40,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'RES_DW_2020_ELC_N',2020,50,'M€/Glav','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CK_NGA_N',2007,2.300E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CK_COA_N',2007,9.927E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CK_LPG_N',2007,3.449E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CK_ELC_N',2007,4.599E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_CK_BIO_N',2007,4.963E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_LHAL_N',2007,4.200E-01,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_SHAL_IMP_N',2007,8.200E-01,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_SHAL_N',2007,5.100E-01,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_MIN_N',2007,3.800E-01,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_SIN_N',2007,7.100E-01,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_LG_KER_N',2007,4.000E+00,'M€/Glm','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_SO_N',2007,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_COND_SO_N',2007,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_SO_N',2007,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_COND_SO_N',2007,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_SO_N',2007,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_COND_SO_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WST_BIO_SO_N',2007,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WPL_BIO_SO_N',2007,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_AHP_ELC_SO_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HNS_ELC_SO_N',2007,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPP_ELC_SO_N',2007,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_N',2007,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HP_HET_SO_N',2007,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPTS_SO_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_DST_SO_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_LPG_SO_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_NGA_SO_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_MO_N',2007,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_COND_MO_N',2007,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_MO_N',2007,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_COND_MO_N',2007,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_MO_N',2007,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_COND_MO_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WST_BIO_MO_N',2007,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WPL_BIO_MO_N',2007,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_AHP_ELC_MO_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HNS_ELC_MO_N',2007,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPP_ELC_MO_N',2007,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_N',2007,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HP_HET_MO_N',2007,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPTS_MO_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_DST_MO_N' ,2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_LPG_MO_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_NGA_MO_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_COND_SN_N',2007,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_COND_SN_N',2007,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_COND_SN_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WST_BIO_SN_N',2007,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WPL_BIO_SN_N',2007,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_AHP_ELC_SN_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HNS_ELC_SN_N',2007,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPP_ELC_SN_N',2007,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_N',2007,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HP_HET_SN_N',2007,1.000E-04,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPTS_SN_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N',2007,1.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_DST_SN_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_LPG_SN_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_SOL_NGA_SN_N',2007,6.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_MN_N',2007,5.866E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_DST_COND_MN_N',2007,8.720E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_MN_N',2007,4.994E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_NGA_COND_MN_N',2007,6.840E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_MN_N',2007,5.470E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_LPG_COND_MN_N',2007,7.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WST_BIO_MN_N',2007,2.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_WPL_BIO_MN_N',2007,1.585E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_AHP_ELC_MN_N',2007,4.756E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HNS_ELC_MN_N',2007,5.074E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HPP_ELC_MN_N',2007,6.659E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SH_HEX_HET_MN_N',2007,2.880E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_AHP_ELC_STD_N',2007,6.309E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_AHP_ELC_IMP_N',2007,7.344E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_CEN_N',2007,9.631E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_ROOM_N',2007,9.396E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_AHP_ELC_ADV_N',2007,1.010E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_GEO_N',2007,1.119E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_ROOM_ELC_NEW_N',2007,1.163E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_GEO_IMP_N',2007,7.222E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_AHP_NGA_ADV_N',2007,8.079E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_CEN_NGA_N',2007,1.299E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'RES_SC_AHP_NGA_N',2016,1.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_SC_HP_N',2007,1.000E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_MISC_EQP_N',2007,1.195E+01,'M€/PJ','');

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
-- Residential sector
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_CLB_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_CLA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_CLA+_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_CLA++_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_2010_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_RFG_2020_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_FRZ_CLB_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_FRZ_CLA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_FRZ_CLA++_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_FRZ_2010_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_RF_FRZ_2020_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_DST_COND_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_NGA_COND_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_LPG_COND_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_WPL_BIO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_ELC_RES_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_AHP_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_HNS_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_SOL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_WH_PDC_ACS_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CW_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CW_ELC_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CW_ELC_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CW_2010_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CW_2020_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CD_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CD_ELC_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CD_ELC_NEW_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_DW_ELC_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_DW_ELC_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_DW_ELC_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_DW_2010_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_DW_2020_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CK_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CK_COA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CK_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CK_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CK_BIO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_BFL_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_SFL_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_EFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_LFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_SFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_LHAL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_SHAL_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_SHAL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_MIN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_SIN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_KER_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_LG_LED_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_COND_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_COND_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_COND_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WST_BIO_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WPL_BIO_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_AHP_ELC_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HNS_ELC_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPP_ELC_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HEX_HET_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HP_HET_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPTS_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_DST_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_LPG_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_NGA_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_ROOF_INS_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_INT_INS_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_BASE_INS_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WIN_INS_SO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_COND_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_COND_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_COND_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WST_BIO_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WPL_BIO_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_AHP_ELC_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HNS_ELC_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPP_ELC_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HEX_HET_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HP_HET_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPTS_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_DST_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_LPG_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_NGA_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_ROOF_INS_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_INT_INS_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_BASE_INS_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WIN_INS_MO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_COND_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_COND_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_COND_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WST_BIO_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WPL_BIO_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_AHP_ELC_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HNS_ELC_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPP_ELC_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HEX_HET_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HP_HET_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPTS_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPTS_GEO_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_DST_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_LPG_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_SOL_NGA_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_ROOF_INS_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_INT_INS_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_BASE_INS_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WIN_INS_SN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_DST_COND_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_NGA_COND_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_LPG_COND_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WST_BIO_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_WPL_BIO_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_AHP_ELC_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HNS_ELC_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HPP_ELC_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SH_HEX_HET_MN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_AHP_ELC_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_AHP_ELC_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_CEN_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_ROOM_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_AHP_ELC_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_GEO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_ROOM_ELC_NEW_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_GEO_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_AHP_NGA_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_CEN_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_AHP_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_SC_HP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_MISC_EQP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_STR_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_H2_PEMFC_N','EUR20');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Residential sector
-- Base year technologies
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_NGA_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_ELC_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_SO_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_NGA_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_MO_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_NGA_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_SN_E',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_MN_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_NGA_MN_E',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_E',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_EHP_E',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_E',8.5707,'Mm2/PJ');
-- New technologies
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_SO_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_MO_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_SN_N',3.1949,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MN_N',3.0303,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_STD_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_GEO_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_GEO_IMP_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_NGA_N',8.5707,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_NGA_N',8.5707,'Mm2/PJ');
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_STR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_H2_PEMFC_N',31.536,'PJ/GW');

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
-- Residential sector
-- Base year technologies
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_NGA_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_NGA_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_DST_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_HFO_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_KER_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_COA_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_LPG_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HT_ELC_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_ELC_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_GEO_SO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_NGA_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_NGA_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_DST_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_HFO_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_KER_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_COA_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_LPG_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HT_ELC_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_GEO_MO_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_NGA_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_NGA_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_DST_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_HFO_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_KER_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_COA_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_LPG_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HT_ELC_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_GEO_SN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_BUR_NGA_MN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_NGA_MN_E',2006,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_CEN_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_EHP_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_ROOM_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_NGA_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_HFO_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_DST_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_LPG_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_BIO_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_ELC_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_HET_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_SOL_E',2006,0.10,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_COND_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_COND_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_COND_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WPL_BIO_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HNS_ELC_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPP_ELC_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPTS_SO_N',2007,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_DST_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_LPG_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_NGA_SO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_COND_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_COND_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_COND_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WPL_BIO_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HNS_ELC_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPP_ELC_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPTS_MO_N',2007,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_DST_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_COND_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_COND_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_COND_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WPL_BIO_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HNS_ELC_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPP_ELC_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPTS_SN_N',2007,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPTS_GEO_SN_N',2007,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_DST_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_LPG_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_SOL_NGA_SN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_DST_COND_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_NGA_COND_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_LPG_COND_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WST_BIO_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_WPL_BIO_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_AHP_ELC_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HNS_ELC_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HPP_ELC_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HEX_HET_MN_N',2007,0.18,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_AHP_ELC_STD_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_CEN_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_ROOM_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_GEO_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_GEO_IMP_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_CEN_NGA_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SC_AHP_NGA_N',2016,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_DST_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_DST_COND_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_NGA_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_NGA_COND_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_LPG_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_LPG_COND_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_WPL_BIO_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_ELC_RES_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_AHP_ELC_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_HNS_ELC_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_WH_SOL_N',2007,0.10,'');
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CC_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_STR_N',2022,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_H2_PEMFC_N',2020,0.90,'');

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
-- Residential sector
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N',2022,0.20,'');

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