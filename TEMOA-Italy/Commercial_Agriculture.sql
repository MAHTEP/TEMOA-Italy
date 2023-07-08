
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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('AGR_FT_NGA','p','AGR','Fuel technology - Natural gas','');
INSERT INTO "technologies" VALUES ('AGR_FT_DST','p','AGR','Fuel technology - Diesel','');
INSERT INTO "technologies" VALUES ('AGR_FT_GSL','p','AGR','Fuel technology - Gasoline','');
INSERT INTO "technologies" VALUES ('AGR_FT_LPG','p','AGR','Fuel technology - Liquified petroleum gas','');
INSERT INTO "technologies" VALUES ('AGR_FT_BIO','p','AGR','Fuel technology - Biofuels','');
INSERT INTO "technologies" VALUES ('AGR_FT_GEO','p','AGR','Fuel technology - Geothermal energy','');
INSERT INTO "technologies" VALUES ('AGR_FT_SOL','p','AGR','Fuel technology - Solar','');
INSERT INTO "technologies" VALUES ('AGR_FT_ELC','p','AGR','Fuel technology - Electricity','');
INSERT INTO "technologies" VALUES ('AGR_FT_HET','p','AGR','Fuel technology - Solar','');
--Base year technologies
INSERT INTO "technologies" VALUES ('AGR_TECH','p','AGR','Agriculture - Existing technology','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('COM_FT_NGA_E','p','COM','Fuel technology - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_E','p','COM','Fuel technology - Diesel - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_LPG_E','p','COM','Fuel technology - Liquified petroleum gas - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_BIO_E','p','COM','Fuel technology - Biomass - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_GEO_E','p','COM','Fuel technology - Geothermal energy - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_SOL_E','p','COM','Fuel technology - Solar - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_ELC_E','p','COM','Fuel technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_HET_E','p','COM','Fuel technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('COM_FT_NGA_N','p','COM','Fuel technology - Natural gas - New','');
INSERT INTO "technologies" VALUES ('COM_FT_DST_N','p','COM','Fuel technology - Diesel - New','');
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
INSERT INTO "technologies" VALUES ('COM_SH_HT_BIO_E','p','COM','Space heating - Heater - Biomass - Existing','');
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
INSERT INTO "technologies" VALUES ('COM_CK_BIO_E','p','COM','Cooking - Biomass - Existing','');
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
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_SOFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_H2_PEMFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Hydrogen','');

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
INSERT INTO "tech_annual" VALUES ('AGR_FT_NGA','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_DST','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_GSL','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_LPG','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_BIO','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_GEO','');
INSERT INTO "tech_annual" VALUES ('AGR_FT_SOL','');
-- Base year technologies
INSERT INTO "tech_annual" VALUES ('AGR_TECH','');
-- Commercial sector
-- Base year technologies
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
INSERT INTO "tech_annual" VALUES ('COM_CK_BIO_E','');
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
INSERT INTO "tech_annual" VALUES ('COM_CK_NGA_N','');
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
INSERT INTO "commodities" VALUES('AGR_CH4','e','Agriculture - CH4 emission');
INSERT INTO "commodities" VALUES('AGR_CO2','e','Agriculture - CO2 emission');
INSERT INTO "commodities" VALUES('AGR_N2O','e','Agriculture - N2O emission');
-- Commercial sector
INSERT INTO "commodities" VALUES('COM_SC','d','Space cooling [PJ]');
INSERT INTO "commodities" VALUES('COM_CK','d','Cooking [PJ]');
INSERT INTO "commodities" VALUES('COM_SH','d','Space heating [PJ]');
INSERT INTO "commodities" VALUES('COM_WH','d','Water heating [PJ]');
INSERT INTO "commodities" VALUES('COM_LG','d','Lighting [PJ]');
INSERT INTO "commodities" VALUES('COM_OE','d','Other electricity use [PJ]');
INSERT INTO "commodities" VALUES('COM_RF','d','Refrigeration [PJ]');
INSERT INTO "commodities" VALUES('COM_BIO','p','Biomass');
INSERT INTO "commodities" VALUES('COM_DST','p','Diesel');
INSERT INTO "commodities" VALUES('COM_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('COM_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('COM_HET','p','Heat');
INSERT INTO "commodities" VALUES('COM_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('COM_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('COM_SOL','p','Solar');
INSERT INTO "commodities" VALUES('COM_CH4','e','Commercial - CH4 emisison');
INSERT INTO "commodities" VALUES('COM_CO2','e','Commercial - CO2 emisison');
INSERT INTO "commodities" VALUES('COM_N2O','e','Commercial - N2O emisison');
-- Input commodities
INSERT INTO "commodities" VALUES('BIO_DST','p','');
INSERT INTO "commodities" VALUES('BIO_METH','p','');
INSERT INTO "commodities" VALUES('BIO_SLB','p','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_H2','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('ELC_SLB_VIR','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('GEO','p','');
INSERT INTO "commodities" VALUES('H2_BL','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('OIL_DST','p','');
INSERT INTO "commodities" VALUES('OIL_GSL','p','');
INSERT INTO "commodities" VALUES('OIL_LPG','p','');
INSERT INTO "commodities" VALUES('OIL_NSP','p','');
INSERT INTO "commodities" VALUES('SOL','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
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
-- Commercial sector
-- New technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_HP_N','COM_SC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_HP_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_HP_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_HP_N','COM_SC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_HP_N','COM_SH',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_HP_N','COM_WH',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_HP_N','COM_SC',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_SH_GEO_N','COM_SC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_GEO_N','COM_SH',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_GEO_N','COM_WH',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_SH_GEO_N','COM_SC',0.30,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_GEO_N','COM_SH',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_GEO_N','COM_WH',0.00,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_SH_GEO_N','COM_SC',0.00,'');
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
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','ELC_DST',0.65,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','COM_HET',0.35,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','ELC_DST',0.69,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','COM_HET',0.31,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','COM_HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','COM_HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','ELC_DST',0.59,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','COM_HET',0.41,'');

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
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_SLB','AGR_FT_BIO',1.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_SLB','AGR_FT_BIO',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','AGR_FT_ELC',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','AGR_FT_ELC',0.35,'');
-- Commercial sector
-- Fuel technologies
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','COM_FT_ELC_E',0.70,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_DST','COM_FT_ELC_E',0.00,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','COM_FT_ELC_E',0.35,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_DST','COM_FT_ELC_E',0.20,'');
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
-- Agriculture sector
INSERT INTO "tech_groups" VALUES ('AGR_TECH','');
INSERT INTO "tech_groups" VALUES ('AGR_FT_NGA','');
INSERT INTO "tech_groups" VALUES ('AGR_FT_DST','');
INSERT INTO "tech_groups" VALUES ('AGR_FT_GSL','');
INSERT INTO "tech_groups" VALUES ('AGR_FT_GEO','');
-- Commercial sector
INSERT INTO "tech_groups" VALUES ('COM_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_BIO_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_GEO_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_GEO_1_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_GEO_2_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_GEO_3_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_FT_SOL_E','');
INSERT INTO "tech_groups" VALUES ('COM_FT_SOL_N','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HP_NGA_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_DST_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_LPG_E','');
INSERT INTO "tech_groups" VALUES ('COM_SH_HT_BIO_E','');
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
INSERT INTO "tech_groups" VALUES ('COM_CK_BIO_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_E','');
INSERT INTO "tech_groups" VALUES ('COM_CK_NGA_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_LPG_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_DST_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_ELC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CK_BIO_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_SLB_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_H2_PEMFC_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Agriculture sector
INSERT INTO "groups" VALUES ('AGR_GRP','');
INSERT INTO "groups" VALUES ('AGR_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('AGR_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('AGR_FT_GSL_GRP','');
-- Commercial sector
INSERT INTO "groups" VALUES ('COM_FT_BIO_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_DST_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_GEO_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_LPG_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('COM_FT_SOL_GRP','');
INSERT INTO "groups" VALUES ('COM_SH_GRP','');
INSERT INTO "groups" VALUES ('COM_WH_GRP','');
INSERT INTO "groups" VALUES ('COM_CK_GRP','');

CREATE TABLE "TechGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"weight"        	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Agriculture sector
INSERT INTO "TechGroupWeight" VALUES ('IT','AGR_TECH','AGR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','AGR_FT_DST','AGR_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','AGR_FT_GSL','AGR_FT_GSL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','AGR_FT_NGA','AGR_FT_NGA_GRP',1.0,'');
-- Commercial sector
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_BIO_E','COM_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_BIO_N','COM_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_DST_E','COM_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_DST_N','COM_FT_DST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_ELC_E','COM_FT_ELC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_GEO_E','COM_FT_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_GEO_1_N','COM_FT_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_GEO_2_N','COM_FT_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_GEO_3_N','COM_FT_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_LPG_E','COM_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_LPG_N','COM_FT_LPG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_NGA_E','COM_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_NGA_N','COM_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_SOL_E','COM_FT_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_FT_SOL_N','COM_FT_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_COND_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_COND_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_COND_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_DST_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_DST_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_GEO_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HEX_GEO_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HEX_HET_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HEX_HET_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HP_AIR_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HP_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HP_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HP_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HP_PRB_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HT_BIO_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HT_DST_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HT_LPG_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_HT_NGA_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_LPG_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_LPG_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_NGA_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_NGA_SOL_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_RES_ELC_E','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_SH_WPEL_N','COM_SH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_AHP_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_COND_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_COND_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_COND_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_DST_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_DST_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_ELC_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_ELC_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_HET_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_HEX_HET_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_LPG_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_LPG_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_NGA_E','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_NGA_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_SOL_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_WH_WPEL_BIO_N','COM_WH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_BIO_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_BIO_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_DST_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_ELC_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_ELC_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_LPG_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_LPG_N','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_NGA_E','COM_CK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','COM_CK_NGA_N','COM_CK_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Commercial sector
INSERT INTO "MinActivityGroup" VALUES (2010,'COM_FT_ELC_GRP',292.79,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'COM_FT_ELC_GRP',306.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'COM_FT_ELC_GRP',308.78,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'COM_FT_ELC_GRP',316.74,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'COM_FT_ELC_GRP',314.14,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'COM_FT_ELC_GRP',257.39,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'COM_FT_LPG_GRP',22.72,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'COM_FT_LPG_GRP',17.81,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'COM_FT_LPG_GRP',16.74,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'COM_FT_LPG_GRP',17.40,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'COM_FT_LPG_GRP',17.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'COM_FT_LPG_GRP',17.29,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'COM_FT_NGA_GRP',324.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'COM_FT_NGA_GRP',289.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'COM_FT_NGA_GRP',248.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'COM_FT_NGA_GRP',261.19,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'COM_FT_NGA_GRP',285.39,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'COM_FT_NGA_GRP',266.79,'PJ');

CREATE TABLE "MaxActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Commercial sector
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_BIO_GRP',0.86,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_BIO_GRP',2.33,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_BIO_GRP',3.51,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_BIO_GRP',3.89,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_BIO_GRP',3.92,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_BIO_GRP',4.09,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_DST_GRP',14.81,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_DST_GRP',12.41,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_DST_GRP',10.94,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_DST_GRP',8.24,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_DST_GRP',6.31,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_DST_GRP',4.97,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_ELC_GRP',323.61,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_ELC_GRP',338.80,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_ELC_GRP',341.28,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_ELC_GRP',350.08,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_ELC_GRP',347.20,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_ELC_GRP',284.48,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_GEO_GRP',5.16,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_GEO_GRP',5.16,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_GEO_GRP',5.04,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_GEO_GRP',5.22,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_GEO_GRP',5.28,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_GEO_GRP',5.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_LPG_GRP',25.12,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_LPG_GRP',19.68,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_LPG_GRP',18.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_LPG_GRP',19.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_LPG_GRP',18.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_LPG_GRP',19.11,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_NGA_GRP',358.70,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_NGA_GRP',319.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_NGA_GRP',275.01,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_NGA_GRP',288.69,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_NGA_GRP',315.43,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_NGA_GRP',294.87,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'COM_FT_SOL_GRP',1.07,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'COM_FT_SOL_GRP',1.42,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'COM_FT_SOL_GRP',1.62,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'COM_FT_SOL_GRP',1.80,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'COM_FT_SOL_GRP',1.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'COM_FT_SOL_GRP',1.90,'PJ');

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
-- Commercial sector
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_ELC','COM_SH_GRP',0.02,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2025,'COM_ELC','COM_SH_GRP',0.12,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_SH_GRP',0.12,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_ELC','COM_WH_GRP',0.30,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_WH_GRP',0.28,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'COM_ELC','COM_CK_GRP',0.15,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'COM_ELC','COM_CK_GRP',0.30,'');

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
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_DST','AGR_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_DST','AGR_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_DST','AGR_FT_DST_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_DST','AGR_FT_DST_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_MET','AGR_FT_GSL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_MET','AGR_FT_GSL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_MET','AGR_FT_GSL_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_MET','AGR_FT_GSL_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','AGR_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','AGR_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','AGR_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','AGR_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','AGR_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','AGR_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','AGR_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','AGR_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','AGR_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','AGR_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','AGR_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','AGR_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','AGR_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','AGR_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_NGA','AGR_GRP',4.97E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_DST','AGR_GRP',7.52E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_GSL','AGR_GRP',4.34E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_LPG','AGR_GRP',2.24E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_BIO','AGR_GRP',1.97E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_ELC','AGR_GRP',1.55E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_HET','AGR_GRP',1.09E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_GEO','AGR_GRP',2.50E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'AGR_SOL','AGR_GRP',1.75E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_NGA','AGR_GRP',4.48E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_DST','AGR_GRP',7.52E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_GSL','AGR_GRP',4.47E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_LPG','AGR_GRP',2.23E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_BIO','AGR_GRP',2.03E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_ELC','AGR_GRP',1.60E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_HET','AGR_GRP',3.05E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_GEO','AGR_GRP',2.57E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2008,'AGR_SOL','AGR_GRP',2.27E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_NGA','AGR_GRP',4.65E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_DST','AGR_GRP',7.49E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_GSL','AGR_GRP',3.66E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_LPG','AGR_GRP',2.25E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_BIO','AGR_GRP',4.78E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_ELC','AGR_GRP',1.66E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_HET','AGR_GRP',2.63E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_GEO','AGR_GRP',1.90E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2010,'AGR_SOL','AGR_GRP',4.08E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_NGA','AGR_GRP',4.63E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_DST','AGR_GRP',7.38E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_GSL','AGR_GRP',3.41E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_LPG','AGR_GRP',2.10E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_BIO','AGR_GRP',6.11E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_ELC','AGR_GRP',1.80E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_HET','AGR_GRP',6.44E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_GEO','AGR_GRP',1.37E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2012,'AGR_SOL','AGR_GRP',5.81E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_NGA','AGR_GRP',4.66E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_DST','AGR_GRP',7.41E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_GSL','AGR_GRP',3.21E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_LPG','AGR_GRP',1.93E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_BIO','AGR_GRP',9.97E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_ELC','AGR_GRP',1.71E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_HET','AGR_GRP',5.73E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_GEO','AGR_GRP',1.25E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'AGR_SOL','AGR_GRP',6.64E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_NGA','AGR_GRP',4.64E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_DST','AGR_GRP',7.48E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_GSL','AGR_GRP',1.10E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_LPG','AGR_GRP',7.67E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_BIO','AGR_GRP',1.22E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_ELC','AGR_GRP',1.73E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_HET','AGR_GRP',3.72E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_GEO','AGR_GRP',1.63E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2016,'AGR_SOL','AGR_GRP',7.14E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_NGA','AGR_GRP',4.72E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_DST','AGR_GRP',7.48E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_GSL','AGR_GRP',1.07E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_LPG','AGR_GRP',7.72E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_BIO','AGR_GRP',1.16E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_ELC','AGR_GRP',1.73E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_HET','AGR_GRP',4.14E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_GEO','AGR_GRP',1.64E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2018,'AGR_SOL','AGR_GRP',7.56E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_NGA','AGR_GRP',4.64E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_DST','AGR_GRP',7.36E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_GSL','AGR_GRP',1.08E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_LPG','AGR_GRP',8.58E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_BIO','AGR_GRP',1.18E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_ELC','AGR_GRP',1.85E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_HET','AGR_GRP',4.92E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_GEO','AGR_GRP',1.51E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'AGR_SOL','AGR_GRP',8.62E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_NGA','AGR_GRP',4.82E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_DST','AGR_GRP',7.66E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_GSL','AGR_GRP',1.12E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_LPG','AGR_GRP',8.93E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_BIO','AGR_GRP',1.23E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_ELC','AGR_GRP',1.93E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_HET','AGR_GRP',5.12E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_GEO','AGR_GRP',1.57E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2022,'AGR_SOL','AGR_GRP',8.97E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_NGA','AGR_GRP',5.05E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_DST','AGR_GRP',8.03E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_GSL','AGR_GRP',1.17E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_LPG','AGR_GRP',9.36E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_BIO','AGR_GRP',1.29E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_ELC','AGR_GRP',2.02E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_HET','AGR_GRP',5.36E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_GEO','AGR_GRP',1.65E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'AGR_SOL','AGR_GRP',9.39E-04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_NGA','AGR_GRP',5.51E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_DST','AGR_GRP',8.76E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_GSL','AGR_GRP',1.28E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_LPG','AGR_GRP',1.02E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_BIO','AGR_GRP',1.41E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_ELC','AGR_GRP',2.20E-01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_HET','AGR_GRP',5.85E-03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_GEO','AGR_GRP',1.80E-02,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'AGR_SOL','AGR_GRP',1.02E-03,'');
-- Commercial sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_DST','COM_FT_DST_GRP',0.94,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_DST','COM_FT_DST_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_GSL','COM_FT_DST_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_GSL','COM_FT_DST_GRP',0.16,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_NSP','COM_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_NSP','COM_FT_DST_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_DST','COM_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_DST','COM_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_DST','COM_FT_DST_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_DST','COM_FT_DST_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_DST','COM_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_DST','COM_FT_DST_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','COM_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','COM_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','COM_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','COM_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','COM_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','COM_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','COM_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','COM_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','COM_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','COM_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','COM_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','COM_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','COM_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','COM_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_NGA','COM_SH_GRP',0.91,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_NGA','COM_SH_GRP',0.92,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_HET','COM_SH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_HET','COM_SH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_BIO','COM_SH_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_BIO','COM_SH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_HET','COM_WH_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_HET','COM_WH_GRP',0.15,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COM_BIO','COM_CK_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COM_BIO','COM_CK_GRP',0.07,'');

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
-- Commercial sector
-- Base year technologies
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_NGA_E',1.767E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HP_NGA_E',4.798E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_DST_E',9.976E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_LPG_E',9.313E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HT_BIO_E',8.871E-02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_RES_ELC_E',4.273E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HP_ELC_E',2.849E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HEX_HET_E',2.312E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SH_HEX_GEO_E',4.483E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HT_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HP_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HT_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HT_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HT_BIO_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_RES_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HP_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HEX_HET_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'COM_SH_HEX_GEO_E',4.483E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ABS_NGA_E',1.722E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_CHL_DST_E',1.168E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_CCL_ELC_CNT_E',6.249E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_AHP_ELC_E',3.900E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ROOM_ELC_E',1.294E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_SC_ROOF_ELC_E',4.035E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ABS_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_CHL_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_CCL_ELC_CNT_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_AHP_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ROOM_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2020,'COM_SC_ROOF_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_NGA_E',5.595E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_DST_E',1.130E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_LPG_E',3.457E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_ELC_E',1.037E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_WH_HET_E',1.101E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_WH_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_WH_DST_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_WH_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_WH_ELC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_WH_HET_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_INC_E',2.667E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SHAL_E',1.212E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_IRCHAL_E',1.585E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SFL_E',1.604E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_LFL_E',1.989E+02,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_CFL_C_E',4.052E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_MER_E',2.431E+01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_LG_SOD_E',6.077E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_INC_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_SHAL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_IRCHAL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_SFL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_LFL_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_CFL_C_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_MER_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_LG_SOD_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_NGA_E',5.739E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_LPG_E',9.266E-01,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_BIO_E',3.397E-03,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'COM_CK_ELC_E',1.418E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_CK_NGA_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_CK_LPG_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_CK_BIO_E',0.0E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2016,'COM_CK_ELC_E',0.0E+00,'PJ','');
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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'AGR_FT_GEO',3.29,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'AGR_FT_GEO',7.30,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'AGR_FT_SOL',0.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'AGR_FT_SOL',0.50,'PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_NGA_E',310.79,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_DST_E',18.82,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_LPG_E',25.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_BIO_E',0.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_E',5.40,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_SOL_E',0.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_HET_E',9.23,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_NGA_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_LPG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_BIO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_GEO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_FT_SOL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_HET_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_NGA_N',37.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_DST_N',2.26,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_LPG_N',2.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_BIO_N',2.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_SOL_N',3.81,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_1_N',0.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_2_N',0.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_GEO_3_N',0.65,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_FT_HET_N',0.86,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_NGA_N',1640.26,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_DST_N',99.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_LPG_N',100.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_BIO_N',100.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_SOL_N',167.47,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_1_N',14.24,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_2_N',14.24,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_GEO_3_N',28.47,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'COM_FT_HET_N',37.80,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_NGA_E',6.201E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HP_NGA_E',1.683E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_DST_E',3.500E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_LPG_E',3.268E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HT_BIO_E',3.113E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_RES_ELC_E',1.499E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HP_ELC_E',9.995E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HEX_HET_E',8.111E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SH_HEX_GEO_E',1.660E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ABS_NGA_E',1.394E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_CHL_DST_E',9.457E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_CCL_ELC_CNT_E',5.060E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_AHP_ELC_E',3.158E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ROOM_ELC_E',1.048E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_SC_ROOF_ELC_E',3.267E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_NGA_E',5.773E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_DST_E',1.166E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_LPG_E',3.585E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_ELC_E',1.070E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_WH_HET_E',4.543E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_INC_E',2.667E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SHAL_E',1.212E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_IRCHAL_E',1.585E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SFL_E',1.604E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_LFL_E',1.989E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_CFL_C_E',4.052E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_MER_E',2.431E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_LG_SOD_E',6.077E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_NGA_E',5.921E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_LPG_E',9.560E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_BIO_E',3.505E-03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_CK_ELC_E',1.463E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_RF_RFR_ELC_E',1.306E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'COM_OE_OFF_ELC_E',9.823E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HP_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HT_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_RES_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HP_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HEX_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SH_HEX_GEO_E',1.660E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_ABS_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'COM_SC_CHL_DST_E',0.0,'PJ','');
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
INSERT INTO "LifetimeTech" VALUES ('IT','AGR_FT_HET',100,'');
-- Commercial sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_FT_DST_N',100,'');
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
INSERT INTO "LifetimeTech" VALUES ('IT','COM_SH_HT_BIO_E',20,'');
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
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CK_BIO_E',15,'');
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
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_H2_PEMFC_N',20,'');

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
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_NGA',2006,6.22,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_DST',2006,104.45,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_GSL',2006,0.66,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_LPG',2006,3.08,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_BIO',2006,0.03,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_GEO',2006,3.29,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_SOL',2006,0.01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_HET',2006,0.09,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_FT_ELC',2006,19.82,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','AGR_TECH',2006,137.66,'PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_NGA_E',2006,328.05,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_DST_E',2006,19.87,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_LPG_E',2006,26.49,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_BIO_E',2006,0.43,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_GEO_E',2006,5.69,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_SOL_E',2006,0.32,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_HET_E',2006,9.45,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_FT_ELC_E',2006,350.00,'PJ','');
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_NGA_E',2006,6.546E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HP_NGA_E',2006,1.777E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_DST_E',2006,3.695E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_LPG_E',2006,3.449E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HT_BIO_E',2006,3.286E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_RES_ELC_E',2006,1.583E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HP_ELC_E',2006,1.055E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HEX_HET_E',2006,8.562E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SH_HEX_GEO_E',2006,1.660E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ABS_NGA_E',2006,1.471E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_CHL_DST_E',2006,9.982E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_CCL_ELC_CNT_E',2006,5.341E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_AHP_ELC_E',2006,3.333E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ROOM_ELC_E',2006,1.106E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_SC_ROOF_ELC_E',2006,3.448E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_NGA_E',2006,6.217E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_DST_E',2006,1.255E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_LPG_E',2006,3.861E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_ELC_E',2006,1.152E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_WH_HET_E',2006,4.892E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_INC_E',2006,2.963E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SHAL_E',2006,1.347E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_IRCHAL_E',2006,1.761E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SFL_E',2006,1.783E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_LFL_E',2006,2.210E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_CFL_C_E',2006,4.502E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_MER_E',2006,2.701E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_LG_SOD_E',2006,6.752E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_NGA_E',2006,6.376E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_LPG_E',2006,1.030E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','COM_CK_BIO_E',2006,3.775E-03,'PJ','');
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
-- Agriculture sector
INSERT INTO "EmissionActivity" VALUES ('IT','AGR_CO2','BIO_METH','AGR_FT_NGA',2006,'AGR_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','AGR_CO2','H2_BL','AGR_FT_NGA',2020,'AGR_NGA',-56.10,'[kt/PJ]','');
-- Commercial sector
INSERT INTO "EmissionActivity" VALUES ('IT','COM_CO2','BIO_METH','COM_FT_NGA_N',2007,'COM_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','COM_CO2','H2_BL','COM_FT_NGA_N',2020,'COM_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','COM_CO2','BIO_DST','COM_FT_DST_N',2007,'COM_DST',-74.07,'[kt/PJ]','');

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
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CO2',74.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CO2',69.30,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CO2',63.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_CO2',0.0001,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_CH4',1.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_CH4',1.32,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_CH4',6.92,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_CH4',300.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_NGA','AGR_N2O',1.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_DST','AGR_N2O',1.32,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_GSL','AGR_N2O',6.60,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_LPG','AGR_N2O',0.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('AGR_BIO','AGR_N2O',4.00,'[t/PJ]','');
-- Commercial sector
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CO2',74.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CO2',63.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CO2',0.0001,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_CH4',1.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_CH4',1.32,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_CH4',300.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_NGA','COM_N2O',1.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_DST','COM_N2O',3.36,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_LPG','COM_N2O',0.01,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('COM_BIO','COM_N2O',4.00,'[t/PJ]','');

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
-- Agriculture sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','AGR_FT_NGA',2006,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','AGR_FT_NGA',2006,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','AGR_FT_NGA',2006,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','AGR_FT_NGA',2020,'AGR_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','AGR_FT_DST',2006,'AGR_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','AGR_FT_DST',2006,'AGR_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','AGR_FT_GSL',2006,'AGR_GSL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','AGR_FT_GSL',2006,'AGR_GSL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','AGR_FT_LPG',2006,'AGR_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','AGR_FT_BIO',2006,'AGR_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','AGR_FT_GEO',2006,'AGR_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SOL','AGR_FT_SOL',2006,'AGR_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','AGR_FT_ELC',2006,'AGR_ELC',0.93,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','AGR_FT_ELC',2006,'AGR_ELC',0.93,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','AGR_FT_ELC',2050,'AGR_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','AGR_FT_ELC',2050,'AGR_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','AGR_FT_HET',2006,'AGR_HET',0.909,'');
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
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2020,'AGR_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_NGA','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_DST','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GSL','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_LPG','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_BIO','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_ELC','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_HET','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_GEO','AGR_TECH',2022,'AGR_DEM',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','AGR_SOL','AGR_TECH',2022,'AGR_DEM',1.15,'');
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
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','COM_FT_NGA_E',2006,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','COM_FT_DST_E',2006,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','COM_FT_LPG_E',2006,'COM_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','COM_FT_ELC_E',2006,'COM_ELC',0.93,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','COM_FT_ELC_E',2006,'COM_ELC',0.93,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','COM_FT_ELC_E',2050,'COM_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','COM_FT_ELC_E',2050,'COM_ELC',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','COM_FT_BIO_E',2006,'COM_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','COM_FT_GEO_E',2006,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SOL','COM_FT_SOL_E',2006,'COM_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','COM_FT_HET_E',2006,'COM_HET',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','COM_FT_NGA_N',2007,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','COM_FT_NGA_N',2007,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','COM_FT_NGA_N',2007,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','COM_FT_NGA_N',2020,'COM_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_DST','COM_FT_DST_N',2007,'COM_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','COM_FT_LPG_N',2007,'COM_LPG',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','COM_FT_BIO_N',2007,'COM_BIO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SOL','COM_FT_SOL_N',2007,'COM_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','COM_FT_GEO_1_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','COM_FT_GEO_2_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','COM_FT_GEO_3_N',2007,'COM_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','COM_FT_HET_N',2007,'COM_HET',1.0,'');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_HT_NGA_E',2006,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_HP_NGA_E',2006,'COM_SH',1.900,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_DST','COM_SH_HT_DST_E',2006,'COM_SH',0.700,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_HT_LPG_E',2006,'COM_SH',0.600,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_BIO','COM_SH_HT_BIO_E',2006,'COM_SH',0.250,'');
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
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_CK_BIO_E',2006,'COM_CK',0.15,'');
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
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_N',2007,'COM_SH',0.65,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_NGA_N',2020,'COM_SH',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2007,'COM_SH',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2020,'COM_SH',0.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_NGA','COM_SH_COND_NGA_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_N',2007,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_LPG_N',2050,'COM_SH',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2007,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2020,'COM_SH',0.94,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_LPG','COM_SH_COND_LPG_N',2050,'COM_SH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2007,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2020,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_HET','COM_SH_HEX_HET_N',2050,'COM_SH',0.90,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2007,'COM_SH',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2020,'COM_SH',3.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_AIR_N',2050,'COM_SH',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2007,'COM_SH',4.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2020,'COM_SH',4.50,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_PRB_N',2050,'COM_SH',5.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SH',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_WH',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2007,'COM_SC',3.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SH',3.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_WH',3.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2020,'COM_SC',3.75,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SH',4.25,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_WH',4.25,'');
INSERT INTO "Efficiency" VALUES ('IT','COM_ELC','COM_SH_HP_N',2050,'COM_SC',4.25,'');
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
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'COM_HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'COM_HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'COM_HET',0.96,'PJ/PJ');

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
-- Commercial sector
INSERT INTO "DiscountRate" VALUES ('IT','COM_FT_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_FT_GEO_1_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_FT_GEO_2_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_FT_GEO_3_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_FT_HET_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_INC_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_SHAL_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_HAL_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_SFL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_LFL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_CFL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_KER_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_MER_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_LG_SOD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_DST_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_COND_DST_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_COND_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_LPG_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_COND_LPG_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_WPEL_BIO_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_ELC_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_AHP_ELC_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_HEX_HET_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_WH_SOL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_DST_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_COND_DST_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_COND_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_LPG_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_COND_LPG_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_HEX_HET_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_HP_AIR_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_HP_PRB_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_HP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_GEO_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_DST_SOL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_LPG_SOL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_NGA_SOL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SH_WPEL_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_DST_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_DST_N',2016,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_HP_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_HP_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ROOF_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ELC_GEO_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ELC_GEO_ADV_N',2010,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ROOF_ADV_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_REC_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_REC_IMP_N',2010,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_CNF_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_CNF_IMP_N',2016,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_CNT_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ROOM_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_GEO_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_ABS_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_NGA_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_SC_NGA_IMP_N',2010,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_CK_NGA_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_CK_LPG_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_CK_DST_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_CK_ELC_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_CK_BIO_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_OE_OFF_ELC_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_OE_OFF_ELC_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_OE_OFF_ADV_N',2010,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_RF_STD_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_RF_IMP_N',2007,0.40,'');
INSERT INTO "DiscountRate" VALUES ('IT','COM_RF_N',2010,0.40,'');

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
-- Commercial sector
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','COM_SC',0.700,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','COM_SC',0.100,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','COM_SC',0.110,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','COM_SC',0.075,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','COM_SC',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','COM_SC',0.015,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','day','COM_SH',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','night','COM_SH',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','summer','peak','COM_SH',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','day','COM_SH',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','night','COM_SH',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','fall','peak','COM_SH',0.042,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','day','COM_SH',0.520,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','night','COM_SH',0.068,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','winter','peak','COM_SH',0.052,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','day','COM_SH',0.138,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','night','COM_SH',0.000,'');
INSERT INTO "DemandSpecificDistribution" VALUES ('IT','spring','peak','COM_SH',0.042,'');

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
INSERT INTO "Driver" VALUES ('IT',2006,'PAGR',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PAGR',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PAGR',1.002,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PAGR',0.875,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PAGR',0.880,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PAGR',0.864,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PAGR',0.858,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PAGR',0.872,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PAGR',0.886,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PAGR',0.900,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PAGR',0.914,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PAGR',0.936,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PAGR',0.973,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PAGR',1.012,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PAGR',1.051,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PAGR',1.094,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PSER',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PSER',1.014,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PSER',1.013,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PSER',1.003,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PSER',0.992,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PSER',0.989,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PSER',1.008,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PSER',1.028,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PSER',0.994,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PSER',1.047,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PSER',1.095,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PSER',1.135,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PSER',1.159,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PSER',1.182,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PSER',1.231,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PSER',1.280,'');

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Agriculture sector
INSERT INTO "Allocation" VALUES ('IT','AGR_DEM','PAGR','');
-- Commercial sector
INSERT INTO "Allocation" VALUES ('IT','COM_SC','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_CK','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_SH','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_WH','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_LG','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_OE','PSER','');
INSERT INTO "Allocation" VALUES ('IT','COM_RF','PSER','');

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
-- Agriculture sector
INSERT INTO "Elasticity" VALUES ('IT',2007,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'AGR_DEM',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'AGR_DEM',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'AGR_DEM',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'AGR_DEM',0.40,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'AGR_DEM',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'AGR_DEM',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'AGR_DEM',0.30,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'AGR_DEM',0.30,'');
-- Commercial sector
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_SC',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_SC',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_SC',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_SC',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_SC',-1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_SC',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_SC',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_SC',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_SC',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_SC',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_SC',0.44,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_SC',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_SC',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_SC',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_CK',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_CK',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_CK',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_CK',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_CK',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_CK',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_CK',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_CK',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_CK',0.31,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_CK',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_CK',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_CK',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_SH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_SH',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_SH',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_SH',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_SH',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_SH',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_SH',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_SH',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_SH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_SH',0.44,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_SH',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_SH',0.31,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_SH',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_WH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_WH',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_WH',1.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_WH',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_WH',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_WH',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_WH',0.38,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_WH',0.31,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_WH',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_WH',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_WH',0.25,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_LG',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_LG',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_LG',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_LG',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_LG',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_LG',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_LG',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_LG',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_LG',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_LG',0.43,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_LG',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_LG',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_LG',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_OE',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_OE',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_OE',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_OE',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_OE',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_OE',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_OE',0.43,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_OE',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_OE',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_OE',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_RF',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_RF',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_RF',-2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_RF',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_RF',2.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_RF',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_RF',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_RF',0.75,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_RF',0.50,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'COM_RF',0.43,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_RF',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'COM_RF',0.35,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_RF',0.35,'');

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
INSERT INTO "Demand" VALUES ('IT',2006,'AGR_DEM',1.377E+02,'PJ','');
-- Commercial sector
INSERT INTO "Demand" VALUES ('IT',2006,'COM_SC',1.494E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_SC',1.677E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_SC',1.790E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_SC',2.036E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_SC',2.246E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_SC',2.506E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_SC',2.664E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_SC',2.737E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_SC',2.738E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_SC',2.773E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_SC',2.837E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_SC',2.970E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_SC',3.124E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_SC',3.257E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_SC',3.473E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_SC',3.551E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_CK',8.976E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_CK',9.170E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_CK',9.165E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_CK',9.119E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_CK',8.030E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_CK',9.054E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_CK',9.315E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_CK',9.499E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_CK',8.137E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_CK',9.374E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_CK',8.442E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_CK',8.558E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_CK',8.601E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_CK',8.645E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_CK',8.735E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_CK',8.824E+00,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_SH',2.616E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_SH',2.410E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_SH',3.077E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_SH',2.935E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_SH',2.761E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_SH',2.594E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_SH',2.949E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_SH',2.986E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_SH',2.947E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_SH',2.958E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_SH',2.944E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_SH',2.948E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_SH',2.940E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_SH',2.950E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_SH',2.947E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_SH',2.942E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_WH',2.405E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_WH',2.453E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_WH',2.485E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_WH',2.504E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_WH',2.568E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_WH',2.659E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_WH',2.774E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_WH',2.670E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_WH',2.602E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_WH',2.582E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_WH',2.576E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_WH',2.638E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_WH',2.668E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_WH',2.700E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_WH',2.732E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_WH',2.753E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_LG',4.836E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_LG',4.975E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_LG',4.975E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_LG',5.076E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_LG',5.185E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_LG',5.220E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_LG',5.421E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_LG',5.634E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_LG',5.634E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_LG',5.860E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_LG',6.061E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_LG',6.172E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_LG',6.216E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_LG',6.260E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_LG',6.351E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_LG',6.442E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_OE',1.057E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_OE',1.087E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_OE',1.087E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_OE',1.109E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_OE',1.133E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_OE',1.141E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_OE',1.185E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_OE',1.231E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_OE',1.231E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_OE',1.281E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_OE',1.324E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_OE',1.349E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_OE',1.358E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_OE',1.368E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_OE',1.388E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_OE',1.408E+02,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'COM_RF',1.967E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'COM_RF',2.024E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'COM_RF',2.024E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'COM_RF',2.065E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'COM_RF',2.110E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'COM_RF',2.124E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'COM_RF',2.206E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'COM_RF',2.292E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'COM_RF',2.292E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'COM_RF',2.384E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'COM_RF',2.466E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'COM_RF',2.511E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'COM_RF',2.529E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'COM_RF',2.547E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'COM_RF',2.584E+01,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'COM_RF',2.621E+01,'PJ','');

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
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_NGA',2006,2.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_DST',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_GSL',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_LPG',2006,3.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_BIO',2006,1.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'AGR_FT_GEO',2006,0.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'AGR_FT_SOL',2007,0.10,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_NGA_N',2007,1.66,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_DST_N',2007,2.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_LPG_N',2007,2.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_BIO_N',2007,1.32,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_FT_SOL_N',2007,0.10,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'COM_FT_ELC_E',2006,15.00,'M€/PJ','');
-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_CI_N',2007,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N',2007,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_NGA_CC_N',2007,5.00E-01,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'COM_CHP_SLB_CI_N',2007,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N',2020,30.56,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N',2025,16.67,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N',2030,4.86,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N',2025,13.89,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N',2030,6.94,'M€/PJ','');

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
INSERT INTO "CostInvest" VALUES ('IT','AGR_FT_HET',2007,5.07,'M€/PJ','');
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
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2020,10000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2025,7750,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2030,2250,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_H2_PEMFC_N',2025,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_H2_PEMFC_N',2030,1050,'M€/GW','');

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
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_NGA',2006,4.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_DST',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_GSL',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_LPG',2006,6.46,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_BIO',2006,2.15,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'AGR_FT_GEO',2006,0.10,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'AGR_FT_SOL',2007,0.10,'M€/PJ','');
-- Commercial sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_NGA_N',2007,3.280,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_DST_N',2007,4.920,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_LPG_N',2007,4.920,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_BIO_N',2007,2.620,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'COM_FT_SOL_N',2007,0.100,'M€/PJ','');
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
-- Commercial sector
INSERT INTO "CurrencyTech" VALUES ('COM_LG_INC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_SHAL_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_HAL_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_SFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_LFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_CFL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_KER_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_MER_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_LG_SOD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_COND_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_COND_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_COND_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_WPEL_BIO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_AHP_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_HEX_HET_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_WH_SOL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_COND_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_COND_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_COND_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_HEX_HET_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_HP_AIR_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_HP_PRB_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_HP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_GEO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_DST_SOL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_LPG_SOL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_NGA_SOL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SH_WPEL_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_DST_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_HP_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_HP_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ROOF_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ELC_GEO_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ELC_GEO_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ROOF_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_REC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_REC_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_CNF_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_CNF_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_CNT_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ROOM_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_GEO_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_ABS_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_NGA_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_SC_NGA_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CK_NGA_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CK_LPG_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CK_DST_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CK_ELC_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CK_BIO_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_OE_OFF_ELC_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_OE_OFF_ELC_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_OE_OFF_ADV_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_RF_STD_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_RF_IMP_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_RF_N','EUR05');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_SLB_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_H2_PEMFC_N','EUR20');

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
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_SLB_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_H2_PEMFC_N',31.536,'PJ/GW');

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
INSERT INTO "CapacityFactor" VALUES ('IT','COM_SH_HT_BIO_E',2006,0.30,'');
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
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_H2_PEMFC_N',2025,0.90,'');

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