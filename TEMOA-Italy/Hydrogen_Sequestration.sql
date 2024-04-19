
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
INSERT INTO "time_period_labels" VALUES ('e','Existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','Future vintages');

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
INSERT INTO "sector_labels" VALUES ('UPS');
INSERT INTO "sector_labels" VALUES ('H2');
INSERT INTO "sector_labels" VALUES ('CCUS');

CREATE TABLE "technology_labels" (
	"tech_labels"	text,
	"tech_labels_desc"	text,
	PRIMARY KEY("tech_labels")
);
INSERT INTO "technology_labels" VALUES ('r','Resource technology');
INSERT INTO "technology_labels" VALUES ('p','Production technology');
INSERT INTO "technology_labels" VALUES ('pb','Baseload production technology');
INSERT INTO "technology_labels" VALUES ('ps','Storage production technology');

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
-- Hydrogen
INSERT INTO "technologies" VALUES ('H2_SR_NGA','p','H2','Hydrogen production - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('H2_GS_COA','p','H2','Hydrogen production - Coal gasification','');
INSERT INTO "technologies" VALUES ('H2_PO_OIL','p','H2','Hydrogen production - Heavy oil partial oxidation','');
INSERT INTO "technologies" VALUES ('H2_SR_BIO','p','H2','Hydrogen production - Solid biomass steam reforming','');
INSERT INTO "technologies" VALUES ('H2_GS_BIO','p','H2','Hydrogen production - Solid biomass gasification','');
INSERT INTO "technologies" VALUES ('H2_SR_ETH','p','H2','Hydrogen production - Ethanol steam reforming, decentralized','');
INSERT INTO "technologies" VALUES ('H2_EL_ALK','p','H2','Hydrogen production - Alkaline electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_EL_PEM','p','H2','Hydrogen production - PEM electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_EL_SOEC','p','H2','Hydrogen production - SOEC','');
INSERT INTO "technologies" VALUES ('H2_EL_AEM','p','H2','Hydrogen production - AEM electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_DMY','p','H2','Dummy - Hydrogen from electrolysis to Hydrogen','');
INSERT INTO "technologies" VALUES ('H2_SF_DMY','p','H2','Dummy - Hydrogen to Hydrogen for synfuels','');
INSERT INTO "technologies" VALUES ('H2_BL_DMY','p','H2','Fuel Tech - H2 Delivery from centralized production to blending (COMP+USTOR+TR+BLENDING+(nocosNATGASINF))-ALL','');
-- CCUS
INSERT INTO "technologies" VALUES ('CCUS_H2_SR_NGA','p','CCUS','Natural Gas Steam Reforming w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SR_NGA_LINKED','p','CCUS','LINKED tech for CCUS_H2_SR_NGA','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_COA','p','CCUS','Coal Gasification w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_COA_LINKED','p','CCUS','LINKED tech for CCUS_H2_GS_COA','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_BIO','p','CCUS','Biomass Gasification w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_BIO_LINKED','p','CCUS','LINKED tech for CCUS_H2_GS_BIO','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA','p','CCUS','Coal power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA','p','CCUS','Natural gas power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_NGA','');
INSERT INTO "technologies" VALUES ('CCUS_DAC','p','CCUS','Direct Air Capture (DAC) with chemical absorption','');
INSERT INTO "technologies" VALUES ('SNK_ELC_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
INSERT INTO "technologies" VALUES ('SNK_IND_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
INSERT INTO "technologies" VALUES ('SNK_UPS_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
INSERT INTO "technologies" VALUES ('SF_NGA_METH','p','CCUS','Methane production from H2C and CO2 (Methanation)','');
INSERT INTO "technologies" VALUES ('SF_DST_HYDR','p','CCUS','Gas oil production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_DST_COELC','p','CCUS','Gas oil production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_KER_HYDR','p','CCUS','Kerosene production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_KER_COELC','p','CCUS','Kerosene production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_DSTKER_DAC','p','CCUS','Gas oil/Kerosene production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_HYDR','p','CCUS','Methanol production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_COELC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_DAC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
INSERT INTO "technologies" VALUES ('CCUS_SNK_DGF_ON','p','CCUS','CO2 physical storage in depleted gas field, onshore','');
INSERT INTO "technologies" VALUES ('CCUS_SNK_DGF_OFF','p','CCUS','CO2 physical storage in depleted gas field, offhore','');
INSERT INTO "technologies" VALUES ('CCUS_SNK_BCKSTP','p','CCUS','CO2 storage, backstop','');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "technologies" VALUES ('DMY_H2_CCUS_TECH','p','UPS','Dummy technology to produce hydrogen',''); -- Required to satisfy the demand since 2007 in this database

CREATE TABLE "tech_ramping" (
	"tech"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
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
CREATE TABLE "tech_flex" (
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

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
-- Hydrogen and CCUS
INSERT INTO "tech_groups" VALUES ('H2_SR_NGA','');
INSERT INTO "tech_groups" VALUES ('H2_GS_COA','');
INSERT INTO "tech_groups" VALUES ('H2_PO_OIL','');
INSERT INTO "tech_groups" VALUES ('H2_SR_BIO','');
INSERT INTO "tech_groups" VALUES ('H2_GS_BIO','');
INSERT INTO "tech_groups" VALUES ('H2_SR_ETH','');
INSERT INTO "tech_groups" VALUES ('H2_EL_ALK','');
INSERT INTO "tech_groups" VALUES ('H2_EL_PEM','');
INSERT INTO "tech_groups" VALUES ('H2_EL_SOEC','');
INSERT INTO "tech_groups" VALUES ('H2_EL_AEM','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_SR_NGA','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_GS_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_GS_BIO','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_NGA','');
INSERT INTO "tech_groups" VALUES ('CCUS_DAC','');
INSERT INTO "tech_groups" VALUES ('SNK_ELC_CO2_AGG','');
INSERT INTO "tech_groups" VALUES ('SNK_IND_CO2_AGG','');
INSERT INTO "tech_groups" VALUES ('SNK_UPS_CO2_AGG','');
INSERT INTO "tech_groups" VALUES ('SF_NGA_METH','');
INSERT INTO "tech_groups" VALUES ('SF_DST_HYDR','');
INSERT INTO "tech_groups" VALUES ('SF_DST_COELC','');
INSERT INTO "tech_groups" VALUES ('SF_KER_HYDR','');
INSERT INTO "tech_groups" VALUES ('SF_KER_COELC','');
INSERT INTO "tech_groups" VALUES ('SF_DSTKER_DAC','');
INSERT INTO "tech_groups" VALUES ('SF_MEOH_HYDR','');
INSERT INTO "tech_groups" VALUES ('SF_MEOH_COELC','');
INSERT INTO "tech_groups" VALUES ('SF_MEOH_DAC','');
INSERT INTO "tech_groups" VALUES ('CCUS_SNK_DGF_ON','');
INSERT INTO "tech_groups" VALUES ('CCUS_SNK_DGF_OFF','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Hydrogen and CCUS
INSERT INTO "groups" VALUES ('H2_PROD_GRP','');
INSERT INTO "groups" VALUES ('SF_PROD_GRP','');
INSERT INTO "groups" VALUES ('CCUS_GRP','');

CREATE TABLE "TechGroupWeight" (
	"tech"		        text,
	"group_name"	    text,
	"weight"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name")
);
-- Hydrogen and CCUS
INSERT INTO "TechGroupWeight" VALUES ('H2_SR_NGA','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_GS_COA','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_PO_OIL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_SR_BIO','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_GS_BIO','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_SR_ETH','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_ALK','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_PEM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_SOEC','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_AEM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_SR_NGA','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_COA','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_BIO','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_NGA_METH','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DST_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DST_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_KER_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_KER_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DSTKER_DAC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_DAC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_SR_NGA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_BIO','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_ELC_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_ELC_NGA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SNK_ELC_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SNK_IND_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SNK_UPS_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_NGA_METH','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DST_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DST_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_KER_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_KER_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_DSTKER_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('SF_MEOH_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_SNK_DGF_ON','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_SNK_DGF_OFF','CCUS_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name","regions")
);
CREATE TABLE "MaxActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
CREATE TABLE "MinCapacityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
CREATE TABLE "MaxCapacityGroup" (
	"regions"	text,
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
CREATE TABLE "commodity_labels" (
	"comm_labels"	text,
	"comm_labels_desc"	text,
	PRIMARY KEY("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','Physical commodity');
INSERT INTO "commodity_labels" VALUES ('d','Demand commodity');
INSERT INTO "commodity_labels" VALUES ('e','Emission commodity');

CREATE TABLE "commodities" (
	"comm_name"	text,
	"flag"	text,
	"comm_desc"	text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("flag") REFERENCES "commodity_labels"("comm_labels")
);
-- Hydrogen
INSERT INTO "commodities" VALUES('H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('H2_EL','p','Hydrogen from electrolysis');
INSERT INTO "commodities" VALUES('H2_EL_SOEC','p','Hydrogen from SOEC');
INSERT INTO "commodities" VALUES('H2_BL','p','Hydrogen for blending');
INSERT INTO "commodities" VALUES('H2_SF','p','Hydrogen for synfuels production');
-- CCUS
INSERT INTO "commodities" VALUES('SNK_CO2','p','Captured CO2 for storage/utilization - Physical');
INSERT INTO "commodities" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "commodities" VALUES('DMY_OUT','d','');
INSERT INTO "commodities" VALUES('BIO_SLB','p','');
INSERT INTO "commodities" VALUES('COA_HCO','p','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_CO2','e','');
INSERT INTO "commodities" VALUES('ELC_COA','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('GAS_ETH','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('OIL_HFO','p','');
INSERT INTO "commodities" VALUES('SNK_ELC_CO2','p','');
INSERT INTO "commodities" VALUES('SNK_IND_CO2','p','');
INSERT INTO "commodities" VALUES('SNK_UPS_CO2','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
INSERT INTO "commodities" VALUES('SYN_KER','p','');
INSERT INTO "commodities" VALUES('SYN_MET','p','');
INSERT INTO "commodities" VALUES('SYN_NGA','p','');
INSERT INTO "commodities" VALUES('TOT_CO2','e','');
INSERT INTO "commodities" VALUES('TRA_CO2','e','');
INSERT INTO "commodities" VALUES('UPS_CO2','e','');
INSERT INTO "commodities" VALUES('ethos','p','');

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
-- Hydrogen
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_NGA','H2_SR_NGA',0.97,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SR_NGA',0.03,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'COA_HCO','H2_GS_COA',0.85,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_GS_COA',0.15,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'OIL_HFO','H2_PO_OIL',0.95,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_PO_OIL',0.05,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'BIO_SLB','H2_SR_BIO',0.97,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SR_BIO',0.03,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'BIO_SLB','H2_GS_BIO',0.94,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_GS_BIO',0.06,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_ETH','H2_SR_ETH',0.94,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_SR_ETH',0.06,'Elaboration of data from JRC-EU-TIMES');
-- CCUS
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'GAS_NGA','CCUS_H2_SR_NGA',0.97,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_SR_NGA',0.03,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'COA_HCO','CCUS_H2_GS_COA',0.99,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_GS_COA',0.01,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'BIO_SLB','CCUS_H2_GS_BIO',0.93,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_GS_BIO',0.07,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_DST','CCUS_DAC',0.1786,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'HET','CCUS_DAC',0.8214,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'H2_SF','SF_NGA_METH',0.0223,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'SNK_CO2','SF_NGA_METH',0.9777,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_NGA_METH',0.0218,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'SNK_CO2','SF_NGA_METH',0.9782,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'H2_SF','SF_NGA_METH',0.0213,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'SNK_CO2','SF_NGA_METH',0.9787,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_DST_HYDR',0.0170,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_DST_HYDR',0.9830,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_DST_COELC',0.0305,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_DST_COELC',0.9695,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_DST_COELC',0.0241,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_DST_COELC',0.9759,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_KER_HYDR',0.0176,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_KER_HYDR',0.9824,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_KER_COELC',0.0316,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_KER_COELC',0.9684,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_KER_COELC',0.0250,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_KER_COELC',0.9750,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_MEOH_HYDR',0.0173,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_MEOH_HYDR',0.9827,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_MEOH_COELC',0.0305,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_MEOH_COELC',0.9695,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_MEOH_COELC',0.0246,'JRC-EU-TIMES');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'SNK_CO2','SF_MEOH_COELC',0.9754,'JRC-EU-TIMES');

CREATE TABLE "TechInputSplitAverage" (
	"regions"	TEXT,
	"periods"	integer,
	"input_comm"	text,
	"tech"	text,
	"ti_split"	real,
	"ti_split_notes"	text,
	PRIMARY KEY("regions","periods","input_comm","tech"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
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
CREATE TABLE "RampDown" (
	"regions"	text,
	"tech"	text,
	"ramp_down" real,
	PRIMARY KEY("regions", "tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "RampUp" (
	"regions"	text,
	"tech"	text,
	"ramp_up" real,
	PRIMARY KEY("regions", "tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
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
-- CCUS, Capture
INSERT INTO "MaxActivity" VALUES ('IT',2007,'SNK_IND_CO2_AGG',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'SNK_IND_CO2_AGG',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'SNK_IND_CO2_AGG',20,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'SNK_IND_CO2_AGG',70,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'SNK_IND_CO2_AGG',220,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'SNK_IND_CO2_AGG',680,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'SNK_IND_CO2_AGG',2080,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'SNK_IND_CO2_AGG',6400,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'SNK_UPS_CO2_AGG',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'SNK_UPS_CO2_AGG',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'SNK_UPS_CO2_AGG',20,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'SNK_UPS_CO2_AGG',70,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'SNK_UPS_CO2_AGG',220,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'SNK_UPS_CO2_AGG',680,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'SNK_UPS_CO2_AGG',2100,'kt','TIMES-Italy');
-- CCUS, Storage
INSERT INTO "MaxActivity" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'CCUS_SNK_DGF_ON',10,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'CCUS_SNK_DGF_ON',100,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'CCUS_SNK_DGF_ON',760,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'CCUS_SNK_DGF_ON',2830,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'CCUS_SNK_DGF_ON',10510,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'CCUS_SNK_DGF_ON',27000,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',0,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'CCUS_SNK_DGF_OFF',1,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'CCUS_SNK_DGF_OFF',20,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'CCUS_SNK_DGF_OFF',160,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'CCUS_SNK_DGF_OFF',870,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'CCUS_SNK_DGF_OFF',4680,'kt','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'CCUS_SNK_DGF_OFF',18000,'kt','TIMES-Italy');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Hydrogen
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SR_NGA',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_GS_COA',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_PO_OIL',25,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SR_BIO',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_GS_BIO',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SR_ETH',10,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_BL_DMY',30,'Elaboration of data from JRC-EU-TIMES');
-- CCUS
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SR_NGA',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SR_NGA_LINKED',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_GS_COA',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_GS_COA_LINKED',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_GS_BIO',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_GS_BIO_LINKED',20,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_COA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_COA_LINKED',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_NGA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_NGA_LINKED',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_DAC',25,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_NGA_METH',25,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DST_HYDR',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DST_COELC',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_KER_HYDR',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_KER_COELC',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DSTKER_DAC',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_HYDR',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_COELC',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_DAC',20,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_SNK_DGF_ON',10,'JRC-EU-TIMES');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_SNK_DGF_OFF',10,'JRC-EU-TIMES');

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
-- Hydrogen
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_ALK',2020,8,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_ALK',2030,11,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_ALK',2050,14,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_PEM',2020,7,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_PEM',2030,8,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_PEM',2050,14,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_SOEC',2020,2,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_SOEC',2030,5,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_SOEC',2050,10,'Elaboration of data from JRC-EU-TIMES');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_EL_AEM',2050,10,'Elaboration of data from JRC-EU-TIMES');

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
-- Hydrogen
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2014,'H2',56.10/0.63,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2025,'H2',56.10/0.66,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SR_NGA',2030,'H2',56.10/0.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_GS_COA',2014,'H2',101.16/0.56,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_GS_COA',2025,'H2',101.16/0.56,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_GS_COA',2030,'H2',101.16/0.68,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','OIL_HFO','H2_PO_OIL',2014,'H2',79.55/0.73,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_SR_BIO',2014,'H2',0.0001/0.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_GS_BIO',2014,'H2',0.0001/0.42,'kt/PJ','');
-- CCUS
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',56.10/0.55*0.20,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',56.10/0.55*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',56.10/0.63*0.20,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',56.10/0.63*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_GS_COA',2020,'H2',101.16/0.56*0.20,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_GS_COA',2020,'H2',101.16/0.56*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_GS_COA',2030,'H2',101.16/0.60*0.20,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_GS_COA',2030,'H2',101.16/0.60*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',-112.00/0.51*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',112.00/0.51*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-101.16/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2030,'ELC_CEN',-101.16/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',101.16/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2030,'ELC_CEN',101.16/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-56.10/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-56.10/0.55*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',56.10/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',56.10/0.55*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-74.07,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-71.87,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',-69.30,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ethos','CCUS_SNK_BCKSTP',2007,'DMY_OUT',-1.0,'','');

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
-- Hydrogen
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SR_NGA',2014,'H2',0.63,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SR_NGA',2014,'H2',0.63,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SR_NGA',2025,'H2',0.66,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SR_NGA',2025,'H2',0.66,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SR_NGA',2030,'H2',0.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SR_NGA',2030,'H2',0.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_GS_COA',2014,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_GS_COA',2014,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_GS_COA',2025,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_GS_COA',2025,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_GS_COA',2030,'H2',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_GS_COA',2030,'H2',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_PO_OIL',2014,'H2',0.73,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','H2_PO_OIL',2014,'H2',0.73,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SR_BIO',2014,'H2',0.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_SR_BIO',2014,'H2',0.71,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_GS_BIO',2014,'H2',0.32,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_GS_BIO',2014,'H2',0.32,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SR_ETH',2014,'H2',0.36,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_ETH','H2_SR_ETH',2014,'H2',0.36,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_ALK',2020,'H2_EL',0.62,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_ALK',2020,'H2_EL',0.62,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_ALK',2030,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_ALK',2030,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_ALK',2050,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_ALK',2050,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_PEM',2020,'H2_EL',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_PEM',2020,'H2_EL',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_PEM',2025,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_PEM',2025,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_PEM',2050,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_PEM',2050,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_SOEC',2020,'H2_EL_SOEC',0.80,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_SOEC',2020,'H2_EL_SOEC',0.80,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_SOEC',2030,'H2_EL_SOEC',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_SOEC',2030,'H2_EL_SOEC',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_SOEC',2050,'H2_EL_SOEC',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_SOEC',2050,'H2_EL_SOEC',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_EL_AEM',2050,'H2_EL',0.59,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_EL_AEM',2050,'H2_EL',0.59,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','H2_DMY',2014,'H2',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2','H2_SF_DMY',2014,'H2_SF',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2','H2_BL_DMY',2020,'H2_BL',1.00,'PJ/PJ');
-- CCUS
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SR_NGA',2020,'H2',0.55,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SR_NGA',2020,'H2',0.55,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SR_NGA',2030,'H2',0.63,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SR_NGA',2030,'H2',0.63,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_GS_COA',2020,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_GS_COA',2020,'H2',0.56,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_GS_COA',2030,'H2',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_GS_COA',2030,'H2',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_GS_BIO',2020,'H2',0.51,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','CCUS_H2_GS_BIO',2020,'H2',0.51,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_SR_NGA_LINKED',2020,'SNK_CO2',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_GS_COA_LINKED',2020,'SNK_CO2',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_GS_BIO_LINKED',2020,'SNK_CO2',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',0.32,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',0.35,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',0.48,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',0.55,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_NGA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SNK_ELC_CO2','SNK_ELC_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
INSERT INTO "Efficiency" VALUES ('IT','SNK_IND_CO2','SNK_IND_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
INSERT INTO "Efficiency" VALUES ('IT','SNK_UPS_CO2','SNK_UPS_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_NGA_METH',2020,'SYN_NGA',0.01743,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_NGA_METH',2020,'SYN_NGA',0.01743,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_NGA_METH',2030,'SYN_NGA',0.01744,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_NGA_METH',2030,'SYN_NGA',0.01744,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_NGA_METH',2050,'SYN_NGA',0.01745,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_NGA_METH',2050,'SYN_NGA',0.01745,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_DST_HYDR',2025,'SYN_DST',0.01327,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_DST_HYDR',2025,'SYN_DST',0.01327,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_DST_COELC',2025,'SYN_DST',0.01309,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_DST_COELC',2025,'SYN_DST',0.01309,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_DST_COELC',2030,'SYN_DST',0.01318,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_DST_COELC',2030,'SYN_DST',0.01318,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_KER_HYDR',2025,'SYN_KER',0.01374,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_KER_HYDR',2025,'SYN_KER',0.01374,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_KER_COELC',2025,'SYN_KER',0.01354,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_KER_COELC',2025,'SYN_KER',0.01354,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_KER_COELC',2030,'SYN_KER',0.01364,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_KER_COELC',2030,'SYN_KER',0.01364,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',0.33,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',0.33,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_SF','SF_MEOH_HYDR',2025,'SYN_MET',0.01418,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_MEOH_HYDR',2025,'SYN_MET',0.01418,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_MEOH_COELC',2025,'SYN_MET',0.01399,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_MEOH_COELC',2025,'SYN_MET',0.01399,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_MEOH_COELC',2030,'SYN_MET',0.01408,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','SF_MEOH_COELC',2030,'SYN_MET',0.01408,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',0.33,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','CCUS_SNK_DGF_ON',2020,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','CCUS_SNK_DGF_OFF',2020,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_SNK_BCKSTP',2007,'DMY_OUT',1.00,'');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_KER','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');

CREATE TABLE "LinkedTechs" (
	"primary_region"	text,
	"primary_tech"	text,
	"emis_comm" text,
 	"LINKED_tech"	text,
	"tech_LINKED_notes"	text,
	FOREIGN KEY("primary_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("LINKED_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name"),
	PRIMARY KEY("primary_region","primary_tech", "emis_comm")
);
-- CCUS
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_SR_NGA','SNK_CO2_EM','CCUS_H2_SR_NGA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_GS_COA','SNK_CO2_EM','CCUS_H2_GS_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_GS_BIO','SNK_CO2_EM','CCUS_H2_GS_BIO_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_COA','SNK_CO2_EM','CCUS_ELC_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_NGA','SNK_CO2_EM','CCUS_ELC_NGA_LINKED','');

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
-- Hydrogen
INSERT INTO "DiscountRate" VALUES ('IT','H2_SR_NGA',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_GS_COA',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_PO_OIL',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_SR_BIO',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_GS_BIO',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_SR_ETH',2014,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_EL_ALK',2020,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_EL_PEM',2020,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_EL_SOEC',2020,0.08,'');
INSERT INTO "DiscountRate" VALUES ('IT','H2_EL_AEM',2050,0.08,'');
-- CCUS
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_SR_NGA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_GS_COA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_GS_BIO',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_COA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_NGA',2020,0.10,'');

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
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Driver" VALUES('IT',2006,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2006,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2007,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2007,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2008,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2008,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2010,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2010,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2012,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2012,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2014,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2014,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2016,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2016,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2018,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2018,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2020,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2020,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2022,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2022,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2025,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2025,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2030,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2030,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2035,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2035,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2040,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2040,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2045,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2045,'GDP',1,'');
INSERT INTO "Driver" VALUES('IT',2050,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2050,'GDP',1,'');

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
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Allocation" VALUES ('IT','DMY_OUT','GDP','');

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
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Elasticity" VALUES ('IT',2007,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'DMY_OUT',0.00,'');

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
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Demand" VALUES('IT',2006,'DMY_OUT',1E6,'PJ','');

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
-- Hydrogen
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SR_NGA',2014,0.23,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_SR_NGA',2025,0.21,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_SR_NGA',2030,0.05,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_GS_COA',2014,0.19,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_GS_COA',2025,0.19,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_GS_COA',2030,0.17,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_PO_OIL',2014,0.14,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SR_BIO',2014,0.18,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_GS_BIO',2014,1.14,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SR_ETH',2014,19.65,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
-- CCUS
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_SR_NGA',2020,0.06,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_GS_COA',2020,0.19,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_GS_BIO',2020,0.46,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_COA',2020,15,'M€/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_NGA',2020,6,'M€/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_DAC',2020,8.00E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_DAC',2030,6.40E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2050,'CCUS_DAC',2050,5.10E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2007,'SNK_IND_CO2_AGG',2007,0.15,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'SNK_UPS_CO2_AGG',2007,0.50,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DST_HYDR',2025,0.27,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DST_COELC',2025,0.33,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_KER_HYDR',2025,0.26,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_KER_COELC',2025,0.32,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DSTKER_DAC',2025,0.46,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_HYDR',2025,0.29,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_COELC',2025,0.41,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_DAC',2025,0.87,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',2020,3.67E-03,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',2020,6.27E-03,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('IT',2007,'CCUS_SNK_BCKSTP',2007,10.00,'M€/kt','');

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
-- Hydrogen
INSERT INTO "CostInvest" VALUES ('IT','H2_SR_NGA',2014,23.52,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_SR_NGA',2025,21.03,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_SR_NGA',2030,16.15,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_GS_COA',2014,16.42,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_GS_COA',2025,16.42,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_GS_COA',2030,14.65,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_PO_OIL',2014,13.69,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_SR_BIO',2014,16.47,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_GS_BIO',2014,106.84,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_GS_BIO',2020,69.60,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_SR_ETH',2014,233.99,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_ALK',2020,46.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_ALK',2030,28.42,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_ALK',2050,23.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_PEM',2020,62.62,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_PEM',2030,35.28,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_PEM',2040,25.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_PEM',2050,22.54,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_SOEC',2020,90.54,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_SOEC',2025,47.06,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_SOEC',2030,36.58,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_SOEC',2050,32.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_EL_AEM',2050,35.92,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_BL_DMY',2020,2.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_BL_DMY',2025,2.5,'M€/PJ','');
-- CCUS
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SR_NGA',2020,20.63,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_GS_COA',2020,16.24,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_GS_BIO',2020,41.51,'M€/PJ','Elaboration of data from JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_COA',2020,5542,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_COA',2030,3416,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_NGA',2020,2630,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_NGA',2050,1582,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2020,2.32,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2030,1.86,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2050,1.48,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2020,19.03,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2030,14.27,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2050,7.93,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_HYDR',2025,15.47,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_HYDR',2030,12.43,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_COELC',2025,31.57,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_COELC',2030,28.22,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_HYDR',2025,15.47,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_HYDR',2030,12.43,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_COELC',2025,31.57,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_COELC',2030,28.22,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DSTKER_DAC',2025,126.26,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_DSTKER_DAC',2030,112.86,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_HYDR',2025,26.94,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_COELC',2025,59.42,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_DAC',2025,237.68,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_SNK_DGF_ON',2020,3.3E-03,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_SNK_DGF_OFF',2020,7.0E-03,'M€/kt','JRC-EU-TIMES');

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
-- Hydrogen
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SR_NGA',2014,0.78,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SR_NGA',2030,0.68,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_GS_COA',2014,0.66,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_GS_COA',2030,0.58,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_PO_OIL',2014,0.68,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SR_BIO',2014,0.66,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_GS_BIO',2014,2.31,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_EL_ALK',2020,1.40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_EL_ALK',2030,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_EL_ALK',2050,0.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_EL_PEM',2020,1.88,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_EL_PEM',2030,1.06,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2040,'H2_EL_PEM',2040,0.77,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_EL_PEM',2050,0.68,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_EL_SOEC',2020,2.72,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_EL_SOEC',2030,1.41,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_EL_SOEC',2050,0.98,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_EL_AEM',2050,1.08,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_BL_DMY',2020,0.2,'M€/PJ','');
--CCUS
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_SR_NGA',2020,1.17,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_GS_COA',2020,0.80,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_GS_BIO',2020,2.07,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_COA',2020,125,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2035,'CCUS_ELC_COA',2035,108,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_NGA',2020,67,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2035,'CCUS_ELC_NGA',2035,60,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_DAC',2020,0.09,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_DAC',2030,0.09,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2050,'CCUS_DAC',2050,0.09,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'SF_NGA_METH',2020,0.95,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_NGA_METH',2030,0.71,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2050,'SF_NGA_METH',2050,0.40,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DST_HYDR',2025,2.85,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DST_HYDR',2030,0.33,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DST_COELC',2025,5.70,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DST_COELC',2030,0.66,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_KER_HYDR',2025,2.85,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_KER_HYDR',2030,0.33,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_KER_COELC',2025,5.70,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_KER_COELC',2030,0.66,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DSTKER_DAC',2025,22.81,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DSTKER_DAC',2030,2.63,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_HYDR',2025,1.72,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_COELC',2025,3.26,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_DAC',2025,13.06,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',2020,1.7E-04,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',2020,3.5E-04,'M€/kt','JRC-EU-TIMES');

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
-- Hydrogen
INSERT INTO "CurrencyTech" VALUES ('H2_SR_NGA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_GS_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_PO_OIL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SR_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_GS_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SR_ETH','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_BL_DMY','EUR12');
-- CCUS
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_SR_NGA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_GS_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_GS_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_COA','USD20');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_NGA','USD20');
INSERT INTO "CurrencyTech" VALUES ('SF_NGA_METH','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DST_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DST_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_KER_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_KER_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DSTKER_DAC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_DAC','EUR10');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- CCUS
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_NGA',31.536,'PJ/GW');

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
-- Hydrogen
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SR_NGA',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_GS_COA',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_PO_OIL',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SR_BIO',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_GS_BIO',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SR_ETH',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_EL_ALK',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_EL_PEM',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_EL_SOEC',2014,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_EL_AEM',2050,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_BL_DMY',2020,0.70,'Assumption');
-- CCUS
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_SR_NGA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_GS_COA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_GS_BIO',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_COA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_NGA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_DAC',2020,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_NGA_METH',2020,0.95,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DST_HYDR',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DST_COELC',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_KER_HYDR',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_KER_COELC',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DSTKER_DAC',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_HYDR',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_COELC',2025,0.90,'JRC-EU-TIMES');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_DAC',2025,0.90,'JRC-EU-TIMES');

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
CREATE TABLE "MaxResource" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);
-- CCUS
INSERT INTO "MaxResource" VALUES ('IT','CCUS_SNK_DGF_ON',3E+07,'kt','');
INSERT INTO "MaxResource" VALUES ('IT','CCUS_SNK_DGF_OFF',1E+04,'kt','');

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