
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
-- Agriculture sector technologies
-- Fuel technologies
INSERT INTO "technologies" VALUES ('AGR_FT_NGA_E','p','AGR','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_DST_E','p','AGR','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_GSL_E','p','AGR','Fuel technology - Gasoline - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_LPG_E','p','AGR','Fuel technology - Liquified petroleum gas - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_BIO_E','p','AGR','Fuel technology - Biofuels - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_GEO_E','p','AGR','Fuel technology - Geothermal energy - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_SOL_E','p','AGR','Fuel technology - Solar - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_ELC_E','p','AGR','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('AGR_FT_HET_E','p','AGR','Fuel technology - Solar - Existing','');
--Base year technologies
INSERT INTO "technologies" VALUES ('AGR_TECH','p','AGR','Agriculture - Existing technology','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('COM_FT_NGA_E','p','COM','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_E','p','COM','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_GEO_E','p','COM','Fuel technology - Geothermal energy - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_ELC_E','p','COM','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_HET_E','p','COM','Fuel technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_NGA_N','p','COM','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_N','p','COM','Fuel technology - Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_FT_KER_N','p','COM','Fuel technology - Kerosene - New','');
INSERT INTO "technologies" VALUES ('COM_FT_LPG_N','p','COM','Fuel technology - Liquified petroleum gas - New','');
INSERT INTO "technologies" VALUES ('COM_FT_BIO_N','p','COM','Fuel technology - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_FT_SOL_N','p','COM','Fuel technology - Solar - New','');
INSERT INTO "technologies" VALUES ('COM_FT_GEO_1_N','p','COM','Fuel technology - Geothermal energy 1 - New','');
INSERT INTO "technologies" VALUES ('COM_FT_GEO_2_N','p','COM','Fuel technology - Geothermal energy 2 - New','');
INSERT INTO "technologies" VALUES ('COM_FT_GEO_3_N','p','COM','Fuel technology - Geothermal energy 3 - New ','');
INSERT INTO "technologies" VALUES ('COM_FT_HET_N','p','COM','Fuel technology - Heat - New','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('COM_SH_HT_NGA_E','p','COM','Space heating - Heater - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_NGA_E','p','COM','Space heating - Heat pump - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HT_DST_E','p','COM','Space heating - Heater - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HT_LPG_E','p','COM','Space heating - Heater - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_RES_ELC_E','p','COM','Space heating - Electric resistance - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_ELC_E','p','COM','Space heating - Heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HEX_HET_E','p','COM','Space heating - Heat exchanger - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_SH_HEX_GEO_E','p','COM','Space heating - Heat exchanger - Geothermal energy - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ABS_NGA_E','p','COM','Space heating - Absorption chiller - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_CHL_DST_E','p','COM','Space cooling - Chiller - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_CCL_ELC_CNT_E','p','COM','Space cooling - Centralized cooler - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_AHP_ELC_E','p','COM','Space cooling - Air-coupled heat pump - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOM_ELC_E','p','COM','Space cooling - Room cooler - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_ELC_E','p','COM','Space cooling - Rooftop cooler- Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_NGA_E','p','COM','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_DST_E','p','COM','Water heating - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_LPG_E','p','COM','Water heating - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_ELC_E','p','COM','Water heating - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_WH_HET_E','p','COM','Water heating - Heat exchanger - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_INC_E','p','COM','Lighting - Incandescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SHAL_E','p','COM','Lighting - Small halogen lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_IRCHAL_E','p','COM','Lighting - IRC halogen lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SFL_E','p','COM','Lighting - Small fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_LFL_E','p','COM','Lighting - Large fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_CFL_C_E','p','COM','Lighting - Compact fluorescent lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_MER_E','p','COM','Lighting - Mercury lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_LG_SOD_E','p','COM','Lighting - Sodium lamp - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_NGA_E','p','COM','Cooking - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_LPG_E','p','COM','Cooking - LPG - Existing','');
INSERT INTO "technologies" VALUES ('COM_CK_ELC_E','p','COM','Cooking - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_RF_RFR_ELC_E','p','COM','Refrigeration - Refrigerator - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_E','p','COM','Other electric - Office equipment - Electricity - Existing','');
-- New technologies
INSERT INTO "technologies" VALUES ('COM_LG_INC_N','p','COM','Lighting - Incandescence light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SHAL_STD_N','p','COM','Lighting - Standard small halogen light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_HAL_IMP_N','p','COM','Lighting - Improved small halogen light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SFL_N','p','COM','Lighting - Small fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_LFL_N','p','COM','Lighting - Large fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_CFL_N','p','COM','Lighting - Compact fluorescent light - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_KER_N','p','COM','Lighting - Kerosene lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_MER_N','p','COM','Lighting - Mercury lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_LG_SOD_N','p','COM','Lighting - Sodium lamp - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_DST_N','p','COM','Water heating - Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_DST_N','p','COM','Water heating - Diesel (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_NGA_N','p','COM','Water heating - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_NGA_N','p','COM','Water heating - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_LPG_N','p','COM','Water heating - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_WH_COND_LPG_N','p','COM','Water heating - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_WH_WPEL_BIO_N','p','COM','Water heating - Wood pellet - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_WH_ELC_N','p','COM','Water heating - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_AHP_ELC_N','p','COM','Water heating - Air-coupled heat pump-based - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_WH_HEX_HET_N','p','COM','Water heating - Heat exchanger - Heat - New','');
INSERT INTO "technologies" VALUES ('COM_WH_SOL_N','p','COM','Water heating - Solar energy - New','');
INSERT INTO "technologies" VALUES ('COM_SH_DST_N','p','COM','Space heating - Heater -  Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_SH_COND_DST_N','p','COM','Space heating - Heater - Diesel (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_SH_NGA_N','p','COM','Space heating - Heater - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_SH_COND_NGA_N','p','COM','Space heating - Heater - Natural gas (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_SH_LPG_N','p','COM','Space heating - Heater - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_SH_COND_LPG_N','p','COM','Space heating - Heater - LPG (condensing) - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HEX_HET_N','p','COM','Space heating - Heat exchanger - Heat - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_AIR_N','p','COM','Space heating - Air-coupled heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_PRB_N','p','COM','Space heating - Heat pump coupled with probe - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_HP_N','p','COM','Space heating - Heat pump - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SH_GEO_N','p','COM','Space heating - Heater - Geothermal - New','');
INSERT INTO "technologies" VALUES ('COM_SH_DST_SOL_N','p','COM','Space heating - Heater - Diesel + Solar energy - New','');
INSERT INTO "technologies" VALUES ('COM_SH_LPG_SOL_N','p','COM','Space heating - Heater - LPG + Solar energy - New','');
INSERT INTO "technologies" VALUES ('COM_SH_NGA_SOL_N','p','COM','Space heating - Heater - Natural gas + Solar energy - New','');
INSERT INTO "technologies" VALUES ('COM_SH_WPEL_N','p','COM','Space heating - Wood pellet - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_SC_DST_STD_N','p','COM','Space cooling - Diesel (standard) - New','');
INSERT INTO "technologies" VALUES ('COM_SC_DST_N','p','COM','Space cooling - Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_SC_HP_STD_N','p','COM','Space cooling - Heat pump (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_HP_IMP_N','p','COM','Space cooling - Heat pump (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_STD_N','p','COM','Space cooling - Rooftop (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ELC_GEO_IMP_N','p','COM','Space cooling - Geothermal (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ELC_GEO_ADV_N','p','COM','Space cooling - Geothermal (advanced) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOF_ADV_N','p','COM','Space cooling - Rooftop (advanced) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_REC_N','p','COM','Space cooling - Reciprocating - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_REC_IMP_N','p','COM','Space cooling - Reciprocating (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNF_N','p','COM','Space cooling - Centrifugal - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNF_IMP_N','p','COM','Space cooling - Centrifugal (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_CNT_N','p','COM','Space cooling - Central - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ROOM_N','p','COM','Space cooling - Room - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_SC_GEO_IMP_N','p','COM','Space cooling - Geothermal energy (improved) - New','');
INSERT INTO "technologies" VALUES ('COM_SC_ABS_NGA_N','p','COM','Space cooling - Absorption - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_SC_NGA_STD_N','p','COM','Space cooling - Natural gas (standard) - New','');
INSERT INTO "technologies" VALUES ('COM_SC_NGA_IMP_N','p','COM','Space cooling - Natural gas (improved) - New','');
INSERT INTO "technologies" VALUES ('COM_CK_NGA_N','p','COM','Cooking - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_CK_KER_N','p','COM','Cooking - Kerosene - New','');
INSERT INTO "technologies" VALUES ('COM_CK_LPG_N','p','COM','Cooking - LPG - New','');
INSERT INTO "technologies" VALUES ('COM_CK_DST_N','p','COM','Cooking - Diesel - New','');
INSERT INTO "technologies" VALUES ('COM_CK_ELC_N','p','COM','Cooking - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_CK_BIO_N','p','COM','Cooking - Biomass - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_STD_N','p','COM','Other electric - Office equipment (standard) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ELC_IMP_N','p','COM','Other electric - Office equipment (improved) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_OE_OFF_ADV_N','p','COM','Other electric - Office equipment (advanced) - Electricity - New','');
INSERT INTO "technologies" VALUES ('COM_RF_STD_N','p','COM','Refrigeration - Electricity (standard) - New','');
INSERT INTO "technologies" VALUES ('COM_RF_IMP_N','p','COM','Refrigeration - Electricity (improved) - New','');
INSERT INTO "technologies" VALUES ('COM_RF_N','p','COM','Refrigeration - Electricity - New','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_MICRO_N','p','COM','mCHP - Commercial - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CC_N','p','COM','mCHP - Commercial - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_SLB_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Solid biomass','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "tech_annual" VALUES ('AGR_FT_GSL_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_GEO_E','');
-- Commercial sector
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_RES_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HEX_HET_E','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HEX_GEO_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ABS_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CHL_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CCL_ELC_CNT_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_AHP_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOM_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_DST_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_WH_HET_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_INC_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SHAL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_IRCHAL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SFL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_LFL_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_CFL_C_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_MER_E','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SOD_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_NGA_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_LPG_E','');
INSERT INTO "tech_annual" VALUES ('COM_CK_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_RF_RFR_ELC_E','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_E','');
-- New technologies
INSERT INTO "tech_annual" VALUES ('COM_LG_INC_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SHAL_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_HAL_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_LFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_CFL_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_KER_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_MER_N','');
INSERT INTO "tech_annual" VALUES ('COM_LG_SOD_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_WPEL_BIO_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_AHP_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_HEX_HET_N','');
INSERT INTO "tech_annual" VALUES ('COM_WH_SOL_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HEX_HET_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_AIR_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_HP_PRB_N','');
INSERT INTO "tech_annual" VALUES ('COM_SH_WPEL_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_DST_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_DST_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_HP_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_HP_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ELC_GEO_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ELC_GEO_ADV_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOF_ADV_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_REC_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_REC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNF_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNF_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_CNT_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ROOM_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_GEO_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_ABS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_NGA_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_SC_NGA_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_NGA_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_KER_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_LPG_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_DST_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_ELC_N','');
INSERT INTO "tech_annual" VALUES ('COM_CK_BIO_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ELC_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_OE_OFF_ADV_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_STD_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_IMP_N','');
INSERT INTO "tech_annual" VALUES ('COM_RF_N','');

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
-- Agriculture sector
INSERT INTO "commodities" VALUES('AGR_DEM','d','Agriculture demand [PJ]');
INSERT INTO "commodities" VALUES('AGR_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('AGR_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('AGR_DST','p','Diesel');
INSERT INTO "commodities" VALUES('AGR_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('AGR_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('AGR_BIO','p','Biofuels');
INSERT INTO "commodities" VALUES('AGR_SOL','p','Solar');
INSERT INTO "commodities" VALUES('AGR_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('AGR_HET','p','Heat');
INSERT INTO "commodities" VALUES('AGR_CH4','e','CH4');
INSERT INTO "commodities" VALUES('AGR_CO2','e','CO2');
INSERT INTO "commodities" VALUES('AGR_N2O','e','N2O');
-- Commercial sector
INSERT INTO "commodities" VALUES('COM_SC','d','Space cooling [PJ]');
INSERT INTO "commodities" VALUES('COM_CK','d','Cooking [PJ]');
INSERT INTO "commodities" VALUES('COM_SH','d','Space heating [PJ]');
INSERT INTO "commodities" VALUES('COM_WH','d','Water heating [PJ]');
INSERT INTO "commodities" VALUES('COM_LG','d','Lighting [PJ]');
INSERT INTO "commodities" VALUES('COM_OE','d','Other electricity use [PJ]');
INSERT INTO "commodities" VALUES('COM_RF','d','Refrigeration [PJ]');
INSERT INTO "commodities" VALUES('COM_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('COM_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('COM_DST','p','Diesel');
INSERT INTO "commodities" VALUES('COM_KER','p','Kerosene');
INSERT INTO "commodities" VALUES('COM_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('COM_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('COM_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('COM_SOL','p','Solar');
INSERT INTO "commodities" VALUES('COM_HET','p','Heat');
INSERT INTO "commodities" VALUES('COM_CH4','e','CH4');
INSERT INTO "commodities" VALUES('COM_CO2','e','CO2');
INSERT INTO "commodities" VALUES('COM_N2O','e','N2O');
-- Input commodities
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('ELC_SLB_VIR','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('UPS_BIO_SLB','p','');
INSERT INTO "commodities" VALUES('UPS_GEO','p','');
INSERT INTO "commodities" VALUES('UPS_NGA','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_DST','p','');
INSERT INTO "commodities" VALUES('UPS_OIL_GSL','p','');
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
-- Commercial sector
-- New technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_SC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_SC',0.30,'');
-- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','COM_HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','COM_HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','COM_HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','COM_HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','COM_HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','COM_HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','COM_HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','COM_HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','COM_HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','COM_HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','COM_HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','COM_HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','ELC_DST',4.926E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','COM_HET',5.074E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','ELC_DST',4.762E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','COM_HET',5.238E-01,'');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_DST','AGR_FT_DST_E',1.0,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_DST','AGR_FT_DST_E',0.9,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_BIO_SLB','AGR_FT_BIO_E',1.0,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_BIO_SLB','AGR_FT_BIO_E',0.9,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','AGR_FT_ELC_E',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','AGR_FT_ELC_E',0.35,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_DST','COM_FT_DST_E',0.941,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_GSL','COM_FT_DST_E',0.059,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_DST','COM_FT_DST_E',0.84,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_GSL','COM_FT_DST_E',0.00,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','COM_FT_ELC_E',0.70,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_DST','COM_FT_ELC_E',0.00,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','COM_FT_ELC_E',0.35,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_DST','COM_FT_ELC_E',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_DST','COM_FT_DST_N',0.941,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'UPS_OIL_GSL','COM_FT_DST_N',0.059,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_DST','COM_FT_DST_N',0.84,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'UPS_OIL_GSL','COM_FT_DST_N',0.00,'');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_DST','COM_SH_DST_SOL_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_SOL','COM_SH_DST_SOL_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_LPG','COM_SH_LPG_SOL_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_SOL','COM_SH_LPG_SOL_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_NGA','COM_SH_NGA_SOL_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COM_SOL','COM_SH_NGA_SOL_N',0.60,'');

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
-- Agriculture sector
INSERT INTO "tech_groups" VALUES ('AGR_TECH','');
-- Commercial sector
INSERT INTO "tech_groups" VALUES ('COM_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_RES_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HEX_HET_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HEX_GEO_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_COND_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_COND_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_COND_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HEX_HET_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_AIR_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_PRB_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_GEO_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_DST_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_LPG_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_NGA_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_WPEL_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_HET_E','');
INSERT INTO "tech_groups" VALUES ('COM_WH_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_COND_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_WPEL_BIO_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_AHP_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_HEX_HET_N','');
INSERT INTO "tech_groups" VALUES ('COM_WH_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_KER_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_BIO_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Agriculture sector
INSERT INTO "groups" VALUES ('AGR_GRP','');
-- Commercial sector
INSERT INTO "groups" VALUES ('COM_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('COM_SH_GRP','');
INSERT INTO "groups" VALUES ('COM_WH_GRP','');
INSERT INTO "groups" VALUES ('COM_CK_GRP','');

CREATE TABLE "MinInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_min_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Commercial sector
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HT_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HP_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HT_DST_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HT_LPG_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_RES_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HP_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HEX_HET_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HEX_GEO_E','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_COND_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_COND_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_COND_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HEX_HET_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HP_AIR_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HP_PRB_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_HP_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_GEO_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_DST_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_LPG_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_NGA_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_SH_WPEL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_NGA_E','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_DST_E','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_LPG_E','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_ELC_E','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_HET_E','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_COND_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_COND_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_COND_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_WPEL_BIO_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_AHP_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_HEX_HET_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_WH_SOL_N','COM_WH_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_NGA_E','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_LPG_E','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_ELC_E','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_NGA_N','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_KER_N','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_LPG_N','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_DST_N','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_ELC_N','COM_CK_GRP',1.0,'');
INSERT INTO "MinInputGroupWeight" VALUES ('IT','COM_CK_BIO_N','COM_CK_GRP',1.0,'');

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
-- Commercial sector
INSERT INTO "MinInputGroup" VALUES ('IT',2014,'COM_ELC','COM_SH_GRP',0.05,''); -- Modified to include constraint on COM_SH_HP_AIR_N
INSERT INTO "MinInputGroup" VALUES ('IT',2030,'COM_ELC','COM_SH_GRP',0.25,''); -- Modified to include constraint on COM_SH_HP_AIR_N
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_SH_GRP',0.30,''); -- Modified to include constraint on COM_SH_HP_AIR_N
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_ELC','COM_WH_GRP',0.30,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_WH_GRP',0.28,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_BIO','COM_CK_GRP',0.00,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_BIO','COM_CK_GRP',0.05,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_ELC','COM_CK_GRP',0.15,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_CK_GRP',0.30,'');

CREATE TABLE "MaxInputGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"gi_max_fraction"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Agriculture sector
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','AGR_TECH','AGR_GRP',1.0,'');
-- Commercial sector
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HT_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HP_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HT_DST_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HT_LPG_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_RES_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HP_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HEX_HET_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HEX_GEO_E','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_COND_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_COND_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_COND_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HEX_HET_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HP_AIR_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HP_PRB_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_HP_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_GEO_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_DST_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_LPG_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_NGA_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_SH_WPEL_N','COM_SH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_NGA_E','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_DST_E','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_LPG_E','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_ELC_E','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_HET_E','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_COND_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_COND_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_COND_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_WPEL_BIO_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_AHP_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_HEX_HET_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_WH_SOL_N','COM_WH_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_NGA_E','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_LPG_E','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_ELC_E','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_NGA_N','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_KER_N','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_LPG_N','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_DST_N','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_ELC_N','COM_CK_GRP',1.0,'');
INSERT INTO "MaxInputGroupWeight" VALUES ('IT','COM_CK_BIO_N','COM_CK_GRP',1.0,'');

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
-- Agriculture sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_NGA','AGR_GRP',0.0422,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_DST','AGR_GRP',0.7075,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_GSL','AGR_GRP',0.0045,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_LPG','AGR_GRP',0.0209,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_BIO','AGR_GRP',0.0555,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_ELC','AGR_GRP',0.1342,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_HET','AGR_GRP',0.0000,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_GEO','AGR_GRP',0.0362,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_SOL','AGR_GRP',0.0000,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_NGA','AGR_GRP',0.0480,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_DST','AGR_GRP',0.7450,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_GSL','AGR_GRP',0.0036,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_LPG','AGR_GRP',0.0230,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_BIO','AGR_GRP',0.0050,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_ELC','AGR_GRP',0.1641,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_HET','AGR_GRP',0.0004,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_GEO','AGR_GRP',0.0200,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_SOL','AGR_GRP',0.0005,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_NGA','AGR_GRP',0.0480,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_DST','AGR_GRP',0.7450,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_GSL','AGR_GRP',0.0036,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_LPG','AGR_GRP',0.0230,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_BIO','AGR_GRP',0.0050,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_ELC','AGR_GRP',0.1641,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_HET','AGR_GRP',0.0004,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_GEO','AGR_GRP',0.0200,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_SOL','AGR_GRP',0.0005,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_NGA','AGR_GRP',0.0480,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_DST','AGR_GRP',0.7301,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_GSL','AGR_GRP',0.0036,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_LPG','AGR_GRP',0.0225,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_BIO','AGR_GRP',0.0050,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_ELC','AGR_GRP',0.1805,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_HET','AGR_GRP',0.0004,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_GEO','AGR_GRP',0.0210,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_SOL','AGR_GRP',0.0005,'');
-- Commercial sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_NGA','COM_SH_GRP',0.91,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_NGA','COM_SH_GRP',0.92,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_HET','COM_SH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_HET','COM_SH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_BIO','COM_SH_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_BIO','COM_SH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_HET','COM_WH_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_HET','COM_WH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_BIO','COM_CK_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_BIO','COM_CK_GRP',0.07,'');

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
-- Commercial sector
INSERT INTO "MinGenGroupWeight" VALUES ('IT','COM_FT_LPG_N','COM_FT_LPG_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','COM_FT_NGA_E','COM_FT_NGA_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','COM_FT_NGA_N','COM_FT_NGA_GRP',1.0,'');
INSERT INTO "MinGenGroupWeight" VALUES ('IT','COM_FT_SOL_N','COM_FT_SOL_GRP',1.0,'');

CREATE TABLE "MinGenGroupTarget" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Commercial sector
INSERT INTO "MinGenGroupTarget" VALUES (2010,'COM_FT_LPG_GRP',24.50,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2020,'COM_FT_LPG_GRP',16.75,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2030,'COM_FT_LPG_GRP',5.58,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2010,'COM_FT_NGA_GRP',360.00,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2012,'COM_FT_NGA_GRP',304.60,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2010,'COM_FT_SOL_GRP',1.26,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2020,'COM_FT_SOL_GRP',18.84,'PJ');
INSERT INTO "MinGenGroupTarget" VALUES (2050,'COM_FT_SOL_GRP',28.26,'PJ');

CREATE TABLE "MaxGenGroupWeight" (
	"regions"	text,
	"tech"	text,
	"max_group_name"	text,
	"act_fraction"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","max_group_name","regions")
);
-- Commercial sector
INSERT INTO "MaxGenGroupWeight" VALUES ('IT','COM_FT_ELC_E','COM_FT_ELC_GRP',1.0,'');

CREATE TABLE "MaxGenGroupLimit" (
	"periods"	integer,
	"max_group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","max_group_name")
);
-- Commercial sector
INSERT INTO "MaxGenGroupLimit" VALUES (2010,'COM_FT_ELC_GRP',312.00,'PJ');
INSERT INTO "MaxGenGroupLimit" VALUES (2012,'COM_FT_ELC_GRP',325.00,'PJ');

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
-- Commercial sector
-- Base year technologies
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_NGA_E',1.767E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HP_NGA_E',4.798E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_DST_E',9.976E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_LPG_E',3.332E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_RES_ELC_E',4.273E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HP_ELC_E',2.849E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HEX_HET_E',3.576E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HEX_GEO_E',1.446E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HT_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HP_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HT_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HT_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_RES_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HP_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_SH_HEX_HET_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SH_HEX_GEO_E',1.446E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ABS_NGA_E',1.722E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_CHL_DST_E',1.168E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_CCL_ELC_CNT_E',6.249E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_AHP_ELC_E',3.900E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ROOM_ELC_E',1.294E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ROOF_ELC_E',4.035E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ABS_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_SC_CHL_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_CCL_ELC_CNT_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_AHP_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ROOM_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ROOF_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_NGA_E',5.595E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_DST_E',1.130E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_LPG_E',1.243E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_ELC_E',1.037E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_HET_E',1.703E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_WH_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_WH_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_WH_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_WH_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_WH_HET_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_INC_E',2.667E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SHAL_E',1.212E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_IRCHAL_E',1.585E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SFL_E',1.604E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_LFL_E',1.989E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_CFL_C_E',4.052E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_MER_E',2.431E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SOD_E',6.077E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_INC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_SHAL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_IRCHAL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_SFL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_LFL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_CFL_C_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_MER_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'COM_LG_SOD_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_NGA_E',5.165E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_LPG_E',3.315E-03,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_ELC_E',1.418E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_CK_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_CK_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_CK_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_RF_RFR_ELC_E',1.772E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_RF_RFR_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_OE_OFF_ELC_E',9.520E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'COM_OE_OFF_ELC_E',0.0E+00,'PJ','');

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
-- Commercial sector
-- New technologies
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'COM_SH_HEX_HET_N',3.20,'PJ','');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'COM_SH_HEX_HET_N',23.27,'PJ','');

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
-- Agriculture sector
INSERT INTO "MaxActivity" VALUES ('IT',2007,'AGR_FT_GEO_E',5.37,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'AGR_FT_GEO_E',7.30,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'AGR_FT_SOL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'AGR_FT_SOL_E',0.50,'PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_NGA_E',3.11E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_DST_E',1.88E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_E',1.74E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_HET_E',1.43E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_GEO_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_HET_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_NGA_N',6.08E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_DST_N',3.68E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_KER_N',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_LPG_N',2.70E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_BIO_N',1.85E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_SOL_N',3.15E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_1_N',3.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_2_N',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_3_N',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_HET_N',1.08E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_NGA_N',2.67E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_DST_N',1.62E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_KER_N',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_LPG_N',8.62E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_BIO_N',8.11E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_SOL_N',1.38E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_1_N',8.02E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_2_N',7.45E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_3_N',1.49E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_HET_N',4.74E+01,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_NGA_E',0.91*1.962E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HP_NGA_E',0.91*5.325E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_DST_E',0.91*1.107E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_LPG_E',0.91*3.698E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_RES_ELC_E',0.91*4.743E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HP_ELC_E',0.91*3.162E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HEX_HET_E',0.91*3.969E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HEX_GEO_E',0.91*1.605E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ABS_NGA_E',0.91*1.911E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_CHL_DST_E',0.91*1.296E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_CCL_ELC_CNT_E',0.91*6.936E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_AHP_ELC_E',0.91*4.329E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ROOM_ELC_E',0.91*1.437E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ROOF_ELC_E',0.91*4.478E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_NGA_E',0.91*6.211E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_DST_E',0.91*1.254E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_LPG_E',0.91*1.380E-02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_ELC_E',0.91*1.151E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_HET_E',0.91*1.890E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_INC_E',0.91*2.960E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SHAL_E',0.91*1.345E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_IRCHAL_E',0.91*1.759E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SFL_E',0.91*1.781E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_LFL_E',0.91*2.207E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_CFL_C_E',0.91*4.498E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_MER_E',0.91*2.698E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SOD_E',0.91*6.745E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_NGA_E',0.91*6.37E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_LPG_E',0.91*3.68E-03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_ELC_E',0.91*1.57E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_RF_RFR_ELC_E',0.91*1.97E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_OE_OFF_ELC_E',0.91*1.06E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HP_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_SH_HT_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_RES_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HP_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_SH_HEX_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HEX_GEO_E',1.45E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_ABS_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_SC_CHL_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_CCL_ELC_CNT_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_AHP_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_ROOM_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_ROOF_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_WH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_WH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_WH_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_WH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_WH_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_INC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_SHAL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_IRCHAL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_SFL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_LFL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_CFL_C_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_MER_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'COM_LG_SOD_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_CK_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_CK_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_CK_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_RF_RFR_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'COM_OE_OFF_ELC_E',0.0,'PJ','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Agriculture sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','AGR_FT_HET_E',100,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_DST_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_KER_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_LPG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_SOL_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_GEO_1_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_GEO_2_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_GEO_3_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_HET_N',100,'');
-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HT_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HP_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HT_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HT_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_RES_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HP_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HEX_HET_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HEX_GEO_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ABS_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_CHL_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_CCL_ELC_CNT_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_AHP_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ROOM_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ROOF_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_NGA_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_LPG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_HET_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_INC_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SHAL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_IRCHAL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SFL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_LFL_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_CFL_C_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_MER_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SOD_E',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_NGA_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_LPG_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_ELC_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_RF_RFR_ELC_E',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_OE_OFF_ELC_E',15,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_INC_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SHAL_STD_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_HAL_IMP_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_LFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_CFL_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_KER_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_MER_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_LG_SOD_N',5,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_COND_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_COND_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_COND_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_WPEL_BIO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_ELC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_AHP_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_HEX_HET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_WH_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_COND_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_COND_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_COND_LPG_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HEX_HET_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HP_AIR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HP_PRB_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_GEO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_DST_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_LPG_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_NGA_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_WPEL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_DST_STD_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_HP_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_HP_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ROOF_STD_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ELC_GEO_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ELC_GEO_ADV_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ROOF_ADV_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_REC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_REC_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_CNF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_CNF_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_CNT_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ROOM_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_GEO_IMP_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_ABS_NGA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_NGA_STD_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SC_NGA_IMP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_KER_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_BIO_N',17,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_OE_OFF_ELC_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_OE_OFF_ELC_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_OE_OFF_ADV_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_RF_STD_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_RF_IMP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_RF_N',10,'');
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_SLB_CI_N',15,'');

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
-- Commercial sector
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2022,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2030,20,'');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_NGA_E',2006,6.231E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_DST_E',2006,1.046E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_GSL_E',2006,6.607E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_LPG_E',2006,3.085E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_BIO_E',2006,8.208E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_GEO_E',2006,1.984E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_ELC_E',2006,2.000E+01,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_TECH',2006,147.79,'PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_ELC_E',2006,3.500E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_NGA_E',2006,3.281E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_DST_E',2006,1.987E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_GEO_E',2006,1.837E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_HET_E',2006,1.462E+01,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_NGA_E',2006,6.546E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HP_NGA_E',2006,1.777E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_DST_E',2006,3.695E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_LPG_E',2006,1.234E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_RES_ELC_E',2006,1.583E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HP_ELC_E',2006,1.055E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HEX_HET_E',2006,1.324E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HEX_GEO_E',2006,5.356E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ABS_NGA_E',2006,1.471E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_CHL_DST_E',2006,9.982E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_CCL_ELC_CNT_E',2006,5.341E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_AHP_ELC_E',2006,3.333E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ROOM_ELC_E',2006,1.106E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ROOF_ELC_E',2006,3.448E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_NGA_E',2006,6.217E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_DST_E',2006,1.255E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_LPG_E',2006,1.381E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_ELC_E',2006,1.152E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_HET_E',2006,7.568E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_INC_E',2006,2.963E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SHAL_E',2006,1.347E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_IRCHAL_E',2006,1.761E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SFL_E',2006,1.783E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_LFL_E',2006,2.210E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_CFL_C_E',2006,4.502E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_MER_E',2006,2.701E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SOD_E',2006,6.752E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_NGA_E',2006,5.739E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_LPG_E',2006,3.684E-03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_ELC_E',2006,1.575E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_RF_RFR_ELC_E',2006,1.407E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_OE_OFF_ELC_E',2006,1.058E+02,'PJ','');

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
-- Agriculture sector
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CO2',5.610E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CO2',7.407E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CO2',6.930E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CO2',6.307E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_CO2',1.000E-04,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CH4',2.000E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_CH4',3.000E+02,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_N2O',1.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_N2O',1.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_N2O',4.000E+00,'kt/PJ','');
-- Commercial sector
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CO2',5.610E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CO2',7.378E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_KER','COM_CO2',7.187E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CO2',6.307E+01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CO2',1.000E-04,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CH4',5.890E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_KER','COM_CH4',1.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CH4',5.000E+00,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CH4',3.000E+02,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_N2O',1.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_N2O',6.000E-01,'kt/PJ','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_KER','COM_N2O',6.000E-01,'kt/PJ','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','AGR_FT_NGA_E',2006,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','AGR_FT_DST_E',2006,'AGR_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_GSL','AGR_FT_GSL_E',2006,'AGR_GSL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','AGR_FT_LPG_E',2006,'AGR_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_SLB','AGR_FT_BIO_E',2006,'AGR_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','AGR_FT_GEO_E',2006,'AGR_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_SOL','AGR_FT_SOL_E',2007,'AGR_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','AGR_FT_ELC_E',2006,'AGR_ELC',0.928,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','AGR_FT_ELC_E',2006,'AGR_ELC',0.928,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','AGR_FT_ELC_E',2020,'AGR_ELC',0.950,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','AGR_FT_ELC_E',2020,'AGR_ELC',0.950,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','AGR_FT_HET_E',2007,'AGR_HET',0.909,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2006,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2010,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2020,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2050,'AGR_DEM',1.25,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2050,'AGR_DEM',1.25,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','COM_FT_NGA_E',2006,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_GSL','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_NSP','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','COM_FT_ELC_E',2006,'COM_ELC',0.929,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','COM_FT_ELC_E',2006,'COM_ELC',0.929,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','COM_FT_GEO_E',2006,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','COM_FT_HET_E',2006,'COM_HET',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_NGA','COM_FT_NGA_N',2007,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_DST','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_GSL','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_NSP','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_KER','COM_FT_KER_N',2007,'COM_KER',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_OIL_LPG','COM_FT_LPG_N',2007,'COM_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_BIO_SLB','COM_FT_BIO_N',2007,'COM_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_SOL','COM_FT_SOL_N',2007,'COM_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','COM_FT_GEO_1_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','COM_FT_GEO_2_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','UPS_GEO','COM_FT_GEO_3_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','COM_FT_HET_N',2007,'COM_HET',1.0,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_HT_NGA_E',2006,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_HP_NGA_E',2006,'COM_SH',1.900,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_HT_DST_E',2006,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_HT_LPG_E',2006,'COM_SH',0.600,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_RES_ELC_E',2006,'COM_SH',0.900,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_ELC_E',2006,'COM_SH',2.000,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_E',2006,'COM_SH',0.900,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_GEO','COM_SH_HEX_GEO_E',2006,'COM_SH',0.900,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SC_ABS_NGA_E',2006,'COM_SC',1.200,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SC_CHL_DST_E',2006,'COM_SC',0.840,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_CCL_ELC_CNT_E',2006,'COM_SC',3.600,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_AHP_ELC_E',2006,'COM_SC',3.720,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ROOM_ELC_E',2006,'COM_SC',3.600,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ROOF_ELC_E',2006,'COM_SC',3.720,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_WH_NGA_E',2006,'COM_WH',0.650,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_WH_DST_E',2006,'COM_WH',0.650,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_LPG_E',2006,'COM_WH',0.600,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_WH_ELC_E',2006,'COM_WH',0.910,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_WH_HET_E',2006,'COM_WH',1.000,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_INC_E',2006,'COM_LG',1.170,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SHAL_E',2006,'COM_LG',1.596,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_IRCHAL_E',2006,'COM_LG',2.087,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SFL_E',2006,'COM_LG',5.632,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_LFL_E',2006,'COM_LG',6.981,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_CFL_C_E',2006,'COM_LG',5.927,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_MER_E',2006,'COM_LG',3.200,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SOD_E',2006,'COM_LG',8.000,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_CK_NGA_E',2006,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_CK_LPG_E',2006,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_CK_ELC_E',2006,'COM_CK',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_RF_RFR_ELC_E',2006,'COM_RF',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_OE_OFF_ELC_E',2006,'COM_OE',1.00,'');
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_INC_N',2007,'COM_LG',1.17,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SHAL_STD_N',2007,'COM_LG',1.60,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_HAL_IMP_N',2007,'COM_LG',2.09,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SFL_N',2007,'COM_LG',5.65,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_LFL_N',2007,'COM_LG',7.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_CFL_N',2007,'COM_LG',5.94,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_KER_N',2007,'COM_LG',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_MER_N',2007,'COM_LG',3.20,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_LG_SOD_N',2007,'COM_LG',8.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_WH_DST_N',2007,'COM_WH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_WH_COND_DST_N',2007,'COM_WH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_WH_COND_DST_N',2020,'COM_WH',0.94,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_WH_COND_DST_N',2050,'COM_WH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_WH_NGA_N',2007,'COM_WH',0.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_WH_COND_NGA_N',2007,'COM_WH',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_WH_COND_NGA_N',2020,'COM_WH',0.85,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_WH_COND_NGA_N',2050,'COM_WH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_LPG_N',2007,'COM_WH',0.68,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_LPG_N',2020,'COM_WH',0.71,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_LPG_N',2050,'COM_WH',0.74,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_COND_LPG_N',2007,'COM_WH',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_COND_LPG_N',2020,'COM_WH',0.84,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_WH_COND_LPG_N',2050,'COM_WH',0.88,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_WH_WPEL_BIO_N',2007,'COM_WH',0.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_WH_WPEL_BIO_N',2020,'COM_WH',0.78,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_WH_WPEL_BIO_N',2050,'COM_WH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_WH_ELC_N',2007,'COM_WH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_WH_AHP_ELC_N',2007,'COM_WH',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_WH_AHP_ELC_N',2020,'COM_WH',3.05,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_WH_AHP_ELC_N',2050,'COM_WH',3.19,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_WH_HEX_HET_N',2007,'COM_WH',0.85,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_WH_HEX_HET_N',2020,'COM_WH',0.89,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_WH_HEX_HET_N',2050,'COM_WH',0.93,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_WH_SOL_N',2007,'COM_WH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_WH_SOL_N',2020,'COM_WH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_WH_SOL_N',2050,'COM_WH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_DST_N',2007,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_COND_DST_N',2007,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_COND_DST_N',2020,'COM_SH',0.94,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_COND_DST_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_N',2007,'COM_SH',0.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_N',2020,'COM_SH',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_N',2050,'COM_SH',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2007,'COM_SH',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2020,'COM_SH',0.85,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_N',2007,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_N',2050,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2007,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2020,'COM_SH',0.94,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2007,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2020,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2007,'COM_SH',3.30,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2020,'COM_SH',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2050,'COM_SH',4.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2007,'COM_SH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2020,'COM_SH',5.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2050,'COM_SH',5.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SH',3.30,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_WH',3.30,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SC',3.30,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_WH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SC',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SH',4.71,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_WH',4.71,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SC',4.71,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_SH',3.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_WH',3.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2007,'COM_SC',3.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_SH',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_WH',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2020,'COM_SC',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_SH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_WH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_GEO_N',2050,'COM_SC',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_DST_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_DST_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_DST_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_DST_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_DST_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_DST_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_LPG_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_LPG_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_LPG_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_NGA_SOL_N',2007,'COM_SH',0.82,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_NGA_SOL_N',2020,'COM_SH',0.86,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_SOL','COM_SH_NGA_SOL_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_SH_WPEL_N',2007,'COM_SH',0.76,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_SH_WPEL_N',2020,'COM_SH',0.79,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_SH_WPEL_N',2050,'COM_SH',0.83,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SC_DST_STD_N',2007,'COM_SC',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SC_DST_N',2016,'COM_SC',0.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_HP_STD_N',2007,'COM_SC',2.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_HP_IMP_N',2007,'COM_SC',5.28,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ROOF_STD_N',2007,'COM_SC',3.10,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ELC_GEO_IMP_N',2007,'COM_SC',3.96,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ELC_GEO_ADV_N',2010,'COM_SC',6.15,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ROOF_ADV_N',2007,'COM_SC',3.40,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_REC_N',2007,'COM_SC',3.60,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_REC_IMP_N',2010,'COM_SC',3.80,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_CNF_N',2007,'COM_SC',6.40,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_CNF_IMP_N',2016,'COM_SC',7.30,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_CNT_N',2007,'COM_SC',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SC_ROOM_N',2007,'COM_SC',3.43,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_GEO','COM_SC_GEO_IMP_N',2007,'COM_SC',4.20,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SC_ABS_NGA_N',2007,'COM_SC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SC_NGA_STD_N',2007,'COM_SC',2.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SC_NGA_IMP_N',2010,'COM_SC',2.20,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_CK_NGA_N',2007,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_KER','COM_CK_KER_N',2007,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_CK_LPG_N',2007,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_CK_DST_N',2007,'COM_CK',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_CK_ELC_N',2007,'COM_CK',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_CK_BIO_N',2007,'COM_CK',0.15,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_OE_OFF_ELC_STD_N',2007,'COM_OE',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_OE_OFF_ELC_IMP_N',2007,'COM_OE',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_OE_OFF_ADV_N',2010,'COM_OE',1.10,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_RF_STD_N',2007,'COM_RF',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_RF_IMP_N',2007,'COM_RF',1.20,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_RF_N',2010,'COM_RF',1.40,'');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'COM_HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'COM_HET',0.520,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'COM_HET',0.510,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'COM_HET',0.500,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'COM_HET',0.480,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'COM_HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2007,'COM_HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2014,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2014,'COM_HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2022,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2022,'COM_HET',0.412,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2030,'ELC_DST',0.390,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB_VIR','COM_CHP_SLB_CI_N',2030,'COM_HET',0.402,'');

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
-- Agriculture sector
INSERT INTO "Demand" VALUES ('IT',2006,'AGR_DEM',1.478E+02,'PJ','');
-- Commercial sector
INSERT INTO "Demand" VALUES ('IT',2006,'COM_SC',1.494E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_CK',7.948E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_SH',2.493E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_WH',2.088E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_LG',4.836E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_OE',1.057E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_RF',1.967E+01,'PJ','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_NGA_E',2006,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_DST_E',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_GSL_E',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_LPG_E',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_BIO_E',2006,1.52,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_GEO_E',2006,0.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'AGR_FT_SOL_E',2007,0.10,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_NGA_N',2007,1.66E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_DST_N',2007,2.48E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_KER_N',2007,2.48E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_LPG_N',2007,2.48E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_BIO_N',2007,2.82E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_SOL_N',2007,1.00E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'COM_FT_ELC_E',2006,1.50E+01,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_CI_N',2007,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N',2007,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_CC_N',2007,5.00E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_SLB_CI_N',2007,4.17E+00,'M€/PJ','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','AGR_FT_HET_E',2007,5.07,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','COM_FT_NGA_N',2007,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_FT_GEO_1_N',2007,1.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_FT_GEO_2_N',2007,1.50E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_FT_GEO_3_N',2007,3.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_FT_HET_N',2007,5.07E+00,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_INC_N',2007,6.30E-01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_SHAL_STD_N',2007,7.10E-01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_HAL_IMP_N',2007,2.93E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_SFL_N',2007,1.31E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_LFL_N',2007,3.96E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_CFL_N',2007,5.89E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_KER_N',2007,1.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_MER_N',2007,3.80E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_LG_SOD_N',2007,6.24E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_DST_N',2007,2.42E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_COND_DST_N',2007,3.60E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_NGA_N',2007,2.06E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_COND_NGA_N',2007,2.82E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_LPG_N',2007,2.26E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_COND_LPG_N',2007,2.89E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_WPEL_BIO_N',2007,5.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_ELC_N',2007,1.70E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_AHP_ELC_N',2007,1.96E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_HEX_HET_N',2007,1.50E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_SOL_N',2007,2.90E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_SOL_N',2020,2.77E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_WH_SOL_N',2050,2.65E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_DST_N',2007,5.87E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_COND_DST_N',2007,8.72E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_NGA_N',2007,4.99E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_COND_NGA_N',2007,6.84E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_LPG_N',2007,5.47E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_COND_LPG_N',2007,7.00E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HEX_HET_N',2007,2.88E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HEX_HET_N',2020,2.75E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HEX_HET_N',2050,2.63E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HP_AIR_N',2007,4.32E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HP_PRB_N',2007,6.66E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HP_N',2007,4.32E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HP_N',2020,4.12E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_HP_N',2050,3.92E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_GEO_N',2007,6.30E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_DST_SOL_N',2007,2.35E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_DST_SOL_N',2020,2.25E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_DST_SOL_N',2050,2.15E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_LPG_SOL_N',2007,2.30E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_LPG_SOL_N',2020,2.20E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_LPG_SOL_N',2050,2.10E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_NGA_SOL_N',2007,2.25E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_NGA_SOL_N',2020,2.15E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_NGA_SOL_N',2050,2.06E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SH_WPEL_N',2007,1.59E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_DST_STD_N',2007,3.90E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_DST_N',2016,2.35E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_HP_STD_N',2007,2.00E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_HP_IMP_N',2007,3.21E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ROOF_STD_N',2007,1.05E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ELC_GEO_IMP_N',2007,3.85E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ELC_GEO_ADV_N',2010,3.85E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ROOF_ADV_N',2007,9.91E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_REC_N',2007,1.91E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_REC_IMP_N',2010,2.18E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_CNF_N',2007,2.52E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_CNF_IMP_N',2016,2.78E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_CNT_N',2007,2.60E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ROOM_N',2007,3.25E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_GEO_IMP_N',2007,4.55E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_ABS_NGA_N',2007,2.35E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_NGA_STD_N',2007,3.55E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_SC_NGA_IMP_N',2010,3.95E+01,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_NGA_N',2007,1.90E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_KER_N',2007,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_LPG_N',2007,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_DST_N',2007,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_ELC_N',2007,1.80E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CK_BIO_N',2007,2.00E+02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_OE_OFF_ELC_STD_N',2007,7.39E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_OE_OFF_ELC_IMP_N',2007,7.99E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_OE_OFF_ADV_N',2010,8.49E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_RF_STD_N',2007,6.66E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_RF_IMP_N',2007,8.72E+00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_RF_N',2010,1.02E+01,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2007,1100.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2014,1050.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2022,980.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2030,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2050,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,1500.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2014,1350.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2022,1160.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2030,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2050,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2007,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2014,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2022,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2030,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2050,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2007,1870.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2014,1785.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2022,1666.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2030,1530.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2050,1350.0,'M€/PJ','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_NGA_E',2006,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_DST_E',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_GSL_E',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_LPG_E',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_BIO_E',2006,3.01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_GEO_E',2006,0.10,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'AGR_FT_SOL_E',2007,0.10,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_NGA_N',2007,3.280E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_DST_N',2007,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_KER_N',2007,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_LPG_N',2007,4.920E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_BIO_N',2007,5.576E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_SOL_N',2007,1.000E-01,'M€/PJ','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_DST_N',2007,5.87E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_COND_DST_N',2007,8.72E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_NGA_N',2007,4.99E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_COND_NGA_N',2007,6.84E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_LPG_N',2007,5.47E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_COND_LPG_N',2007,7.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_INC_N',2007,1.78E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_SHAL_STD_N',2007,9.00E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_HAL_IMP_N',2007,1.61E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_SFL_N',2007,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_LFL_N',2007,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_CFL_N',2007,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_KER_N',2007,4.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_MER_N',2007,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_LG_SOD_N',2007,1.03E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_DST_N',2007,2.42E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_COND_DST_N',2007,3.60E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_NGA_N',2007,2.06E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_COND_NGA_N',2007,2.82E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_LPG_N',2007,2.26E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_COND_LPG_N',2007,2.89E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_WPEL_BIO_N',2007,5.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_ELC_N',2007,3.40E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_AHP_ELC_N',2007,1.96E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_HEX_HET_N',2007,0.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_WH_SOL_N',2007,1.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_HEX_HET_N',2007,2.88E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_HP_AIR_N',2007,4.76E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_HP_PRB_N',2007,6.66E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_HP_N',2007,4.76E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_GEO_N',2007,6.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_DST_SOL_N',2007,7.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_LPG_SOL_N',2007,6.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_NGA_SOL_N',2007,6.00E-02,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SH_WPEL_N',2007,1.59E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_DST_STD_N',2007,4.57E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'COM_SC_DST_N',2016,3.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_HP_STD_N',2007,1.00E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_HP_IMP_N',2007,1.28E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_ROOF_STD_N',2007,6.27E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_ELC_GEO_IMP_N',2007,1.28E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'COM_SC_ELC_GEO_ADV_N',2010,1.10E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_ROOF_ADV_N',2007,4.77E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_REC_N',2007,3.23E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'COM_SC_REC_IMP_N',2010,3.20E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_CNF_N',2007,2.14E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'COM_SC_CNF_IMP_N',2016,2.15E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_CNT_N',2007,2.62E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_ROOM_N',2007,2.87E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_GEO_IMP_N',2007,3.61E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_ABS_NGA_N',2007,1.59E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_SC_NGA_STD_N',2007,3.08E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'COM_SC_NGA_IMP_N',2010,3.11E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_NGA_N',2007,2.78E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_KER_N',2007,3.33E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_LPG_N',2007,3.50E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_DST_N',2007,3.50E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_ELC_N',2007,2.22E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_CK_BIO_N',2007,4.17E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_OE_OFF_ELC_STD_N',2007,4.10E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_OE_OFF_ELC_IMP_N',2007,4.20E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'COM_OE_OFF_ADV_N',2010,4.40E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_RF_STD_N',2007,6.30E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_RF_IMP_N',2007,7.90E-01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'COM_RF_N',2010,9.20E-01,'M€/PJ','');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Commercial sector
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_MICRO_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_SLB_CI_N',31.356,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CC_N',31.356,'PJ/GW');

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
-- Commercial sector
-- Base year technologies
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HT_NGA_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HP_NGA_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HT_DST_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HT_LPG_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_RES_ELC_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HP_ELC_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HEX_HET_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HEX_GEO_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ABS_NGA_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_CHL_DST_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_CCL_ELC_CNT_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_AHP_ELC_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ROOM_ELC_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ROOF_ELC_E',2006,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_NGA_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_DST_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_LPG_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_ELC_E',2006,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_HET_E',2006,0.25,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_RF_RFR_ELC_E',2006,0.14,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_DST_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_COND_DST_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_NGA_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_COND_NGA_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_LPG_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_COND_LPG_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_WPEL_BIO_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_ELC_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_AHP_ELC_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_HEX_HET_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_WH_SOL_N',2007,0.10,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_DST_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_COND_DST_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_NGA_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_COND_NGA_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_LPG_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_COND_LPG_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HEX_HET_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HP_AIR_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HP_PRB_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HP_N',2007,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_GEO_N',2007,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_DST_SOL_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_LPG_SOL_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_NGA_SOL_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_WPEL_N',2007,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_DST_STD_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_DST_N',2016,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_HP_STD_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_HP_IMP_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ROOF_STD_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ELC_GEO_IMP_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ELC_GEO_ADV_N',2010,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ROOF_ADV_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_REC_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_REC_IMP_N',2010,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_CNF_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_CNF_IMP_N',2016,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_CNT_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ROOM_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_GEO_IMP_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_ABS_NGA_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_NGA_STD_N',2007,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SC_NGA_IMP_N',2010,0.13,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_RF_STD_N',2007,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_RF_IMP_N',2007,0.14,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_RF_N',2010,0.14,'');
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_SLB_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CC_N',2007,0.34,'');

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
-- Commercial sector
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N',2007,0.20,'');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N',2007,0.20,'');

COMMIT;