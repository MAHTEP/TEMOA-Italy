
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
INSERT INTO "technologies" VALUES ('RES_SH_HP_ELE_SO_E','p','RES','Space heating - Air-coupled heat pump - Electricity - SF-old - Existing','');
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
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_NGA_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_KER_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_COA_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_ELE_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_GEO_SO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_NGA_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_KER_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_COA_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_ELC_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_GEO_MO_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_DST_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_NGA_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_HFO_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_COA_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_KER_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_LPG_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HT_ELC_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_ELC_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_GEO_SN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BUR_NGA_MN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_NGA_MN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_CEN_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_EHP_E','');
INSERT INTO "tech_annual" VALUES ('RES_SC_ROOM_E','');
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
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_HET_SO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_ROOF_INS_SO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_INT_INS_SO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BASE_INS_SO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WIN_INS_SO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_HET_MO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_ROOF_INS_MO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_INT_INS_MO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BASE_INS_MO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WIN_INS_MO_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_COND_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_COND_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_COND_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HP_HET_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_ROOF_INS_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_INT_INS_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_BASE_INS_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WIN_INS_SN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_DST_COND_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_NGA_COND_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WST_BIO_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_WPL_BIO_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_AHP_ELC_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HNS_ELC_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HPP_ELC_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_HEX_HET_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SH_LPG_COND_MN_N','');
INSERT INTO "tech_annual" VALUES ('RES_SC_HP_N','');
INSERT INTO "tech_annual" VALUES ('RES_MISC_EQP_N','');

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
INSERT INTO "commodities" VALUES('RES_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('RES_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('RES_DST','p','Diesel');
INSERT INTO "commodities" VALUES('RES_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('RES_KER','p','Kerosene');
INSERT INTO "commodities" VALUES('RES_LPG','p','LPG');
INSERT INTO "commodities" VALUES('RES_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('RES_COA','p','Coal');
INSERT INTO "commodities" VALUES('RES_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('RES_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('RES_HET','p','Heat');
INSERT INTO "commodities" VALUES('RES_INS_C','p','Insulation - Cooling');
INSERT INTO "commodities" VALUES('RES_INS_SO','p','Insulation - SF-Old');
INSERT INTO "commodities" VALUES('RES_INS_MO','p','Insulation - MF-Old');
INSERT INTO "commodities" VALUES('RES_INS_SN','p','Insulation - SF-New');
INSERT INTO "commodities" VALUES('RES_PH_SO','p','Heating from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_PH_MO','p','Heating from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PH_SN','p','Heating from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_PC_SO','p','Cooling from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_PC_MO','p','Cooling from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PC_SN','p','Cooling from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_PW_SO','p','Hot water from heat pump - SF-Old');
INSERT INTO "commodities" VALUES('RES_PW_MO','p','Hot water from heat pump - MF-Old');
INSERT INTO "commodities" VALUES('RES_PW_SN','p','Hot water from heat pump - SF-New');
INSERT INTO "commodities" VALUES('RES_RF_RFG','p','Refrigeration - Refrigerators');
INSERT INTO "commodities" VALUES('RES_RF_FRZ','p','Refrigeration - Freezers');
INSERT INTO "commodities" VALUES('RES_CH4','e','CH4');
INSERT INTO "commodities" VALUES('RES_CH4_PRC','e','Process CH4');
INSERT INTO "commodities" VALUES('RES_CO2','e','CO2');
INSERT INTO "commodities" VALUES('RES_N2O','e','N2O');
-- Input commodities
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('UPS_BIO_BMU','p','');
INSERT INTO "commodities" VALUES('UPS_BIO_GAS','p','');
INSERT INTO "commodities" VALUES('UPS_BIO_SLB','p','');
INSERT INTO "commodities" VALUES('UPS_COA_BCO','p','');
INSERT INTO "commodities" VALUES('UPS_COA_HCO','p','');
INSERT INTO "commodities" VALUES('UPS_COA_OVC','p','');
INSERT INTO "commodities" VALUES('UPS_COG','p','');
INSERT INTO "commodities" VALUES('UPS_CRT_EFF','p','');
INSERT INTO "commodities" VALUES('UPS_GEO','p','');
INSERT INTO "commodities" VALUES('UPS_NGA','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_DST','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_HFO','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_KER','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_LPG','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_NSP','p','');
INSERT INTO "commodities" VALUES('UPS_SOL','p','');

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
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PH_MO',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PC_MO',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_MO_N','RES_PW_MO',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_SN_N','RES_PW_SN',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PH_SN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PC_SN',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_SH_HPTS_GEO_SN_N','RES_PW_SN',0.20,'');
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
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_NGA','RES_FT_NGA_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_NGA','RES_FT_NGA_E',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_DST','RES_FT_DST_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_DST','RES_FT_DST_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_BIO_SLB','RES_FT_BIO_E',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_BIO_GAS','RES_FT_BIO_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_BIO_SLB','RES_FT_BIO_E',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_BIO_GAS','RES_FT_BIO_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','RES_FT_ELC_E',0.70,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_DST','RES_FT_ELC_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','RES_FT_ELC_E',0.65,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','RES_FT_ELC_E',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','RES_FT_ELC_E',0.35,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_DST','RES_FT_ELC_E',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_NGA','RES_FT_NGA_N',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_NGA','RES_FT_NGA_N',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_BIO_SLB','RES_FT_BIO_N',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_BIO_GAS','RES_FT_BIO_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_BIO_SLB','RES_FT_BIO_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_BIO_GAS','RES_FT_BIO_N',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_COA_HCO','RES_FT_COA_E',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_COA_HCO','RES_FT_COA_E',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_COA_HCO','RES_FT_COA_N',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_COA_HCO','RES_FT_COA_N',0.00,'');
-- Existing technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_RF_RFG','RES_RF_TECH',0.80,'User constraint');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'RES_RF_FRZ','RES_RF_TECH',0.20,'User constraint');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'RES_RF_RFG','RES_RF_TECH',0.66,'User constraint'); -- Modified from 0.80 to include the efficiency
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'RES_RF_FRZ','RES_RF_TECH',0.34,'User constraint'); -- Modified from 0.20 to include the efficiency
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
-- Residential sector
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_BIO_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_COA_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_COA_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_DST_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_1_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_2_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_3_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_GEO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HET_N','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HFO_E','');
INSERT INTO "tech_groups" VALUES ('RES_FT_HFO_N','');
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

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Residential sector
INSERT INTO "groups" VALUES ('RES_FT_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('RES_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_SO_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_MO_GRP','');
INSERT INTO "groups" VALUES ('RES_SH_SN_GRP','');
INSERT INTO "groups" VALUES ('RES_WH_GRP','');
INSERT INTO "groups" VALUES ('RES_CK_GRP','');
INSERT INTO "groups" VALUES ('RES_LG_HAL_IN_GRP','');

CREATE TABLE "MinInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_min_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Residential sector
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_NGA_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_HFO_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_DST_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_LPG_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_BIO_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_ELC_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_HET_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_SOL_E','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_DST_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_DST_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_NGA_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_NGA_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_LPG_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_LPG_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_WPL_BIO_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_ELC_RES_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_AHP_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_HNS_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_SOL_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_WH_PDC_ACS_N','RES_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_NGA_E','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_LPG_E','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_ELC_E','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_NGA_N','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_COA_N','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_LPG_N','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_ELC_N','RES_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','RES_CK_BIO_N','RES_CK_GRP',1.0,'');

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
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'RES_ELC','RES_WH_GRP',0.25,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'RES_ELC','RES_WH_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_ELC','RES_WH_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'RES_ELC','RES_CK_GRP',0.24,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2030,'RES_ELC','RES_CK_GRP',0.20,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'RES_ELC','RES_CK_GRP',0.20,'');

CREATE TABLE "MaxInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_max_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Residential sector
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_DST_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_DST_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_NGA_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_NGA_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_LPG_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_LPG_COND_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WST_BIO_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HEX_HET_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HP_HET_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_DST_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_SO_N','RES_SH_SO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_DST_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_DST_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_NGA_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_NGA_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_LPG_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_LPG_COND_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WST_BIO_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HEX_HET_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HP_HET_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_DST_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_MO_N','RES_SH_MO_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_DST_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_NGA_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_LPG_COND_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WST_BIO_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_WPL_BIO_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_AHP_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HNS_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HPP_ELC_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HEX_HET_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_HP_HET_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_DST_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_LPG_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_SH_SOL_NGA_SN_N','RES_SH_SN_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_NGA_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_HFO_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_DST_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_LPG_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_BIO_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_ELC_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_HET_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_SOL_E','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_DST_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_DST_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_NGA_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_NGA_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_LPG_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_LPG_COND_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_WPL_BIO_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_ELC_RES_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_AHP_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_HNS_ELC_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_SOL_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_WH_PDC_ACS_N','RES_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_NGA_E','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_LPG_E','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_ELC_E','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_NGA_N','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_COA_N','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_LPG_N','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_ELC_N','RES_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','RES_CK_BIO_N','RES_CK_GRP',1.0,'');

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
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_SO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_SO_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_SO_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_BIO','RES_SH_SO_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_BIO','RES_SH_SO_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_BIO','RES_SH_SO_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_SO_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_SO','RES_SH_SO_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_PH_SO','RES_SH_SO_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_SO','RES_SH_SO_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_MO_GRP',0.66,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_MO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_MO_GRP',0.75,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_BIO','RES_SH_MO_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_MO_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_MO','RES_SH_MO_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_PH_MO','RES_SH_MO_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_MO','RES_SH_MO_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_SH_SN_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_NGA','RES_SH_SN_GRP',0.90,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_SH_SN_GRP',0.90,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_BIO','RES_SH_SN_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_BIO','RES_SH_SN_GRP',0.12,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_BIO','RES_SH_SN_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_BIO','RES_SH_SN_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_PH_SN','RES_SH_SN_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_PH_SN','RES_SH_SN_GRP',0.08,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_PH_SN','RES_SH_SN_GRP',0.07,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_NGA','RES_WH_GRP',0.50,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'RES_NGA','RES_WH_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_NGA','RES_WH_GRP',0.80,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_BIO','RES_CK_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_BIO','RES_CK_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'RES_LPG','RES_CK_GRP',0.30,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'RES_LPG','RES_CK_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'RES_LPG','RES_CK_GRP',0.13,'');

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

CREATE TABLE "MinGenGroupWeight" (
	"regions"	text,
	"tech"	text,
	"group_name"	text,
	"act_fraction"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Residential sector
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_FT_LPG_E','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_FT_LPG_N','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_FT_SOL_E','RES_FT_SOL_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_FT_SOL_N','RES_FT_SOL_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_LHAL_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SHAL_IMP_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SHAL_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_MIN_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SIN_E','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_LHAL_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SHAL_IMP_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SHAL_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_MIN_N','RES_LG_HAL_IN_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','RES_LG_SIN_N','RES_LG_HAL_IN_GRP',1.0,'');

CREATE TABLE "MinGenGroupTarget" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Residential sector
INSERT INTO "MinGenGroupTarget" VALUES (2014,'RES_FT_LPG_GRP',46.50,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2020,'RES_FT_LPG_GRP',33.85,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2030,'RES_FT_LPG_GRP',29.10,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2010,'RES_FT_SOL_GRP',8.37,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2020,'RES_FT_SOL_GRP',25.12,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2050,'RES_FT_SOL_GRP',37.68,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2010,'RES_LG_HAL_IN_GRP',100.00,'Glm');
INSERT INTO "MinGenGroupTarget" VALUES (2050,'RES_LG_HAL_IN_GRP',50.00,'Glm');

CREATE TABLE "MaxGenGroupWeight" (
	"regions"	text,
	"tech"	text,
	"max_group_name"	text,
	"act_fraction"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","max_group_name","regions")
);
-- Residential sector
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_BIO_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_BIO_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_COA_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_COA_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_DST_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_DST_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_ELC_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_GEO_1_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_GEO_2_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_GEO_3_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_GEO_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_HET_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_HET_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_HFO_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_HFO_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_KER_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_KER_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_LPG_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_LPG_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_NGA_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_NGA_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_SOL_E','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_SOL_N','RES_FT_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_DST_E','RES_FT_DST_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_DST_N','RES_FT_DST_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_LPG_E','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_LPG_N','RES_FT_LPG_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_NGA_E','RES_FT_NGA_GRP',1.0,'');
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','RES_FT_NGA_N','RES_FT_NGA_GRP',1.0,'');

CREATE TABLE "MaxGenGroupLimit" (
	"periods"	integer,
	"max_group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","max_group_name")
);
-- Residential sector
INSERT INTO "MaxGenGroupLimit" VALUES (2010,'RES_FT_GRP',1333.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2016,'RES_FT_GRP',1360.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2020,'RES_FT_GRP',1354.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2010,'RES_FT_DST_GRP',80.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2012,'RES_FT_DST_GRP',68.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2010,'RES_FT_LPG_GRP',58.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2012,'RES_FT_LPG_GRP',51.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2018,'RES_FT_NGA_GRP',799.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2020,'RES_FT_NGA_GRP',798.00,'PJ');

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
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SO_E',783.89,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SO_E',11.96,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SO_E',137.15,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SO_E',4.51,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SO_E',0.08,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SO_E',0.27,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SO_E',73.20,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SO_E',27.94,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SO_E',3.12,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_ELE_SO_E',1.32,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_E',29.55,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SO_E',11.50,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_BUR_NGA_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_AHP_NGA_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_SH_BUR_DST_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2010,'RES_SH_BUR_HFO_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_KER_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_BUR_COA_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SH_BUR_LPG_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_WST_BIO_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HT_ELC_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HP_ELE_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HEX_HET_SO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HP_GEO_SO_E',5.93,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MO_E',47.89,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MO_E',0.73,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_MO_E',10.01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_MO_E',0.44,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_MO_E',0.01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_MO_E',5.62,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_MO_E',2.04,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_MO_E',0.22,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_MO_E',0.09,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_E',2.16,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_MO_E',0.84,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_BUR_NGA_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HP_NGA_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_SH_BUR_DST_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_SH_BUR_HFO_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_BUR_KER_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_BUR_COA_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_WST_BIO_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HT_ELC_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_AHP_ELC_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HEX_HET_MO_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'RES_SH_HP_GEO_MO_E',0.84,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SN_E',11.83,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SN_E',0.18,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SN_E',1.65,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SN_E',0.08,'Mm2','');
--INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SN_E',0.00,'Mm2','');
--INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SN_E',0.83,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SN_E',0.30,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SN_E',0.03,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_SN_E',0.01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_E',0.32,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SN_E',0.12,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_AHP_NGA_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_DST_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_HFO_SN_E',0.00,'Mm2','');
--INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_KER_SN_E',0.00,'Mm2','');
--INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_COA_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_WST_BIO_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_HT_ELC_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_AHP_ELC_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_HEX_HET_SN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_HP_GEO_SN_E',0.12,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MN_E',1.16,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MN_E',0.01,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_BUR_NGA_MN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_SH_HP_NGA_MN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_CEN_E',250.04,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_EHP_E',22.68,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_SC_ROOM_E',195.75,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_CEN_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_EHP_E',0.00,'Mm2','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'RES_SC_ROOM_E',0.00,'Mm2','');
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
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CK_LPG_E',5.762E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_CK_ELC_E',7.898E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_CK_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'RES_CK_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'RES_CK_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_OE_EQP_E',47.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2010,'RES_OE_EQP_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_LFL_E',1.043E+02,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SFL_E',1.082E+02,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_LHAL_E',2.879E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SHAL_IMP_E',4.403E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SHAL_E',6.097E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_MIN_E',8.807E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'RES_LG_SIN_E',7.452E+01,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_LFL_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SFL_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_LHAL_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SHAL_IMP_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SHAL_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_MIN_E',0.000E+00,'Glm','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'RES_LG_SIN_E',0.000E+00,'Glm','');

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
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_N',1.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_HEX_HET_SO_N',5.70,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_SO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_SO_N',94.90,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_SO_N',45.39,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_SO_N',33.01,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_SO_N',16.50,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_N',5.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_HEX_HET_MO_N',23.14,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_MO_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_MO_N',15.84,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_MO_N',40.49,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_MO_N',15.84,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_MO_N',14.08,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_N',0.10,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_HEX_HET_SN_N',5.50,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_ROOF_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_INT_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_BASE_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_WIN_INS_SN_N',0.00,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_ROOF_INS_SN_N',73.96,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_INT_INS_SN_N',35.37,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_BASE_INS_SN_N',25.73,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_WIN_INS_SN_N',12.86,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'RES_SH_HEX_HET_MN_N',0.30,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'RES_SH_HEX_HET_MN_N',12.20,'PJ','');

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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_LPG_E',8.32E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_BIO_E',6.62E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_E',1.74E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_SOL_E',1.43E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HET_E',6.78E+01,'PJ','');
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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_NGA_N',1.36E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_DST_N',2.50E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HFO_N',1.22E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_KER_N',1.48E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_COA_N',5.58E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_LPG_N',1.63E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_BIO_N',2.14E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_1_N',3.40E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_2_N',1.70E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_GEO_3_N',1.70E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_FT_HET_N',2.94E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_NGA_N',5.99E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_DST_N',1.10E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_HFO_N',5.37E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_KER_N',6.50E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_COA_N',2.45E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_LPG_N',7.16E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_FT_BIO_N',3.00E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_BIO_N',5.99E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_1_N',1.50E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_2_N',7.48E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_GEO_3_N',7.48E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_FT_HET_N',1.29E+02,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SO_E',807.77,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SO_E',12.33,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SO_E',150.21,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SO_E',6.73,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SO_E',0.09,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SO_E',0.28,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SO_E',76.94,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SO_E',28.79,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SO_E',3.36,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_ELE_SO_E',1.36,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SO_E',30.45,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SO_E',12.37,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_BUR_NGA_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_AHP_NGA_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'RES_SH_BUR_DST_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'RES_SH_BUR_HFO_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_KER_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_BUR_COA_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SH_BUR_LPG_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_WST_BIO_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HT_ELC_SO_E',1.22,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HP_ELE_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HEX_HET_SO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HP_GEO_SO_E',12.37,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MO_E',49.34,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MO_E',0.75,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_MO_E',10.96,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_MO_E',0.54,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_MO_E',0.01,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_MO_E',0.02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_MO_E',5.73,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_MO_E',2.10,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_MO_E',0.23,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_MO_E',0.10,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_MO_E',2.22,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_MO_E',0.90,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_BUR_NGA_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HP_NGA_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'RES_SH_BUR_DST_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'RES_SH_BUR_HFO_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_BUR_KER_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_BUR_COA_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_LPG_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_WST_BIO_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HT_ELC_MO_E',0.72,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_AHP_ELC_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HEX_HET_MO_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'RES_SH_HP_GEO_MO_E',0.90,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_SN_E',12.45,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_NGA_SN_E',0.19,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_DST_SN_E',1.73,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_HFO_SN_E',0.09,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_KER_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_COA_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_LPG_SN_E',0.88,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_WST_BIO_SN_E',0.32,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HT_ELC_SN_E',0.04,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_AHP_ELC_SN_E',0.02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HEX_HET_SN_E',0.34,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_GEO_SN_E',0.14,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_NGA_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_AHP_NGA_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_DST_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_HFO_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_KER_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_COA_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_LPG_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_WST_BIO_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_HT_ELC_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_AHP_ELC_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_HEX_HET_SN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_HP_GEO_SN_E',0.14,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_BUR_NGA_MN_E',1.22,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SH_HP_NGA_MN_E',0.02,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_BUR_NGA_MN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'RES_SH_HP_NGA_MN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_CEN_E',257.98,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_EHP_E',23.40,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_SC_ROOM_E',201.96,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_CEN_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_EHP_E',0.00,'Mm2','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_SC_ROOM_E',0.00,'Mm2','');
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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CK_LPG_E',0.91*6.403E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_CK_ELC_E',0.91*8.776E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_NGA_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_LPG_E',3.200E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'RES_CK_LPG_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'RES_CK_ELC_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_OE_EQP_E',6.850E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'RES_OE_EQP_E',0.000E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_LFL_E',0.91*1.159E+02,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SFL_E',0.91*1.202E+02,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_LHAL_E',0.91*3.199E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SHAL_IMP_E',0.91*4.893E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SHAL_E',0.91*6.774E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_MIN_E',0.91*9.785E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'RES_LG_SIN_E',0.91*8.280E+01,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_LFL_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SFL_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_LHAL_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SHAL_IMP_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SHAL_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_MIN_E',0.000E+00,'Glm','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'RES_LG_SIN_E',0.000E+00,'Glm','');

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
INSERT INTO "LifetimeTech" VALUES ('IT','RES_SH_HP_ELE_SO_E',15,'');
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
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_BIO_E',2006,6.991E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_GEO_E',2006,1.837E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_SOL_E',2006,1.509E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_HET_E',2006,6.908E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_FT_ELC_E',2006,3.000E+02,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_SO_E',2006,2.41E+03,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_NGA_SO_E',2006,3.69E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_SO_E',2006,4.69E+02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_SO_E',2006,2.31E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_SO_E',2006,2.58E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_SO_E',2006,8.35E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_SO_E',2006,2.37E+02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_SO_E',2006,8.60E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_SO_E',2006,9.62E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_ELE_SO_E',2006,4.07E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_SO_E',2006,9.10E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_SO_E',2006,3.54E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_MO_E',2006,1.08E+02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_NGA_MO_E',2006,1.64E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_MO_E',2006,2.50E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_MO_E',2006,1.23E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_MO_E',2006,1.37E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_MO_E',2006,4.44E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_MO_E',2006,1.26E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_MO_E',2006,4.58E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_MO_E',2006,5.12E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_ELC_MO_E',2006,2.17E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_MO_E',2006,4.84E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_MO_E',2006,1.89E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_SN_E',2006,3.76E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_NGA_SN_E',2006,5.74E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_DST_SN_E',2006,5.24E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_HFO_SN_E',2006,2.59E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_KER_SN_E',2006,2.88E-03,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_COA_SN_E',2006,9.32E-03,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_LPG_SN_E',2006,2.65E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_WST_BIO_SN_E',2006,9.61E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HT_ELC_SN_E',2006,1.08E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_AHP_ELC_SN_E',2006,4.55E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HEX_HET_SN_E',2006,1.02E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_GEO_SN_E',2006,3.96E-01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_BUR_NGA_MN_E',2006,2.69E+00,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SH_HP_NGA_MN_E',2006,4.10E-02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_CEN_E',2006,1.45E+02,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_EHP_E',2006,1.32E+01,'Mm2','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_SC_ROOM_E',2006,1.14E+02,'Mm2','');
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
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_LFL_E',2006,1.16E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SFL_E',2006,1.20E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_LHAL_E',2006,3.20E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SHAL_IMP_E',2006,4.89E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SHAL_E',2006,6.77E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_MIN_E',2006,9.79E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','RES_LG_SIN_E',2006,8.28E+01,'PJ','');

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
-- Residential sector
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CO2',5.610E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CO2',7.407E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CO2',7.737E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_CO2',7.187E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_CO2',9.827E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CO2',6.307E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CO2',1.000E-04,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_CH4',1.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_CH4',5.000E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_CH4',3.000E+02,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_NGA','RES_N2O',1.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_DST','RES_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_HFO','RES_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_KER','RES_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_COA','RES_N2O',1.400E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_LPG','RES_N2O',1.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('RES_BIO','RES_N2O',4.000E+00,'kt/PJ','');

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
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','RES_FT_NGA_E',2006,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COG','RES_FT_NGA_E',2006,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','RES_FT_DST_E',2006,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_NSP','RES_FT_DST_E',2006,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_HFO','RES_FT_HFO_E',2006,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_KER','RES_FT_KER_E',2006,'RES_KER',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_HCO','RES_FT_COA_E',2006,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_BCO','RES_FT_COA_E',2006,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_OVC','RES_FT_COA_E',2006,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','RES_FT_LPG_E',2006,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_SLB','RES_FT_BIO_E',2006,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_GAS','RES_FT_BIO_E',2006,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_BMU','RES_FT_BIO_E',2006,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_SOL','RES_FT_SOL_E',2006,'RES_SOL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','RES_FT_GEO_E',2006,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','RES_FT_ELC_E',2006,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','RES_FT_ELC_E',2006,'RES_ELC',0.928,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','RES_FT_HET_E',2006,'RES_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COG','RES_FT_NGA_N',2007,'RES_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','RES_FT_DST_N',2007,'RES_DST',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_HFO','RES_FT_HFO_N',2007,'RES_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_KER','RES_FT_KER_N',2007,'RES_KER',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_HCO','RES_FT_COA_N',2007,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_BCO','RES_FT_COA_N',2007,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_COA_OVC','RES_FT_COA_N',2007,'RES_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','RES_FT_LPG_N',2007,'RES_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_SLB','RES_FT_BIO_N',2007,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_GAS','RES_FT_BIO_N',2007,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_BMU','RES_FT_BIO_N',2007,'RES_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_SOL','RES_FT_SOL_N',2007,'RES_SOL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','RES_FT_GEO_1_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','RES_FT_GEO_2_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','RES_FT_GEO_3_N',2007,'RES_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','RES_FT_HET_N',2007,'RES_HET',1.0,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_SO_E',2006,'RES_SH_SO',0.73*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_AHP_NGA_SO_E',2006,'RES_SH_SO',1.10*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_SO_E',2006,'RES_SH_SO',0.73*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_SO_E',2006,'RES_SH_SO',0.73*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_SO_E',2006,'RES_SH_SO',0.06*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_SO_E',2006,'RES_SH_SO',0.55*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_SO_E',2006,'RES_SH_SO',0.68*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_E',2006,'RES_SH_SO',0.25*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_SO_E',2006,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HP_ELE_SO_E',2006,'RES_SH_SO',2.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SO_E',2006,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_SO_E',2006,'RES_SH_SO',3.80*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_MO_E',2006,'RES_SH_MO',0.73*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_HP_NGA_MO_E',2006,'RES_SH_MO',1.10*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_MO_E',2006,'RES_SH_MO',0.73*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_MO_E',2006,'RES_SH_MO',0.73*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_MO_E',2006,'RES_SH_MO',0.06*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_MO_E',2006,'RES_SH_MO',0.55*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_MO_E',2006,'RES_SH_MO',0.68*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MO_E',2006,'RES_SH_MO',0.25*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_MO_E',2006,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_E',2006,'RES_SH_MO',2.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MO_E',2006,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_MO_E',2006,'RES_SH_MO',3.80*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_SN_E',2006,'RES_SH_SN',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_AHP_NGA_SN_E',2006,'RES_SH_SN',1.16*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_BUR_DST_SN_E',2006,'RES_SH_SN',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HFO','RES_SH_BUR_HFO_SN_E',2006,'RES_SH_SN',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_KER','RES_SH_BUR_KER_SN_E',2006,'RES_SH_SN',0.07*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_COA','RES_SH_BUR_COA_SN_E',2006,'RES_SH_SN',0.57*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_BUR_LPG_SN_E',2006,'RES_SH_SN',0.72*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SN_E',2006,'RES_SH_SN',0.26*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HT_ELC_SN_E',2006,'RES_SH_SN',0.95*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_E',2006,'RES_SH_SN',2.10*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SN_E',2006,'RES_SH_SN',0.95*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SH_HP_GEO_SN_E',2006,'RES_SH_SN',3.99*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_BUR_NGA_MN_E',2006,'RES_SH_MN',0.76*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_HP_NGA_MN_E',2006,'RES_SH_MN',1.16*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_CEN_E',2006,'RES_SC',2.40*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_EHP_E',2006,'RES_SC',2.80*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_E',2006,'RES_SC',2.40*14.7257,'Mm2/PJ');
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
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LFL_E',2006,'RES_LG',47.173,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SFL_E',2006,'RES_LG',38.060,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_LHAL_E',2006,'RES_LG',9.113,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_IMP_E',2006,'RES_LG',13.938,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SHAL_E',2006,'RES_LG',9.649,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_MIN_E',2006,'RES_LG',6.969,'Glm/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_LG_SIN_E',2006,'RES_LG',5.897,'Glm/PJ');
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
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_SO_N',2007,'RES_SH_SO',0.81*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_SO_N',2007,'RES_SH_SO',0.81*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2020,'RES_SH_SO',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_DST_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_SO_N',2007,'RES_SH_SO',0.78*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_SO_N',2007,'RES_SH_SO',0.78*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',0.85*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2007,'RES_SH_SO',0.85*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2020,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_NGA_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_SO_N',2007,'RES_SH_SO',0.81*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_SO_N',2007,'RES_SH_SO',0.81*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2020,'RES_SH_SO',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_LPG_COND_SO_N',2050,'RES_SH_SO',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WST_BIO_SO_N',2007,'RES_SH_SO',0.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2007,'RES_SH_SO',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',0.79*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2020,'RES_SH_SO',0.79*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',0.83*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_WPL_BIO_SO_N',2050,'RES_SH_SO',0.83*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',3.30*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2007,'RES_SH_SO',3.30*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',4.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2020,'RES_SH_SO',4.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',4.71*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_AHP_ELC_SO_N',2050,'RES_SH_SO',4.71*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',4.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2007,'RES_SH_SO',4.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',5.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2020,'RES_SH_SO',5.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HNS_ELC_SO_N',2050,'RES_SH_SO',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2007,'RES_SH_SO',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2020,'RES_SH_SO',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HPP_ELC_SO_N',2050,'RES_SH_SO',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SO','RES_SH_HEX_HET_SO_N',2007,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PH_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PC_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2007,'RES_PW_SO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PH_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PC_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2020,'RES_PW_SO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PH_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PC_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_SO_N',2050,'RES_PW_SO',4.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_SO','RES_SH_HP_HET_SO_N',2007,'RES_SH_SO',1.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2007,'RES_SH_SO',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2020,'RES_SH_SO',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SO_N',2050,'RES_SH_SO',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_SO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_SO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating multi-family old
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_MO_N',2007,'RES_SH_MO',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_MO_N',2007,'RES_SH_MO',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2020,'RES_SH_MO',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_DST_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MO_N',2007,'RES_SH_MO',0.78*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_MO_N',2007,'RES_SH_MO',0.78*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',0.85*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2007,'RES_SH_MO',0.85*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2020,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_NGA_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_MO_N',2007,'RES_SH_MO',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_MO_N',2007,'RES_SH_MO',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2020,'RES_SH_MO',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_LPG_COND_MO_N',2050,'RES_SH_MO',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WST_BIO_MO_N',2007,'RES_SH_MO',0.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',0.76*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2007,'RES_SH_MO',0.76*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',0.79*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2020,'RES_SH_MO',0.79*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',0.83*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_WPL_BIO_MO_N',2050,'RES_SH_MO',0.83*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',3.30*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2007,'RES_SH_MO',3.30*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',4.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2020,'RES_SH_MO',4.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',4.71*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_AHP_ELC_MO_N',2050,'RES_SH_MO',4.71*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',4.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2007,'RES_SH_MO',4.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',5.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2020,'RES_SH_MO',5.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HNS_ELC_MO_N',2050,'RES_SH_MO',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',4.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2007,'RES_SH_MO',4.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',5.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2020,'RES_SH_MO',5.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HPP_ELC_MO_N',2050,'RES_SH_MO',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_MO','RES_SH_HEX_HET_MO_N',2007,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PH_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PC_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2007,'RES_PW_MO',3.30,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PH_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PC_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2020,'RES_PW_MO',4.50,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PH_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PC_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPTS_MO_N',2050,'RES_PW_MO',4.70,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_MO','RES_SH_HP_HET_MO_N',2007,'RES_SH_MO',1.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2007,'RES_SH_MO',0.82*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2020,'RES_SH_MO',0.86*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_MO_N',2050,'RES_SH_MO',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_MO',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_MO_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating single-family new
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_DST_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_NGA_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2020,'RES_SH_SN',0.94*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_LPG_COND_SN_N',2050,'RES_SH_SN',0.98*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WST_BIO_SN_N',2007,'RES_SH_SN',0.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2007,'RES_SH_SN',0.76*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',0.79*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2020,'RES_SH_SN',0.79*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',0.83*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_WPL_BIO_SN_N',2050,'RES_SH_SN',0.83*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',3.30*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2007,'RES_SH_SN',3.30*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2020,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',4.71*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_AHP_ELC_SN_N',2050,'RES_SH_SN',4.71*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2007,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2020,'RES_SH_SN',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HNS_ELC_SN_N',2050,'RES_SH_SN',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2007,'RES_SH_SN',4.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2020,'RES_SH_SN',5.50*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HPP_ELC_SN_N',2050,'RES_SH_SN',5.75*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_SN','RES_SH_HEX_HET_SN_N',2007,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
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
INSERT INTO "Efficiency" VALUES ('IT','RES_PH_SN','RES_SH_HP_HET_SN_N',2007,'RES_SH_SN',1.00*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_SOL_DST_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_SOL_LPG_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2007,'RES_SH_SN',0.82*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2020,'RES_SH_SN',0.86*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_SOL','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_SOL_NGA_SN_N',2050,'RES_SH_SN',0.90*1.9395,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_SN',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_ROOF_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_INT_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_BASE_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','UPS_CRT_EFF','RES_SH_WIN_INS_SN_N',2007,'RES_INS_C',1.00,'PJ/PJ');
-- Space heating multi-family new
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_MN_N',2007,'RES_SH_MN',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2007,'RES_SH_MN',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2020,'RES_SH_MN',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_DST','RES_SH_DST_COND_MN_N',2050,'RES_SH_MN',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_MN_N',2007,'RES_SH_MN',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2007,'RES_SH_MN',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2020,'RES_SH_MN',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SH_NGA_COND_MN_N',2050,'RES_SH_MN',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_MN_N',2007,'RES_SH_MN',0.81*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2007,'RES_SH_MN',0.90*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2020,'RES_SH_MN',0.94*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_LPG','RES_SH_LPG_COND_MN_N',2050,'RES_SH_MN',0.98*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WST_BIO_MN_N',2007,'RES_SH_MN',1.00*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2007,'RES_SH_MN',0.76*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2020,'RES_SH_MN',0.79*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_BIO','RES_SH_WPL_BIO_MN_N',2050,'RES_SH_MN',0.83*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2007,'RES_SH_MN',3.30*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2020,'RES_SH_MN',4.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_AHP_ELC_MN_N',2050,'RES_SH_MN',4.71*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2007,'RES_SH_MN',4.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2020,'RES_SH_MN',5.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HNS_ELC_MN_N',2050,'RES_SH_MN',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2007,'RES_SH_MN',4.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2020,'RES_SH_MN',5.50*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SH_HPP_ELC_MN_N',2050,'RES_SH_MN',5.75*2.6602,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_HET','RES_SH_HEX_HET_MN_N',2007,'RES_SH_MN',0.90*2.6602,'Mm2/PJ');
-- Space cooling
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',3.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_STD_N',2007,'RES_SC',3.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',3.52*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_IMP_N',2007,'RES_SC',3.52*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_CEN_N',2007,'RES_SC',2.93*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_CEN_N',2007,'RES_SC',2.93*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_N',2007,'RES_SC',3.43*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_ROOM_N',2007,'RES_SC',3.43*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',4.31*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_ELC_ADV_N',2007,'RES_SC',4.31*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_GEO_N',2007,'RES_SC',4.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_GEO_N',2007,'RES_SC',4.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_ELC','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',3.52*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_ROOM_ELC_NEW_N',2007,'RES_SC',3.52*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_GEO','RES_SC_GEO_IMP_N',2007,'RES_SC',4.20*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_GEO_IMP_N',2007,'RES_SC',4.20*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',1.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_NGA_ADV_N',2007,'RES_SC',1.10*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_CEN_NGA_N',2007,'RES_SC',1.20*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_CEN_NGA_N',2007,'RES_SC',1.20*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_NGA','RES_SC_AHP_NGA_N',2016,'RES_SC',1.20*14.7257,'Mm2/PJ');
INSERT INTO "Efficiency" VALUES ('IT','RES_INS_C','RES_SC_AHP_NGA_N',2016,'RES_SC',1.20*14.7257,'Mm2/PJ');
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
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SO','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MO','POP','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_SN','DRH3','');
INSERT INTO "Allocation" VALUES ('IT','RES_SH_MN','DRH4','');
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
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_SO',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_SO',0.00,'');
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
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_SH_MN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_SH_MN',3.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_SH_MN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_SH_MN',2.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_SH_MN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_SH_MN',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_SH_MN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_SH_MN',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_SH_MN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_SH_MN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_SH_MN',1.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_SH_MN',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_SH_MN',1.00,'');
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
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CD',8.280E-02,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CK',2.587E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_CW',6.015E+00,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_DW',2.770E+00,'Glav','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_LG',4.312E+02,'Glm','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_OE',6.843E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_RF',9.013E+00,'Gl','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SC',5.200E+02,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_SO',1.189E+03,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_MO',7.658E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_SN',1.706E+01,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_SH_MN',1.306E+00,'Mm2','');
INSERT INTO "Demand" VALUES ('IT',2006,'RES_WH',7.676E+01,'PJ','');

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
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_NGA_N',2007,2.07E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_DST_N',2007,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_HFO_N',2007,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_KER_N',2007,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_COA_N',2007,3.52E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_LPG_N',2007,3.11E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_BIO_N',2007,3.52E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'RES_FT_SOL_N',2007,1.00E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'RES_FT_ELC_E',2006,15.0,'M€/PJ','');
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
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_NGA_N',2007,4.10E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_DST_N',2007,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_HFO_N',2007,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_KER_N',2007,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_COA_N',2007,6.97E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_LPG_N',2007,6.15E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'RES_FT_BIO_N',2007,6.97E+00,'M€/PJ','');
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
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_NGA_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_ELE_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_SO_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_NGA_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_MO_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_NGA_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_DST_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_HFO_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_KER_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_COA_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_LPG_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HT_ELC_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_GEO_SN_E',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_BUR_NGA_MN_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_NGA_MN_E',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_E',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_EHP_E',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_E',14.7257,'Mm2/PJ');
-- New technologies
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_SO_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_MO_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HP_HET_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_DST_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_LPG_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_SOL_NGA_SN_N',1.9395,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_DST_COND_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_NGA_COND_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_LPG_COND_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WST_BIO_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_WPL_BIO_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_AHP_ELC_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HNS_ELC_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HPP_ELC_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SH_HEX_HET_MN_N',2.6602,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_STD_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_IMP_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_ELC_ADV_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_GEO_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_ROOM_ELC_NEW_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_GEO_IMP_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_NGA_ADV_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_CEN_NGA_N',14.7257,'Mm2/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_SC_AHP_NGA_N',14.7257,'Mm2/PJ');
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_MICRO_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CC_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_STR_N',31.356,'PJ/GW');

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
INSERT INTO "CapacityFactor" VALUES ('IT','RES_SH_HP_ELE_SO_E',2006,0.18,'');
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

COMMIT;