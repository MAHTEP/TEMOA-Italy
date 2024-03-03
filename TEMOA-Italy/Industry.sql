
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
-- Industrial sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('IND_FT_BFG_E','p','IND','Fuel Technology - Blast furnace gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_BFG_N','p','IND','Fuel Technology - Blast furnace gas - New','');
INSERT INTO "technologies" VALUES ('IND_FT_BIO_E','p','IND','Fuel Technology - Biofuels - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_BIO_N','p','IND','Fuel Technology - Biofuels - New','');
INSERT INTO "technologies" VALUES ('IND_FT_COA_E','p','IND','Fuel Technology - Coal  - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_COA_N','p','IND','Fuel Technology - Coal - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_COG_N','p','IND','Fuel Technology - Coke oven gas  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_COK_E','p','IND','Fuel Technology - Oven coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_COK_N','p','IND','Fuel Technology - Oven coke  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_ELC_E','p','IND','Fuel Technology - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_ETH_E','p','IND','Fuel Technology - Ethane - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_ETH_N','p','IND','Fuel Technology - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_FT_GEO_1_N','p','IND','Fuel Technology - Geothermal 1 - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_GEO_2_N','p','IND','Fuel Technology - Geothermal 2 - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_GEO_3_N','p','IND','Fuel Technology - Geothermal 3 - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_HET_E','p','IND','Fuel Technology - Heat - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_HET_N','p','IND','Fuel Technology - Heat - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_HFO_E','p','IND','Fuel Technology - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_HFO_N','p','IND','Fuel Technology - Heavy fuel oil  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_LPG_E','p','IND','Fuel Technology - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_LPG_N','p','IND','Fuel Technology - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_FT_NAP_E','p','IND','Fuel Technology - Naphtha - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_NAP_N','p','IND','Fuel Technology - Naphtha - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_NGA_E','p','IND','Fuel Technology - Natural gas mix - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_NGA_N','p','IND','Fuel Technology - Natural gas mix  - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_OIL_E','p','IND','Fuel Technology - Refined petroleum products - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_OIL_N','p','IND','Fuel Technology - Refined petroleum products - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_PTC_E','p','IND','Fuel Technology - Petroleum coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_FT_PTC_N','p','IND','Fuel Technology - Petroleum coke - New ','');
INSERT INTO "technologies" VALUES ('IND_FT_H2_N','p','IND','Fuel technology - Hydrogen','');
INSERT INTO "technologies" VALUES ('IND_FT_H2E_N','p','IND','Fuel technology - Hydrogen from electrolysis','');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "technologies" VALUES ('IND_MD_TECH','p','IND','Technology to produce sector-specific Machine Drive','');
INSERT INTO "technologies" VALUES ('IND_MD_ELC_E','p','IND','Machine Drive - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_MD_DST_E','p','IND','Machine Drive - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_TECH','p','IND','Technology to produce sector-specific steam','');
INSERT INTO "technologies" VALUES ('IND_STM_BYPROD','p','IND','Technology to allow production of steam as by product','');
INSERT INTO "technologies" VALUES ('IND_STM_BIO_E','p','IND','Steam - Biomass - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_COA_E','p','IND','Steam - Coal - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_DST_E','p','IND','Steam - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_HET_E','p','IND','Steam - Heat - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_HFO_E','p','IND','Steam - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_LPG_E','p','IND','Steam - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_STM_NGA_E','p','IND','Steam - Natural gas - Existing','');
-- Chemicals
INSERT INTO "technologies" VALUES ('IND_CH_TECH','p','IND','Chemical demand production','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_E','p','IND','Olefins – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_BTX_E','p','IND','Aromatics – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_E','p','IND','Ammonia – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_E','p','IND','Methanol – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_E','p','IND','Chlorine – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_E','p','IND','Other chemicals – Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_DST_E','p','IND','Technology to convert distillate to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_GSL_E','p','IND','Technology to convert gasoline to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_HFO_E','p','IND','Technology to convert heavy fuel oil to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_KER_E','p','IND','Technology to convert kerosene to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_LPG_E','p','IND','Technology to convert LPG to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NAP_E','p','IND','Technology to convert naphtha to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NGA_E','p','IND','Technology to convert natural gas to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NSP_E','p','IND','Technology to convert oil non-specified to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_RFG_E','p','IND','Technology to convert refinery gas to non-energy petrochemical feedstock - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_EC_E','p','IND','Electro-chemical process for Chemicals - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_COK_E','p','IND','Other energy use for Chemicals - Coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_DST_E','p','IND','Other energy use for Chemicals - Distillate Oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ELC_E','p','IND','Other energy use for Chemicals - Electric - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ETH_E','p','IND','Other energy use for Chemicals - Ethane - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_HFO_E','p','IND','Other energy use for Chemicals - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_NGA_E','p','IND','Other energy use for Chemicals - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_PTC_E','p','IND','Other energy use for Chemicals - Petroleum coke - Existing','');
-- Iron and steel
INSERT INTO "technologies" VALUES ('IND_IS_TECH','p','IND','Iron and steel demand production','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_E','p','IND','Basic oxygen furnace - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_EAF_E','p','IND','EAF - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_FS_PTC_E','p','IND','Petroleum coke consumption in Iron and Steel - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_FS_COK_E','p','IND','Coke consumption in Iron and Steel - Existing','');
INSERT INTO "technologies" VALUES ('IND_IS_OTH_ELC_E','p','IND','Other energy use for Iron and Steel - Electricity - Existing','');
-- Non-ferrous metals
INSERT INTO "technologies" VALUES ('IND_NF_TECH','p','IND','Non-ferrous metals demand production','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_E','p','IND','Aluminum - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_COP_E','p','IND','Copper - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_ZNC_E','p','IND','Zinc - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_E','p','IND','Other Non-ferrous metals- Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_EC_E','p','IND','Electro-chemical process for Non-ferrous metals - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_ELC_E','p','IND','Other energy use for Non-ferrous metals - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_DST_E','p','IND','Other energy use for Non-ferrous metals - Distillate Oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_NGA_E','p','IND','Other energy use for Non-ferrous metals - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_LPG_E','p','IND','Other energy use for Non-ferrous metals - LPG - Existing','');
-- Non-metallic minerals
INSERT INTO "technologies" VALUES ('IND_NM_TECH','p','IND','Non-metallic minerals demand production','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRY_E','p','IND','Clinker - Dry process - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_WET_E','p','IND','Clinker - Wet process - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_CRM_E','p','IND','Ceramics - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_E','p','IND','Glass - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_LIM_E','p','IND','Lime - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_COK_E','p','IND','Other energy use for Non-metallic minerals - Coke - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_DST_E','p','IND','Other energy use for Non-metallic minerals - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_ELC_E','p','IND','Other energy use for Non-metallic minerals - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_LPG_E','p','IND','Other energy use for Non-metallic minerals - LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_NM_OTH_NGA_E','p','IND','Other energy use for Non-metallic minerals - Natural gas - Existing','');
-- Pulp and paper
INSERT INTO "technologies" VALUES ('IND_PP_TECH','p','IND','Pulp and paper demand production','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_TECH','p','IND','Pulp commodities collection','');
INSERT INTO "technologies" VALUES ('IND_PP_PAP_E','p','IND','Paper mill - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_CHEM_E','p','IND','Chemical pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_MEC_E','p','IND','Mechanical pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_REC_E','p','IND','Recycled fiber pulping - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_DST_E','p','IND','Process Heat for Pulp and Paper - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_ELC_E','p','IND','Process Heat for Pulp and Paper - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_HFO_E','p','IND','Process Heat for Pulp and Paper - Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_NGA_E','p','IND','Process Heat for Pulp and Paper - Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_DST_E','p','IND','Other energy use for Pulp and Paper - Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_ELC_E','p','IND','Other energy use for Pulp and Paper - Electric - Existing','');
INSERT INTO "technologies" VALUES ('IND_PP_OTH_LPG_E','p','IND','Other energy use for Pulp and Paper - LPG - Existing','');
-- Other industries
INSERT INTO "technologies" VALUES ('IND_OTH_TECH','p','IND','Other industries demand production','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_DST_E','p','IND','Process Heat for Other Industry Distillate oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_HFO_E','p','IND','Process Heat for Other Industry Heavy fuel oil - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_LPG_E','p','IND','Process Heat for Other Industry LPG - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_NGA_E','p','IND','Process Heat for Other Industry Natural gas - Existing','');
INSERT INTO "technologies" VALUES ('IND_OTH_OTH_ELC_E','p','IND','Other energy use for Other Industry - Electricity - Existing','');
INSERT INTO "technologies" VALUES ('IND_NEU_TECH','p','IND','Other non-energy uses demand production','');
INSERT INTO "technologies" VALUES ('IND_ONS_TECH','p','IND','Other non-specified industrial demand production','');
-- New technologies
-- Machine and steam
INSERT INTO "technologies" VALUES ('IND_MD_DST_N','p','IND','Machine drive - Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_MD_LPG_N','p','IND','Machine drive - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_MD_NGA_N','p','IND','Machine drive - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_MD_ELC_N','p','IND','Machine drive - Electricity - New','');
INSERT INTO "technologies" VALUES ('IND_STM_BFG_N','p','IND','Steam - Blast furnace gas - New','');
INSERT INTO "technologies" VALUES ('IND_STM_BIO_N','p','IND','Steam - Biomass - New','');
INSERT INTO "technologies" VALUES ('IND_STM_COA_N','p','IND','Steam - Coal - New','');
INSERT INTO "technologies" VALUES ('IND_STM_COG_N','p','IND','Steam - Coke oven gas - New','');
INSERT INTO "technologies" VALUES ('IND_STM_DST_N','p','IND','Steam - Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_STM_ETH_N','p','IND','Steam - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_STM_HET_N','p','IND','Steam - Heat - New','');
INSERT INTO "technologies" VALUES ('IND_STM_HFO_N','p','IND','Steam - Heavy fuel oil - New','');
INSERT INTO "technologies" VALUES ('IND_STM_LPG_N','p','IND','Steam - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_STM_NGA_N','p','IND','Steam - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_STM_PTC_N','p','IND','Steam - Petroleum coke - New','');
-- Chemicals
INSERT INTO "technologies" VALUES ('IND_CH_HVC_NAPSC_N','p','IND','HVC - Naphtha steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_ETHSC_N','p','IND','HVC - Ethane steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_GSOSC_N','p','IND','HVC - Gas oil steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_LPGSC_N','p','IND','HVC - LPG steam cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_NCC_N','p','IND','HVC - Naphtha catalytic cracking','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_BDH_N','p','IND','HVC - Bioethanol dehydration','');
INSERT INTO "technologies" VALUES ('IND_CH_HVC_N','p','IND','HVC - Olefins and BTX production','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_PDH_N','p','IND','Olefins - Prophane dehydrogenation','');
INSERT INTO "technologies" VALUES ('IND_CH_OLF_MTO_N','p','IND','Olefins - Methanol-to-olefins','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NGASR_N','p','IND','Ammonia - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NGASR_CCS_N','p','IND','Ammonia - Natural gas steam reforming CCS','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NGASR_CCS_N_LINKED','p','IND','Ammonia - Natural gas steam reforming CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_NAPPOX_N','p','IND','Ammonia - Naphtha partial oxidation','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_COAGSF_N','p','IND','Ammonia - Coal gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_BIOGSF_N','p','IND','Ammonia - Biomass gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_AMM_ELCSYS_N','p','IND','Ammonia - Synthesis via electrolysis','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_NGASR_N','p','IND','Methanol - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_NGASR_CCS_N','p','IND','Methanol - Natural gas steam reforming CCS','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_NGASR_CCS_N_LINKED','p','IND','Methanol - Natural gas steam reforming CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_COGSR_N','p','IND','Methanol - Coke oven gas steam reforming','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_LPGSR_N','p','IND','Methanol - LPG partial oxidation','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_COAGSF_N','p','IND','Methanol - Coal gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_BIOGSF_N','p','IND','Methanol - Biomass gasification','');
INSERT INTO "technologies" VALUES ('IND_CH_MTH_ELCSYS_N','p','IND','Methanol - Synthesis via electrolysis','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_MERC_N','p','IND','Chlorine - Mercury cell','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_DIAP_N','p','IND','Chlorine - Diaphragm cell','');
INSERT INTO "technologies" VALUES ('IND_CH_CHL_MEMB_N','p','IND','Chlorine - Membrane cell','');
INSERT INTO "technologies" VALUES ('IND_CH_EC_N','p','IND','Electro-chemical process for Chemicals - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_BIO_N','p','IND','Feedstock for Chemicals - Biomass - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_COA_N','p','IND','Feedstock for Chemicals - Coal - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_DST_N','p','IND','Feedstock for Chemicals - Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_ETH_N','p','IND','Feedstock for Chemicals - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_LPG_N','p','IND','Feedstock for Chemicals - LPG - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_MTH_N','p','IND','Feedstock for Chemicals - Methanol - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NAP_N','p','IND','Feedstock for Chemicals - Naphtha - New','');
INSERT INTO "technologies" VALUES ('IND_CH_FS_NGA_N','p','IND','Feedstock for Chemicals - Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_COK_N','p','IND','Other energy use for Chemicals - Coke - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_DST_N','p','IND','Other energy use for Chemicals - Distillate Oil - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ELC_N','p','IND','Other energy use for Chemicals - Electric - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_ETH_N','p','IND','Other energy use for Chemicals - Ethane - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_HFO_N','p','IND','Other energy use for Chemicals - Heavy fuel oil - New','');
INSERT INTO "technologies" VALUES ('IND_CH_OTH_NGA_N','p','IND','Other energy use for Chemicals - Natural gas - New','');
-- Iron and steel
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFBOF_N','p','IND','Blast furnace-Basic oxygen furnace (BF-BOF)','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFBOF_CCS_N','p','IND','BF-BOF CCS','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFBOF_CCS_N_LINKED','p','IND','BF-BOF CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFTGRBOF_CCS_N','p','IND','BF-TGR-BOF CCS','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_BFTGRBOF_CCS_N_LINKED','p','IND','BF-TGR-BOF CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_DRIEAF_N','p','IND','Direct reduced iron-Electric arc furnace (DRI-EAF)','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_DRIEAF_CCS_N','p','IND','DRI-EAF CCS','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_DRIEAF_CCS_N_LINKED','p','IND','DRI-EAF CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_IS_DRI_HDREAF_N','p','IND','Hydrogen direct reduction (HDR)-EAF','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_HISBOF_N','p','IND','HIsarna-BOF','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_HISBOF_CCS_N','p','IND','HIsarna-BOF CCS','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_HISBOF_CCS_N_LINKED','p','IND','HIsarna-BOF CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCOWIN_N','p','IND','Ulcowin','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCOLYSIS_N','p','IND','Ulcolysis','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCORED_CCS_N','p','IND','Ulcored CCS','');
INSERT INTO "technologies" VALUES ('IND_IS_BOF_ULCORED_CCS_N_LINKED','p','IND','Ulcored CCS - Linked','');
-- Non-ferrous metals
INSERT INTO "technologies" VALUES ('IND_NF_AMN_BAY_N','p','IND','Alumina - Bayer process','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_HLH_N','p','IND','Primary aluminum - Hall-Héroult process','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_SEC_N','p','IND','Secondary aluminum - Production from scrap','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_HLHIA_N','p','IND','Primary aluminum - Hall-Héroult with inert anodes','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_CBT_N','p','IND','Aluminum - Carbothermic reduction of alumina','');
INSERT INTO "technologies" VALUES ('IND_NF_ALU_KAO_N','p','IND','Aluminum - Kaolinite reduction','');
INSERT INTO "technologies" VALUES ('IND_NF_COP_N','p','IND','Copper - New','');
INSERT INTO "technologies" VALUES ('IND_NF_ZNC_N','p','IND','Zinc - New','');
INSERT INTO "technologies" VALUES ('IND_NF_EC_N','p','IND','Electro-chemical process for Non-ferrous metals - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_ELC_N','p','IND','Other energy use for Non-ferrous metals - Electricity - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_DST_N','p','IND','Other energy use for Non-ferrous metals - Distillate Oil - New','');
INSERT INTO "technologies" VALUES ('IND_NF_OTH_NGA_N','p','IND','Other energy use for Non-ferrous metals - Natural gas - New','');
-- Non-metallic minerals
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRY_N','p','IND','Clinker - Dry process','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRY_BIO_N','p','IND','Clinker - Dry process - Biomass','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_WET_N','p','IND','Clinker - Wet process','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','p','IND','Clinker - Dry process with post-combustion CCS','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_PCCS_N_LINKED','p','IND','Clinker - Dry process with post-combustion CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_PCCS_BIO_N','p','IND','Clinker - Dry process with post-combustion CCS - Biomass','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED','p','IND','Clinker - Dry process with post-combustion CCS - Biomass - Linked','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','p','IND','Clinker - Dry process with oxy-fuel CCS','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_OCCS_N_LINKED','p','IND','Clinker - Dry process with oxy-fuel CCS - Linked','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_OCCS_BIO_N','p','IND','Clinker - Dry process with oxy-fuel CCS - Biomass','');
INSERT INTO "technologies" VALUES ('IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED','p','IND','Clinker - Dry process with oxy-fuel CCS - Biomass - Linked','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_BLN_N','p','IND','Cement blending','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_AAC_N','p','IND','Alkali-activated cement-based binders (AAC)','');
INSERT INTO "technologies" VALUES ('IND_NM_CEM_BEL_N','p','IND','Belite cement','');
INSERT INTO "technologies" VALUES ('IND_NM_LIM_LRK_N','p','IND','Lime - Long rotary kiln','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_FOSS_N','p','IND','Glass - Fossil fuel-fired furnace','');
INSERT INTO "technologies" VALUES ('IND_NM_GLS_ELEC_N','p','IND','Glass - All-electric furnace','');
INSERT INTO "technologies" VALUES ('IND_NM_CRM_N','p','IND','Ceramics production','');
INSERT INTO "technologies" VALUES ('IND_NM_EC_N','p','IND','Electro-chemical process for Non-metallic minerals - New','');
-- Pulp and paper
INSERT INTO "technologies" VALUES ('IND_PP_PUL_KRF_N','p','IND','Chemical pulping - Kraft process','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_SUL_N','p','IND','Chemical pulping - Sulfite process','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_MEC_N','p','IND','Mechanical pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_SCH_N','p','IND','Semi-chemical pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PUL_REC_N','p','IND','Recycled fiber pulping','');
INSERT INTO "technologies" VALUES ('IND_PP_PAP_N','p','IND','Paper production and printing','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_HFO_N','p','IND','Process heat for Pulp and Paper - Heavy fuel oil','');
INSERT INTO "technologies" VALUES ('IND_PP_PH_NGA_N','p','IND','Process heat for Pulp and Paper - Natural gas','');
-- Other industries
INSERT INTO "technologies" VALUES ('IND_OTH_PH_DST_N','p','IND','Process Heat for Other Industry Distillate oil - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_HFO_N','p','IND','Process Heat for Other Industry Heavy fuel oil - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_LPG_N','p','IND','Process Heat for Other Industry LPG - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_PH_NGA_N','p','IND','Process Heat for Other Industry Natural gas - New','');
INSERT INTO "technologies" VALUES ('IND_OTH_OTH_ELC_N','p','IND','Other energy use for Other Industry - Electricity','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TG_N','p','IND','mCHP - Industry - Simple cycle gas turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TV_N','p','IND','mCHP - Industry - Steam turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_BLQ_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Bioliquid','');
-- Other sectors and dummies not required in the whole database)
INSERT INTO "technologies" VALUES ('DMY_OUT_TECH','p','UPS','Dummy technology to produce DMY_OUT','');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "tech_annual" VALUES ('IND_FT_BFG_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BFG_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BIO_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COA_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COA_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COG_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_COK_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_ETH_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_GEO_1_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_GEO_2_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_GEO_3_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_OIL_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_OIL_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_PTC_E','');
INSERT INTO "tech_annual" VALUES ('IND_FT_PTC_N','');
INSERT INTO "tech_annual" VALUES ('IND_FT_H2_N','');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "tech_annual" VALUES ('IND_MD_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_MD_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_MD_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BYPROD','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BIO_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_COA_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HET_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_STM_NGA_E','');
-- Chemicals
INSERT INTO "tech_annual" VALUES ('IND_CH_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_BTX_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_GSL_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_KER_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NSP_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_RFG_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_EC_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ETH_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_PTC_E','');
-- Iron and steel
INSERT INTO "tech_annual" VALUES ('IND_IS_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_EAF_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_FS_PTC_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_FS_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_IS_OTH_ELC_E','');
-- Non-ferrous metals
INSERT INTO "tech_annual" VALUES ('IND_NF_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_COP_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ZNC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_EC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_LPG_E','');
-- Non-metallic minerals
INSERT INTO "tech_annual" VALUES ('IND_NM_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRY_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_WET_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CRM_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_LIM_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_COK_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_NM_OTH_NGA_E','');
-- Pulp and paper
INSERT INTO "tech_annual" VALUES ('IND_PP_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PAP_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_CHEM_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_MEC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_REC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_PP_OTH_LPG_E','');
-- Other industries
INSERT INTO "tech_annual" VALUES ('IND_OTH_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_DST_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_HFO_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_LPG_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_NGA_E','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_OTH_ELC_E','');
INSERT INTO "tech_annual" VALUES ('IND_NEU_TECH','');
INSERT INTO "tech_annual" VALUES ('IND_ONS_TECH','');
-- New tech_annual
-- Machine and steam
INSERT INTO "tech_annual" VALUES ('IND_MD_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_MD_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_MD_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_MD_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BFG_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_COA_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_COG_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HET_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_STM_PTC_N','');
-- Chemicals
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_NAPSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_ETHSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_GSOSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_LPGSC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_NCC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_BDH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_HVC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_PDH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OLF_MTO_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NGASR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NGASR_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NGASR_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_NAPPOX_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_COAGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_BIOGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_AMM_ELCSYS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_NGASR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_NGASR_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_NGASR_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_COGSR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_LPGSR_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_COAGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_BIOGSF_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_MTH_ELCSYS_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_MERC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_DIAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_CHL_MEMB_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_EC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_COA_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_MTH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_FS_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_COK_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_ETH_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_CH_OTH_NGA_N','');
-- Iron and steel
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFBOF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFBOF_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFBOF_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFTGRBOF_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_BFTGRBOF_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_DRIEAF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_DRIEAF_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_DRIEAF_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_IS_DRI_HDREAF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_HISBOF_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_HISBOF_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_HISBOF_CCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCOWIN_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCOLYSIS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCORED_CCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_IS_BOF_ULCORED_CCS_N_LINKED','');
-- Non-ferrous metals
INSERT INTO "tech_annual" VALUES ('IND_NF_AMN_BAY_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_HLH_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_SEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_HLHIA_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_CBT_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ALU_KAO_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_COP_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_ZNC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_EC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_ELC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_NF_OTH_NGA_N','');
-- Non-metallic minerals
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRY_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRY_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_WET_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_PCCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_PCCS_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_OCCS_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_OCCS_BIO_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_BLN_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_AAC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CEM_BEL_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_LIM_LRK_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_FOSS_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_GLS_ELEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_CRM_N','');
INSERT INTO "tech_annual" VALUES ('IND_NM_EC_N','');
-- Pulp and paper
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_KRF_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_SUL_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_MEC_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_SCH_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PUL_REC_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PAP_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_PP_PH_NGA_N','');
-- Other industries
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_DST_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_HFO_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_LPG_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_PH_NGA_N','');
INSERT INTO "tech_annual" VALUES ('IND_OTH_OTH_ELC_N','');

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
-- Industrial sector
-- Demands
INSERT INTO "commodities" VALUES('IND_CH','d','Chemicals [PJ]');
INSERT INTO "commodities" VALUES('IND_IS','d','Iron and steel [Mt]');
INSERT INTO "commodities" VALUES('IND_PP','d','Pulp and paper [Mt]');
INSERT INTO "commodities" VALUES('IND_NF','d','Non-ferrous metals [Mt]');
INSERT INTO "commodities" VALUES('IND_NM','d','Non-metallic minerals [Mt]');
INSERT INTO "commodities" VALUES('IND_OTH','d','Other industries [PJ]');
INSERT INTO "commodities" VALUES('IND_OTH_NEU','d','Industrial and other non-energy uses [PJ]');
INSERT INTO "commodities" VALUES('IND_OTH_NSP','d','Other non-specified [PJ]');
-- Sector-specific commodities
INSERT INTO "commodities" VALUES('IND_MD','p','Machine drive');
INSERT INTO "commodities" VALUES('IND_SB','p','Steam boiler');
INSERT INTO "commodities" VALUES('IND_BFG','p','Blast furnace gas');
INSERT INTO "commodities" VALUES('IND_BIO','p','Biofuels');
INSERT INTO "commodities" VALUES('IND_COA','p','Coal');
INSERT INTO "commodities" VALUES('IND_COG','p','Coke oven gas');
INSERT INTO "commodities" VALUES('IND_COK','p','Coke oven coke');
INSERT INTO "commodities" VALUES('IND_ELC','p','Electricity');
INSERT INTO "commodities" VALUES('IND_ELC_BP','p','Electricity - Byproduct');
INSERT INTO "commodities" VALUES('IND_ETH','p','Ethane');
INSERT INTO "commodities" VALUES('IND_GEO','p','Geothermal');
INSERT INTO "commodities" VALUES('IND_HET','p','Heat');
INSERT INTO "commodities" VALUES('IND_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('IND_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('IND_H2E','p','Hydrogen from electrolysis');
INSERT INTO "commodities" VALUES('IND_LPG','p','Liquified petroleum gas');
INSERT INTO "commodities" VALUES('IND_NAP','p','Naphtha');
INSERT INTO "commodities" VALUES('IND_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('IND_OIL','p','Refined petroleum products');
INSERT INTO "commodities" VALUES('IND_PTC','p','Petroleum coke');
INSERT INTO "commodities" VALUES('SNK_IND_CO2','p','Industry - Physical CO2 for storage/utilization');
-- Chemicals
INSERT INTO "commodities" VALUES('IND_CH_HVC','p','HVC');
INSERT INTO "commodities" VALUES('IND_CH_BTX','p','Aromatics');
INSERT INTO "commodities" VALUES('IND_CH_OLF','p','Olefins');
INSERT INTO "commodities" VALUES('IND_CH_AMM','p','Ammonia');
INSERT INTO "commodities" VALUES('IND_CH_MTH','p','Methanol');
INSERT INTO "commodities" VALUES('IND_CH_CHL','p','Chlorine');
INSERT INTO "commodities" VALUES('IND_CH_OTH_PROD','p','Other chemical products');
INSERT INTO "commodities" VALUES('IND_CH_EC','p','Chemical - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_CH_MD','p','Chemical - Machine drive');
INSERT INTO "commodities" VALUES('IND_CH_FS','p','Chemical - Feedstock');
INSERT INTO "commodities" VALUES('IND_CH_FS_BIO','p','Chemical - Feedstock - Biomass');
INSERT INTO "commodities" VALUES('IND_CH_FS_DST','p','Chemical - Feedstock - Gas oil');
INSERT INTO "commodities" VALUES('IND_CH_FS_ETH','p','Chemical - Feedstock - Ethane');
INSERT INTO "commodities" VALUES('IND_CH_FS_HCO','p','Chemical - Feedstock - Hard coal');
INSERT INTO "commodities" VALUES('IND_CH_FS_LPG','p','Chemical - Feedstock - LPG');
INSERT INTO "commodities" VALUES('IND_CH_FS_MTH','p','Chemical - Feedstock - Methanol');
INSERT INTO "commodities" VALUES('IND_CH_FS_NAP','p','Chemical - Feedstock - Naphtha');
INSERT INTO "commodities" VALUES('IND_CH_FS_NGA','p','Chemical - Feedstock - Natural gas');
INSERT INTO "commodities" VALUES('IND_CH_OTH','p','Chemical - Other energy use');
INSERT INTO "commodities" VALUES('IND_CH_SB','p','Chemical - Steam boiler');
-- Iron and steel
INSERT INTO "commodities" VALUES('IND_IS_BOF','p','BOF steel');
INSERT INTO "commodities" VALUES('IND_IS_EAF','p','EAF steel');
INSERT INTO "commodities" VALUES('MAT_BFS','p','Blast furnace slag');
INSERT INTO "commodities" VALUES('MAT_WOD','p','Wood');
INSERT INTO "commodities" VALUES('IND_IS_FS','p','Iron and steel - Feedstock');
INSERT INTO "commodities" VALUES('IND_IS_MD','p','Iron and steel - Machine drive');
INSERT INTO "commodities" VALUES('IND_IS_OTH','p','Iron and steel - Other energy use');
INSERT INTO "commodities" VALUES('IND_IS_SB','p','Iron and steel - Steam boiler');
-- Non-ferrous metals
INSERT INTO "commodities" VALUES('IND_NF_AMN','p','Alumina');
INSERT INTO "commodities" VALUES('IND_NF_ALU','p','Aluminum');
INSERT INTO "commodities" VALUES('IND_NF_COP','p','Copper');
INSERT INTO "commodities" VALUES('IND_NF_ZNC','p','Zinc');
INSERT INTO "commodities" VALUES('IND_NF_OTH_PROD','p','Other non-ferrous metals');
INSERT INTO "commodities" VALUES('IND_NF_EC','p','Non-ferrous metals - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_NF_MD','p','Non-ferrous metals - Machine drive');
INSERT INTO "commodities" VALUES('IND_NF_OTH','p','Non-ferrous metals - Other');
INSERT INTO "commodities" VALUES('IND_NF_SB','p','Non-ferrous metals - Steam boiler');
-- Non-metallic minerals
INSERT INTO "commodities" VALUES('IND_NM_CMT','p','Cement');
INSERT INTO "commodities" VALUES('IND_NM_CLK','p','Clinker');
INSERT INTO "commodities" VALUES('IND_NM_LIM','p','Lime');
INSERT INTO "commodities" VALUES('IND_NM_GLS','p','Glass');
INSERT INTO "commodities" VALUES('IND_NM_CRM','p','Ceramics');
INSERT INTO "commodities" VALUES('IND_NM_EC','p','Non-metallic minerals - Electro-chemical process');
INSERT INTO "commodities" VALUES('IND_NM_MD','p','Non-metallic minerals - Machine drive');
INSERT INTO "commodities" VALUES('IND_NM_OTH','p','Non-metallic minerals - Other');
INSERT INTO "commodities" VALUES('IND_NM_SB','p','Non-metallic minerals - Steam boiler');
-- Pulp and paper
INSERT INTO "commodities" VALUES('IND_PP_PUL','p','Pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUC','p','Chemical pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUM','p','Mechanical pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PUR','p','Recycled pulp for paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_PAP','p','Paper and paperboard');
INSERT INTO "commodities" VALUES('IND_PP_MD','p','Pulp and paper - Machine drive');
INSERT INTO "commodities" VALUES('IND_PP_OTH','p','Pulp and paper - Other energy use');
INSERT INTO "commodities" VALUES('IND_PP_PH','p','Pulp and paper - Process heat');
INSERT INTO "commodities" VALUES('IND_PP_DH','p','Pulp and paper - Direct heat');
INSERT INTO "commodities" VALUES('IND_PP_SB','p','Pulp and paper - Steam boiler');
-- Other industries
INSERT INTO "commodities" VALUES('IND_OTH_MD','p','Other industries - Machine drive');
INSERT INTO "commodities" VALUES('IND_OTH_OTH','p','Other industries - Other');
INSERT INTO "commodities" VALUES('IND_OTH_PH','p','Other industries - Process heat');
INSERT INTO "commodities" VALUES('IND_OTH_SB','p','Other industries - Steam boiler');
-- Emission commodities
INSERT INTO "commodities" VALUES('IND_CH4','e','Industry - CH4 emission');
INSERT INTO "commodities" VALUES('IND_CO2','e','Industry - CO2 emission');
INSERT INTO "commodities" VALUES('IND_CO2_PRC','e','Industry - Process CO2 emission');
INSERT INTO "commodities" VALUES('IND_N2O','e','Industry - N2O emission');
INSERT INTO "commodities" VALUES('IND_SOX','e','Industry - SOX emission');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "commodities" VALUES('DMY_OUT','d','');
INSERT INTO "commodities" VALUES('SNK_CO2_EM','e','');
INSERT INTO "commodities" VALUES('BIO_BIN','p','');
INSERT INTO "commodities" VALUES('BIO_BMU','p','');
INSERT INTO "commodities" VALUES('BIO_GAS','p','');
INSERT INTO "commodities" VALUES('BIO_METH','p','');
INSERT INTO "commodities" VALUES('BIO_SLB','p','');
INSERT INTO "commodities" VALUES('COA_HCO','p','');
INSERT INTO "commodities" VALUES('COA_OVC','p','');
INSERT INTO "commodities" VALUES('ELC_BLQ','p','');
INSERT INTO "commodities" VALUES('ELC_CEN','p','');
INSERT INTO "commodities" VALUES('ELC_DST','p','');
INSERT INTO "commodities" VALUES('ELC_NGA','p','');
INSERT INTO "commodities" VALUES('GAS_BFG','p','');
INSERT INTO "commodities" VALUES('GAS_COG','p','');
INSERT INTO "commodities" VALUES('GAS_ETH','p','');
INSERT INTO "commodities" VALUES('GAS_NGA','p','');
INSERT INTO "commodities" VALUES('GAS_RFG','p','');
INSERT INTO "commodities" VALUES('GEO','p','');
INSERT INTO "commodities" VALUES('H2','p','');
INSERT INTO "commodities" VALUES('H2_EL','p','');
INSERT INTO "commodities" VALUES('H2_EL_SOEC','p','');
INSERT INTO "commodities" VALUES('H2_BL','p','');
INSERT INTO "commodities" VALUES('HET','p','');
INSERT INTO "commodities" VALUES('MTH_SYN','p','');
INSERT INTO "commodities" VALUES('OIL_DST','p','');
INSERT INTO "commodities" VALUES('OIL_GSL','p','');
INSERT INTO "commodities" VALUES('OIL_HFO','p','');
INSERT INTO "commodities" VALUES('OIL_JTK','p','');
INSERT INTO "commodities" VALUES('OIL_KER','p','');
INSERT INTO "commodities" VALUES('OIL_LPG','p','');
INSERT INTO "commodities" VALUES('OIL_NAP','p','');
INSERT INTO "commodities" VALUES('OIL_NSP','p','');
INSERT INTO "commodities" VALUES('OIL_PTC','p','');
INSERT INTO "commodities" VALUES('SYN_DST','p','');
INSERT INTO "commodities" VALUES('SYN_KER','p','');
INSERT INTO "commodities" VALUES('SYN_MET','p','');
INSERT INTO "commodities" VALUES('SYN_NGA','p','');
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
-- Industrial sector
-- Base year
-- Pulp and paper
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_MEC_E','IND_PP_SB',0.69,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_MEC_E','IND_PP_PUM',0.31,'');
-- New technologies
-- Chemicals
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_NAPSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_NAPSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_NAPSC_N','IND_CH_SB',0.68,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_NAPSC_N','IND_CH_HVC',0.32,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_ETHSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_ETHSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_ETHSC_N','IND_CH_SB',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_ETHSC_N','IND_CH_HVC',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_GSOSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_GSOSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_LPGSC_N','IND_CH_SB',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_HVC_LPGSC_N','IND_CH_HVC',0.42,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_LPGSC_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_HVC_LPGSC_N','IND_CH_HVC',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'IND_CH_HVC_NCC_N','IND_CH_SB',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'IND_CH_HVC_NCC_N','IND_CH_HVC',0.455,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_OLF_MTO_N','IND_CH_OLF',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_OLF_MTO_N','IND_CH_SB',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_NGASR_N','IND_CH_AMM',0.10,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_NGASR_N','IND_CH_SB',0.90,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_NGASR_N','IND_CH_AMM',0.08,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_NGASR_N','IND_CH_SB',0.92,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_AMM_NGASR_CCS_N','IND_CH_AMM',0.10,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_AMM_NGASR_CCS_N','IND_CH_SB',0.90,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM',0.11,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_NAPPOX_N','IND_CH_SB',0.89,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM',0.09,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_SB',0.91,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_COAGSF_N','IND_CH_AMM',0.40,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_AMM_COAGSF_N','IND_CH_SB',0.60,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_COAGSF_N','IND_CH_AMM',0.345,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_AMM_COAGSF_N','IND_CH_SB',0.655,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_AMM',0.37,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_SB',0.63,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_NGASR_N','IND_CH_MTH',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_NGASR_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'IND_CH_MTH_NGASR_N','IND_CH_MTH',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'IND_CH_MTH_NGASR_N','IND_CH_SB',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_MTH_NGASR_CCS_N','IND_CH_MTH',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_MTH_NGASR_CCS_N','IND_CH_SB',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_COGSR_N','IND_CH_MTH',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_COGSR_N','IND_CH_SB',0.85,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_LPGSR_N','IND_CH_MTH',0.26,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_LPGSR_N','IND_CH_SB',0.74,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_COAGSF_N','IND_CH_MTH',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_MTH_COAGSF_N','IND_CH_SB',0.85,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_MTH',0.145,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_SB',0.855,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_CHL_MERC_N','IND_CH_CHL',0.70,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_CHL_MERC_N','IND_CH_CHL',0.54,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_CHL_DIAP_N','IND_CH_CHL',0.70,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_CHL_DIAP_N','IND_CH_CHL',0.54,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CH_CHL_MEMB_N','IND_CH_CHL',0.70,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CH_CHL_MEMB_N','IND_CH_CHL',0.54,'No TechOutputSplit for IND_H2 to avoid forced H2 consumption');
-- Iron and steel
--INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_IS_BOF_BFBOF_N','GAS_BFG',0.78,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_IS_BOF_BFBOF_N','IND_IS_BOF',0.22,'');
--INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_BOF_BFBOF_CCS_N','GAS_BFG',0.78,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_BOF_BFBOF_CCS_N','IND_IS_BOF',0.22,'');
--INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'IND_IS_BOF_BFTGRBOF_CCS_N','GAS_BFG',0.78,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'IND_IS_BOF_BFTGRBOF_CCS_N','IND_IS_BOF',0.22,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_IS_DRI_DRIEAF_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_IS_DRI_DRIEAF_N','IND_IS_SB',0.17,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N','IND_IS_SB',0.17,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_DRI_HDREAF_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_DRI_HDREAF_N','IND_IS_SB',0.17,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_BOF_ULCORED_CCS_N','IND_IS_EAF',0.83,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_IS_BOF_ULCORED_CCS_N','IND_IS_SB',0.17,'');
-- Pulp and paper
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_KRF_N','BIO_BIN',0.77,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_KRF_N','IND_ELC_BP',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_KRF_N','IND_PP_PUC',0.03,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_SUL_N','BIO_BIN',0.76,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_SUL_N','IND_ELC_BP',0.18,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_SUL_N','IND_PP_PUC',0.06,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_MEC_N','IND_PP_PUM',0.27,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_PP_PUL_MEC_N','IND_PP_SB',0.73,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_PP_PUL_MEC_N','IND_PP_PUM',0.15,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_PP_PUL_MEC_N','IND_PP_SB',0.85,'');
-- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_CI_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_CI_N','ELC_DST',0.455,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_CI_N','ELC_DST',0.477,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_CI_N','ELC_DST',0.511,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_NGA_CI_N','ELC_DST',0.518,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TG_N','ELC_DST',0.392,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TG_N','ELC_DST',0.400,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TG_N','ELC_DST',0.414,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TG_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TV_N','ELC_DST',0.200,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TV_N','ELC_DST',0.211,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TV_N','ELC_DST',0.225,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TV_N','ELC_DST',0.241,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N','ELC_DST',0.431,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N','ELC_DST',0.453,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N','ELC_DST',0.466,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N','ELC_DST',0.483,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_CI_N','IND_HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_CI_N','IND_HET',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_CI_N','IND_HET',0.523,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_CI_N','IND_HET',0.489,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_NGA_CI_N','IND_HET',0.482,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TG_N','IND_HET',0.608,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TG_N','IND_HET',0.600,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TG_N','IND_HET',0.586,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TG_N','IND_HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TV_N','IND_HET',0.800,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TV_N','IND_HET',0.789,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TV_N','IND_HET',0.775,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TV_N','IND_HET',0.759,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N','IND_HET',0.569,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N','IND_HET',0.547,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N','IND_HET',0.534,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N','IND_HET',0.517,'');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_SLB','IND_FT_BIO_E',0.60,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','IND_FT_ELC_E',0.70,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_DST','IND_FT_ELC_E',0.00,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2012,'ELC_CEN','IND_FT_ELC_E',0.65,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2012,'ELC_DST','IND_FT_ELC_E',0.12,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_CEN','IND_FT_ELC_E',0.35,'');
--INSERT INTO "TechInputSplit" VALUES ('IT',2050,'ELC_DST','IND_FT_ELC_E',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'GAS_RFG','IND_FT_ETH_E',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'GAS_RFG','IND_FT_ETH_N',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'OIL_HFO','IND_FT_HFO_E',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'OIL_HFO','IND_FT_HFO_N',0.90,'');
-- Base year technologies
-- Chemicals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_OLF','IND_CH_TECH',0.1419,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_BTX','IND_CH_TECH',0.0386,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_AMM','IND_CH_TECH',0.0308,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MTH','IND_CH_TECH',0.0024,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_CHL','IND_CH_TECH',0.0103,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_OTH_PROD','IND_CH_TECH',0.7760,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_OLF_E',0.010,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_OLF_E',0.074,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_CH_OLF_E',0.005,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_CH_OLF_E',0.029,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_CH_OLF_E',0.023,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ETH','IND_CH_OLF_E',0.014,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS','IND_CH_OLF_E',0.700,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_OLF_E',0.144,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_OLF_E',0.001,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_BTX_E',0.008,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_BTX_E',0.044,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_CH_BTX_E',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_CH_BTX_E',0.023,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_CH_BTX_E',0.019,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ETH','IND_CH_BTX_E',0.022,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS','IND_CH_BTX_E',0.722,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_BTX_E',0.156,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_BTX_E',0.002,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_AMM_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_AMM_E',0.47,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS','IND_CH_AMM_E',0.21,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_AMM_E',0.29,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_AMM_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_MTH_E',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_MTH_E',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS','IND_CH_MTH_E',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_MTH_E',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_MTH_E',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_CHL_E',0.83,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_CHL_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_CHL_E',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_OTH_E',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS','IND_CH_OTH_E',0.24,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_OTH_E',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_OTH_E',0.23,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_OTH','IND_CH_OTH_E',0.26,'');
-- Iron and steel
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_BOF','IND_IS_TECH',0.3738,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_BOF','IND_IS_TECH',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_IS_BOF','IND_IS_TECH',0.18,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_EAF','IND_IS_TECH',0.6262,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_EAF','IND_IS_TECH',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_IS_EAF','IND_IS_TECH',0.82,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_SB','IND_IS_BOF_E',0.0339,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_MD','IND_IS_BOF_E',0.0621,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_OTH','IND_IS_BOF_E',0.0247,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_FS','IND_IS_BOF_E',0.4111,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_IS_BOF_E',0.3964,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_IS_BOF_E',0.0451,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BFG','IND_IS_BOF_E',0.0012,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_IS_BOF_E',0.0194,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_IS_BOF_E',0.0061,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_SB','IND_IS_BOF_E',0.0329,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_MD','IND_IS_BOF_E',0.0604,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_OTH','IND_IS_BOF_E',0.0240,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_FS','IND_IS_BOF_E',0.3798,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_NGA','IND_IS_BOF_E',0.4163,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_COA','IND_IS_BOF_E',0.0659,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_BFG','IND_IS_BOF_E',0.0011,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_HFO','IND_IS_BOF_E',0.0132,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_LPG','IND_IS_BOF_E',0.0054,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_SB','IND_IS_EAF_E',0.0717,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_MD','IND_IS_EAF_E',0.2539,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_OTH','IND_IS_EAF_E',0.0731,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_FS','IND_IS_EAF_E',0.0769,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_IS_EAF_E',0.0760,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_IS_EAF_E',0.0800,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_IS_EAF_E',0.3646,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_IS_EAF_E',0.0038,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_SB','IND_IS_EAF_E',0.0705,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_MD','IND_IS_EAF_E',0.2498,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_OTH','IND_IS_EAF_E',0.0719,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_IS_FS','IND_IS_EAF_E',0.0680,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_NGA','IND_IS_EAF_E',0.0785,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_COA','IND_IS_EAF_E',0.0983,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_ELC','IND_IS_EAF_E',0.3586,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_OIL','IND_IS_EAF_E',0.0033,'');
-- Non-ferrous metals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_ALU','IND_NF_TECH',0.4903,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_COP','IND_NF_TECH',0.0923,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_ZNC','IND_NF_TECH',0.0881,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_OTH_PROD','IND_NF_TECH',0.3293,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_ALU_E',0.0311,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_ALU_E',0.8618,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_ALU_E',0.1071,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_COP_E',0.4726,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_COP_E',0.2602,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NF_COP_E',0.0040,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COK','IND_NF_COP_E',0.0467,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_COP_E',0.0709,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_SB','IND_NF_COP_E',0.1456,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_ZNC_E',0.6288,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_ZNC_E',0.1346,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_ZNC_E',0.0734,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_SB','IND_NF_ZNC_E',0.0864,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_MD','IND_NF_ZNC_E',0.0768,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_MD','IND_NF_OTH_E',0.0902,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_OTH','IND_NF_OTH_E',0.9098,'');
-- Non-metallic minerals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_CMT','IND_NM_TECH',0.7625,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_LIM','IND_NM_TECH',0.0827,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_GLS','IND_NM_TECH',0.0580,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_CRM','IND_NM_TECH',0.0968,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CLK_DRY_E',0.0023,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_CLK_DRY_E',0.0170,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CLK_DRY_E',0.0034,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PTC','IND_NM_CLK_DRY_E',0.7162,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_NM_CLK_DRY_E',0.0942,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_NM_CLK_DRY_E',0.0342,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_NM_CLK_DRY_E',0.0011,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_SB','IND_NM_CLK_DRY_E',0.0015,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_MD','IND_NM_CLK_DRY_E',0.1214,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_OTH','IND_NM_CLK_DRY_E',0.0087,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CLK_WET_E',0.0127,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_CLK_WET_E',0.1056,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CLK_WET_E',0.0554,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PTC','IND_NM_CLK_WET_E',0.6824,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_NM_CLK_WET_E',0.0247,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_NM_CLK_WET_E',0.0120,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_NM_CLK_WET_E',0.0078,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_SB','IND_NM_CLK_WET_E',0.0054,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_MD','IND_NM_CLK_WET_E',0.0877,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_OTH','IND_NM_CLK_WET_E',0.0063,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_LIM_E',0.1872,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_LIM_E',0.2990,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_LIM_E',0.0586,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_NM_LIM_E',0.0111,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_NM_LIM_E',0.1499,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_SB','IND_NM_LIM_E',0.1136,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_MD','IND_NM_LIM_E',0.0485,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_OTH','IND_NM_LIM_E',0.1321,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_GLS_E',0.6750,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_GLS_E',0.0425,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_NM_GLS_E',0.0181,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_SB','IND_NM_GLS_E',0.0862,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_MD','IND_NM_GLS_E',0.0706,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_OTH','IND_NM_GLS_E',0.1076,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CRM_E',0.6734,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_CRM_E',0.0473,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CRM_E',0.0459,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_NM_CRM_E',0.0020,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_NM_CRM_E',0.0227,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_SB','IND_NM_CRM_E',0.0969,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_MD','IND_NM_CRM_E',0.0881,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_OTH','IND_NM_CRM_E',0.0237,'');
-- Pulp and paper
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PUC','IND_PP_PUL_TECH',0.025,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PUM','IND_PP_PUL_TECH',0.057,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_PP_PUC','IND_PP_PUL_TECH',0.020,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_PP_PUM','IND_PP_PUL_TECH',0.045,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_CHEM_E',0.7406,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PH','IND_PP_PUL_CHEM_E',0.1144,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_CHEM_E',0.1450,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_REC_E',0.1395,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_DH','IND_PP_PUL_REC_E',0.0337,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_REC_E',0.7905,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_OTH','IND_PP_PUL_REC_E',0.0363,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PAP_E',0.6566,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_DH','IND_PP_PAP_E',0.0375,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PAP_E',0.2335,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_OTH','IND_PP_PAP_E',0.0097,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PUL','IND_PP_PAP_E',0.0627,'');
-- Other industries
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OTH_SB','IND_OTH_TECH',0.1145,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OTH_PH','IND_OTH_TECH',0.4948,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OTH_MD','IND_OTH_TECH',0.3241,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OTH_OTH','IND_OTH_TECH',0.0666,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_OTH_SB','IND_OTH_TECH',0.1493,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_OTH_PH','IND_OTH_TECH',0.4693,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_OTH_MD','IND_OTH_TECH',0.3088,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_OTH_OTH','IND_OTH_TECH',0.0715,'');
-- Other non-specified consumption
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_ONS_TECH',0.459,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_ONS_TECH',0.232,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_ONS_TECH',0.008,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_ONS_TECH',0.107,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_ONS_TECH',0.011,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_ONS_TECH',0.019,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_GEO','IND_ONS_TECH',0.000,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HET','IND_ONS_TECH',0.164,'');
-- Industrial non-energy uses
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'COA_HCO','IND_NEU_TECH',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'OIL_NSP','IND_NEU_TECH',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2012,'COA_HCO','IND_NEU_TECH',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2012,'OIL_NSP','IND_NEU_TECH',0.96,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'COA_HCO','IND_NEU_TECH',0.00,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2016,'OIL_NSP','IND_NEU_TECH',1.00,'');
-- New technologies
-- Chemicals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NAP','IND_CH_HVC_NAPSC_N',0.139,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_HVC_NAPSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',0.858,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ETH','IND_CH_HVC_ETHSC_N',0.193,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_HVC_ETHSC_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',0.803,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_CH_HVC_GSOSC_N',0.117,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_HVC_GSOSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',0.880,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_CH_HVC_LPGSC_N',0.145,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_HVC_LPGSC_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',0.852,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NAP','IND_CH_HVC_NCC_N',0.147,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_MD','IND_CH_HVC_NCC_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_FS_NAP','IND_CH_HVC_NCC_N',0.849,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_BIO','IND_CH_HVC_BDH_N',0.017,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_MD','IND_CH_HVC_BDH_N',0.020,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_SB','IND_CH_HVC_BDH_N',0.479,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_FS_BIO','IND_CH_HVC_BDH_N',0.484,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_LPG','IND_CH_OLF_PDH_N',0.154,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_CH_SB','IND_CH_OLF_PDH_N',0.039,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_CH_MD','IND_CH_OLF_PDH_N',0.001,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N',0.805,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_LPG','IND_CH_OLF_PDH_N',0.145,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_SB','IND_CH_OLF_PDH_N',0.036,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_MD','IND_CH_OLF_PDH_N',0.001,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N',0.818,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_OLF_MTO_N',0.089,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_MTH','IND_CH_OLF_MTO_N',0.907,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_OLF_MTO_N',0.003,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_AMM_NGASR_N',0.57,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_AMM_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_CH_AMM_NGASR_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',0.55,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_EC','IND_CH_AMM_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_NGA','IND_CH_AMM_NGASR_CCS_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_MD','IND_CH_AMM_NGASR_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NAP','IND_CH_AMM_NAPPOX_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_AMM_NAPPOX_N',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NAP','IND_CH_AMM_NAPPOX_N',0.50,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_EC','IND_CH_AMM_NAPPOX_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_CH_AMM_COAGSF_N',0.52,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',0.40,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_AMM_COAGSF_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_CH_AMM_COAGSF_N',0.47,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_CH_EC','IND_CH_AMM_COAGSF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_BIO','IND_CH_AMM_BIOGSF_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_EC','IND_CH_AMM_BIOGSF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_H2E','IND_CH_AMM_ELCSYS_N',0.89,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_MD','IND_CH_AMM_ELCSYS_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_CH_MTH_NGASR_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_MTH_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NGA','IND_CH_MTH_NGASR_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',0.61,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_CH_MD','IND_CH_MTH_NGASR_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_NGA','IND_CH_MTH_NGASR_CCS_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N',0.61,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_MD','IND_CH_MTH_NGASR_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COG','IND_CH_MTH_COGSR_N',0.51,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_MTH_COGSR_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_LPG','IND_CH_MTH_LPGSR_N',0.39,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',0.56,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_MTH_LPGSR_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_CH_MTH_COAGSF_N',0.54,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',0.39,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_MTH_COAGSF_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_BIO','IND_CH_MTH_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',0.46,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_MD','IND_CH_MTH_BIOGSF_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_H2E','IND_CH_MTH_ELCSYS_N',0.94,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_CH_MD','IND_CH_MTH_ELCSYS_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_CHL_MERC_N',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_CHL_MERC_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_CHL_MERC_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_CHL_DIAP_N',0.81,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_CHL_DIAP_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_CHL_DIAP_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_EC','IND_CH_CHL_MEMB_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_SB','IND_CH_CHL_MEMB_N',0.12,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_CH_MD','IND_CH_CHL_MEMB_N',0.08,'');
-- Iron and steel
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BFG','IND_IS_BOF_BFBOF_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_FS','IND_IS_BOF_BFBOF_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_MD','IND_IS_BOF_BFBOF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_IS_BOF_BFBOF_N',0.36,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_BFG','IND_IS_BOF_BFBOF_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',0.57,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_BOF_BFBOF_CCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_IS_BOF_BFBOF_CCS_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_BFG','IND_IS_BOF_BFBOF_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',0.57,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_ELC','IND_IS_BOF_BFBOF_CCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_COA','IND_IS_BOF_BFBOF_CCS_N',0.36,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N',0.52,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',0.32,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_ELC','IND_IS_DRI_DRIEAF_N',0.70,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_IS_FS','IND_IS_DRI_DRIEAF_N',0.22,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_IS_DRI_DRIEAF_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_DRI_DRIEAF_CCS_N',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N',0.21,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_DRI_HDREAF_N',0.22,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_H2','IND_IS_DRI_HDREAF_N',0.60,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_DRI_HDREAF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_MD','IND_IS_DRI_HDREAF_N',0.13,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_NGA','IND_IS_BOF_HISBOF_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_ELC','IND_IS_BOF_HISBOF_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2025,'IND_COA','IND_IS_BOF_HISBOF_N',0.94,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_BOF_HISBOF_CCS_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_BOF_HISBOF_CCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_IS_BOF_HISBOF_CCS_N',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_MD','IND_IS_BOF_HISBOF_CCS_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_IS_BOF_ULCOWIN_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_BOF_ULCOWIN_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_BOF_ULCOWIN_N',0.80,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_BOF_ULCOLYSIS_N',0.92,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_BOF_ULCOLYSIS_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_ELC','IND_IS_BOF_ULCORED_CCS_N',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N',0.21,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_IS_BOF_ULCORED_CCS_N',0.07,'');
-- Non-ferrous metals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NF_AMN_BAY_N',0.58,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_AMN_BAY_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_AMN_BAY_N',0.27,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_AMN_BAY_N',0.07,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_AMN','IND_NF_ALU_HLH_N',0.04,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_ALU_HLH_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_ALU_HLH_N',0.91,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_ALU_SEC_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_ALU_SEC_N',0.86,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_ALU_SEC_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NF_AMN','IND_NF_ALU_HLHIA_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_NF_ALU_HLHIA_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NF_EC','IND_NF_ALU_HLHIA_N',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NF_AMN','IND_NF_ALU_CBT_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NGA','IND_NF_ALU_CBT_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NF_EC','IND_NF_ALU_CBT_N',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NF_COP_N',0.03,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NF_COP_N',0.20,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NF_COP_N',0.02,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_NF_COP_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_COP_N',0.67,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_EC','IND_NF_ZNC_N',0.76,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_SB','IND_NF_ZNC_N',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_NF_EC','IND_NF_ZNC_N',0.76,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_NF_SB','IND_NF_ZNC_N',0.19,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2010,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NF_EC','IND_NF_ZNC_N',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NF_SB','IND_NF_ZNC_N',0.18,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NF_MD','IND_NF_ZNC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_NF_EC','IND_NF_ZNC_N',0.77,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_NF_SB','IND_NF_ZNC_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2040,'IND_NF_MD','IND_NF_ZNC_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NF_EC','IND_NF_ZNC_N',0.79,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NF_SB','IND_NF_ZNC_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'IND_NF_MD','IND_NF_ZNC_N',0.06,'');
-- Non-metallic minerals
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_CLK_DRY_N',0.707,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CLK_DRY_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CLK_DRY_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_NM_CLK_DRY_N',0.090,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_CLK_DRY_N',0.195,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_NM_CLK_DRY_BIO_N',0.797,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CLK_DRY_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CLK_DRY_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_CLK_DRY_BIO_N',0.195,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_CLK_WET_N',0.64,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_CLK_WET_N',0.16,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CLK_WET_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_NM_CLK_WET_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_CLK_WET_N',0.06,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_COA','IND_NM_CLK_DRYCL_PCCS_N',0.734,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',0.094,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',0.043,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',0.121,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',0.828,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N',0.043,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2020,'IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N',0.121,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_NM_CLK_DRYCL_OCCS_N',0.707,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',0.090,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',0.195,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',0.797,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',0.004,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N',0.195,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_CLK','IND_NM_CEM_BLN_N',0.66,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'MAT_BFS','IND_NM_CEM_BLN_N',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_NM_CEM_AAC_N',0.62,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_HFO','IND_NM_CEM_AAC_N',0.16,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_NM_CEM_AAC_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_BIO','IND_NM_CEM_AAC_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NM_EC','IND_NM_CEM_AAC_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_COA','IND_NM_CEM_BEL_N',0.61,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_HFO','IND_NM_CEM_BEL_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NGA','IND_NM_CEM_BEL_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_BIO','IND_NM_CEM_BEL_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_NM_EC','IND_NM_CEM_BEL_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_COA','IND_NM_LIM_LRK_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_HFO','IND_NM_LIM_LRK_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_LIM_LRK_N',0.27,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_BIO','IND_NM_LIM_LRK_N',0.21,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_LIM_LRK_N',0.01,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_GLS_FOSS_N',0.32,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_NM_GLS_FOSS_N',0.63,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_GLS_FOSS_N',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_GLS_ELEC_N',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_OIL','IND_NM_GLS_ELEC_N',0.69,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NGA','IND_NM_CRM_N',0.88,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_NM_EC','IND_NM_CRM_N',0.12,'');
-- Pulp and paper
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PH','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_KRF_N',0.42,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'MAT_WOD','IND_PP_PUL_KRF_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_PH','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_MD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_SB','IND_PP_PUL_KRF_N',0.41,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'MAT_WOD','IND_PP_PUL_KRF_N',0.09,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PH','IND_PP_PUL_SUL_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_SUL_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_SUL_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'MAT_WOD','IND_PP_PUL_SUL_N',0.10,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_PH','IND_PP_PUL_SUL_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_MD','IND_PP_PUL_SUL_N',0.17,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_SB','IND_PP_PUL_SUL_N',0.34,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'MAT_WOD','IND_PP_PUL_SUL_N',0.11,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_MEC_N',0.86,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'MAT_WOD','IND_PP_PUL_MEC_N',0.14,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_MD','IND_PP_PUL_MEC_N',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'MAT_WOD','IND_PP_PUL_MEC_N',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_SCH_N',0.31,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_SCH_N',0.45,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'MAT_WOD','IND_PP_PUL_SCH_N',0.24,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_MD','IND_PP_PUL_SCH_N',0.30,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'IND_PP_SB','IND_PP_PUL_SCH_N',0.44,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2030,'MAT_WOD','IND_PP_PUL_SCH_N',0.26,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PUL_REC_N',0.38,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PUL_REC_N',0.62,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_PUL','IND_PP_PAP_N',0.08,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_MD','IND_PP_PAP_N',0.35,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'IND_PP_SB','IND_PP_PAP_N',0.57,'');

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
-- Industrial sector
INSERT INTO "tech_groups" VALUES ('IND_FT_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_BIO_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_BIO_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_COK_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_HFO_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_NAP_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_NAP_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_OIL_E','');
INSERT INTO "tech_groups" VALUES ('IND_FT_OIL_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_H2_N','');
INSERT INTO "tech_groups" VALUES ('IND_MD_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_MD_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_MD_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_MD_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_MD_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_MD_ELC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_GSL_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_KER_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NAP_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NSP_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_LPG_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NAP_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_FS_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ETH_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_HFO_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_PTC_E','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_COK_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_ETH_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_HFO_N','');
INSERT INTO "tech_groups" VALUES ('IND_CH_OTH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_ELC_N','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_DST_N','');
INSERT INTO "tech_groups" VALUES ('IND_NF_OTH_NGA_N','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_COK_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_DST_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_ELC_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_LPG_E','');
INSERT INTO "tech_groups" VALUES ('IND_NM_OTH_NGA_E','');
INSERT INTO "tech_groups" VALUES ('IND_CHP_BLQ_CI_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_GEO_1_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_GEO_2_N','');
INSERT INTO "tech_groups" VALUES ('IND_FT_GEO_3_N','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Industrial sector
INSERT INTO "groups" VALUES ('IND_FT_BIO_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_COK_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_ELC_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_HFO_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_NAP_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_OIL_GRP','');
INSERT INTO "groups" VALUES ('IND_FT_H2_GRP','');
INSERT INTO "groups" VALUES ('IND_MD_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_FS_NGA_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_FS_OIL_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_FS_NAP_GRP','');
INSERT INTO "groups" VALUES ('IND_CH_OTH_GRP','');
INSERT INTO "groups" VALUES ('IND_NF_OTH_GRP','');
INSERT INTO "groups" VALUES ('IND_NM_OTH_GRP','');

CREATE TABLE "TechGroupWeight" (
	"regions"	        text,
	"tech"		        text,
	"group_name"	    text,
	"weight"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name","regions")
);
-- Industrial sector
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_BIO_E','IND_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_BIO_N','IND_FT_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_COK_E','IND_FT_COK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_COK_N','IND_FT_COK_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_ELC_E','IND_FT_ELC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_HFO_E','IND_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_HFO_N','IND_FT_HFO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_NAP_E','IND_FT_NAP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_NAP_N','IND_FT_NAP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_NGA_E','IND_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_NGA_N','IND_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_OIL_E','IND_FT_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_OIL_N','IND_FT_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_FT_H2_N','IND_FT_H2_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_DST_E','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_DST_N','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_ELC_E','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_ELC_N','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_LPG_N','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_MD_NGA_N','IND_MD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_DST_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_DST_N','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_GSL_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_HFO_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_KER_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_LPG_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_LPG_N','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_NAP_E','IND_CH_FS_NAP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_NAP_N','IND_CH_FS_NAP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_NGA_E','IND_CH_FS_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_NGA_N','IND_CH_FS_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_FS_NSP_E','IND_CH_FS_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_COK_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_COK_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_DST_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_DST_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_ELC_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_ELC_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_ETH_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_ETH_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_HFO_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_HFO_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_NGA_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_NGA_N','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_CH_OTH_PTC_E','IND_CH_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_DST_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_DST_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_ELC_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_ELC_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_LPG_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_NGA_E','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NF_OTH_NGA_N','IND_NF_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NM_OTH_COK_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NM_OTH_DST_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NM_OTH_ELC_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NM_OTH_LPG_E','IND_NM_OTH_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IT','IND_NM_OTH_NGA_E','IND_NM_OTH_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Industrial sector
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_FT_ELC_GRP',429.27,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_FT_ELC_GRP',402.37,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_FT_ELC_GRP',385.75,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_FT_ELC_GRP',391.35,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_FT_ELC_GRP',402.90,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_FT_ELC_GRP',389.01,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_FT_NGA_GRP',389.56,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_FT_NGA_GRP',392.78,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_FT_NGA_GRP',371.69,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_FT_NGA_GRP',380.81,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_FT_NGA_GRP',379.86,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_FT_NGA_GRP',359.17,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2050,'IND_FT_NGA_GRP',104.67,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_FT_COK_GRP',47.63,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_FT_COK_GRP',45.41,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_FT_COK_GRP',21.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_FT_COK_GRP',16.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_FT_COK_GRP',18.86,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_FT_COK_GRP',17.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_CH_FS_NGA_GRP',19.36,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_CH_FS_NGA_GRP',18.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_CH_FS_NGA_GRP',23.89,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_CH_FS_NGA_GRP',28.93,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_CH_FS_NGA_GRP',27.84,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_CH_FS_NGA_GRP',29.83,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_CH_FS_OIL_GRP',67.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_CH_FS_OIL_GRP',58.88,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_CH_FS_OIL_GRP',44.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_CH_FS_OIL_GRP',29.19,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_CH_FS_OIL_GRP',18.28,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_CH_FS_OIL_GRP',13.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2010,'IND_CH_FS_NAP_GRP',112.96,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2012,'IND_CH_FS_NAP_GRP',78.33,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2014,'IND_CH_FS_NAP_GRP',91.30,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2016,'IND_CH_FS_NAP_GRP',127.68,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2018,'IND_CH_FS_NAP_GRP',150.96,'PJ');
INSERT INTO "MinActivityGroup" VALUES (2020,'IND_CH_FS_NAP_GRP',137.39,'PJ');

CREATE TABLE "MaxActivityGroup" (
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Industrial sector
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_FT_ELC_GRP',474.46,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_FT_ELC_GRP',444.73,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_FT_ELC_GRP',426.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_FT_ELC_GRP',432.55,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_FT_ELC_GRP',445.31,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_FT_ELC_GRP',429.96,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_FT_NGA_GRP',481.2,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_FT_NGA_GRP',434.1,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_FT_NGA_GRP',410.8,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_FT_NGA_GRP',420.9,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_FT_NGA_GRP',419.8,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_FT_NGA_GRP',397.0,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_FT_COK_GRP',52.64,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_FT_COK_GRP',50.19,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_FT_COK_GRP',34.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_FT_COK_GRP',30.60,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_FT_COK_GRP',23.82,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_FT_COK_GRP',19.38,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_FT_HFO_GRP',100.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_FT_HFO_GRP',50.93,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_FT_HFO_GRP',36.53,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_FT_HFO_GRP',38.38,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_FT_HFO_GRP',24.78,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_FT_HFO_GRP',23.24,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_FT_OIL_GRP',32.06,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_FT_OIL_GRP',33.34,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_FT_OIL_GRP',24.62,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_FT_OIL_GRP',21.42,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_FT_OIL_GRP',22.73,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_FT_OIL_GRP',19.37,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_CH_FS_NGA_GRP',36.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_CH_FS_NGA_GRP',38.20,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_CH_FS_NGA_GRP',37.73,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_CH_FS_NGA_GRP',63.95,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_CH_FS_NGA_GRP',30.77,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_CH_FS_NGA_GRP',32.97,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_CH_FS_OIL_GRP',74.13,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_CH_FS_OIL_GRP',65.08,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_CH_FS_OIL_GRP',48.80,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_CH_FS_OIL_GRP',49.16,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_CH_FS_OIL_GRP',20.20,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_CH_FS_OIL_GRP',15.28,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2010,'IND_CH_FS_NAP_GRP',124.85,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2012,'IND_CH_FS_NAP_GRP',86.57,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2014,'IND_CH_FS_NAP_GRP',100.91,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2016,'IND_CH_FS_NAP_GRP',141.12,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2018,'IND_CH_FS_NAP_GRP',166.85,'PJ');
INSERT INTO "MaxActivityGroup" VALUES (2020,'IND_CH_FS_NAP_GRP',151.85,'PJ');

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
-- Industrial sector
INSERT INTO "MinInputGroup" VALUES ('IT',2014,'ELC_CEN','IND_FT_H2_GRP',0.94,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'IND_ELC','IND_MD_GRP',0.99,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'IND_ELC','IND_MD_GRP',1.00,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'IND_NGA','IND_CH_OTH_GRP',0.50,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2010,'IND_NGA','IND_CH_OTH_GRP',0.43,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'IND_NGA','IND_CH_OTH_GRP',0.32,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'IND_ELC','IND_CH_OTH_GRP',0.10,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'IND_ELC','IND_CH_OTH_GRP',0.30,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'IND_ELC','IND_NF_OTH_GRP',0.62,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'IND_ELC','IND_NF_OTH_GRP',0.62,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2007,'IND_ELC','IND_NM_OTH_GRP',0.39,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'IND_ELC','IND_NM_OTH_GRP',0.55,'');

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
-- Industrial sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'ELC_CEN','IND_FT_H2_GRP',0.94,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_GAS','IND_FT_BIO_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_GAS','IND_FT_BIO_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_MET','IND_FT_NAP_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_MET','IND_FT_NAP_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_MET','IND_FT_NAP_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_MET','IND_FT_NAP_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','IND_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'SYN_NGA','IND_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','IND_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','IND_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','IND_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','IND_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','IND_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','IND_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','IND_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','IND_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','IND_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','IND_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','IND_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','IND_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','IND_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_DST','IND_FT_OIL_GRP',0.64,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_KER','IND_FT_OIL_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_GSL','IND_FT_OIL_GRP',0.52,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_JTK','IND_FT_OIL_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_DST','IND_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_KER','IND_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'OIL_DST','IND_FT_OIL_GRP',0.64,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'OIL_KER','IND_FT_OIL_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'OIL_GSL','IND_FT_OIL_GRP',0.52,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'OIL_JTK','IND_FT_OIL_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_DST','IND_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_KER','IND_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'OIL_DST','IND_FT_OIL_GRP',0.64,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'OIL_KER','IND_FT_OIL_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'OIL_GSL','IND_FT_OIL_GRP',0.52,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'OIL_JTK','IND_FT_OIL_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_DST','IND_FT_OIL_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_KER','IND_FT_OIL_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_DST','IND_FT_OIL_GRP',0.64,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_KER','IND_FT_OIL_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_GSL','IND_FT_OIL_GRP',0.52,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_JTK','IND_FT_OIL_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_DST','IND_FT_OIL_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_KER','IND_FT_OIL_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'IND_COK','IND_CH_OTH_GRP',0.004,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'IND_COK','IND_CH_OTH_GRP',0.031,'');
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
-- Industrial sector
-- Base year technologies
-- Machine drive and steam
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_MD_ELC_E',2.72E+02,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_MD_DST_E',1.73E-01,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2022,'IND_MD_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2022,'IND_MD_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_NGA_E',9.68E+01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_LPG_E',8.81E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_COA_E',6.87E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_HFO_E',1.24E+01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_DST_E',4.31E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_BIO_E',4.77E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_STM_HET_E',8.83E+01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2020,'IND_STM_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_STM_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_STM_COA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_STM_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_STM_BIO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_STM_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_STM_HET_E',0.0,'PJ','');
-- Chemicals
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OLF_E',2.78E+00,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_BTX_E',7.56E-01,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_AMM_E',6.05E-01,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_MTH_E',4.67E-02,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_CHL_E',2.02E-01,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_E',1.52E+01,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OLF_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_BTX_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_AMM_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_MTH_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_CHL_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_DST_E',23.86,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_GSL_E',5.47,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_HFO_E',15.15,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_KER_E',7.60,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_LPG_E',0.56,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_NAP_E',108.95,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_NGA_E',34.66,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_NSP_E',1.01,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_FS_RFG_E',16.98,'PJ','87.50% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_GSL_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_KER_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_LPG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_NAP_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_NSP_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_CH_FS_RFG_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_EC_E',1.61E+01,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_EC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_COK_E',1.65E-01,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_DST_E',4.69E+00,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_ELC_E',9.64E+00,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_ETH_E',1.77E+00,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_HFO_E',3.18E+00,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_NGA_E',1.94E+01,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_CH_OTH_PTC_E',3.03E-01,'PJ','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_COK_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_ETH_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_CH_OTH_PTC_E',0.0,'PJ','');
-- Iron and steel
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_IS_BOF_E',9.46,'Mt','80% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_IS_BOF_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_IS_EAF_E',15.84,'Mt','80% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_IS_EAF_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_IS_OTH_ELC_E',8.06,'PJ','80% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_IS_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_IS_FS_COK_E',55.47,'PJ','80% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_IS_FS_COK_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_IS_FS_PTC_E',0.10,'PJ','80% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_IS_FS_PTC_E',0.0,'PJ','');
-- Non-ferrous metals
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_ALU_E',1.26E+00,'Mt','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_COP_E',2.38E-01,'Mt','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_ZNC_E',2.26E-01,'Mt','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_OTH_E',8.47E-01,'Mt','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_ALU_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_COP_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_ZNC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_OTH_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_EC_E',5.96E+00,'PJ','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_EC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_OTH_ELC_E',5.22E+00,'PJ','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_OTH_DST_E',1.54E-01,'PJ','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_OTH_NGA_E',1.79E+00,'PJ','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NF_OTH_LPG_E',5.24E-01,'PJ','60% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NF_OTH_LPG_E',0.0,'PJ','');
-- Non-metallic minerals
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_CLK_WET_E',1.23E+01,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_CLK_DRY_E',3.08E+01,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_LIM_E',4.67E+00,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_GLS_E',3.28E+00,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_CRM_E',5.47E+00,'Mt','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_CLK_WET_E',0.00E+00,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_CLK_DRY_E',0.00E+00,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_LIM_E',0.00E+00,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_GLS_E',0.00E+00,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_CRM_E',0.00E+00,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_OTH_DST_E',1.96E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_OTH_NGA_E',6.61E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_OTH_COK_E',1.57E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_OTH_ELC_E',4.84E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_NM_OTH_LPG_E',5.96E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_OTH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_OTH_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_OTH_COK_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_NM_OTH_LPG_E',0.00E+00,'PJ','');
-- Pulp and paper
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PUL_CHEM_E',1.46E-01,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PUL_MEC_E',1.17E+00,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PUL_REC_E',5.28E+00,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PAP_E',9.48E+00,'Mt','94.74% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PUL_CHEM_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PUL_MEC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PUL_REC_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PAP_E',0.0,'Mt','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PH_HFO_E',3.64E-01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PH_DST_E',4.22E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PH_NGA_E',2.32E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_PH_ELC_E',1.02E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PH_HFO_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PH_NGA_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_PH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_OTH_DST_E',4.22E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_OTH_ELC_E',1.02E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_PP_OTH_LPG_E',5.59E-02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_PP_OTH_LPG_E',0.0,'PJ','');
-- Other industries
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_OTH_OTH_ELC_E',2.80E+01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2025,'IND_OTH_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_OTH_PH_HFO_E',3.49E+01,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_OTH_PH_DST_E',8.58E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_OTH_PH_NGA_E',1.59E+02,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2007,'IND_OTH_PH_LPG_E',5.48E+00,'PJ','90% of base year');
INSERT INTO "MinActivity" VALUES ('IT',2014,'IND_OTH_PH_HFO_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'IND_OTH_PH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'IND_OTH_PH_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'IND_OTH_PH_LPG_E',0.00E+00,'PJ','');

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
-- Industrial sector
-- Base year technologies
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_NGA_E',6.76E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_LPG_E',1.93E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_COA_E',4.01E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_COK_E',7.27E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_BFG_E',1.85E-01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_HFO_E',1.39E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_OIL_E',7.50E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_ETH_E',2.64E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_NAP_E',1.28E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_PTC_E',1.10E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_BIO_E',1.19E+01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_HET_E',1.18E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_COA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_COK_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_BFG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_OIL_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_ETH_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_NAP_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_PTC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_FT_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_HET_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_ELC_E',5.79E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'IND_FT_ELC_E',4.98E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'IND_FT_ELC_E',4.31E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_ELC_E',2.16E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_BFG_N',0.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_BIO_N',5.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_COA_N',18.88,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_COG_N',2.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_COK_N',16.52,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_ETH_N',5.99,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_HFO_N',31.66,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_LPG_N',4.38,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_NAP_N',29.15,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_NGA_N',169.08,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_OIL_N',17.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_PTC_N',24.97,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_GEO_1_N',0.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_GEO_2_N',0.20,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_FT_GEO_3_N',0.20,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_BFG_N',0.93,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_BIO_N',118.93,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_COA_N',200.34,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_COG_N',100.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_COK_N',363.37,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_ETH_N',131.80,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_HFO_N',696.48,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_LPG_N',96.42,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_NAP_N',641.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_NGA_N',3719.69,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_OIL_N',375.24,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_PTC_N',549.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_GEO_1_N',7.20,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_GEO_2_N',9.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_GEO_3_N',9.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'IND_FT_HET_N',1.31E+02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'IND_FT_HET_N',3.62E+02,'PJ','');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_MD_ELC_E',2.78E+02,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_MD_DST_E',1.77E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'IND_MD_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'IND_MD_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_NGA_E',1.01E+02,'PJ','93.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_LPG_E',9.47E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_COA_E',7.39E-02,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_HFO_E',2.47E+01,'PJ','90.90% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_DST_E',4.63E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_BIO_E',5.14E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_STM_HET_E',9.40E+01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'IND_STM_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_STM_LPG_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_STM_COA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'IND_STM_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_STM_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_STM_BIO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_STM_HET_E',0.0,'PJ','');
-- Chemicals
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OLF_E',2.84E+00,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_BTX_E',7.72E-01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_AMM_E',6.18E-01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_MTH_E',4.77E-02,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_CHL_E',2.06E-01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OLF_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_BTX_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_AMM_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_MTH_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_CHL_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_EC_E',1.64E+01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_EC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_COK_E',1.68E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_DST_E',4.79E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_ELC_E',9.85E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_ETH_E',1.81E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_HFO_E',3.25E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_NGA_E',1.98E+01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_CH_OTH_PTC_E',3.10E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_COK_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_ETH_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_HFO_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_CH_OTH_PTC_E',0.0,'PJ','');
-- Iron and steel
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_IS_BOF_E',11.33,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_IS_BOF_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_IS_EAF_E',18.98,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_IS_EAF_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_IS_OTH_ELC_E',10.08,'PJ','100% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_IS_OTH_ELC_E',0.0,'PJ','');
-- Non-ferrous metals
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_ALU_E',2.03E+00,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_COP_E',3.82E-01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_ZNC_E',3.65E-01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_ALU_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_COP_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_ZNC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_EC_E',9.61E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_EC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_OTH_ELC_E',8.43E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_OTH_DST_E',2.48E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_OTH_NGA_E',2.89E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NF_OTH_LPG_E',8.46E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_OTH_ELC_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_OTH_DST_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_OTH_NGA_E',0.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NF_OTH_LPG_E',0.0,'PJ','');
-- Non-metallic minerals
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_CLK_WET_E',1.32E+01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_CLK_DRY_E',3.31E+01,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_LIM_E',5.02E+00,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_GLS_E',3.52E+00,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_CRM_E',5.88E+00,'Mt','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_CLK_WET_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_CLK_DRY_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_LIM_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_GLS_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_CRM_E',0.00E+00,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_OTH_DST_E',2.10E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_OTH_NGA_E',7.11E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_OTH_COK_E',1.68E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_OTH_ELC_E',5.21E+00,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_NM_OTH_LPG_E',6.41E-01,'PJ','96.79% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_OTH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_OTH_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_OTH_COK_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_NM_OTH_LPG_E',0.00E+00,'PJ','');
-- Pulp and paper
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PUL_CHEM_E',1.48E-01,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PUL_MEC_E',1.18E+00,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PUL_REC_E',5.35E+00,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PAP_E',9.59E+00,'Mt','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PUL_CHEM_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PUL_MEC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PUL_REC_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PAP_E',0.0,'Mt','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PH_HFO_E',3.87E-01,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PH_DST_E',4.49E-02,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PH_NGA_E',2.47E+00,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_PH_ELC_E',1.08E+00,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PH_HFO_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PH_NGA_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_PH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_OTH_DST_E',4.49E-02,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_OTH_ELC_E',1.08E+00,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_PP_OTH_LPG_E',5.95E-02,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_OTH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_PP_OTH_LPG_E',0.00E+00,'PJ','');
-- Other industries
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_OTH_OTH_ELC_E',2.98E+01,'PJ','95.83% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'IND_OTH_OTH_ELC_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_OTH_PH_HFO_E',3.49E+01,'PJ','90.00% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_OTH_PH_DST_E',8.86E+00,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_OTH_PH_NGA_E',1.64E+02,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'IND_OTH_PH_LPG_E',5.65E+00,'PJ','92.86% of base year');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'IND_OTH_PH_HFO_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'IND_OTH_PH_DST_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'IND_OTH_PH_LPG_E',0.00E+00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'IND_OTH_PH_NGA_E',0.00E+00,'PJ','');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Industrial sector
-- New technologies
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_NGA_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_COA_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_COK_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_COG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_BFG_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_ETH_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_HFO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_OIL_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_NAP_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_PTC_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_BIO_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_GEO_1_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_GEO_2_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_GEO_3_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_HET_N',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_FT_H2_N',20,'');
-- Base year technologies
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_ELC_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_DST_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_BIO_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_COA_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_DST_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_HET_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_HFO_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_LPG_E',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_NGA_E',25,'');
-- Chemicals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OLF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_BTX_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_CHL_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_KER_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_NSP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_GSL_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_NAP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_RFG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_EC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_ETH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_PTC_E',30,'');
-- Iron and steel
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_EAF_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_FS_PTC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_FS_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_OTH_ELC_E',30,'');
-- Non-ferrous metals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_COP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ZNC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_EC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_LPG_E',30,'');
-- Non-metallic minerals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRY_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_WET_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CRM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_GLS_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_LIM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_OTH_COK_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_OTH_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_OTH_NGA_E',30,'');
-- Pulp and paper
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PAP_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_CHEM_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_MEC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_REC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_OTH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_OTH_LPG_E',30,'');
-- Other industries
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_TECH',100,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_OTH_ELC_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_DST_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_HFO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_LPG_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_NGA_E',30,'');
-- New technologies
-- Machine drive and steam
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_DST_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_LPG_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_NGA_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_MD_ELC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_BFG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_COG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_ETH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_HET_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_HFO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_LPG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_STM_PTC_N',30,'');
-- Chemicals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_NAPSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_ETHSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_GSOSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_LPGSC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_NCC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_BDH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_HVC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OLF_PDH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OLF_MTO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_NGASR_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_NGASR_CCS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_NGASR_CCS_N_LINKED',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_NAPPOX_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_COAGSF_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_BIOGSF_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_AMM_ELCSYS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_NGASR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_NGASR_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_NGASR_CCS_N_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_COGSR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_LPGSR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_COAGSF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_BIOGSF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_MTH_ELCSYS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_CHL_MERC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_CHL_DIAP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_CHL_MEMB_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_EC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_ETH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_LPG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_MTH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_NAP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_FS_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_COK_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_ETH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_HFO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CH_OTH_NGA_N',30,'');
-- Iron and steel
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_BFBOF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_BFTGRBOF_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_BFTGRBOF_CCS_N_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_DRI_DRIEAF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_DRI_DRIEAF_CCS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_DRI_DRIEAF_CCS_N_LINKED',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_DRI_HDREAF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_HISBOF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_HISBOF_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_HISBOF_CCS_N_LINKED',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_ULCOWIN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_ULCOLYSIS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_ULCORED_CCS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_IS_BOF_ULCORED_CCS_N_LINKED',20,'');
-- Non-ferrous metals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_AMN_BAY_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_HLH_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_SEC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_HLHIA_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_CBT_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ALU_KAO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_COP_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_ZNC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_EC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_ELC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_DST_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NF_OTH_NGA_N',30,'');
-- Non-metallic minerals
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRY_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRY_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_WET_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_N_LINKED',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_N_LINKED',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CEM_BLN_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CEM_AAC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CEM_BEL_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_LIM_LRK_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_GLS_FOSS_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_GLS_ELEC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_CRM_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_NM_EC_N',30,'');
-- Pulp and paper
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_KRF_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_SUL_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_MEC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_SCH_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PUL_REC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PAP_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_HFO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_PP_PH_NGA_N',30,'');
-- Other industries
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_OTH_ELC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_DST_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_HFO_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_LPG_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_OTH_PH_NGA_N',30,'');
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_TV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_BLQ_CI_N',15,'');

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
-- Industrial sector
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2007,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2014,22,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2030,25,'');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_NGA_E',2006,6.76E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_LPG_E',2006,1.93E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_COA_E',2006,4.01E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_COK_E',2006,7.27E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_BFG_E',2006,1.85E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_HFO_E',2006,1.39E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_OIL_E',2006,7.50E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_ETH_E',2006,2.64E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_NAP_E',2006,1.28E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_PTC_E',2006,1.10E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_BIO_E',2006,1.19E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_HET_E',2006,1.21E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_FT_ELC_E',2006,8.20E+02,'PJ','');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_MD_TECH',2006,2.87E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_MD_ELC_E',2006,4.14E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_MD_DST_E',2006,2.64E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_TECH',2006,2.39E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_NGA_E',2006,1.43E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_LPG_E',2006,1.31E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_COA_E',2006,1.02E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_HFO_E',2006,3.66E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_BIO_E',2006,7.07E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_DST_E',2006,6.38E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_STM_HET_E',2006,1.31E+02,'PJ','');
-- Chemicals
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_TECH',2006,2.09E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OLF_E',2006,2.96E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_BTX_E',2006,8.06E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_AMM_E',2006,6.45E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_MTH_E',2006,4.97E-02,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_CHL_E',2006,2.15E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_E',2006,1.62E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_NGA_E',2006,4.00E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_LPG_E',2006,6.50E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_KER_E',2006,8.77E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_HFO_E',2006,1.75E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_DST_E',2006,2.75E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_NSP_E',2006,1.17E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_GSL_E',2006,6.31E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_NAP_E',2006,1.26E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_FS_RFG_E',2006,1.96E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_EC_E',2006,1.71E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_HFO_E',2006,3.39E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_DST_E',2006,5.00E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_NGA_E',2006,2.07E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_COK_E',2006,1.76E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_ETH_E',2006,1.89E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_ELC_E',2006,1.03E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_CH_OTH_PTC_E',2006,3.23E-01,'PJ','');
-- Iron and steel
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_TECH',2006,3.163E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_BOF_E',2006,1.18E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_EAF_E',2006,1.98E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_OTH_ELC_E',2006,1.01E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_FS_PTC_E',2006,1.30E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_IS_FS_COK_E',2006,6.93E+01,'PJ','');
-- Non-ferrous metals
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_TECH',2006,4.322E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_ALU_E',2006,2.119E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_COP_E',2006,3.990E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_ZNC_E',2006,3.808E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_OTH_E',2006,1.423E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_EC_E',2006,1.00E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_OTH_ELC_E',2006,8.798E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_OTH_DST_E',2006,2.585E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_OTH_NGA_E',2006,3.011E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NF_OTH_LPG_E',2006,8.827E-01,'PJ','');
-- Non-metallic minerals
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_TECH',2006,6.279E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_CLK_WET_E',2006,1.378E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_CLK_DRY_E',2006,3.458E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_LIM_E',2006,5.24E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_GLS_E',2006,3.68E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_CRM_E',2006,6.14E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_OTH_DST_E',2006,2.17E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_OTH_NGA_E',2006,7.35E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_OTH_COK_E',2006,1.74E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_OTH_ELC_E',2006,5.38E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NM_OTH_LPG_E',2006,6.62E-01,'PJ','');
-- Pulp and paper
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_TECH',2006,1.112E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PUL_CHEM_E',2006,1.72E-01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PUL_MEC_E',2006,1.25E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PUL_REC_E',2006,6.20E+00,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PAP_E',2006,1.112E+01,'Mt','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PH_HFO_E',2006,4.04E-01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PH_DST_E',2006,4.69E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PH_NGA_E',2006,2.57E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_PH_ELC_E',2006,1.13E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_OTH_DST_E',2006,4.69E-02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_OTH_ELC_E',2006,1.13E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_PP_OTH_LPG_E',2006,6.21E-02,'PJ','');
-- Other energy use
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_TECH',2006,4.64E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_PH_HFO_E',2006,3.88E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_PH_DST_E',2006,9.54E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_PH_NGA_E',2006,1.77E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_PH_LPG_E',2006,6.09E+00,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_OTH_OTH_ELC_E',2006,3.11E+01,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_ONS_TECH',2006,1.38E+02,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','IND_NEU_TECH',2006,1.66E+02,'PJ','');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','BIO_METH','IND_FT_NGA_N',2007,'IND_NGA',-56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','H2_BL','IND_FT_NGA_N',2020,'IND_NGA',-56.10,'[kt/PJ]','');
-- Base year technologies
-- Chemicals
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',63.07,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',5.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',0.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',98.27,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',0.54,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',1.81,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',77.37,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',0.72,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',3.11,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',74.07,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',1.32,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',3.36,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',61.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',69.30,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',6.92,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',6.60,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',73.33,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',0.72,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',0.60,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',56.10,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.10,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.00,'[t/PJ]','');
-- Iron and steel
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-94.60,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-0.54,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-1.81,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_SOX','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-1.20,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-100.80,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-5.00,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-1.40,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_SOX','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-0.57,'[t/PJ]','');
-- Non-metallic minerals
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_PTC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_ELC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_LPG','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_PTC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_ELC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_OIL','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_LPG','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_ELC','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_LPG','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_LIM_E',2006,'IND_NM_LIM',392.50,'[kt/Mt]','');
-- Other non-energy uses
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',14.89,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',14.89,'[kt/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',0.96,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CH4','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',0.96,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',0.13,'[t/PJ]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_N2O','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',0.13,'[t/PJ]','');
-- New technologies
-- Chemicals
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',-248.23,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',-248.23,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',248.23,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',248.23,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',-505.41,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',-505.41,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',505.41,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',505.41,'[kt/act]','');
-- Iron and steel
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',-292.24,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',-292.24,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',-258.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',-258.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',292.24,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',292.24,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',258.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',258.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',-269.14,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',-153.64,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',-269.14,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',-153.64,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',269.14,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',153.64,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',269.14,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',153.64,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',-263.01,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',-263.01,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',263.01,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',263.01,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',-1098.44,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',1098.44,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',-289.46,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',-289.46,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',289.46,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',289.46,'[kt/act]','');
-- Non-metallic minerals
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-251.33,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-197.88,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-143.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',756.53,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',703.08,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',648.68,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-286.45,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-197.87,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-143.48,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',791.65,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',703.07,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',648.68,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-261.35,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-205.76,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-149.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',766.59,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',711.00,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',654.43,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-297.87,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-205.76,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-149.20,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',803.07,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',710.96,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',654.40,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',505.20,'[kt/act]','');

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
-- Industrial sector
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_CO2',63.07,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_CO2',98.27,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_CO2',94.60,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_CO2',108.17,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_CO2',108.17,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_CO2',77.37,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_CO2',71.98,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_CO2',54.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_CO2',73.33,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_CO2',100.80,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_CO2',0.0001,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_CH4',1.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_CH4',0.54,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_CH4',0.54,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_CH4',0.54,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_CH4',0.54,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_CH4',0.72,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_CH4',3.82,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_CH4',1.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_CH4',5.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_CH4',300.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_N2O',1.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_N2O',0.10,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_N2O',1.81,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_N2O',1.81,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_N2O',1.81,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_N2O',1.81,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_N2O',3.11,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_N2O',4.82,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_N2O',1.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_N2O',0.60,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_N2O',1.40,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_N2O',4.00,'[t/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NGA','IND_SOX',0.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_LPG','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COA','IND_SOX',1.20,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COK','IND_SOX',1.20,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_COG','IND_SOX',1.20,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BFG','IND_SOX',0.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_HFO','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_OIL','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_ETH','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_NAP','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_PTC','IND_SOX',0.57,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('IND_BIO','IND_SOX',0.00,'[kt/PJ]','');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','GAS_BFG','IND_FT_BFG_E',2006,'IND_BFG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_BFG','IND_FT_BFG_N',2007,'IND_BFG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','IND_FT_BIO_E',2006,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_GAS','IND_FT_BIO_E',2006,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BMU','IND_FT_BIO_E',2006,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BIN','IND_FT_BIO_E',2006,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','IND_FT_BIO_N',2007,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_GAS','IND_FT_BIO_N',2007,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BMU','IND_FT_BIO_N',2007,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BIN','IND_FT_BIO_N',2007,'IND_BIO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_FT_COA_E',2006,'IND_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_FT_COA_N',2007,'IND_COA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_COG','IND_FT_COG_N',2007,'IND_COG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_OVC','IND_FT_COK_E',2006,'IND_COK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','COA_OVC','IND_FT_COK_N',2007,'IND_COK',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','IND_FT_ELC_E',2006,'IND_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','IND_FT_ELC_E',2006,'IND_ELC',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC_BP','IND_FT_ELC_E',2006,'IND_ELC',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_RFG','IND_FT_ETH_E',2006,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_ETH','IND_FT_ETH_E',2006,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_RFG','IND_FT_ETH_N',2007,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_ETH','IND_FT_ETH_N',2007,'IND_ETH',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','IND_FT_GEO_1_N',2007,'IND_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','IND_FT_GEO_2_N',2007,'IND_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GEO','IND_FT_GEO_3_N',2007,'IND_GEO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','IND_FT_HET_E',2006,'IND_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','HET','IND_FT_HET_N',2007,'IND_HET',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','IND_FT_HFO_E',2006,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_FT_HFO_E',2006,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','IND_FT_HFO_N',2007,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_FT_HFO_N',2007,'IND_HFO',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','IND_FT_OIL_E',2006,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','IND_FT_OIL_E',2006,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','IND_FT_OIL_E',2006,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_JTK','IND_FT_OIL_E',2006,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_JTK','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_DST','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_KER','IND_FT_OIL_N',2007,'IND_OIL',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','IND_FT_LPG_E',2006,'IND_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','IND_FT_LPG_N',2007,'IND_LPG',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NAP','IND_FT_NAP_E',2006,'IND_NAP',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NAP','IND_FT_NAP_N',2007,'IND_NAP',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_MET','IND_FT_NAP_N',2007,'IND_NAP',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','IND_FT_NGA_E',2006,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','IND_FT_NGA_N',2007,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','IND_FT_NGA_N',2007,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','IND_FT_NGA_N',2007,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','IND_FT_NGA_N',2020,'IND_NGA',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_PTC','IND_FT_PTC_E',2006,'IND_PTC',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','OIL_PTC','IND_FT_PTC_N',2007,'IND_PTC',1.0,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2','IND_FT_H2_N',2014,'IND_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','IND_FT_H2_N',2014,'IND_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL_SOEC','IND_FT_H2_N',2014,'IND_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','IND_FT_H2_N',2014,'IND_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','IND_FT_H2E_N',2014,'IND_H2E',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL_SOEC','IND_FT_H2E_N',2014,'IND_H2E',1.00,'PJ/PJ');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_IS_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_NF_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_CH_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_NM_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_PP_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_MD','IND_MD_TECH',2006,'IND_OTH_MD',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_MD_ELC_E',2006,'IND_MD',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_MD_DST_E',2006,'IND_MD',0.35,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_IS_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_NF_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_CH_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_NM_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_PP_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_SB','IND_STM_TECH',2006,'IND_OTH_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_STM_BIO_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_STM_DST_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_STM_COA_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_STM_HFO_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_STM_LPG_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_STM_NGA_E',2006,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_STM_HET_E',2006,'IND_SB',1.00,'PJ/PJ');
-- Chemicals
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_OLF','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_BTX','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_AMM','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MTH','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_CHL','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_OTH_PROD','IND_CH_TECH',2006,'IND_CH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_E',2006,'IND_CH_OLF',1.33E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_BTX_E',2006,'IND_CH_BTX',1.37E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_E',2006,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_E',2006,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_AMM_E',2006,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_AMM_E',2006,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_AMM_E',2006,'IND_CH_AMM',1.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_MTH_E',2006,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_E',2006,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_MTH_E',2006,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_MTH_E',2006,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_E',2006,'IND_CH_MTH',2.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_E',2006,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_E',2006,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_E',2006,'IND_CH_CHL',7.78E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_OTH','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_OTH','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_EC_E',2006,'IND_CH_EC',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COK','IND_CH_OTH_COK_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_OTH_DST_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_OTH_ELC_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_OTH_ETH_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_CH_OTH_HFO_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OTH_NGA_E',2006,'IND_CH_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_CH_OTH_PTC_E',2006,'IND_CH_OTH',1.0,'');
-- Iron and steel
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_BOF','IND_IS_TECH',2006,'IND_IS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_EAF','IND_IS_TECH',2006,'IND_IS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_SB','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_OTH','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_IS_BOF_E',2006,'IND_IS_BOF',7.74E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_SB','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_OTH','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_IS_EAF_E',2006,'IND_IS_EAF',2.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_OTH_ELC_E',2006,'IND_IS_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',1.0,'');
-- Non-ferrous metals
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_ALU','IND_NF_TECH',2006,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_COP','IND_NF_TECH',2006,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_ZNC','IND_NF_TECH',2006,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_OTH_PROD','IND_NF_TECH',2006,'IND_NF',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_ALU_E',2006,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_E',2006,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_E',2006,'IND_NF_ALU',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COK','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_COP_E',2006,'IND_NF_COP',3.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_E',2006,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ZNC_E',2006,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_ZNC_E',2006,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_E',2006,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_E',2006,'IND_NF_ZNC',5.68E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_OTH_E',2006,'IND_NF_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_OTH','IND_NF_OTH_E',2006,'IND_NF_OTH_PROD',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_EC_E',2006,'IND_NF_EC',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_OTH_ELC_E',2006,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NF_OTH_DST_E',2006,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_OTH_NGA_E',2006,'IND_NF_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_NF_OTH_LPG_E',2006,'IND_NF_OTH',1.0,'');
-- Non-metallic minerals
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_CMT','IND_NM_TECH',2006,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_LIM','IND_NM_TECH',2006,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_GLS','IND_NM_TECH',2006,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_CRM','IND_NM_TECH',2006,'IND_NM',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_OTH','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',3.89E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_OTH','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',2.16E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_OTH','IND_NM_LIM_E',2006,'IND_NM_LIM',1.45E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_OTH','IND_NM_GLS_E',2006,'IND_NM_GLS',8.09E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_SB','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_OTH','IND_NM_CRM_E',2006,'IND_NM_CRM',4.71E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COK','IND_NM_OTH_COK_E',2006,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_OTH_DST_E',2006,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_OTH_ELC_E',2006,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_NM_OTH_LPG_E',2006,'IND_NM_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_OTH_NGA_E',2006,'IND_NM_OTH',1.0,'');
-- Pulp and paper
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PAP','IND_PP_TECH',2006,'IND_PP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUC','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUM','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUR','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',7.24E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_E',2006,'IND_PP_SB',5.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_E',2006,'IND_PP_PUM',5.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_DH','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_OTH','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',6.82E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PAP_E',2006,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_DH','IND_PP_PAP_E',2006,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PAP_E',2006,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_OTH','IND_PP_PAP_E',2006,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUL','IND_PP_PAP_E',2006,'IND_PP_PAP',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_PP_PH_HFO_E',2006,'IND_PP_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_PP_PH_HFO_E',2006,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_PP_PH_DST_E',2006,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_PP_PH_NGA_E',2006,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_PP_PH_ELC_E',2006,'IND_PP_DH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_PP_OTH_DST_E',2006,'IND_PP_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_PP_OTH_ELC_E',2006,'IND_PP_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_PP_OTH_LPG_E',2006,'IND_PP_OTH',1.0,'');
-- Other industries
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_SB','IND_OTH_TECH',2006,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_PH','IND_OTH_TECH',2006,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_MD','IND_OTH_TECH',2006,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_OTH','IND_OTH_TECH',2006,'IND_OTH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_SB','IND_OTH_TECH',2010,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_PH','IND_OTH_TECH',2010,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_MD','IND_OTH_TECH',2010,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_OTH','IND_OTH_TECH',2010,'IND_OTH',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_SB','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_PH','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_MD','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_OTH','IND_OTH_TECH',2030,'IND_OTH',1.11,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_SB','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_PH','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_MD','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OTH_OTH','IND_OTH_TECH',2050,'IND_OTH',1.18,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_OTH_PH_DST_E',2006,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_OTH_PH_HFO_E',2006,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_OTH_PH_LPG_E',2006,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_OTH_PH_NGA_E',2006,'IND_OTH_PH',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_OTH_OTH_ELC_E',2006,'IND_OTH_OTH',1.0,'');
-- Other non-specified consumption
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_GEO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_GEO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_GEO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_ONS_TECH',2020,'IND_OTH_NSP',1.30,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_GEO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_ONS_TECH',2050,'IND_OTH_NSP',1.50,'');
-- Other non-energy uses
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_NEU_TECH',2020,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_NEU_TECH',2020,'IND_OTH_NEU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_NEU_TECH',2050,'IND_OTH_NEU',1.20,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','IND_NEU_TECH',2050,'IND_OTH_NEU',1.20,'');
-- New technologies
-- Machine drive and steam
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_MD_DST_N',2007,'IND_MD',0.35,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_MD_DST_N',2050,'IND_MD',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_MD_LPG_N',2007,'IND_MD',0.38,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_MD_LPG_N',2050,'IND_MD',0.44,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_MD_NGA_N',2007,'IND_MD',0.38,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_MD_NGA_N',2050,'IND_MD',0.44,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_MD_ELC_N',2007,'IND_MD',0.87,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_MD_ELC_N',2050,'IND_MD',0.93,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_STM_BFG_N',2007,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_STM_BFG_N',2050,'IND_SB',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_STM_BIO_N',2007,'IND_SB',0.79,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_STM_BIO_N',2050,'IND_SB',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_STM_COA_N',2007,'IND_SB',0.82,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_STM_COA_N',2050,'IND_SB',0.89,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_STM_COG_N',2007,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_STM_COG_N',2050,'IND_SB',0.91,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_STM_DST_N',2007,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_STM_DST_N',2050,'IND_SB',0.91,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_STM_ETH_N',2007,'IND_SB',0.85,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_STM_ETH_N',2050,'IND_SB',0.91,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_STM_HET_N',2007,'IND_SB',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HET','IND_STM_HET_N',2050,'IND_SB',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_STM_HFO_N',2007,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_STM_HFO_N',2050,'IND_SB',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_STM_LPG_N',2007,'IND_SB',0.83,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_STM_LPG_N',2050,'IND_SB',0.86,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_STM_NGA_N',2007,'IND_SB',0.84,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_STM_NGA_N',2050,'IND_SB',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_STM_PTC_N',2007,'IND_SB',0.81,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_PTC','IND_STM_PTC_N',2050,'IND_SB',0.87,'PJ/PJ');
-- Chemicals
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',2.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',3.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',3.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',6.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',2.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',2.61E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',2.58E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',4.54E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',2.97E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',3.30E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',1.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_HVC','IND_CH_HVC_N',2007,'IND_CH_BTX',1.00E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_HVC','IND_CH_HVC_N',2007,'IND_CH_OLF',1.00E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',1.44E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',1.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',3.19E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',3.55E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',2.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',3.50E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',2.26E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_CH_AMM_NGASR_CCS_N_LINKED',2025,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',1.95E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',2.61E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',5.46E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',4.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_H2E','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',2.48E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',2.48E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',1.00E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',1.11E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_CH_MTH_NGASR_CCS_N_LINKED',2025,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',1.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',1.38E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',1.15E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',1.44E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_H2E','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',4.18E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',4.18E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2007,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2007,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2007,'IND_H2',9.05E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_H2',1.30E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2007,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2007,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2007,'IND_H2',1.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_H2',1.62E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2007,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2007,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2007,'IND_H2',1.19E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_H2',1.72E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_EC_N',2007,'IND_CH_EC',1.01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_EC_N',2020,'IND_CH_EC',1.05,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_EC_N',2050,'IND_CH_EC',1.10,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','IND_CH_FS_BIO_N',2007,'IND_CH_FS_BIO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','IND_CH_FS_COA_N',2007,'IND_CH_FS_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','IND_CH_FS_DST_N',2007,'IND_CH_FS_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_ETH','IND_CH_FS_ETH_N',2007,'IND_CH_FS_ETH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','MTH_SYN','IND_CH_FS_MTH_N',2007,'IND_CH_FS_MTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','IND_CH_FS_NGA_N',2007,'IND_CH_FS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','IND_CH_FS_LPG_N',2007,'IND_CH_FS_LPG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NAP','IND_CH_FS_NAP_N',2007,'IND_CH_FS_NAP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COK','IND_CH_OTH_COK_N',2007,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_CH_OTH_DST_N',2007,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_CH_OTH_ELC_N',2007,'IND_CH_OTH',1.02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ETH','IND_CH_OTH_ETH_N',2007,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_CH_OTH_HFO_N',2007,'IND_CH_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OTH_NGA_N',2007,'IND_CH_OTH',1.02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_CH_OTH_NGA_N',2040,'IND_CH_OTH',1.03,'');
-- Iron and steel
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',2.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',3.05E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',2.68E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',3.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_IS_BOF_BFBOF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',2.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_IS_BOF_BFTGRBOF_CCS_N_LINKED',2040,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',1.79E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',1.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',1.70E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_IS_DRI_DRIEAF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',1.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',7.32E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',8.14E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',7.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',7.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',7.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',7.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_IS_BOF_HISBOF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',6.40E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',6.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',6.35E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',1.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_IS_BOF_ULCORED_CCS_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
-- Non-ferrous metals
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',6.80E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',9.62E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_AMN','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',1.87E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_AMN','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',2.08E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',2.32E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',2.58E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_AMN','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',2.36E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_AMN','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',2.63E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ALU_KAO_N',2050,'IND_NF_ALU',1.98E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_COP_N',2007,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_COP_N',2007,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NF_COP_N',2007,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NF_COP_N',2007,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_COP_N',2007,'IND_NF_COP',6.13E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_COP_N',2030,'IND_NF_COP',6.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_N',2007,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_N',2007,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_N',2007,'IND_NF_ZNC',5.66E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_N',2010,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_N',2010,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_N',2010,'IND_NF_ZNC',5.81E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_N',2030,'IND_NF_ZNC',6.16E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_N',2040,'IND_NF_ZNC',6.52E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_EC','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_SB','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NF_MD','IND_NF_ZNC_N',2050,'IND_NF_ZNC',7.34E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_EC_N',2007,'IND_NF_EC',1.01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_EC_N',2020,'IND_NF_EC',1.04,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_EC_N',2050,'IND_NF_EC',1.06,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_OTH_ELC_N',2007,'IND_NF_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NF_OTH_ELC_N',2040,'IND_NF_OTH',1.03,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NF_OTH_DST_N',2007,'IND_NF_OTH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NF_OTH_NGA_N',2007,'IND_NF_OTH',1.01,'');
-- Non-metallic minerals
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',4.18E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',1.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',1.71E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_NM_CLK_DRYCL_PCCS_N_LINKED',2020,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED',2020,'SNK_IND_CO2',3.91E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_NM_CLK_DRYCL_OCCS_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',3.76E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED',2030,'SNK_IND_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_CLK','IND_NM_CEM_BLN_N',2007,'IND_NM_CMT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_BFS','IND_NM_CEM_BLN_N',2007,'IND_NM_CMT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',8.33E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',2.54E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',2.06E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',2.06E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',2.06E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',2.06E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',2.06E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_COA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',2.29E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',2.29E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',2.29E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_BIO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',2.29E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',2.29E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',6.25E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',6.94E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_GLS_ELEC_N',2007,'IND_NM_GLS',9.26E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_GLS_ELEC_N',2007,'IND_NM_GLS',9.26E-02,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',1.03E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CRM_N',2007,'IND_NM_CRM',3.81E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CRM_N',2007,'IND_NM_CRM',3.81E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_NM_CRM_N',2030,'IND_NM_CRM',4.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NM_EC','IND_NM_CRM_N',2030,'IND_NM_CRM',4.24E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_NM_EC_N',2007,'IND_NM_EC',1.04,'');
-- Pulp and paper
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19E+00,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'BIO_BIN',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'BIO_BIN',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'BIO_BIN',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2007,'BIO_BIN',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'BIO_BIN',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'BIO_BIN',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'BIO_BIN',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2030,'BIO_BIN',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',9.40E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2007,'IND_PP_PUM',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_MEC_N',2007,'IND_PP_PUM',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2007,'IND_PP_SB',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_MEC_N',2007,'IND_PP_SB',3.99E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',8.60E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',1.96E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','MAT_WOD','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',2.12E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_REC_N',2007,'IND_PP_PUR',7.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_REC_N',2007,'IND_PP_PUR',7.69E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',8.55E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',8.55E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUL','IND_PP_PAP_N',2007,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PAP_N',2007,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PAP_N',2007,'IND_PP_PAP',1.39E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_PUL','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_MD','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_PP_SB','IND_PP_PAP_N',2030,'IND_PP_PAP',1.55E-01,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_PP_PH_HFO_N',2007,'IND_PP_PH',0.91,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_PP_PH_HFO_N',2030,'IND_PP_PH',0.98,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_PP_PH_NGA_N',2007,'IND_PP_PH',0.89,'');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_PP_PH_NGA_N',2050,'IND_PP_PH',0.95,'');
-- Other industries
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_OTH_OTH_ELC_N',2007,'IND_OTH_OTH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_OTH_OTH_ELC_N',2016,'IND_OTH_OTH',1.03,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_OTH_OTH_ELC_N',2025,'IND_OTH_OTH',1.05,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_ELC','IND_OTH_OTH_ELC_N',2050,'IND_OTH_OTH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_OIL','IND_OTH_PH_DST_N',2007,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_OTH_PH_HFO_N',2007,'IND_OTH_PH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_OTH_PH_HFO_N',2040,'IND_OTH_PH',1.01,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_HFO','IND_OTH_PH_HFO_N',2050,'IND_OTH_PH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_OTH_PH_LPG_N',2007,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_LPG','IND_OTH_PH_LPG_N',2050,'IND_OTH_PH',1.02,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_OTH_PH_NGA_N',2007,'IND_OTH_PH',1.00,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_OTH_PH_NGA_N',2025,'IND_OTH_PH',1.08,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_OTH_PH_NGA_N',2030,'IND_OTH_PH',1.15,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','IND_NGA','IND_OTH_PH_NGA_N',2050,'IND_OTH_PH',1.20,'PJ/PJ');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'ELC_DST',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'ELC_DST',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'ELC_DST',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'ELC_DST',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'ELC_DST',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'ELC_DST',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'ELC_DST',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'ELC_DST',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2010,'ELC_DST',0.845,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'ELC_DST',0.870,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'ELC_DST',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'ELC_DST',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'ELC_DST',0.931,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'IND_HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'IND_HET',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'IND_HET',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'IND_HET',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'IND_HET',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'IND_HET',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'IND_HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'IND_HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'IND_HET',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'IND_HET',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'IND_HET',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'IND_HET',0.870,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'IND_HET',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'IND_HET',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'IND_HET',0.931,'PJ/PJ');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','SNK_IND_CO2','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'');

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
-- Industrial sector
INSERT INTO "LinkedTechs" VALUES('IT','IND_CH_AMM_NGASR_CCS_N','SNK_CO2_EM','IND_CH_AMM_NGASR_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_CH_MTH_NGASR_CCS_N','SNK_CO2_EM','IND_CH_MTH_NGASR_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N','SNK_CO2_EM','IND_IS_BOF_BFBOF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N','SNK_CO2_EM','IND_IS_BOF_BFTGRBOF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N','SNK_CO2_EM','IND_IS_DRI_DRIEAF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N','SNK_CO2_EM','IND_IS_BOF_HISBOF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N','SNK_CO2_EM','IND_IS_BOF_ULCORED_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N','SNK_CO2_EM','IND_NM_CLK_DRYCL_PCCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N','SNK_CO2_EM','IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N','SNK_CO2_EM','IND_NM_CLK_DRYCL_OCCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N','SNK_CO2_EM','IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED','');

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
-- Industrial sector
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_NAPSC_N',2007,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_ETHSC_N',2007,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_GSOSC_N',2007,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_LPGSC_N',2007,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_NCC_N',2020,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_HVC_BDH_N',2020,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_OLF_PDH_N',2010,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_OLF_MTO_N',2007,0.079,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_NGASR_N',2007,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_NGASR_CCS_N',2025,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_NAPPOX_N',2007,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_COAGSF_N',2007,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_BIOGSF_N',2025,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_AMM_ELCSYS_N',2025,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_NGASR_N',2007,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_NGASR_CCS_N',2025,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_COGSR_N',2007,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_LPGSR_N',2007,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_COAGSF_N',2007,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_BIOGSF_N',2025,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_MTH_ELCSYS_N',2025,0.092,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_CHL_MERC_N',2007,0.084,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_CHL_DIAP_N',2007,0.084,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_CH_CHL_MEMB_N',2007,0.084,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_BFBOF_N',2007,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_DRI_DRIEAF_N',2007,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_DRI_HDREAF_N',2030,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_HISBOF_N',2025,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_HISBOF_CCS_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_ULCOWIN_N',2030,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_ULCOLYSIS_N',2030,0.095,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_IS_BOF_ULCORED_CCS_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_AMN_BAY_N',2007,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ALU_HLH_N',2007,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ALU_SEC_N',2007,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ALU_HLHIA_N',2030,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ALU_CBT_N',2050,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ALU_KAO_N',2050,0.074,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_COP_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NF_ZNC_N',2007,0.098,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRY_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRY_BIO_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_WET_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_N',2020,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,0.150,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CEM_BLN_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CEM_AAC_N',2030,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CEM_BEL_N',2030,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_LIM_LRK_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_GLS_FOSS_N',2007,0.065,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_GLS_ELEC_N',2007,0.065,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_NM_CRM_N',2007,0.094,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PUL_KRF_N',2007,0.099,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PUL_SUL_N',2007,0.099,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PUL_MEC_N',2007,0.099,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PUL_SCH_N',2007,0.099,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PUL_REC_N',2007,0.099,'');
INSERT INTO "DiscountRate" VALUES ('IT','IND_PP_PAP_N',2007,0.099,'');

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
-- Industrial sector
INSERT INTO "Driver" VALUES ('IT',2006,'PCHEM',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PCHEM',1.005,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PCHEM',0.971,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PCHEM',0.937,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PCHEM',0.887,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PCHEM',0.892,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PCHEM',0.936,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PCHEM',0.998,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PCHEM',0.997,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PCHEM',1.016,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PCHEM',1.046,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PCHEM',1.096,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PCHEM',1.145,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PCHEM',1.194,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PCHEM',1.247,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PCHEM',1.300,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PISNF',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PISNF',0.990,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PISNF',0.898,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PISNF',0.822,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PISNF',0.730,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PISNF',0.718,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PISNF',0.751,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PISNF',0.781,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PISNF',0.746,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PISNF',0.753,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PISNF',0.763,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PISNF',0.780,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PISNF',0.796,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PISNF',0.812,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PISNF',0.829,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PISNF',0.846,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PIS',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PIS',1.056,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PIS',1.011,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PIS',0.779,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PIS',0.751,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PIS',0.742,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PIS',0.738,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PIS',0.778,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PIS',0.704,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PIS',0.704,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PIS',0.705,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PIS',0.707,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PIS',0.708,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PIS',0.709,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PIS',0.710,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PIS',0.712,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PNM',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PNM',1.028,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PNM',0.967,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PNM',0.787,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PNM',0.721,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PNM',0.706,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PNM',0.742,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PNM',0.759,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PNM',0.706,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PNM',0.727,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PNM',0.758,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PNM',0.815,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PNM',0.871,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PNM',0.927,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PNM',0.990,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PNM',1.054,'');
INSERT INTO "Driver" VALUES ('IT',2006,'PLP',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'PLP',1.029,'');
INSERT INTO "Driver" VALUES ('IT',2008,'PLP',0.970,'');
INSERT INTO "Driver" VALUES ('IT',2010,'PLP',0.918,'');
INSERT INTO "Driver" VALUES ('IT',2012,'PLP',0.883,'');
INSERT INTO "Driver" VALUES ('IT',2014,'PLP',0.904,'');
INSERT INTO "Driver" VALUES ('IT',2016,'PLP',0.939,'');
INSERT INTO "Driver" VALUES ('IT',2018,'PLP',0.917,'');
INSERT INTO "Driver" VALUES ('IT',2020,'PLP',0.914,'');
INSERT INTO "Driver" VALUES ('IT',2022,'PLP',0.931,'');
INSERT INTO "Driver" VALUES ('IT',2025,'PLP',0.956,'');
INSERT INTO "Driver" VALUES ('IT',2030,'PLP',1.001,'');
INSERT INTO "Driver" VALUES ('IT',2035,'PLP',1.044,'');
INSERT INTO "Driver" VALUES ('IT',2040,'PLP',1.087,'');
INSERT INTO "Driver" VALUES ('IT',2045,'PLP',1.134,'');
INSERT INTO "Driver" VALUES ('IT',2050,'PLP',1.181,'');
INSERT INTO "Driver" VALUES ('IT',2006,'POI',1.000,'');
INSERT INTO "Driver" VALUES ('IT',2007,'POI',1.028,'');
INSERT INTO "Driver" VALUES ('IT',2008,'POI',0.994,'');
INSERT INTO "Driver" VALUES ('IT',2010,'POI',0.860,'');
INSERT INTO "Driver" VALUES ('IT',2012,'POI',0.810,'');
INSERT INTO "Driver" VALUES ('IT',2014,'POI',0.783,'');
INSERT INTO "Driver" VALUES ('IT',2016,'POI',0.809,'');
INSERT INTO "Driver" VALUES ('IT',2018,'POI',0.851,'');
INSERT INTO "Driver" VALUES ('IT',2020,'POI',0.800,'');
INSERT INTO "Driver" VALUES ('IT',2022,'POI',0.808,'');
INSERT INTO "Driver" VALUES ('IT',2025,'POI',0.820,'');
INSERT INTO "Driver" VALUES ('IT',2030,'POI',0.841,'');
INSERT INTO "Driver" VALUES ('IT',2035,'POI',0.860,'');
INSERT INTO "Driver" VALUES ('IT',2040,'POI',0.879,'');
INSERT INTO "Driver" VALUES ('IT',2045,'POI',0.900,'');
INSERT INTO "Driver" VALUES ('IT',2050,'POI',0.920,'');

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Industrial sector
INSERT INTO "Allocation" VALUES ('IT','IND_CH','PCHEM','');
INSERT INTO "Allocation" VALUES ('IT','IND_IS','PIS','');
INSERT INTO "Allocation" VALUES ('IT','IND_PP','PLP','');
INSERT INTO "Allocation" VALUES ('IT','IND_NF','PISNF','');
INSERT INTO "Allocation" VALUES ('IT','IND_NM','PNM','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH','POI','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH_NEU','GDP','');
INSERT INTO "Allocation" VALUES ('IT','IND_OTH_NSP','GDP','');

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
-- Industrial sector
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_CH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_CH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_CH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_CH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_CH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_CH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_CH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_CH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_CH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_CH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_CH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_CH',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_CH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_CH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_CH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_IS',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_IS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_IS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_IS',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_IS',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_IS',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_IS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_IS',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_IS',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_IS',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_IS',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_IS',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_IS',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_IS',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_IS',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_PP',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_PP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_PP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_PP',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_PP',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_PP',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_PP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_PP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_PP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_PP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_PP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_PP',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_PP',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_PP',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_PP',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_NF',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_NM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_NM',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_NM',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_NM',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_NM',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_NM',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_NM',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_NM',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_NM',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_NM',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_NM',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_NM',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_NM',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_NM',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_NM',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_OTH',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_OTH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH_NEU',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH_NEU',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH_NEU',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH_NEU',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH_NEU',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH_NEU',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_OTH_NEU',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_OTH_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH_NEU',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2007,'IND_OTH_NSP',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'IND_OTH_NSP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'IND_OTH_NSP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'IND_OTH_NSP',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'IND_OTH_NSP',0.800,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'IND_OTH_NSP',1.500,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'IND_OTH_NSP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'IND_OTH_NSP',1.000,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'IND_OTH_NSP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'IND_OTH_NSP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'IND_OTH_NSP',0.375,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'IND_OTH_NSP',0.313,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'IND_OTH_NSP',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'IND_OTH_NSP',0.250,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'IND_OTH_NSP',0.250,'');

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
-- Industrial sector
INSERT INTO "Demand" VALUES ('IT',2006,'IND_CH',20.69,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_CH',23.41,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_CH',19.52,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_CH',17.92,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_CH',17.91,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_CH',15.49,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_CH',16.01,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_CH',16.59,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_CH',15.92,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_CH',16.63,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_CH',16.59,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_CH',16.52,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_CH',16.49,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_CH',16.59,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_CH',16.86,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_CH',17.17,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_IS',31.63,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_IS',31.55,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_IS',30.59,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_IS',24.78,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_IS',25.67,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_IS',22.87,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_IS',23.72,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_IS',24.65,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_IS',22.39,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_IS',24.41,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_IS',24.17,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_IS',23.73,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_IS',23.32,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_IS',23.07,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_IS',23.00,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_IS',23.06,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_NF',4.28,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_NF',4.27,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_NF',4.12,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_NF',2.33,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_NF',2.19,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_NF',2.78,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_NF',3.31,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_NF',3.39,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_NF',3.36,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_NF',3.35,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_NF',3.32,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_NF',3.27,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_NF',3.23,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_NF',3.23,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_NF',3.27,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_NF',3.32,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_NM',62.79,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_NM',62.98,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_NM',62.70,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_NM',49.36,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_NM',45.00,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_NM',43.92,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_NM',39.71,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_NM',38.46,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_NM',38.78,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_NM',38.78,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_NM',38.81,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_NM',38.95,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_NM',39.09,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_NM',39.39,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_NM',39.98,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_NM',40.58,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_PP',10.01,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_PP',10.11,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_PP',9.47,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_PP',8.87,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_PP',8.56,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_PP',8.74,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_PP',8.61,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_PP',8.71,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_PP',8.73,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_PP',8.71,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_PP',8.69,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_PP',8.67,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_PP',8.65,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_PP',8.65,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_PP',8.69,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_PP',8.73,'Mt','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_OTH',467.38,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_OTH',459.15,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_OTH',447.25,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_OTH',373.03,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_OTH',342.35,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_OTH',359.10,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_OTH',383.29,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_OTH',392.61,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_OTH',394.39,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_OTH',396.06,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_OTH',397.20,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_OTH',394.77,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_OTH',391.09,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_OTH',388.39,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_OTH',387.68,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_OTH',388.18,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_OTH_NEU',160.47,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_OTH_NEU',159.23,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_OTH_NEU',165.69,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_OTH_NEU',151.80,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_OTH_NEU',129.77,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_OTH_NEU',124.56,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_OTH_NEU',129.22,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_OTH_NEU',130.20,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_OTH_NEU',130.28,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_OTH_NEU',130.09,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_OTH_NEU',129.84,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_OTH_NEU',129.29,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_OTH_NEU',128.92,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_OTH_NEU',129.23,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_OTH_NEU',130.45,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_OTH_NEU',131.77,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2006,'IND_OTH_NSP',138.37,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2007,'IND_OTH_NSP',143.03,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2008,'IND_OTH_NSP',136.50,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2010,'IND_OTH_NSP',120.26,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2012,'IND_OTH_NSP',116.10,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2014,'IND_OTH_NSP',119.18,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2016,'IND_OTH_NSP',125.23,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2018,'IND_OTH_NSP',128.96,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2020,'IND_OTH_NSP',130.99,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2022,'IND_OTH_NSP',132.73,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2025,'IND_OTH_NSP',134.65,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2030,'IND_OTH_NSP',136.76,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2035,'IND_OTH_NSP',138.35,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2040,'IND_OTH_NSP',140.96,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2045,'IND_OTH_NSP',145.71,'PJ','');
INSERT INTO "Demand" VALUES ('IT',2050,'IND_OTH_NSP',150.62,'PJ','');
-- Other sectors and dummies not required in the whole database)
INSERT INTO "Demand" VALUES ('IT',2007,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2008,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2010,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2012,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2014,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2016,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2018,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2020,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2022,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2025,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2030,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2035,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2040,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2045,'DMY_OUT',1E6,'','');
INSERT INTO "Demand" VALUES ('IT',2050,'DMY_OUT',1E6,'','');

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
-- Industrial sector
-- New technologies
-- Fuel Technologies
--INSERT INTO "CostVariable" VALUES ('IT',2006,'IND_FT_ELC_E',2006,15.00,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2006,'IND_FT_ELC_E',2006,15.00+2.78,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2006,'IND_FT_HET_E',2006,5.00,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_BFG_N',2007,0.83,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_BFG_N',2007,0.83+0.010*108.17,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_BFG_N',2030,0.83+0.080*108.17,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_BFG_N',2050,0.83+0.150*108.17,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_BIO_N',2007,0.73,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COA_N',2007,1.55,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COA_N',2007,1.55+0.45,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COA_N',2007,1.55+0.45+0.010*98.27,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_COA_N',2030,1.55+0.45+0.080*98.27,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_COA_N',2050,1.55+0.45+0.150*98.27,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COG_N',2007,1.55,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COG_N',2007,1.55+0.010*108.17,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_COG_N',2030,1.55+0.080*108.17,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_COG_N',2050,1.55+0.150*108.17,'M€/PJ','Distribution + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COK_N',2007,1.55,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COK_N',2007,1.55+0.45,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_COK_N',2007,1.55+0.45+0.010*94.60,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_COK_N',2030,1.55+0.45+0.080*94.60,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_COK_N',2050,1.55+0.45+0.150*94.60,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_ETH_N',2007,1.55,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_ETH_N',2007,1.55+0.010*54.10,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_ETH_N',2030,1.55+0.080*54.10,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_ETH_N',2050,1.55+0.150*54.10,'M€/PJ','Distribution + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_HFO_N',2007,1.55,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_HFO_N',2007,1.55+4.31,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_HFO_N',2007,1.55+4.31+0.010*77.37,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_HFO_N',2030,1.55+4.31+0.080*77.37,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_HFO_N',2050,1.55+4.31+0.150*77.37,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_LPG_N',2007,1.55,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_LPG_N',2007,1.55+0.010*63.07,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_LPG_N',2030,1.55+0.080*63.07,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_LPG_N',2050,1.55+0.150*63.07,'M€/PJ','Distribution + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NAP_N',2007,1.55,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NAP_N',2007,1.55+4.31,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NAP_N',2007,1.55+4.31+0.010*73.33,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_NAP_N',2030,1.55+4.31+0.080*73.33,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_NAP_N',2050,1.55+4.31+0.150*73.33,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NGA_N',2007,1.04,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NGA_N',2007,1.04+0.37,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_NGA_N',2007,1.04+0.37+0.010*56.10,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_NGA_N',2030,1.04+0.37+0.080*56.10,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_NGA_N',2050,1.04+0.37+0.150*56.10,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_OIL_N',2007,1.55,'M€/PJ','Distribution');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_OIL_N',2007,1.55+4.31,'M€/PJ','Distribution + Excise');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_OIL_N',2007,1.55+4.31+0.010*71.98,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_OIL_N',2030,1.55+4.31+0.080*71.98,'M€/PJ','Distribution + Excise + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_OIL_N',2050,1.55+4.31+0.150*71.98,'M€/PJ','Distribution + Excise + ETS');
--INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_PTC_N',2007,1.55,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_FT_PTC_N',2007,1.55+0.010*100.80,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_FT_PTC_N',2030,1.55+0.080*100.80,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_FT_PTC_N',2050,1.55+0.150*100.80,'M€/PJ','Distribution + ETS');
INSERT INTO "CostVariable" VALUES ('IT',2014,'IND_FT_H2_N',2014,0.32,'M€/PJ','Distribution');
-- Micro-CHP
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_CHP_NGA_CI_N',2007,4.17E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'IND_CHP_NGA_CI_N',2014,3.75E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'IND_CHP_NGA_CI_N',2022,3.22E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_CHP_NGA_CI_N',2030,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_CHP_NGA_TG_N',2007,1.67E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'IND_CHP_NGA_TG_N',2014,1.53E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'IND_CHP_NGA_TG_N',2022,1.39E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'IND_CHP_NGA_TV_N',2007,1.39E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N',2014,3.75E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N',2022,3.22E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N',2030,2.78E+00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N',2050,2.50E+00,'M€/PJ','');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','IND_FT_HET_N',2007,5.07,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_FT_NGA_N',2007,20.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_FT_H2_N',2014,30.29,'M€/PJ','');
-- New technologies
-- Machine drive and steam
INSERT INTO "CostInvest" VALUES ('IT','IND_MD_DST_N',2007,19.25,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_MD_LPG_N',2007,19.25,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_MD_NGA_N',2007,23.10,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_MD_ELC_N',2007,0.75,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_MD_ELC_N',2016,4.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_BFG_N',2007,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_BIO_N',2007,18.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_COA_N',2007,15.20,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_COG_N',2007,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_DST_N',2007,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_ETH_N',2007,4.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_HET_N',2007,4.70,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_HFO_N',2007,5.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_LPG_N',2007,3.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_NGA_N',2007,4.60,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_STM_PTC_N',2007,15.20,'M€/PJ','');
-- Chemicals
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_NAPSC_N',2007,8.57E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_NAPSC_N',2030,6.64E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_ETHSC_N',2007,6.20E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_ETHSC_N',2030,3.72E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_GSOSC_N',2007,9.70E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_LPGSC_N',2007,7.92E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_LPGSC_N',2030,5.00E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_NCC_N',2020,1.36E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_HVC_BDH_N',2020,1.33E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OLF_PDH_N',2010,1.69E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OLF_MTO_N',2007,4.76E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_NGASR_N',2007,8.35E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_NGASR_N',2030,6.94E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_NGASR_CCS_N',2025,9.03E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_NAPPOX_N',2007,1.28E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_NAPPOX_N',2030,1.12E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_COAGSF_N',2007,8.25E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_COAGSF_N',2030,7.11E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_BIOGSF_N',2025,2.22E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_AMM_ELCSYS_N',2025,1.04E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_NGASR_N',2007,7.38E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_NGASR_CCS_N',2025,7.98E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_COGSR_N',2007,4.54E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_LPGSR_N',2007,7.56E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_COAGSF_N',2007,1.09E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_BIOGSF_N',2025,7.10E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_ELCSYS_N',2025,4.40E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_ELCSYS_N',2030,2.65E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_MTH_ELCSYS_N',2050,1.42E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_MERC_N',2007,4.76E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_MERC_N',2030,3.67E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_DIAP_N',2007,4.76E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_DIAP_N',2030,3.67E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_MEMB_N',2007,4.76E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_CHL_MEMB_N',2030,3.67E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_EC_N',2007,1.00E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_COK_N',2007,3.09E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_DST_N',2007,2.95E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_ELC_N',2007,1.00E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_ETH_N',2007,3.09E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_HFO_N',2007,3.10E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CH_OTH_NGA_N',2007,2.60E+00,'M€/cap','');
-- Iron and steel
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_BFBOF_N',2007,1.28E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N',2030,1.78E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N',2050,1.31E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,1.44E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_DRI_DRIEAF_N',2007,4.58E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,4.95E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_DRI_HDREAF_N',2030,6.34E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_HISBOF_N',2025,4.40E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_HISBOF_CCS_N',2030,4.93E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_ULCOWIN_N',2030,6.94E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_ULCOLYSIS_N',2030,6.72E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_IS_BOF_ULCORED_CCS_N',2030,4.95E+02,'M€/cap','');
-- Non-ferrous metals
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_AMN_BAY_N',2007,1.56E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ALU_HLH_N',2007,4.41E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ALU_SEC_N',2007,1.26E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ALU_HLHIA_N',2030,3.87E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ALU_CBT_N',2050,1.30E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ALU_KAO_N',2050,1.56E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_COP_N',2007,4.40E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_ZNC_N',2007,2.00E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_EC_N',2007,8.15E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_OTH_ELC_N',2007,3.15E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_OTH_ELC_N',2040,4.09E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_OTH_DST_N',2007,2.94E+00,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NF_OTH_NGA_N',2007,2.66E+00,'M€/cap','');
-- Non-metallic minerals
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRY_N',2007,3.49E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRY_BIO_N',2007,3.49E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_WET_N',2007,3.49E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_N',2020,7.40E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,7.40E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,4.34E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,4.34E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CEM_BLN_N',2007,1.20E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CEM_AAC_N',2030,1.10E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CEM_BEL_N',2030,3.61E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_LIM_LRK_N',2007,3.98E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_GLS_FOSS_N',2007,3.32E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_GLS_ELEC_N',2007,3.32E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_NM_CRM_N',2007,1.25E+02,'M€/cap','');
-- Pulp and paper
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PUL_KRF_N',2007,1.36E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PUL_SUL_N',2007,1.36E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PUL_MEC_N',2007,3.00E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PUL_SCH_N',2007,8.28E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PUL_REC_N',2007,6.42E+02,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PAP_N',2007,1.80E+03,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PH_HFO_N',2007,7.41E+01,'M€/cap','');
INSERT INTO "CostInvest" VALUES ('IT','IND_PP_PH_NGA_N',2007,7.41E+01,'M€/cap','');
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2007,1.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2014,1.05E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2022,1.03E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2030,9.45E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_TG_N',2007,8.00E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_TV_N',2007,1.50E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2014,2.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2022,2.06E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2030,1.89E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2050,1.80E+03,'M€/GW','');
-- Other energy use
INSERT INTO "CostInvest" VALUES ('IT','IND_OTH_OTH_ELC_N',2007,12.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_OTH_PH_DST_N',2007,10.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_OTH_PH_HFO_N',2007,8.25,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_OTH_PH_LPG_N',2007,6.00,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','IND_OTH_PH_NGA_N',2007,5.00,'M€/PJ','');

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
-- Industrial sector
-- New technologies
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_BFG_N',2007,1.64E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_BIO_N',2007,1.44E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_COA_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_COG_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_COK_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_ETH_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_HFO_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_LPG_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_NAP_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_NGA_N',2007,2.05E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_OIL_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_FT_PTC_N',2007,3.08E+00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2014,'IND_FT_H2_N',2014,1.57,'M€/PJ','');
-- Machine drive and steam
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_MD_DST_N',2007,1.93,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_MD_LPG_N',2007,1.93,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_MD_NGA_N',2007,2.31,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_MD_ELC_N',2007,0.08,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2016,'IND_MD_ELC_N',2016,0.45,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_BFG_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_BIO_N',2007,1.52,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_COA_N',2007,1.00,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_COG_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_DST_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_ETH_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_HET_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_HFO_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_LPG_N',2007,0.30,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_NGA_N',2007,0.32,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_STM_PTC_N',2007,1.00,'M€/PJ','');
-- Chemicals
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_HVC_NAPSC_N',2007,2.14E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_HVC_NAPSC_N',2030,1.66E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_HVC_ETHSC_N',2007,1.55E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_HVC_ETHSC_N',2030,9.30E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_HVC_GSOSC_N',2007,2.43E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_HVC_LPGSC_N',2007,1.98E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_HVC_LPGSC_N',2030,1.25E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'IND_CH_HVC_NCC_N',2020,3.41E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'IND_CH_HVC_BDH_N',2020,3.32E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2010,'IND_CH_OLF_PDH_N',2010,4.23E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OLF_MTO_N',2007,1.19E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_AMM_NGASR_N',2007,2.09E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_AMM_NGASR_N',2030,1.73E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_AMM_NGASR_CCS_N',2025,4.95E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_AMM_NAPPOX_N',2007,3.20E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_AMM_NAPPOX_N',2030,2.81E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_AMM_COAGSF_N',2007,2.06E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_AMM_COAGSF_N',2030,1.78E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_AMM_BIOGSF_N',2025,3.00E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_AMM_ELCSYS_N',2025,2.60E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_MTH_NGASR_N',2007,5.38E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_MTH_NGASR_CCS_N',2025,1.28E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_MTH_COGSR_N',2007,3.31E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_MTH_LPGSR_N',2007,5.51E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_MTH_COAGSF_N',2007,2.73E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_MTH_BIOGSF_N',2025,3.55E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_CH_MTH_ELCSYS_N',2025,1.10E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_MTH_ELCSYS_N',2030,6.63E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'IND_CH_MTH_ELCSYS_N',2050,3.55E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_CHL_MERC_N',2007,4.72E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_CHL_MERC_N',2030,3.64E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_CHL_DIAP_N',2007,4.72E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_CHL_DIAP_N',2030,3.64E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_CHL_MEMB_N',2007,4.72E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_CH_CHL_MEMB_N',2030,3.64E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_EC_N',2007,1.00E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_COK_N',2007,5.30E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_DST_N',2007,5.30E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_ELC_N',2007,3.60E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_ETH_N',2007,5.30E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_HFO_N',2007,5.30E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_CH_OTH_NGA_N',2007,4.80E-01,'M€/cap','');
-- Iron and steel
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_IS_BOF_BFBOF_N',2007,3.19E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_BOF_BFBOF_CCS_N',2030,3.14E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2040,'IND_IS_BOF_BFTGRBOF_CCS_N',2040,3.09E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_IS_DRI_DRIEAF_N',2007,1.74E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N',2030,1.74E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_DRI_HDREAF_N',2030,1.74E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2025,'IND_IS_BOF_HISBOF_N',2025,1.45E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_BOF_HISBOF_CCS_N',2030,1.49E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_BOF_ULCOWIN_N',2030,2.02E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_BOF_ULCOLYSIS_N',2030,1.70E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_IS_BOF_ULCORED_CCS_N',2030,1.64E+01,'M€/cap','');
-- Non-ferrous metals
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_AMN_BAY_N',2007,1.37E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_ALU_HLH_N',2007,6.84E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_ALU_SEC_N',2007,3.65E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_NF_ALU_HLHIA_N',2030,5.63E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'IND_NF_ALU_CBT_N',2050,5.47E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2050,'IND_NF_ALU_KAO_N',2050,1.37E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_COP_N',2007,1.00E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_ZNC_N',2007,1.00E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_EC_N',2007,5.28E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_OTH_ELC_N',2007,3.00E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_OTH_DST_N',2007,2.94E-01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NF_OTH_NGA_N',2007,2.66E-01,'M€/cap','');
-- Non-metallic minerals
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_CLK_DRY_N',2007,7.28E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_CLK_DRY_BIO_N',2007,7.28E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_CLK_WET_N',2007,7.28E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'IND_NM_CLK_DRYCL_PCCS_N',2020,1.45E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2020,'IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,1.45E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_NM_CLK_DRYCL_OCCS_N',2030,8.77E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,8.77E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_CEM_BLN_N',2007,3.00E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_NM_CEM_AAC_N',2030,2.30E+02,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2030,'IND_NM_CEM_BEL_N',2030,7.58E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_LIM_LRK_N',2007,1.99E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_GLS_FOSS_N',2007,2.65E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_GLS_ELEC_N',2007,2.65E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_NM_CRM_N',2007,1.50E+01,'M€/cap','');
-- Pulp and paper
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PUL_KRF_N',2007,4.00E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PUL_SUL_N',2007,4.00E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PUL_MEC_N',2007,1.50E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PUL_SCH_N',2007,2.80E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PUL_REC_N',2007,3.00E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PAP_N',2007,8.90E+01,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PH_HFO_N',2007,5.00E+00,'M€/cap','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_PP_PH_NGA_N',2007,5.00E+00,'M€/cap','');
-- Other energy use
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_OTH_OTH_ELC_N',2007,0.01,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_OTH_PH_DST_N',2007,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_OTH_PH_HFO_N',2007,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_OTH_PH_LPG_N',2007,0.50,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'IND_OTH_PH_NGA_N',2007,0.20,'M€/PJ','');

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
-- Industry
-- Fuel technologies
INSERT INTO "CurrencyTech" VALUES ('IND_FT_H2_N','EUR12');
-- Chemicals
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_NAPSC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_ETHSC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_GSOSC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_LPGSC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_NCC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_BDH_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_HVC_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OLF_PDH_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OLF_MTO_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_NGASR_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_NGASR_CCS_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_NAPPOX_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_COAGSF_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_BIOGSF_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_AMM_ELCSYS_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_NGASR_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_NGASR_CCS_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_COGSR_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_LPGSR_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_COAGSF_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_BIOGSF_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_MTH_ELCSYS_N','USD16');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_CHL_MERC_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_CHL_DIAP_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_CHL_MEMB_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_EC_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_BIO_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_COA_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_DST_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_ETH_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_LPG_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_MTH_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_NAP_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_FS_NGA_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_COK_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_DST_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_ELC_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_ETH_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_HFO_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_CH_OTH_NGA_N','USD00');
-- Iron and steel
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_BFBOF_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_BFBOF_CCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_BFTGRBOF_CCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_DRI_DRIEAF_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_DRI_DRIEAF_CCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_DRI_HDREAF_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_HISBOF_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_HISBOF_CCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_ULCOWIN_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_ULCOLYSIS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_IS_BOF_ULCORED_CCS_N','USD10');
-- Non-ferrous metals
INSERT INTO "CurrencyTech" VALUES ('IND_NF_AMN_BAY_N','USD12');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ALU_HLH_N','USD11');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ALU_SEC_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ALU_HLHIA_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ALU_CBT_N','USD13');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ALU_KAO_N','USD12');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_COP_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_ZNC_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_EC_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_OTH_ELC_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_OTH_DST_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_NF_OTH_NGA_N','USD00');
-- Non-metallic minerals
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRY_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRY_BIO_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_WET_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRYCL_PCCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRYCL_PCCS_BIO_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRYCL_OCCS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CLK_DRYCL_OCCS_BIO_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CEM_BLN_N','USD11');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CEM_AAC_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CEM_BEL_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_LIM_LRK_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_GLS_FOSS_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_GLS_ELEC_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_CRM_N','USD06');
INSERT INTO "CurrencyTech" VALUES ('IND_NM_EC_N','USD00');
-- Pulp and paper
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PUL_KRF_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PUL_SUL_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PUL_MEC_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PUL_SCH_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PUL_REC_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PAP_N','USD10');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PH_HFO_N','USD00');
INSERT INTO "CurrencyTech" VALUES ('IND_PP_PH_NGA_N','USD00');
-- Other industries
INSERT INTO "CurrencyTech" VALUES ('IND_OTH_PH_DST_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_OTH_PH_HFO_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_OTH_PH_LPG_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_OTH_PH_NGA_N','USD08');
INSERT INTO "CurrencyTech" VALUES ('IND_OTH_OTH_ELC_N','USD08');
-- Micro-CHP
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TG_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TV_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_BLQ_CI_N','EUR09');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Industrial sector
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TG_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TV_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_BLQ_CI_N',31.536,'PJ/GW');

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
-- Industrial sector
-- Fuel technologies
INSERT INTO "CapacityFactor" VALUES ('IT','IND_FT_H2_N',2014,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_FT_H2E_N',2014,0.75,'');
-- Base year technologies
-- Machine drive and steam
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_ELC_E',2006,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_DST_E',2006,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_BIO_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_DST_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_COA_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_HFO_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_LPG_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_NGA_E',2006,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_HET_E',2006,0.75,'');
-- New technologies
-- Machine drive and steam
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_DST_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_LPG_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_NGA_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_MD_ELC_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_BFG_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_BIO_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_COA_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_COG_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_DST_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_ETH_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_HET_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_HFO_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_LPG_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_NGA_N',2007,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_STM_PTC_N',2007,0.75,'');
-- Chemicals
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_NAPSC_N',2007,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_ETHSC_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_GSOSC_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_LPGSC_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_NCC_N',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_HVC_BDH_N',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OLF_PDH_N',2010,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OLF_MTO_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_NGASR_N',2007,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_NGASR_CCS_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_NAPPOX_N',2007,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_COAGSF_N',2007,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_BIOGSF_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_AMM_ELCSYS_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_NGASR_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_NGASR_CCS_N',2025,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_COGSR_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_LPGSR_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_COAGSF_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_BIOGSF_N',2025,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_MTH_ELCSYS_N',2025,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_CHL_MERC_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_CHL_DIAP_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_CHL_MEMB_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_EC_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_COK_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_DST_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_ELC_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_ETH_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_HFO_N',2007,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_NGA_N',2007,0.82,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CH_OTH_NGA_N',2020,0.85,'');
-- Iron and steel
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_BFBOF_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_BFBOF_CCS_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_DRI_DRIEAF_N',2007,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_DRI_HDREAF_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_HISBOF_N',2025,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_HISBOF_CCS_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_ULCOWIN_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_ULCOLYSIS_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_IS_BOF_ULCORED_CCS_N',2030,0.85,'');
-- Non-ferrous metals
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ALU_HLH_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ALU_SEC_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ALU_HLHIA_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ALU_CBT_N',2050,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ALU_KAO_N',2050,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_COP_N',2007,0.9,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_ZNC_N',2007,0.9,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_EC_N',2007,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_OTH_ELC_N',2007,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_OTH_DST_N',2007,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NF_OTH_NGA_N',2007,0.8,'');
-- Non-metallic minerals
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRY_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRY_BIO_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_WET_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_N',2025,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2025,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CEM_BLN_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CEM_AAC_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CEM_BEL_N',2030,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_LIM_LRK_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_GLS_FOSS_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_GLS_ELEC_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_CRM_N',2007,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_NM_EC_N',2007,0.80,'');
-- Pulp and paper
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PUL_KRF_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PUL_SUL_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PUL_MEC_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PUL_SCH_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PUL_REC_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PAP_N',2007,0.95,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PH_HFO_N',2007,0.8,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_PP_PH_NGA_N',2007,0.8,'');
-- Other industries
INSERT INTO "CapacityFactor" VALUES ('IT','IND_OTH_OTH_ELC_N',2007,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_OTH_PH_DST_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_OTH_PH_HFO_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_OTH_PH_LPG_N',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_OTH_PH_NGA_N',2007,0.70,'');
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_CI_N',2007,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TG_N',2007,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TV_N',2007,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_BLQ_CI_N',2014,0.57,'');

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