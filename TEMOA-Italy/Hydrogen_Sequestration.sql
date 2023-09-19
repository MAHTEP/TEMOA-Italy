
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
INSERT INTO "time_periods" VALUES (2040,'f');
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
INSERT INTO "technologies" VALUES ('H2_SMR_CL','p','H2','Natural gas steam reforming, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_SMR_CS','p','H2','Natural gas steam reforming, centralized, small','');
INSERT INTO "technologies" VALUES ('H2_SMR_DM','p','H2','Natural gas steam reforming, decentralized, medium','');
INSERT INTO "technologies" VALUES ('H2_SMR_DS','p','H2','Natural gas steam reforming, decentralized, small','');
INSERT INTO "technologies" VALUES ('H2_COA_CL','p','H2','Coal gasification, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_COA_CM','p','H2','Coal gasification, centralized, medium','');
INSERT INTO "technologies" VALUES ('H2_HOPO','p','H2','Heavy oil partial oxidation','');
INSERT INTO "technologies" VALUES ('H2_ELALK_CL','p','H2','Alkaline electrolyzer, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_ELALK_DS','p','H2','Alkaline electrolyzer (Green WE), decentralized, small','');
INSERT INTO "technologies" VALUES ('H2_ELPEM_CL','p','H2','PEM electrolyzer, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_ELPEM_DS','p','H2','PEM electrolyzer (Green WE), decentralized, small','');
INSERT INTO "technologies" VALUES ('H2_SOEC_CL','p','H2','SOEC, centralized, large','');
INSERT INTO "technologies" VALUES ('H2_SOEC_DS','p','H2','SOEC, decentralized (Green WE), small','');
INSERT INTO "technologies" VALUES ('H2_AEM_DS','p','H2','AEM, decentralized (Green WE), small','');
INSERT INTO "technologies" VALUES ('H2_SBR_C','p','H2','Solid biomass steam reforming, centralized','');
INSERT INTO "technologies" VALUES ('H2_SBG_DS','p','H2','Solid biomass gasification, decentralized, small','');
INSERT INTO "technologies" VALUES ('H2_SBG_CM','p','H2','Solid biomass gasification, centralized, medium','');
INSERT INTO "technologies" VALUES ('H2_SER_D','p','H2','Ethanol steam reforming, decentralized','');
INSERT INTO "technologies" VALUES ('H2_DMY_CTE','p','H2','Dummy - Centralized tank H2 from electrolysis to delivery chains','');
INSERT INTO "technologies" VALUES ('H2_DMY_CUE','p','H2','Dummy - Centralized underground H2 from electrolysis to delivery chains','');
INSERT INTO "technologies" VALUES ('H2_DMY_DTE','p','H2','Dummy - Distributed tank H2 from electrolysis ready to delivery chains','');
INSERT INTO "technologies" VALUES ('H2_DMY_SYNFUELS','p','H2','Dummy technology to produce hydrogen for synfuel production',''); -- Required to put together H2_CU and H2_CT, prior to synfuels production
INSERT INTO "technologies" VALUES ('H2_IND_FT_GC','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+DP - Industrial)','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_LC1','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+LIQ+LSTORB+RTS+REFLL(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC1','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+LIQ+LSTORB+RTS+REFLG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_LC2','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+LIQ+LSTORB+RTS+REFLL(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC2','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+LIQ+LSTORB+RTS+REFLG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC3','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+TR+DP+REFGG(large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC4','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+GSTORB+RTS+REFGG (small))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GC5','p','H2','Fuel Tech - H2 Delivery from centralized production (COMP+USTOR+TR+DP+REFGG(large))','');
INSERT INTO "technologies" VALUES ('H2_BLEND','p','H2','Fuel Tech - H2 Delivery from centralized production to blending (COMP+USTOR+TR+BLENDING+(nocosNATGASINF))-ALL','');
INSERT INTO "technologies" VALUES ('H2_ELC_FT','p','H2','Fuel Tech - H2 - Power sector','');
INSERT INTO "technologies" VALUES ('H2_IND_FT_GDE','p','H2','Fuel Tech - H2 Delivery from local production through electrolysis (Local production - Industrial)','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_LD','p','H2','Fuel Tech - H2 Delivery from local production (LOCGSTORB+ONSITELIQ+REFLL (large))','');
INSERT INTO "technologies" VALUES ('H2_TRA_FT_GD','p','H2','Fuel Tech - H2 Delivery from local production (LOCGSTORB + REFGG (small))','');
-- CCUS, Hydrogen
INSERT INTO "technologies" VALUES ('CCUS_H2_SMR_CL','p','CCUS','Natural Gas Steam Reforming w/CCUS Centralized - Large','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SMR_CL_LINKED','p','CCUS','LINKED tech for CCUS_H2_SMR_CL','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SMR_CS','p','CCUS','Natural Gas Steam Reforming w/CCUS Centralized - Small','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SMR_CS_LINKED','p','CCUS','LINKED tech for CCUS_H2_SMR_CS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_COA_CL','p','CCUS','Coal Gasification w/CCUS Centralized - Large','');
INSERT INTO "technologies" VALUES ('CCUS_H2_COA_CL_LINKED','p','CCUS','LINKED tech for CCUS_H2_COA_CL','');
INSERT INTO "technologies" VALUES ('CCUS_H2_COA_CM','p','CCUS','Coal Gasification w/CCUS Centralized - Medium','');
INSERT INTO "technologies" VALUES ('CCUS_H2_COA_CM_LINKED','p','CCUS','LINKED tech for CCUS_H2_COA_CM','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SBG_CM','p','CCUS','Biomass Gasification w/CCUS Centralized - Small','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SBG_CM_LINKED','p','CCUS','LINKED tech for CCUS_H2_SBG_CM','');
-- CCUS, Power
INSERT INTO "technologies" VALUES ('CCUS_ELC_IG_COA','p','CCUS','IGCC coal w/CCUS, removal from input gas','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_IG_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_IG_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OG_COA','p','CCUS','Conventional pulverized coal w/CCUS, removal from output gas','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OG_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_OG_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_COA','p','CCUS','Conventional pulverized coal w/CCUS, oxyfueling','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_OXY_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_SOFC_COA','p','CCUS','SOFC w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_SOFC_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_SOFC_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_NGA','p','CCUS','NGCC w/CCUS, oxyfueling','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_OXY_NGA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_OXY_NGA','');
-- CCUS, Capture
INSERT INTO "technologies" VALUES ('CCUS_DAC','p','CCUS','Direct Air Capture (DAC) with chemical absorption','');
INSERT INTO "technologies" VALUES ('SNK_ELC_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
INSERT INTO "technologies" VALUES ('SNK_IND_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
INSERT INTO "technologies" VALUES ('SNK_UPS_CO2_AGG','p','CCUS','Aggregation of captured CO2 to SNK_CO2','');
-- CCUS, Synfuels
INSERT INTO "technologies" VALUES ('SF_NGA_METH','p','CCUS','Methane production from H2C and CO2 (Methanation)','');
INSERT INTO "technologies" VALUES ('SF_DST_HYDR','p','CCUS','Gas oil production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_DST_COELC','p','CCUS','Gas oil production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_KER_HYDR','p','CCUS','Kerosene production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_KER_COELC','p','CCUS','Kerosene production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_DSTKER_DAC','p','CCUS','Gas oil/Kerosene production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_HYDR','p','CCUS','Methanol production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_COELC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_DAC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
-- CCUS, Storage
INSERT INTO "technologies" VALUES ('CCUS_SNK_DGF_ON','p','CCUS','CO2 physical storage in depleted gas field, onshore','');
INSERT INTO "technologies" VALUES ('CCUS_SNK_DGF_OFF','p','CCUS','CO2 physical storage in depleted gas field, offhore','');
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
-- Hydrogen
INSERT INTO "tech_annual" VALUES ('H2_IND_FT_GC','');

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
-- Hydrogen and CCUS
INSERT INTO "tech_groups" VALUES ('H2_SMR_CL','');
INSERT INTO "tech_groups" VALUES ('H2_SMR_CS','');
INSERT INTO "tech_groups" VALUES ('H2_SMR_DM','');
INSERT INTO "tech_groups" VALUES ('H2_SMR_DS','');
INSERT INTO "tech_groups" VALUES ('H2_COA_CL','');
INSERT INTO "tech_groups" VALUES ('H2_COA_CM','');
INSERT INTO "tech_groups" VALUES ('H2_HOPO','');
INSERT INTO "tech_groups" VALUES ('H2_ELALK_CL','');
INSERT INTO "tech_groups" VALUES ('H2_ELALK_DS','');
INSERT INTO "tech_groups" VALUES ('H2_ELPEM_CL','');
INSERT INTO "tech_groups" VALUES ('H2_ELPEM_DS','');
INSERT INTO "tech_groups" VALUES ('H2_SOEC_CL','');
INSERT INTO "tech_groups" VALUES ('H2_SOEC_DS','');
INSERT INTO "tech_groups" VALUES ('H2_AEM_DS','');
INSERT INTO "tech_groups" VALUES ('H2_SBR_C','');
INSERT INTO "tech_groups" VALUES ('H2_SBG_DS','');
INSERT INTO "tech_groups" VALUES ('H2_SBG_CM','');
INSERT INTO "tech_groups" VALUES ('H2_SER_D','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_SMR_CL','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_SMR_CS','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_COA_CL','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_COA_CM','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_SBG_CM','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_IG_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_OG_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_OXY_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_SOFC_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_OXY_NGA','');
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
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"weight"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Hydrogen and CCUS
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SMR_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SMR_CS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SMR_DM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SMR_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_COA_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_COA_CM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_HOPO','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_ELALK_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_ELALK_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_ELPEM_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_ELPEM_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SOEC_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SOEC_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_AEM_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SBR_C','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SBG_DS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SBG_CM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','H2_SER_D','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SMR_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SMR_CS','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_COA_CL','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_COA_CM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SBG_CM','H2_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_NGA_METH','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DST_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DST_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_KER_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_KER_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DSTKER_DAC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_HYDR','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_COELC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_DAC','SF_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SMR_CL','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SMR_CS','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_COA_CL','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_COA_CM','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_H2_SBG_CM','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_ELC_IG_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_ELC_OG_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_ELC_OXY_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_ELC_SOFC_COA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_ELC_OXY_NGA','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SNK_ELC_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SNK_IND_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SNK_UPS_CO2_AGG','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_NGA_METH','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DST_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DST_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_KER_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_KER_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_DSTKER_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_HYDR','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_COELC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','SF_MEOH_DAC','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_SNK_DGF_ON','CCUS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','CCUS_SNK_DGF_OFF','CCUS_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name","regions")
);
CREATE TABLE "MaxActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
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
INSERT INTO "commodities" VALUES('H2_BL','d','Hydrogen from blending');
INSERT INTO "commodities" VALUES('H2_CT','p','Hydrogen, centralized production, tank storage');
INSERT INTO "commodities" VALUES('H2_CTE','p','Hydrogen from electrolysis, centralized production, tank storage');
INSERT INTO "commodities" VALUES('H2_CU','p','Hydrogen, centralized production, underground storage');
INSERT INTO "commodities" VALUES('H2_CUE','p','Hydrogen from electrolysis, centralized production, underground storage');
INSERT INTO "commodities" VALUES('H2_DT','p','Hydrogen, decentralized production, tank storage');
INSERT INTO "commodities" VALUES('H2_DTE','p','Hydrogen from electrolysis, decentralized production, tank storage');
INSERT INTO "commodities" VALUES('H2_SF','p','Hydrogen for synfuel production');
-- CCUS
INSERT INTO "commodities" VALUES('SNK_CO2','p','Captured CO2 for storage/utilization - Physical');
INSERT INTO "commodities" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "commodities" VALUES('DMY_OUT','d','');
INSERT INTO "commodities" VALUES('BIO_SLB','p','');
INSERT INTO "commodities" VALUES('COA_HCO','p','');
INSERT INTO "commodities" VALUES('COM_H2','d','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_CO2','e','');
INSERT INTO "commodities" VALUES('ELC_COA','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_H2','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('GAS_ETH','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('IND_H2','d','');
INSERT INTO "commodities" VALUES('IND_H2E','d','');
INSERT INTO "commodities" VALUES('OIL_HFO','p','');
INSERT INTO "commodities" VALUES('RES_H2','d','');
INSERT INTO "commodities" VALUES('SNK_ELC_CO2','p','');
INSERT INTO "commodities" VALUES('SNK_IND_CO2','p','');
INSERT INTO "commodities" VALUES('SNK_UPS_CO2','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
INSERT INTO "commodities" VALUES('SYN_KER','p','');
INSERT INTO "commodities" VALUES('SYN_MET','p','');
INSERT INTO "commodities" VALUES('SYN_NGA','p','');
INSERT INTO "commodities" VALUES('TOT_CO2','e','');
INSERT INTO "commodities" VALUES('TRA_CO2','e','');
INSERT INTO "commodities" VALUES('TRA_GSL','p','');
INSERT INTO "commodities" VALUES('TRA_H2G','d','');
INSERT INTO "commodities" VALUES('TRA_H2L','d','');
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
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_NGA','H2_SMR_CL',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SMR_CL',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_NGA','H2_SMR_CS',0.98,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SMR_CS',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_NGA','H2_SMR_DM',0.84,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_SMR_DM',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_NGA','H2_SMR_DS',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_SMR_DS',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'COA_HCO','H2_COA_CL',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_COA_CL',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'OIL_HFO','H2_HOPO',0.95,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_HOPO',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'BIO_SLB','H2_SBR_C',0.97,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SBR_C',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'BIO_SLB','H2_SBG_DS',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_SBG_DS',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'BIO_SLB','H2_SBG_CM',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_SBG_CM',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'GAS_ETH','H2_SER_D',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_SER_D',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CU','H2_TRA_FT_LC1',0.79,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_LC1',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'TRA_GSL','H2_TRA_FT_LC1',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CU','H2_TRA_FT_GC1',0.78,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_GC1',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'TRA_GSL','H2_TRA_FT_GC1',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CT','H2_TRA_FT_LC2',0.79,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_LC2',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'TRA_GSL','H2_TRA_FT_LC2',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CT','H2_TRA_FT_GC2',0.78,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_GC2',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'TRA_GSL','H2_TRA_FT_GC2',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CT','H2_IND_FT_GC',0.93,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_IND_FT_GC',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CT','H2_TRA_FT_GC3',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_GC3',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CU','H2_TRA_FT_GC4',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_GC4',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'TRA_GSL','H2_TRA_FT_GC4',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_CU','H2_TRA_FT_GC5',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_CEN','H2_TRA_FT_GC5',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_DT','H2_TRA_FT_LD',0.68,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_TRA_FT_LD',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'H2_DT','H2_TRA_FT_GD',0.88,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2014,'ELC_DST','H2_TRA_FT_GD',0.11,'');
-- CCUS, Hydrogen
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'GAS_NGA','CCUS_H2_SMR_CL',0.968,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_SMR_CL',0.032,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'GAS_NGA','CCUS_H2_SMR_CL',0.968,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','CCUS_H2_SMR_CL',0.032,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'GAS_NGA','CCUS_H2_SMR_CL',0.973,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','CCUS_H2_SMR_CL',0.027,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'GAS_NGA','CCUS_H2_SMR_CS',0.960,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_SMR_CS',0.040,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'GAS_NGA','CCUS_H2_SMR_CS',0.960,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','CCUS_H2_SMR_CS',0.040,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'GAS_NGA','CCUS_H2_SMR_CS',0.973,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','CCUS_H2_SMR_CS',0.027,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'COA_HCO','CCUS_H2_COA_CL',0.940,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_COA_CL',0.060,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'COA_HCO','CCUS_H2_COA_CL',0.940,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','CCUS_H2_COA_CL',0.060,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'COA_HCO','CCUS_H2_COA_CL',0.986,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','CCUS_H2_COA_CL',0.014,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'BIO_SLB','CCUS_H2_SBG_CM',0.917,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_CEN','CCUS_H2_SBG_CM',0.083,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'BIO_SLB','CCUS_H2_SBG_CM',0.927,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','CCUS_H2_SBG_CM',0.073,'');
-- CCUS, Capture
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'ELC_DST','CCUS_DAC',0.1786,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'HET','CCUS_DAC',0.8214,'');
-- CCUS, Synfuels
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'H2_SF','SF_NGA_METH',0.0223,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'SNK_CO2','SF_NGA_METH',0.9777,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_NGA_METH',0.0218,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'SNK_CO2','SF_NGA_METH',0.9782,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'H2_SF','SF_NGA_METH',0.0213,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'SNK_CO2','SF_NGA_METH',0.9787,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_DST_HYDR',0.0170,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_DST_HYDR',0.9830,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_DST_COELC',0.0305,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_DST_COELC',0.9695,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_DST_COELC',0.0241,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_DST_COELC',0.9759,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_KER_HYDR',0.0176,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_KER_HYDR',0.9824,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_KER_COELC',0.0316,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_KER_COELC',0.9684,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'H2_SF','SF_KER_COELC',0.0250,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_KER_COELC',0.9750,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'H2_SF','SF_MEOH_HYDR',0.0173,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_MEOH_HYDR',0.9827,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'ELC_CEN','SF_MEOH_COELC',0.0305,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'SNK_CO2','SF_MEOH_COELC',0.9695,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'ELC_CEN','SF_MEOH_COELC',0.0246,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'SNK_CO2','SF_MEOH_COELC',0.9754,'');

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
	`regions`	text,
	`reserve_margin`	REAL,
	PRIMARY KEY(regions),
	FOREIGN KEY(`regions`) REFERENCES regions
);
CREATE TABLE "RampDown" (
	`regions`	text,
	`tech`	text,
	`ramp_down` real,
	PRIMARY KEY("regions", "tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "RampUp" (
	`regions`	text,
	`tech`	text,
	`ramp_up` real,
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
INSERT INTO "MaxActivity" VALUES ('IT',2007,'SNK_IND_CO2_AGG',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'SNK_IND_CO2_AGG',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'SNK_IND_CO2_AGG',20,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'SNK_IND_CO2_AGG',70,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'SNK_IND_CO2_AGG',220,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'SNK_IND_CO2_AGG',680,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'SNK_IND_CO2_AGG',2080,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'SNK_IND_CO2_AGG',6400,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'SNK_UPS_CO2_AGG',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'SNK_UPS_CO2_AGG',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'SNK_UPS_CO2_AGG',20,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'SNK_UPS_CO2_AGG',70,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'SNK_UPS_CO2_AGG',220,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'SNK_UPS_CO2_AGG',680,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'SNK_UPS_CO2_AGG',2100,'kt','');
-- CCUS, Storage
INSERT INTO "MaxActivity" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'CCUS_SNK_DGF_ON',10,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'CCUS_SNK_DGF_ON',100,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'CCUS_SNK_DGF_ON',760,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'CCUS_SNK_DGF_ON',2830,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'CCUS_SNK_DGF_ON',10510,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'CCUS_SNK_DGF_ON',27000,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',0,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'CCUS_SNK_DGF_OFF',1,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'CCUS_SNK_DGF_OFF',20,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2035,'CCUS_SNK_DGF_OFF',160,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'CCUS_SNK_DGF_OFF',870,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2045,'CCUS_SNK_DGF_OFF',4680,'kt','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'CCUS_SNK_DGF_OFF',18000,'kt','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Hydrogen
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SMR_CL',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SMR_CS',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SMR_DM',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SMR_DS',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_COA_CL',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_COA_CM',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_HOPO',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SBR_C',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SBG_DS',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SBG_CM',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_SER_D',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_DMY_CTE',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_DMY_CUE',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_DMY_DTE',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_LC1',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GC1',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_LC2',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GC2',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_IND_FT_GC',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GC3',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GC4',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GC5',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_BLEND',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_IND_FT_GDE',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_LD',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','H2_TRA_FT_GD',20,'');
-- CCUS, Hydrogen
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SMR_CL',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SMR_CL_LINKED',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SMR_CS',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SMR_CS_LINKED',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_COA_CL',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_COA_CL_LINKED',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_COA_CM',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_COA_CM_LINKED',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SBG_CM',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_H2_SBG_CM_LINKED',20,'');
-- CCUS, Power
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_IG_COA',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_IG_COA_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OG_COA',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OG_COA_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_COA',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_COA_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_SOFC_COA',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_SOFC_COA_LINKED',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_NGA',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_OXY_NGA_LINKED',30,'');
-- CCUS, Capture
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_DAC',25,'');
-- CCUS, Synfuels
INSERT INTO "LifetimeTech" VALUES ('IT','SF_NGA_METH',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DST_HYDR',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DST_COELC',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_KER_HYDR',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_KER_COELC',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_DSTKER_DAC',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_HYDR',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_COELC',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','SF_MEOH_DAC',20,'');
-- CCUS, Storage
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_SNK_DGF_ON',10,'');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_SNK_DGF_OFF',10,'');

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
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_CL',2020,10,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_CL',2030,11,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_CL',2050,17,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_DS',2020,6,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_DS',2030,10,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELALK_DS',2050,11,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_CL',2020,10,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_CL',2030,10,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_CL',2050,17,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_DS',2020,3,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_DS',2030,6,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_ELPEM_DS',2050,10,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_CL',2020,3,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_CL',2030,6,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_CL',2050,11,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_DS',2020,1,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_DS',2030,4,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_SOEC_DS',2050,8,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','H2_AEM_DS',2050,11,'');

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
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CL',2014,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CL',2014,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CL',2025,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CL',2025,'H2_CU',74.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CL',2030,'H2_CU',70.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CL',2030,'H2_CU',70.1,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CS',2014,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CS',2014,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CS',2025,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CS',2025,'H2_CT',88.4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SMR_CS',2030,'H2_CT',83.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_CS',2030,'H2_CT',83.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DM',2014,'H2_DT',76.3,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DM',2014,'H2_DT',76.3,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DM',2020,'H2_DT',76.3,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DM',2020,'H2_DT',76.3,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DM',2025,'H2_DT',71.2,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DM',2025,'H2_DT',71.2,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DS',2014,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DS',2014,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DS',2025,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DS',2025,'H2_DT',101.5,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SMR_DS',2030,'H2_DT',87.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','H2_SMR_DS',2030,'H2_DT',87.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_COA_CL',2014,'H2_CU',173.9,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_COA_CL',2014,'H2_CU',173.9,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_COA_CL',2025,'H2_CU',173.9,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_COA_CL',2025,'H2_CU',173.9,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_COA_CL',2030,'H2_CU',122.8,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_COA_CL',2030,'H2_CU',122.8,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_COA_CM',2014,'H2_CU',172.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','H2_COA_CM',2014,'H2_CU',172.0,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_HOPO',2014,'H2_CT',100.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','OIL_HFO','H2_HOPO',2014,'H2_CT',100.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SBR_C',2014,'H2_CU',1.36E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_SBR_C',2014,'H2_CU',1.36E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_DST','H2_SBG_DS',2014,'H2_DT',3.00E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_SBG_DS',2014,'H2_DT',3.00E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SBG_CM',2014,'H2_CT',2.78E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_SBG_CM',2014,'H2_CT',2.78E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','H2_SBG_CM',2020,'H2_CT',1.80E-04,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','H2_SBG_CM',2020,'H2_CT',1.80E-04,'kt/PJ','');
-- CCUS, Hydrogen
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CL',2020,'H2_CU',17.31,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CL',2020,'H2_CU',17.31,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CL',2020,'H2_CU',67.96,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CL',2020,'H2_CU',67.96,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CL',2025,'H2_CU',17.31,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CL',2025,'H2_CU',17.31,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CL',2025,'H2_CU',67.96,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CL',2025,'H2_CU',67.96,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CL',2030,'H2_CU',15.94,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CL',2030,'H2_CU',15.94,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CL',2030,'H2_CU',62.60,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CL',2030,'H2_CU',62.60,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CS',2020,'H2_CT',18.79,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CS',2020,'H2_CT',18.79,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CS',2020,'H2_CT',73.77,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CS',2020,'H2_CT',73.77,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CS',2025,'H2_CT',18.79,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CS',2025,'H2_CT',18.79,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CS',2025,'H2_CT',73.77,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CS',2025,'H2_CT',73.77,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SMR_CS',2030,'H2_CT',15.94,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','GAS_NGA','CCUS_H2_SMR_CS',2030,'H2_CT',15.94,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SMR_CS',2030,'H2_CT',62.60,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','GAS_NGA','CCUS_H2_SMR_CS',2030,'H2_CT',62.60,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_COA_CL',2020,'H2_CU',36.35,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_COA_CL',2020,'H2_CU',36.35,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_COA_CL',2020,'H2_CU',142.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_COA_CL',2020,'H2_CU',142.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_COA_CL',2025,'H2_CU',36.35,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_COA_CL',2025,'H2_CU',36.35,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_COA_CL',2025,'H2_CU',142.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_COA_CL',2025,'H2_CU',142.71,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_COA_CL',2030,'H2_CU',33.27,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_COA_CL',2030,'H2_CU',33.27,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_COA_CL',2030,'H2_CU',130.61,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_COA_CL',2030,'H2_CU',130.61,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','COA_HCO','CCUS_H2_COA_CM',2020,'H2_CU',35.32,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','COA_HCO','CCUS_H2_COA_CM',2020,'H2_CU',138.68,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SBG_CM',2020,'H2_CT',-204.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','CCUS_H2_SBG_CM',2020,'H2_CT',-204.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SBG_CM',2020,'H2_CT',204.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','BIO_SLB','CCUS_H2_SBG_CM',2020,'H2_CT',204.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','ELC_CEN','CCUS_H2_SBG_CM',2025,'H2_CT',-161.03,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','UPS_CO2','BIO_SLB','CCUS_H2_SBG_CM',2025,'H2_CT',-161.03,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_CEN','CCUS_H2_SBG_CM',2025,'H2_CT',161.03,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','BIO_SLB','CCUS_H2_SBG_CM',2025,'H2_CT',161.03,'kt/PJ','');
-- CCUS, Power
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_IG_COA',2020,'ELC_CEN',-184.95,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_IG_COA',2030,'ELC_CEN',-175.41,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_IG_COA',2020,'ELC_CEN',184.95,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_IG_COA',2030,'ELC_CEN',175.41,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_OG_COA',2020,'ELC_CEN',-194.88,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_OG_COA',2030,'ELC_CEN',-181.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_OG_COA',2020,'ELC_CEN',194.88,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_OG_COA',2030,'ELC_CEN',181.59,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_OXY_COA',2020,'ELC_CEN',-206.34,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_OXY_COA',2030,'ELC_CEN',-192.27,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_OXY_COA',2020,'ELC_CEN',206.34,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_OXY_COA',2030,'ELC_CEN',192.27,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_SOFC_COA',2035,'ELC_CEN',-78.11,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_SOFC_COA',2035,'ELC_CEN',78.11,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_OXY_NGA',2030,'ELC_CEN',-96.73,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_OXY_NGA',2030,'ELC_CEN',96.73,'kt/PJ','');
-- CCUS, Capture
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
-- CCUS, Synfuels
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-74.07,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-71.87,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','TOT_CO2','ELC_CEN','SF_MEOH_DAC',2025,'SYN_MET',-69.30,'kt/PJ','');

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
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CL',2014,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CL',2014,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CL',2025,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CL',2025,'H2_CU',0.7462,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CS',2014,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CS',2014,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CS',2025,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CS',2025,'H2_CT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SMR_CS',2030,'H2_CT',0.6667,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_CS',2030,'H2_CT',0.6667,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DM',2014,'H2_DT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DM',2014,'H2_DT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DM',2020,'H2_DT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DM',2020,'H2_DT',0.6211,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DM',2025,'H2_DT',0.7463,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DM',2025,'H2_DT',0.7463,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DS',2014,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DS',2014,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DS',2025,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DS',2025,'H2_DT',0.5319,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SMR_DS',2030,'H2_DT',0.625,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','H2_SMR_DS',2030,'H2_DT',0.625,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_COA_CL',2014,'H2_CU',0.5435,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_COA_CL',2014,'H2_CU',0.5435,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_COA_CL',2025,'H2_CU',0.5435,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_COA_CL',2025,'H2_CU',0.5435,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_COA_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_COA_CL',2030,'H2_CU',0.7874,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_COA_CM',2014,'H2_CU',0.5714,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','H2_COA_CM',2014,'H2_CU',0.5714,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_HOPO',2014,'H2_CT',0.7353,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','H2_HOPO',2014,'H2_CT',0.7353,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELALK_CL',2020,'H2_CTE',0.7,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELALK_CL',2025,'H2_CTE',0.7,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELALK_CL',2030,'H2_CTE',0.71,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELALK_CL',2050,'H2_CTE',0.8,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELALK_DS',2020,'H2_DTE',0.63,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELALK_DS',2025,'H2_DTE',0.63,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELALK_DS',2030,'H2_DTE',0.65,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELALK_DS',2050,'H2_DTE',0.7,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELPEM_CL',2020,'H2_CUE',0.6,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELPEM_CL',2025,'H2_CUE',0.6,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELPEM_CL',2030,'H2_CUE',0.68,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_ELPEM_CL',2050,'H2_CUE',0.74,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELPEM_DS',2020,'H2_DTE',0.56,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELPEM_DS',2025,'H2_DTE',0.56,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELPEM_DS',2030,'H2_DTE',0.63,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_ELPEM_DS',2050,'H2_DTE',0.67,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SOEC_CL',2020,'H2_CUE',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SOEC_CL',2025,'H2_CUE',0.81,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SOEC_CL',2030,'H2_CUE',0.84,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SOEC_CL',2050,'H2_CUE',0.9,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SOEC_DS',2020,'H2_DTE',0.74,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SOEC_DS',2025,'H2_DTE',0.74,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SOEC_DS',2030,'H2_DTE',0.77,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_AEM_DS',2050,'H2_DTE',0.74,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SBR_C',2014,'H2_CU',0.7143,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_SBR_C',2014,'H2_CU',0.7143,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SBG_DS',2014,'H2_DT',0.3125,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_SBG_DS',2014,'H2_DT',0.3125,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SBG_CM',2014,'H2_CT',0.3356,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_SBG_CM',2014,'H2_CT',0.3356,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_SBG_CM',2020,'H2_CT',0.5263,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','H2_SBG_CM',2020,'H2_CT',0.5263,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_SER_D',2014,'H2_DT',0.3558,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_ETH','H2_SER_D',2014,'H2_DT',0.3558,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CTE','H2_DMY_CTE',2014,'H2_CT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CUE','H2_DMY_CUE',2014,'H2_CU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DTE','H2_DMY_DTE',2014,'H2_DT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_DMY_SYNFUELS',2014,'H2_SF',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_DMY_SYNFUELS',2014,'H2_SF',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DT','H2_BLEND',2020,'H2_BL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_BLEND',2020,'H2_BL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_BLEND',2020,'H2_BL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DT','H2_ELC_FT',2020,'ELC_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_ELC_FT',2020,'ELC_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_ELC_FT',2020,'ELC_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_IND_FT_GC',2014,'IND_H2',0.9381,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_IND_FT_GC',2014,'IND_H2',0.9381,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_LC1',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_TRA_FT_LC1',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','H2_TRA_FT_LC1',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_GC1',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_TRA_FT_GC1',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','H2_TRA_FT_GC1',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_LC2',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_TRA_FT_LC2',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','H2_TRA_FT_LC2',2014,'TRA_H2L',0.8071,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_GC2',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_TRA_FT_GC2',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','H2_TRA_FT_GC2',2014,'TRA_H2G',0.7916,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_GC3',2014,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CT','H2_TRA_FT_GC3',2014,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_GC4',2014,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_TRA_FT_GC4',2014,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('IT','TRA_GSL','H2_TRA_FT_GC4',2014,'TRA_H2G',0.9291,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','H2_TRA_FT_GC5',2014,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_CU','H2_TRA_FT_GC5',2014,'TRA_H2G',0.9173,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DTE','H2_IND_FT_GDE',2020,'IND_H2E',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_TRA_FT_GD',2014,'TRA_H2G',0.8889,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DT','H2_TRA_FT_GD',2014,'TRA_H2G',0.8889,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','H2_TRA_FT_LD',2014,'TRA_H2L',0.6887,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_DT','H2_TRA_FT_LD',2014,'TRA_H2L',0.6887,'');
-- CCUS, Hydrogen
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CL',2020,'H2_CU',0.6369,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CL',2020,'H2_CU',0.6369,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CL',2025,'H2_CU',0.6369,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CL',2025,'H2_CU',0.6369,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CL',2030,'H2_CU',0.6949,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CL',2030,'H2_CU',0.6949,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CS',2020,'H2_CT',0.5824,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CS',2020,'H2_CT',0.5824,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CS',2025,'H2_CT',0.5824,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CS',2025,'H2_CT',0.5824,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SMR_CS',2030,'H2_CT',0.6949,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','CCUS_H2_SMR_CS',2030,'H2_CT',0.6949,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_COA_CL',2020,'H2_CU',0.5316,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_COA_CL',2020,'H2_CU',0.5316,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_COA_CL',2025,'H2_CU',0.5316,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_COA_CL',2025,'H2_CU',0.5316,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_COA_CL',2030,'H2_CU',0.6086,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_COA_CL',2030,'H2_CU',0.6086,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','CCUS_H2_COA_CM',2020,'H2_CU',0.5814,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SBG_CM',2020,'H2_CT',0.4207,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','CCUS_H2_SBG_CM',2020,'H2_CT',0.4207,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','CCUS_H2_SBG_CM',2025,'H2_CT',0.5136,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','CCUS_H2_SBG_CM',2025,'H2_CT',0.5136,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_SMR_CL_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_SMR_CS_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_COA_CL_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_COA_CM_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_H2_SBG_CM_LINKED',2020,'SNK_CO2',1.00,'');
-- CCUS, Power
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_IG_COA',2020,'ELC_CEN',0.4320,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_IG_COA',2025,'ELC_CEN',0.4555,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_OG_COA',2020,'ELC_CEN',0.4100,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_OG_COA',2025,'ELC_CEN',0.4400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_OXY_COA',2020,'ELC_CEN',0.4100,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_OXY_COA',2025,'ELC_CEN',0.4400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_SOFC_COA',2035,'ELC_CEN',0.4750,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_OXY_NGA',2030,'ELC_CEN',0.5500,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_IG_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_OG_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_OXY_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_SOFC_COA_LINKED',2035,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_OXY_NGA_LINKED',2030,'SNK_ELC_CO2',1.00,'');
-- CCUS, Capture
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SNK_ELC_CO2','SNK_ELC_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
INSERT INTO "Efficiency" VALUES ('IT','SNK_IND_CO2','SNK_IND_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
INSERT INTO "Efficiency" VALUES ('IT','SNK_UPS_CO2','SNK_UPS_CO2_AGG',2007,'SNK_CO2',1.00,'kt/kt');
-- CCUS, Synfuels
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
-- CCUS, Storage
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','CCUS_SNK_DGF_ON',2020,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_CO2','CCUS_SNK_DGF_OFF',2020,'DMY_OUT',1.00,'');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'H2_BL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'COM_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'RES_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'IND_H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'IND_H2E',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'TRA_H2G',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'TRA_H2L',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_KER','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','DMY_H2_CCUS_TECH',2007,'DMY_OUT',1.00,'');

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
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_SMR_CL','SNK_CO2_EM','CCUS_H2_SMR_CL_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_SMR_CS','SNK_CO2_EM','CCUS_H2_SMR_CS_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_COA_CL','SNK_CO2_EM','CCUS_H2_COA_CL_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_COA_CM','SNK_CO2_EM','CCUS_H2_COA_CM_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_H2_SBG_CM','SNK_CO2_EM','CCUS_H2_SBG_CM_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_IG_COA','SNK_CO2_EM','CCUS_ELC_IG_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_OG_COA','SNK_CO2_EM','CCUS_ELC_OG_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_OXY_COA','SNK_CO2_EM','CCUS_ELC_OXY_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_SOFC_COA','SNK_CO2_EM','CCUS_ELC_SOFC_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','CCUS_ELC_OXY_NGA','SNK_CO2_EM','CCUS_ELC_OXY_NGA_LINKED','');

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
-- CCUS
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_SMR_CL',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_SMR_CS',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_COA_CL',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_COA_CM',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_H2_SBG_CM',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_IG_COA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_OG_COA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_OXY_COA',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_SOFC_COA',2035,0.10,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_OXY_NGA',2030,0.10,'');

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
INSERT INTO "Driver" VALUES('IT',2040,'POP',1,'');
INSERT INTO "Driver" VALUES('IT',2040,'GDP',1,'');
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
INSERT INTO "Allocation" VALUES ('IT','H2_BL','POP','');
INSERT INTO "Allocation" VALUES ('IT','COM_H2','GDP','');
INSERT INTO "Allocation" VALUES ('IT','RES_H2','POP','');
INSERT INTO "Allocation" VALUES ('IT','IND_H2','GDP','');
INSERT INTO "Allocation" VALUES ('IT','IND_H2E','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_H2G','GDP','');
INSERT INTO "Allocation" VALUES ('IT','TRA_H2L','POP','');
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
INSERT INTO "Elasticity" VALUES ('IT',2007,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'TRA_H2L',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'H2_BL',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'COM_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'RES_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_H2',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_H2E',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_H2G',1.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'TRA_H2L',1.00,'');
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
INSERT INTO "Demand" VALUES('IT',2006,'H2_BL',100,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'COM_H2',150,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'IND_H2',200,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'IND_H2E',200,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'RES_H2',75,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'TRA_H2G',300,'PJ','');
INSERT INTO "Demand" VALUES('IT',2006,'TRA_H2L',300,'PJ','');
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
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SMR_CL',2014,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_SMR_CL',2025,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_SMR_CL',2030,0.05,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SMR_CS',2014,0.14,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_SMR_CS',2025,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_SMR_CS',2030,0.05,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SMR_DM',2014,0.04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SMR_DS',2014,0.65,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_SMR_DS',2025,0.65,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_SMR_DS',2030,0.04,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_COA_CL',2014,0.16,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_COA_CL',2025,0.16,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'H2_COA_CL',2030,0.12,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_COA_CM',2014,0.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_HOPO',2014,0.14,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SBR_C',2014,0.18,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SBG_DS',2014,1.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SBG_CM',2014,0.93,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_SBG_CM',2020,0.45,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_SER_D',2014,20,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_LC1',2014,1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_LC1',2020,0.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GC1',2014,0.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_GC1',2025,0.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_LC2',2014,1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_LC2',2020,0.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GC2',2014,0.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_GC2',2025,0.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_IND_FT_GC',2014,0.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_IND_FT_GC',2020,0.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GC3',2014,0.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_GC3',2020,0.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_GC3',2025,0.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GC4',2014,0.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_GC4',2025,0.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GC5',2014,0.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_GC5',2020,0.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_GC5',2025,0.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_BLEND',2020,0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_IND_FT_GDE',2020,0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_LD',2014,1.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_LD',2020,1.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'H2_TRA_FT_LD',2025,1.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'H2_TRA_FT_GD',2014,0.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'H2_TRA_FT_GD',2020,0.1,'M€/PJ','');
-- CCUS, Hydrogen
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_SMR_CL',2020,530E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'CCUS_H2_SMR_CL',2025,530E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_H2_SMR_CL',2030,70E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_SMR_CS',2020,200E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'CCUS_H2_SMR_CS',2025,200E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_H2_SMR_CS',2030,70E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_COA_CL',2020,200E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'CCUS_H2_COA_CL',2025,200E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_H2_COA_CL',2030,130E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_COA_CM',2020,260E-03,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_H2_SBG_CM',2020,460E-03,'M€/PJ','');
-- CCUS, Power
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_IG_COA',2020,0.78,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_OG_COA',2020,1.62,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_OXY_COA',2020,0.64,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2035,'CCUS_ELC_SOFC_COA',2035,1.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_ELC_OXY_NGA',2030,0.34,'M€/PJ','');
-- CCUS, Capture
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_DAC',2020,8.00E-05,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'CCUS_DAC',2030,6.40E-05,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'CCUS_DAC',2050,5.10E-05,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'SNK_IND_CO2_AGG',2007,0.15,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'SNK_UPS_CO2_AGG',2007,0.50,'M€/kt','');
-- CCUS, Synfuels (CO2 transportation costs are included)
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DST_HYDR',2025,0.27,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DST_COELC',2025,0.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_KER_HYDR',2025,0.26,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_KER_COELC',2025,0.32,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_DSTKER_DAC',2025,0.46,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_HYDR',2025,0.29,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_COELC',2025,0.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'SF_MEOH_DAC',2025,0.87,'M€/PJ','');
-- CCUS, Storage (CO2 transportation costs are included)
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',2020,3.67E-03,'M€/kt','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',2020,6.27E-03,'M€/kt','');

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
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CL',2014,6.38,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CL',2025,6.38,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CL',2030,5.02,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CS',2014,13.69,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CS',2025,13.69,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_CS',2030,10.92,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DM',2014,15.4,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DM',2020,15.4,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DM',2025,11.95,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DS',2014,58.59,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DS',2020,52.1,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DS',2025,52.1,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SMR_DS',2030,36.71,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_COA_CL',2014,14.67,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_COA_CL',2025,14.67,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_COA_CL',2030,11.13,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_COA_CM',2014,18.18,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_HOPO',2014,13.69,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_CL',2020,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_CL',2025,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_CL',2030,12.68,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_CL',2050,6.34,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_DS',2020,44.39,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_DS',2025,44.39,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_DS',2030,26.95,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELALK_DS',2050,22.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_CL',2020,34.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_CL',2025,34.88,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_CL',2030,20.61,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_CL',2050,6.34,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_DS',2020,57.08,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_DS',2025,57.08,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_DS',2030,47.56,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_ELPEM_DS',2050,28.54,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_CL',2020,88.79,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_CL',2025,88.79,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_CL',2030,25.37,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_CL',2050,15.85,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_DS',2020,177.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_DS',2025,177.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_DS',2030,88.79,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SOEC_DS',2050,31.71,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_AEM_DS',2050,6.34,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SBR_C',2014,16.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SBG_DS',2014,130.04,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SBG_DS',2020,98.27,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SBG_CM',2014,83.64,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SBG_CM',2020,40.92,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_SER_D',2014,233.99,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC1',2014,38.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC1',2020,30.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC1',2025,27.4,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC1',2014,65.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC1',2020,50.8,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC1',2025,45.8,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC2',2014,38.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC2',2020,30.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LC2',2025,27.4,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC2',2014,65.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC2',2020,50.8,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC2',2025,45.8,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_IND_FT_GC',2014,34.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_IND_FT_GC',2020,31.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_IND_FT_GC',2025,30.3,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC3',2014,80.6,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC3',2020,66.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC3',2025,62.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC4',2014,66.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC4',2020,51.9,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC4',2025,47.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC5',2014,80.6,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC5',2020,66.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GC5',2025,62.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_BLEND',2020,2.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_BLEND',2025,2.5,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_IND_FT_GDE',2020,0.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LD',2014,144.8,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LD',2020,110.4,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_LD',2025,98.9,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GD',2014,70.2,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GD',2020,55.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','H2_TRA_FT_GD',2025,49.9,'M€/PJ','');
-- CCUS, Hydrogen
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CL',2020,9.03,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CL',2025,8.65,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CL',2030,6.07,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CS',2020,18.72,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CS',2025,17.92,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SMR_CS',2030,14.29,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_COA_CL',2020,18.11,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_COA_CL',2025,16.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_COA_CL',2030,11.53,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_COA_CM',2020,20.95,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_H2_SBG_CM',2020,41.51,'M€/PJ','');
-- CCUS, Power
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_IG_COA',2020,3539,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_IG_COA',2030,2827,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OG_COA',2020,3758,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OG_COA',2030,3087,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OXY_COA',2020,3648,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OXY_COA',2030,2757,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_SOFC_COA',2035,3455,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_OXY_NGA',2030,1330,'M€/GW','');
-- CCUS, Capture
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2020,2.32,'M€/kt','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2030,1.86,'M€/kt','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_DAC',2050,1.48,'M€/kt','');
-- CCUS, Synfuels
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2020,19.03,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2030,14.27,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_NGA_METH',2050,7.93,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_HYDR',2025,15.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_HYDR',2030,12.43,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_COELC',2025,31.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DST_COELC',2030,28.22,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_HYDR',2025,15.47,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_HYDR',2030,12.43,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_COELC',2025,31.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_KER_COELC',2030,28.22,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DSTKER_DAC',2025,126.26,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_DSTKER_DAC',2030,112.86,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_HYDR',2025,26.94,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_COELC',2025,59.42,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','SF_MEOH_DAC',2025,237.68,'M€/PJ','');
-- CCUS, Storage
INSERT INTO "CostInvest" VALUES ('IT','CCUS_SNK_DGF_ON',2020,3.3E-03,'M€/kt','');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_SNK_DGF_OFF',2020,7.0E-03,'M€/kt','');

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
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SMR_CL',2014,0.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SMR_CL',2025,0.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SMR_CL',2030,0.24,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SMR_CS',2014,0.52,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SMR_CS',2025,0.52,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SMR_CS',2030,0.41,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SMR_DM',2014,0.89,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_SMR_DM',2020,0.89,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SMR_DM',2025,1.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SMR_DS',2014,1.41,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SMR_DS',2025,1.41,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SMR_DS',2030,0.73,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_COA_CL',2014,0.87,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_COA_CL',2025,0.87,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_COA_CL',2030,0.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_COA_CM',2014,0.45,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_HOPO',2014,0.68,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_ELALK_CL',2020,0.48,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_ELALK_CL',2025,0.48,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_ELALK_CL',2030,0.38,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_ELALK_CL',2050,0.19,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_ELALK_DS',2020,1.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_ELALK_DS',2025,1.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_ELALK_DS',2030,0.81,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_ELALK_DS',2050,0.67,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_ELPEM_CL',2020,1.05,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_ELPEM_CL',2025,1.05,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_ELPEM_CL',2030,0.62,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_ELPEM_CL',2050,0.19,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_ELPEM_DS',2020,1.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_ELPEM_DS',2025,1.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_ELPEM_DS',2030,1.43,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_ELPEM_DS',2050,0.86,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_SOEC_CL',2020,2.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SOEC_CL',2025,2.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SOEC_CL',2030,0.76,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_SOEC_CL',2050,0.48,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_SOEC_DS',2020,5.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_SOEC_DS',2025,5.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'H2_SOEC_DS',2030,2.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_SOEC_DS',2050,0.95,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'H2_AEM_DS',2050,0.19,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SBR_C',2014,0.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SBG_DS',2014,2.57,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_SBG_CM',2014,4.18,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_SBG_CM',2020,2.05,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_LC1',2014,2,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_LC1',2020,1.6,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_LC1',2025,1.4,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GC1',2014,2.7,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GC1',2020,2.1,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GC1',2025,1.9,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_LC2',2014,2,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_LC2',2020,1.6,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_LC2',2025,1.4,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GC2',2014,2.7,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GC2',2020,2.1,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GC2',2025,1.9,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_IND_FT_GC',2014,1.8,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_IND_FT_GC',2020,1.6,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GC3',2014,5.8,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GC3',2020,4.7,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GC3',2025,4.3,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GC4',2014,5,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GC4',2020,3.9,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GC4',2025,3.5,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GC5',2014,5.8,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GC5',2020,4.7,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GC5',2025,4.3,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_BLEND',2020,0.2,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_IND_FT_GDE',2020,0.0,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_LD',2014,9,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_LD',2020,6.8,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_LD',2025,6.1,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'H2_TRA_FT_GD',2014,5.1,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'H2_TRA_FT_GD',2020,4,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'H2_TRA_FT_GD',2025,3.6,'M€/PJ','');
--CCUS, Hydrogen
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_SMR_CL',2020,0.45,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'CCUS_H2_SMR_CL',2025,0.45,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_H2_SMR_CL',2030,0.36,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_SMR_CS',2020,0.94,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'CCUS_H2_SMR_CS',2025,0.94,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_H2_SMR_CS',2030,0.76,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_COA_CL',2020,1.30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'CCUS_H2_COA_CL',2025,1.30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_H2_COA_CL',2030,0.72,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_COA_CM',2020,0.87,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_H2_SBG_CM',2020,2.07,'M€/PJ','');
-- CCUS, Power
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_IG_COA',2020,80.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_ELC_IG_COA',2030,69.12,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_OG_COA',2020,80.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_ELC_OG_COA',2030,74.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_OXY_COA',2020,84.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_ELC_OXY_COA',2030,76.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2035,'CCUS_ELC_SOFC_COA',2035,88.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_ELC_OXY_NGA',2030,38.00,'M€/GW','');
-- CCUS, Capture
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_DAC',2020,0.09,'M€/kt','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'CCUS_DAC',2030,0.09,'M€/kt','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'CCUS_DAC',2050,0.09,'M€/kt','');
-- CCUS, Synfuels
INSERT INTO "CostFixed" VALUES ('IT',2020,'SF_NGA_METH',2020,0.95,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_NGA_METH',2030,0.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'SF_NGA_METH',2050,0.40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DST_HYDR',2025,2.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DST_HYDR',2030,0.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DST_COELC',2025,5.70,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DST_COELC',2030,0.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_KER_HYDR',2025,2.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_KER_HYDR',2030,0.33,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_KER_COELC',2025,5.70,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_KER_COELC',2030,0.66,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_DSTKER_DAC',2025,22.81,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'SF_DSTKER_DAC',2030,2.63,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_HYDR',2025,1.72,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_COELC',2025,3.26,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'SF_MEOH_DAC',2025,13.06,'M€/PJ','');
-- CCUS, Storage
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_SNK_DGF_ON',2020,1.7E-04,'M€/kt','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_SNK_DGF_OFF',2020,3.5E-04,'M€/kt','');

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
INSERT INTO "CurrencyTech" VALUES ('H2_SMR_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SMR_CS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SMR_DM','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SMR_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_COA_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_COA_CM','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_HOPO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_ELALK_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_ELALK_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_ELPEM_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_ELPEM_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SOEC_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SOEC_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_AEM_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SBR_C','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SBG_DS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SBG_CM','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SER_D','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_IND_FT_GC','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_LC1','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GC1','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_LC2','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GC2','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GC3','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GC4','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GC5','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_BLEND','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_IND_FT_GDE','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_LD','EUR12');
INSERT INTO "CurrencyTech" VALUES ('H2_TRA_FT_GD','EUR12');
-- CCUS
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_SMR_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_SMR_CS','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_COA_CL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_COA_CM','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_SBG_CM','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_IG_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_OG_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_OXY_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_SOFC_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_OXY_NGA','EUR10');
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
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_IG_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_OG_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_OXY_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_SOFC_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_OXY_NGA',31.536,'PJ/GW');

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
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SMR_CL',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SMR_CS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SMR_DM',2014,0.86,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SMR_DS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_COA_CL',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_COA_CM',2014,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_HOPO',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_ELALK_CL',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_ELALK_DS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_ELPEM_CL',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_ELPEM_DS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SOEC_CL',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SOEC_DS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_AEM_DS',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SBR_C',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SBG_DS',2014,0.71,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SBG_CM',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_SER_D',2014,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_LC1',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GC1',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_LC2',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GC2',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_IND_FT_GC',2014,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GC3',2014,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GC4',2014,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GC5',2014,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_BLEND',2020,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_IND_FT_GDE',2020,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_LD',2014,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','H2_TRA_FT_GD',2014,0.70,'');
-- CCUS, Hydrogen
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_SMR_CL',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_SMR_CS',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_COA_CL',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_COA_CM',2020,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_H2_SBG_CM',2020,0.90,'');
-- CCUS, Power
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_IG_COA',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_OG_COA',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_OXY_COA',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_SOFC_COA',2035,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_OXY_NGA',2030,0.90,'');
-- CCUS, Capture
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_DAC',2020,0.90,'');
-- CCUS, Synfuels
INSERT INTO "CapacityFactor" VALUES ('IT','SF_NGA_METH',2020,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DST_HYDR',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DST_COELC',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_KER_HYDR',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_KER_COELC',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_DSTKER_DAC',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_HYDR',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_COELC',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','SF_MEOH_DAC',2025,0.90,'');

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