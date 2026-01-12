BEGIN TRANSACTION;

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
	"segfrac"	real CHECK("seg_frac" >= 0 AND "segfrac" <= 1),
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
INSERT INTO "sector_labels" VALUES ('ELC');
INSERT INTO "sector_labels" VALUES ('IND');
INSERT INTO "sector_labels" VALUES ('COM');
INSERT INTO "sector_labels" VALUES ('RES');
INSERT INTO "sector_labels" VALUES ('UPS');
INSERT INTO "sector_labels" VALUES ('DIS');
INSERT INTO "sector_labels" VALUES ('STG');
INSERT INTO "sector_labels" VALUES ('CCUS');
INSERT INTO "sector_labels" VALUES ('MAT');

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
-- Micro-CHP
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_MICRO_N','p','COM','mCHP - Commercial - Cogeneration microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CC_N','p','COM','mCHP - Commercial - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_SLB_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Solid biomass','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_SOFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_H2_PEMFC_N','p','COM','mCHP - Commercial - PEM fuel cell - Hydrogen','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TG_N','p','IND','mCHP - Industry - Simple cycle gas turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TV_N','p','IND','mCHP - Industry - Steam turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_BLQ_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Bioliquid','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CI_N','p','RES','mCHP - Residential - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_MICRO_N','p','RES','mCHP - Residential - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CC_N','p','RES','mCHP - Residential - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_STR_N','p','RES','mCHP - Residential - Stirling engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_SOFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_H2_PEMFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Hydrogen','');
-- Storage
INSERT INTO "technologies" VALUES ('STG_ELC_DST_BTT','ps','STG','Storage - Distributed Electricity - Lithium-Ion Battery','ATB 2022');
INSERT INTO "technologies" VALUES ('STG_ELC_HYD_PUM_E','ps','STG','Storage - Pumping hydroelectric plant - Existing','TIMES-Italy');
INSERT INTO "technologies" VALUES ('STG_ELC_CEN_BTT','ps','STG','Storage - Centralized Electricity - Lithium-Ion Battery','ATB 2022');
-- Upstream
INSERT INTO "technologies" VALUES ('UPS_COA','p','UPS','Coal Price','');
INSERT INTO "technologies" VALUES ('UPS_NGA','p','UPS','Natural Gas Price','');
INSERT INTO "technologies" VALUES ('UPS_OIL','p','UPS','Oil and Oil Products Price','');
INSERT INTO "technologies" VALUES ('UPS_H2','p','UPS','Hydrogen Price','');
INSERT INTO "technologies" VALUES ('UPS_IMP_NUC','p','UPS','Import of Uranium U3O8 yellowcake','ATB 2022');
INSERT INTO "technologies" VALUES ('UPS_BIO','p','UPS','Biofuels Price','');
INSERT INTO "technologies" VALUES ('UPS_WIN','p','UPS','Wind Resource','');
INSERT INTO "technologies" VALUES ('UPS_HYD','p','UPS','Hydroelectric Resource','');
INSERT INTO "technologies" VALUES ('UPS_GEO','p','UPS','Geothermal Resource','');
INSERT INTO "technologies" VALUES ('UPS_SOL','p','UPS','Solar Resource','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_CEN','p','UPS','Import of Electricity','');
INSERT INTO "technologies" VALUES ('UPS_EXP_ELC_CEN','p','UPS','Export of Electricity','');
-- Electricity sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('ELC_FT_BGS','p','ELC','Fuel technology - Biogas','');
INSERT INTO "technologies" VALUES ('ELC_FT_BLQ','p','ELC','Fuel technology - Bioliquids','');
INSERT INTO "technologies" VALUES ('ELC_FT_BMU','p','ELC','Fuel technology - Municipal waste','');
INSERT INTO "technologies" VALUES ('ELC_FT_COA','p','ELC','Fuel technology - Coal','');
INSERT INTO "technologies" VALUES ('ELC_FT_DERGAS','p','ELC','Fuel technology - Derived gas','');
INSERT INTO "technologies" VALUES ('ELC_FT_GEO','p','ELC','Fuel technology - Geothermal','');
INSERT INTO "technologies" VALUES ('ELC_FT_HHC','p','ELC','Fuel technology - Heavy hydrocarbons','');
INSERT INTO "technologies" VALUES ('ELC_FT_HYD','p','ELC','Fuel technology - Hydroelectric','');
INSERT INTO "technologies" VALUES ('ELC_FT_NGA','p','ELC','Fuel technology - Natural gas','');
INSERT INTO "technologies" VALUES ('ELC_FT_NUC','p','ELC','Fuel technology - Nuclear fuel production=conv+enr+fabbr','');
INSERT INTO "technologies" VALUES ('ELC_FT_OIL','p','ELC','Fuel technology - Oil','');
INSERT INTO "technologies" VALUES ('ELC_FT_SLB','p','ELC','Fuel technology - Solid biomass','');
INSERT INTO "technologies" VALUES ('ELC_FT_SOL','p','ELC','Fuel technology - Solar','');
INSERT INTO "technologies" VALUES ('ELC_FT_WIN','p','ELC','Fuel technology - Wind','');
INSERT INTO "technologies" VALUES ('ELC_FT_H2','p','ELC','Fuel technology - Hydrogen','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('ELC_COA_COND_E','pb','ELC','Coal condensation steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_COA_OIL_E','pb','ELC','Coal and oil plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_DERGAS_CC_E','pb','ELC','Derived gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_CC_E','p','ELC','Natural gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_OIL_E','p','ELC','Natural gas and oil plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_STM_REP_E','p','ELC','Repowered natural gas steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_TURB_E','p','ELC','Natural gas turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_MIN_E','p','ELC','Minor natural gas plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_DST_TURB_E','pb','ELC','Diesel turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_OIL_STM_E','pb','ELC','Oil steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BGS_E','pb','ELC','Biogas plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CEN_E','pb','ELC','Centralized biomass plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BIO_DST_E','pb','ELC','Distributed biomass plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_GEO_E','p','ELC','Geothermal plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_SOL_E','p','ELC','Solar plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_WIN_E','p','ELC','Wind plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_FLO_E','p','ELC','Flowing water hydroelectric plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_FLO_L10MW_E','p','ELC','Flowing water hydroelectric plant (< 10MW) - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_RES_E','p','ELC','Reservoir hydroelectric plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_GASDER_CC_E','p','ELC','Cogeneration derived gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_HHC_CC_E','p','ELC','Cogeneration heavy hydrocarbons combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_E','p','ELC','Cogeneration natural gas combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_CEN_E','p','ELC','Centralized cogeneration natural gas turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_DST_E','p','ELC','Distributed cogeneration natural gas turbine - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_STM_COND_E','p','ELC','Cogeneration natural gas condensation steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_OIL_STM_COND_CEN_E','p','ELC','Centralized cogeneration oil condensation steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_OIL_STM_COND_DST_E','p','ELC','Distributed cogeneration oil condensation steam cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BMU_E','p','ELC','Cogeneration municipal waste plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BGS_COG_E','p','ELC','Cogeneration biogas plant - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_COA_IGCC_E','p','ELC','Cogeneration integrated gasification coal combined cycle - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BIO_CEN_E','p','ELC','Centralized cogeneration biomass plant - Existing','');
INSERT INTO "technologies" VALUES ('HET_NGA_E','p','ELC','Natural gas heat plant - Existing','');
INSERT INTO "technologies" VALUES ('HET_GEO_E','p','ELC','Geothermal heat plant - Existing','');
-- Planned technologies
INSERT INTO "technologies" VALUES ('ELC_COA_STM_P','pb','ELC','Coal steam cycle - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_NGA_CC_P','p','ELC','Natural gas combined cycle - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_P','p','ELC','Cogeneration natural gas combined cycle - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_P','p','ELC','Cogeneration natural gas turbine - New (planned)','');
INSERT INTO "technologies" VALUES ('ELC_WIN_P','p','ELC','Wind plant - New (planned)','');
-- New technologies
INSERT INTO "technologies" VALUES ('ELC_NGA_CT_N','p','ELC','Natural gas combustion turbine - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_CC_N','p','ELC','Natural gas combined cycle - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_STM_N','pb','ELC','Coal steam cycle - New','');
INSERT INTO "technologies" VALUES ('ELC_OIL_STM_N','pb','ELC','Oil steam cycle - New','');
INSERT INTO "technologies" VALUES ('ELC_BLQ_N','p','ELC','Bioliquid plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_5C_N','p','ELC','Biomass (5 cent) plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_12C_N','p','ELC','Biomass (12 cent) plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BGS_AGR_N','p','ELC','Agriculture and farming biogas plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BGS_LAN_N','p','ELC','Landfill biogas plant - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_MICRO_N','p','ELC','Micro hydroelectric (< 1MW) - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_MINI_N','p','ELC','Mini hydroelectric (> 1MW) - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_HENT_N','p','ELC','Geothermal high enthalpy plant - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_LENT_N','p','ELC','Geothermal low enthalpy plant - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_N','p','ELC','Wind plant - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_OFF_N','p','ELC','Wind plant - Offshore - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_OFF_DEEP_N','p','ELC','Wind plant - Deep offshore - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_ITC_N','p','ELC','Photovoltaic ground plant - Northwest Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_ITF_N','p','ELC','Photovoltaic ground plant - South Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_ITG_N','p','ELC','Photovoltaic ground plant - Insular Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_ITH_N','p','ELC','Photovoltaic ground plant - Northeast Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_GRO_ITI_N','p','ELC','Photovoltaic ground plant - Central Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_ITC_N','p','ELC','Photovoltaic roof plant - Northwest Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_ITF_N','p','ELC','Photovoltaic roof plant - South Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_ITG_N','p','ELC','Photovoltaic roof plant - Insular Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_ITH_N','p','ELC','Photovoltaic roof plant - Northeast Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_PV_ROOF_ITI_N','p','ELC','Photovoltaic roof plant - Central Italy - New','');
INSERT INTO "technologies" VALUES ('ELC_H2_PEMFC_N','p','ELC','PEM fuel cell system running on hydrogen 100 kW based - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_LWR_N','pb','ELC','Nuclear fission - Light Water Reactor','');
INSERT INTO "technologies" VALUES ('ELC_NUC_SMR_N','pb','ELC','Nuclear fission - Small Modular Reactor','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BMU_N','p','ELC','Cogeneration municipal waste plant - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TURB_N','p','ELC','Cogeneration natural gas turbine - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CC_N','p','ELC','Cogeneration natural gas combined cycle - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_CP_N','p','ELC','Cogeneration natural gas cycle in counter pressure - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_TAP_N','p','ELC','Cogeneration natural gas cycle with steam tapping - New','');
INSERT INTO "technologies" VALUES ('HET_NGA_N','p','ELC','Natural gas heat plant - New','');
INSERT INTO "technologies" VALUES ('HET_OIL_N','p','ELC','Oil heat plant - New','');
INSERT INTO "technologies" VALUES ('HET_BIO_N','p','ELC','Biomass heat plant - New','');
INSERT INTO "technologies" VALUES ('HET_COA_N','p','ELC','Coal heat plant - New','');
INSERT INTO "technologies" VALUES ('HET_GEO_N','p','ELC','Geothermal heat plant - New','');
INSERT INTO "technologies" VALUES ('HET_GEO_SHA_N','p','ELC','Geothermal shallow heat plant - New','');
-- CCUS
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA','p','CCUS','Coal power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA','p','CCUS','Natural gas power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_NGA','');
-- Dummy
INSERT INTO "technologies" VALUES ('DMY_PHY_NON_ANNUAL','p','UPS','Dummy import for physical commodities - Non annual','');-- Hydrogen
INSERT INTO "technologies" VALUES ('DMY_OUT_TECH','p','UPS','Dummy technology to produce DMY_OUT','');
-- Distrib and demand
INSERT INTO "technologies" VALUES ('DISTR_ELC','p','DIS','','');
INSERT INTO "technologies" VALUES ('END_USES_ELC','p','DIS','','');
INSERT INTO "technologies" VALUES ('END_USES_HET','p','DIS','','');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "technologies" VALUES ('DMY_ELC_TECH','p','UPS','Dummy technology to consume SNK_ELC_CO2','');
-- Materials
INSERT INTO "technologies" VALUES ('MAT_SUP_ALU','p','MAT','Material Supply - Aluminum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_BOR','p','MAT','Material Supply - Boron','');
INSERT INTO "technologies" VALUES ('MAT_SUP_CER','p','MAT','Material Supply - Cerium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_CHR','p','MAT','Material Supply - Chromium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_COB','p','MAT','Material Supply - Cobalt','');
INSERT INTO "technologies" VALUES ('MAT_SUP_COP','p','MAT','Material Supply - Copper','');
INSERT INTO "technologies" VALUES ('MAT_SUP_DYS','p','MAT','Material Supply - Dysprosium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_EUP','p','MAT','Material Supply - Europium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_FLU','p','MAT','Material Supply - Fluospar','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GAD','p','MAT','Material Supply - Gadolinium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GAL','p','MAT','Material Supply - Gallium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GER','p','MAT','Material Supply - Germanium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GRA','p','MAT','Material Supply - Graphite','');
INSERT INTO "technologies" VALUES ('MAT_SUP_IND','p','MAT','Material Supply - Indium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_IRI','p','MAT','Material Supply - Iridium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_LAN','p','MAT','Material Supply - Lanthanum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_LIT','p','MAT','Material Supply - Lithium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MAG','p','MAT','Material Supply - Magnesium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MAN','p','MAT','Material Supply - Manganese','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MOL','p','MAT','Material Supply - Molybdenum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NEO','p','MAT','Material Supply - Neodymium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NIC','p','MAT','Material Supply - Nickel','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NIO','p','MAT','Material Supply - Niobium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PAL','p','MAT','Material Supply - Palladium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PHO','p','MAT','Material Supply - Phosphorus','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PLA','p','MAT','Material Supply - Platinum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PRA','p','MAT','Material Supply - Praseodymium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_SIL','p','MAT','Material Supply - Silicon','');
INSERT INTO "technologies" VALUES ('MAT_SUP_SIV','p','MAT','Material Supply - Silver','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TAN','p','MAT','Material Supply - Tantalum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TER','p','MAT','Material Supply - Terbium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TIT','p','MAT','Material Supply - Titanium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_VAN','p','MAT','Material Supply - Vanadium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_YTT','p','MAT','Material Supply - Yttrium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_ZIR','p','MAT','Material Supply - Zirconium','');

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
-- Electricity sector
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_CT_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_CC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_STM_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_STM_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BLQ_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_5C_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_12C_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BGS_AGR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BGS_LAN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_MICRO_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_MINI_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_HENT_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_LENT_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_OFF_DEEP_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_ITC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_ITF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_ITG_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_ITH_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_GRO_ITI_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_ITC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_ITF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_ITG_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_ITH_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_PV_ROOF_ITI_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_H2_PEMFC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_LWR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_SMR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_BMU_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_TURB_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_CC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_CP_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_TAP_N','');
-- Storage
INSERT INTO "tech_reserve" VALUES ('STG_ELC_CEN_BTT','');
INSERT INTO "tech_reserve" VALUES ('STG_ELC_DST_BTT','');

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
-- Electricity sector
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_P','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_OFF_DEEP_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_ITC_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_ITF_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_ITG_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_ITH_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_GRO_ITI_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_ITC_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_ITF_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_ITG_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_ITH_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_PV_ROOF_ITI_N','');

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
INSERT INTO "tech_annual" VALUES ('UPS_IMP_NUC','');

CREATE TABLE "commodity_labels" (
	"comm_labels"	text,
	"comm_labels_desc"	text,
	PRIMARY KEY("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','Physical commodity');
INSERT INTO "commodity_labels" VALUES ('e','Emissions commodity');
INSERT INTO "commodity_labels" VALUES ('d','Service demand commodity');
INSERT INTO "commodity_labels" VALUES ('m','Material commodity');

CREATE TABLE "commodities" (
	"comm_name"	text,
	"flag"	text,
	"comm_desc"	text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("flag") REFERENCES "commodity_labels"("comm_labels")
);
-- Physical commodities
--INSERT INTO "commodities" VALUES('BIO','p','Biofuels');
--INSERT INTO "commodities" VALUES('COA','p','Coal');
--INSERT INTO "commodities" VALUES('NGA','p','Natural Gas');
--INSERT INTO "commodities" VALUES('OIL','p','Oil and Oil Products');
INSERT INTO "commodities" VALUES('ethos','p','Dummy input commodity for primary energy technologies');
-- Input commodities
INSERT INTO "commodities" VALUES('BIO_BIN','p','Industrial wastes');
INSERT INTO "commodities" VALUES('BIO_BMU','p','Municipal wastes');
INSERT INTO "commodities" VALUES('BIO_DST','p','Biodiesel');
INSERT INTO "commodities" VALUES('BIO_GAS','p','Biogas');
INSERT INTO "commodities" VALUES('BIO_METH','p','Biomethane');
INSERT INTO "commodities" VALUES('BIO_SLB','p','Solid biomass');
INSERT INTO "commodities" VALUES('COA_HCO','p','Hard coal');
INSERT INTO "commodities" VALUES('COA_OVC','p','Coke oven coke');
INSERT INTO "commodities" VALUES('GAS_BFG','p','Blast furnace gas');
INSERT INTO "commodities" VALUES('GAS_COG','p','Coke oven gas');
INSERT INTO "commodities" VALUES('GAS_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('GAS_RFG','p','Refinery gas');
INSERT INTO "commodities" VALUES('GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('H2_EL','p','Hydrogen from electrolysis');
INSERT INTO "commodities" VALUES('H2_BL','p','Hydrogen for blending');
INSERT INTO "commodities" VALUES('HYD','p','Hydroelectric energy');
INSERT INTO "commodities" VALUES('NUC','p','Uranium U3O8 yellowcake');
INSERT INTO "commodities" VALUES('OIL_CRD','p','Crude oil');
INSERT INTO "commodities" VALUES('OIL_DST','p','Distillates');
INSERT INTO "commodities" VALUES('OIL_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES('OIL_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES('OIL_KER','p','Other kerosene');
INSERT INTO "commodities" VALUES('OIL_LPG','p','Liquid petroleum gas');
INSERT INTO "commodities" VALUES('OIL_NAP','p','Naphtha');
INSERT INTO "commodities" VALUES('OIL_NSP','p','Non specified oil');
INSERT INTO "commodities" VALUES('OIL_PTC','p','Petroleum coke');
INSERT INTO "commodities" VALUES('SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('SYN_NGA','p','Synthetic natural gas');
INSERT INTO "commodities" VALUES('WIN','p','Wind energy');
-- Electricity sector commodities
INSERT INTO "commodities" VALUES('ELC_BGS','p','Biogas');
INSERT INTO "commodities" VALUES('ELC_BLQ','p','Bioliquids');
INSERT INTO "commodities" VALUES('ELC_BMU','p','Municipal waste');
INSERT INTO "commodities" VALUES('ELC_CEN','p','Electricity (centralized)');
INSERT INTO "commodities" VALUES('ELC_COA','p','Coal');
INSERT INTO "commodities" VALUES('ELC_DST','p','Electricity (distributed)');
INSERT INTO "commodities" VALUES('ELC_GASDER','p','Derived gas');
INSERT INTO "commodities" VALUES('ELC_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES('ELC_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES('ELC_HHC','p','Heavy hydrocarbons');
INSERT INTO "commodities" VALUES('ELC_HYD','p','Hydroelectric energy');
INSERT INTO "commodities" VALUES('ELC_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES('ELC_NUC','p','Nuclear fuel');
INSERT INTO "commodities" VALUES('ELC_OIL','p','Oil');
INSERT INTO "commodities" VALUES('ELC_SLB','p','Solid biomass');
INSERT INTO "commodities" VALUES('ELC_SOL','p','Solar energy');
INSERT INTO "commodities" VALUES('ELC_WIN','p','Wind energy');
INSERT INTO "commodities" VALUES('HET','p','Heat');
INSERT INTO "commodities" VALUES('SNK_ELC_CO2','p','Power sector - Physical CO2 for storage/utilization');
-- Emission commodities
INSERT INTO "commodities" VALUES('ELC_CH4','e','Power sector - CH4 emission');
INSERT INTO "commodities" VALUES('ELC_CO2','e','Power sector - CO2 emission');
INSERT INTO "commodities" VALUES('ELC_N2O','e','Power sector - N2O emission');
-- CCUS
INSERT INTO "commodities" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission');
-- Dummy
INSERT INTO "commodities" VALUES('DMY_OUT','d','Dummy output commodity');
-- Demand commodities
INSERT INTO "commodities" VALUES('ELC_DEM','d','Electricity Demand');
INSERT INTO "commodities" VALUES('HET_DEM','d','Heat Demand');
-- Materials
INSERT INTO "commodities" VALUES('ALU','m','Aluminum');
INSERT INTO "commodities" VALUES('BOR','m','Boron');
INSERT INTO "commodities" VALUES('CER','m','Cerium');
INSERT INTO "commodities" VALUES('CHR','m','Chromium');
INSERT INTO "commodities" VALUES('COB','m','Cobalt');
INSERT INTO "commodities" VALUES('COP','m','Copper');
INSERT INTO "commodities" VALUES('DYS','m','Dysprosium');
INSERT INTO "commodities" VALUES('EUP','m','Europium');
INSERT INTO "commodities" VALUES('FLU','m','Fluospar');
INSERT INTO "commodities" VALUES('GAD','m','Gadolinium');
INSERT INTO "commodities" VALUES('GAL','m','Gallium');
INSERT INTO "commodities" VALUES('GER','m','Germanium');
INSERT INTO "commodities" VALUES('GRA','m','Graphite');
INSERT INTO "commodities" VALUES('IND','m','Indium');
INSERT INTO "commodities" VALUES('IRI','m','Iridium');
INSERT INTO "commodities" VALUES('LAN','m','Lanthanum');
INSERT INTO "commodities" VALUES('LIT','m','Lithium');
INSERT INTO "commodities" VALUES('MAG','m','Magnesium');
INSERT INTO "commodities" VALUES('MAN','m','Manganese');
INSERT INTO "commodities" VALUES('MOL','m','Molybdenum');
INSERT INTO "commodities" VALUES('NEO','m','Neodymium');
INSERT INTO "commodities" VALUES('NIC','m','Nickel');
INSERT INTO "commodities" VALUES('NIO','m','Niobium');
INSERT INTO "commodities" VALUES('PAL','m','Palladium');
INSERT INTO "commodities" VALUES('PHO','m','Phosphorus');
INSERT INTO "commodities" VALUES('PLA','m','Platinum');
INSERT INTO "commodities" VALUES('PRA','m','Praseodymium');
INSERT INTO "commodities" VALUES('SIL','m','Silicon');
INSERT INTO "commodities" VALUES('SIV','m','Silver');
INSERT INTO "commodities" VALUES('TAN','m','Tantalum');
INSERT INTO "commodities" VALUES('TER','m','Terbium');
INSERT INTO "commodities" VALUES('TIT','m','Titanium');
INSERT INTO "commodities" VALUES('VAN','m','Vanadium');
INSERT INTO "commodities" VALUES('YTT','m','Yttrium');
INSERT INTO "commodities" VALUES('ZIR','m','Zirconium');

CREATE TABLE "commodities_e_moo" (
	"comm_name"	text,
	"notes"		text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "MultiObjectiveSlacked" (
	"objective_name"		text,
	"objective_slack"		real,
	"notes"					text
);
CREATE TABLE "EnergyCommodityConcentrationIndex" (
    "regions"                   text,
    "comm_name"                 text,
    "periods"                   integer,
    "concentration_index"       real,
    "concentration_index_units" text,
    "concentration_index_notes" text,
	PRIMARY KEY("regions","comm_name","periods"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "TechnologyMaterialSupplyRisk" (
	"regions"	        text,
	"tech"	            text,
	"vintage"	        integer,
	"tech_msr"	        real,
	"tech_msr_units"	text,
	"tech_msr_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);

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
-- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','ELC_DST',4.926E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','HET',5.074E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','ELC_DST',4.762E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','HET',5.238E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','ELC_DST',0.65,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','HET',0.35,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','ELC_DST',0.69,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','HET',0.31,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','ELC_DST',0.59,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','HET',0.41,'');
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
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_CI_N','HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_CI_N','HET',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_CI_N','HET',0.523,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_CI_N','HET',0.489,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_NGA_CI_N','HET',0.482,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TG_N','HET',0.608,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TG_N','HET',0.600,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TG_N','HET',0.586,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TG_N','HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TV_N','HET',0.800,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TV_N','HET',0.789,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TV_N','HET',0.775,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TV_N','HET',0.759,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N','HET',0.569,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N','HET',0.547,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N','HET',0.534,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N','HET',0.517,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','ELC_DST',0.61,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','HET',0.39,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','ELC_DST',0.53,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','HET',0.47,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','ELC_DST',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','HET',0.42,'');
-- Electricity sector
-- Base year technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_GASDER_CC_E','ELC_CEN',0.61,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_GASDER_CC_E','HET',0.39,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_HHC_CC_E','ELC_CEN',0.62,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_HHC_CC_E','HET',0.38,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_E','ELC_CEN',0.72,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_E','HET',0.28,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','ELC_CEN',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_CEN_E','HET',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_DST_E','ELC_CEN',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_DST_E','HET',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_STM_COND_E','ELC_CEN',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_STM_COND_E','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','ELC_CEN',0.63,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E','HET',0.37,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','ELC_CEN',0.63,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E','HET',0.37,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BMU_E','ELC_CEN',0.44,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BMU_E','HET',0.56,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BGS_COG_E','ELC_CEN',0.45,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BGS_COG_E','HET',0.55,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_COA_IGCC_E','ELC_CEN',0.79,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_COA_IGCC_E','HET',0.21,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BIO_CEN_E','ELC_CEN',0.47,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BIO_CEN_E','HET',0.53,'');
-- Planned technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_P','ELC_CEN',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_P','HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'ELC_CHP_NGA_CC_P','ELC_CEN',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'ELC_CHP_NGA_CC_P','HET',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_P','ELC_CEN',0.52,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_P','HET',0.48,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'ELC_CHP_NGA_TURB_P','ELC_CEN',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'ELC_CHP_NGA_TURB_P','HET',0.75,'');
-- New technologies
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BMU_N','ELC_CEN',0.67,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_BMU_N','HET',0.33,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_N','ELC_CEN',0.42,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_N','HET',0.58,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_TURB_N','ELC_CEN',0.45,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_TURB_N','HET',0.55,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_N','ELC_CEN',0.62,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_N','HET',0.38,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_CC_N','ELC_CEN',0.71,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_CC_N','HET',0.29,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CP_N','ELC_CEN',0.20,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_CP_N','HET',0.80,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TAP_N','ELC_CEN',0.28,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'ELC_CHP_NGA_TAP_N','HET',0.72,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_TAP_N','ELC_CEN',0.30,'TIMES-Italy');
INSERT INTO "TechOutputSplit" VALUES ('IT',2040,'ELC_CHP_NGA_TAP_N','HET',0.70,'TIMES-Italy');

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
-- Electricity sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'OIL_PTC','ELC_FT_HHC',0.89,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'OIL_PTC','ELC_FT_HHC',0.79,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_BMU','ELC_FT_BMU',0.95,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_BMU','ELC_FT_BMU',0.90,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'BIO_BIN','ELC_FT_BMU',0.05,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2050,'BIO_BIN','ELC_FT_BMU',0.01,'');
-- Base year technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_COA','ELC_COA_OIL_E',0.85,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_OIL','ELC_COA_OIL_E',0.15,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_NGA','ELC_NGA_OIL_E',0.37,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_OIL','ELC_NGA_OIL_E',0.63,'');
-- New technologies
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_GEO','HET_GEO_SHA_N',0.998,'');
INSERT INTO "TechInputSplit" VALUES ('IT',2007,'ELC_CEN','HET_GEO_SHA_N',0.002,'');

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);
-- Storage
INSERT INTO "StorageDuration" VALUES ('IT','STG_ELC_HYD_PUM_E',10,'ATB 2022');
INSERT INTO "StorageDuration" VALUES ('IT','STG_ELC_CEN_BTT',6,'ATB 2022');
INSERT INTO "StorageDuration" VALUES ('IT','STG_ELC_DST_BTT',6,'ATB 2022');

CREATE TABLE "PlanningReserveMargin" (
	"regions"	text,
	"reserve_margin"	REAL,
	PRIMARY KEY("regions"),
	FOREIGN KEY("regions") REFERENCES regions
);
INSERT INTO "PlanningReserveMargin" VALUES ('IT',0.35);

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY(tech)
);
-- Micro-CHP
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_SLB_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_H2_PEMFC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CHP_BLQ_CI_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_STR_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_H2_PEMFC_N','');
-- Electricity sector
INSERT INTO "tech_groups" VALUES ('ELC_FT_BLQ','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_BMU','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_SLB','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_COA','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_DERGAS','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_GEO','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_HHC','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_NGA','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_OIL','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_H2','');
INSERT INTO "tech_groups" VALUES ('ELC_BGS_AGR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BGS_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BGS_LAN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_12C_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_5C_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_CEN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_DST_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BLQ_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BGS_COG_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BIO_CEN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BMU_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BMU_N','');
INSERT INTO "tech_groups" VALUES ('HET_BIO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_COND_E','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_OIL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_STM_P','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_STM_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_FLO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_FLO_L10MW_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_RES_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_MINI_N','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_HENT_N','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_LENT_N','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_P','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_OFF_DEEP_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_ITC_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_ITF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_ITG_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_ITH_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_GRO_ITI_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_ITC_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_ITF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_ITG_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_ITH_N','');
INSERT INTO "tech_groups" VALUES ('ELC_PV_ROOF_ITI_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_LWR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_SMR_N','');
INSERT INTO "tech_groups" VALUES ('HET_GEO_E','');
INSERT INTO "tech_groups" VALUES ('HET_GEO_N','');
INSERT INTO "tech_groups" VALUES ('HET_GEO_SHA_N','');
-- CCUS
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_ELC_NGA','');
-- Storage
INSERT INTO "tech_groups" VALUES ('STG_ELC_HYD_PUM_E','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
-- Electricity sector
INSERT INTO "groups" VALUES ('ELC_FT_BLQ_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_SLB_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_COA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_GEO_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_OIL_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_OIL_PROD_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_H2_GRP','');
INSERT INTO "groups" VALUES ('ELC_BGS_GRP','');
INSERT INTO "groups" VALUES ('ELC_BMU_GRP','');
INSERT INTO "groups" VALUES ('ELC_BLQ_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIO_GRP','');
INSERT INTO "groups" VALUES ('ELC_COA_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_N_GRP','');
INSERT INTO "groups" VALUES ('ELC_GEO_GRP','');
INSERT INTO "groups" VALUES ('ELC_GEO_HET_GRP','');
INSERT INTO "groups" VALUES ('ELC_SOL_GRP','');
INSERT INTO "groups" VALUES ('ELC_WIN_GRP','');
INSERT INTO "groups" VALUES ('ELC_NUC_GRP','');

CREATE TABLE "TechGroupWeight" (
	"tech"		        text,
	"group_name"	    text,
	"weight"	real,
	"tech_desc"	        text,
	PRIMARY KEY("tech","group_name")
);
-- Micro-CHP
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_NGA_CI_N','RES_FT_HET_GRP',0.55,'');
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_NGA_MICRO_N','RES_FT_HET_GRP',0.62,'');
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_NGA_CC_N','RES_FT_HET_GRP',0.50,'');
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_NGA_STR_N','RES_FT_HET_GRP',0.20,'');
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_NGA_SOFC_N','RES_FT_HET_GRP',0.50,'');
--INSERT INTO "TechGroupWeight" VALUES ('RES_CHP_H2_PEMFC_N','RES_FT_HET_GRP',0.46,'');
-- Electricity sector
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_BLQ','ELC_FT_BLQ_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_SLB','ELC_FT_SLB_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_COA','ELC_FT_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_GEO','ELC_FT_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_NGA','ELC_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_OIL','ELC_FT_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_DERGAS','ELC_FT_OIL_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_HHC','ELC_FT_OIL_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_OIL','ELC_FT_OIL_PROD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_H2','ELC_FT_H2_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_AGR_N','ELC_BGS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_LAN_N','ELC_BGS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_E','ELC_BMU_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_N','ELC_BMU_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('IND_CHP_BLQ_CI_N','ELC_BLQ_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BLQ_N','ELC_BLQ_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_BIO_N','ELC_BLQ_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('COM_CHP_SLB_CI_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_AGR_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BGS_LAN_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_12C_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_5C_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CEN_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_DST_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BLQ_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BGS_COG_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_CEN_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BMU_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_COND_E','ELC_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_OIL_E','ELC_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_STM_P','ELC_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_STM_N','ELC_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_FLO_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_FLO_L10MW_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_RES_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MICRO_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MINI_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MICRO_N','ELC_HYD_N_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_MINI_N','ELC_HYD_N_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('STG_ELC_HYD_PUM_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_E','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_HENT_N','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_LENT_N','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_E','ELC_GEO_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_N','ELC_GEO_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_SHA_N','ELC_GEO_HET_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_E','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_P','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_N','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_OFF_N','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_OFF_DEEP_N','ELC_WIN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_E','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_ITC_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_ITF_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_ITG_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_ITH_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_GRO_ITI_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_ITC_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_ITF_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_ITG_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_ITH_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_PV_ROOF_ITI_N','ELC_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_LWR_N','ELC_NUC_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_SMR_N','ELC_NUC_GRP',1.0,'');
-- CCUS
--INSERT INTO "TechGroupWeight" VALUES ('CCUS_ELC_COA','CCUS_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('CCUS_ELC_NGA','CCUS_GRP',1.0,'');

CREATE TABLE "MinActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Electricity sector
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_FT_BLQ_GRP',0.50*18.32,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_FT_BLQ_GRP',0.50*26.42,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2014,'ELC_FT_BLQ_GRP',0.50*35.52,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_FT_BLQ_GRP',0.50*35.14,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2018,'ELC_FT_BLQ_GRP',0.50*34.75,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_FT_BLQ_GRP',0.50*36.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_FT_SLB_GRP',0.50*74.21,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_FT_SLB_GRP',0.50*102.11,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2014,'ELC_FT_SLB_GRP',0.50*74.67,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_FT_SLB_GRP',0.50*107.28,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2018,'ELC_FT_SLB_GRP',0.50*106.45,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_FT_SLB_GRP',0.50*108.14,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2007,'ELC_FT_NGA_GRP',1088.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_FT_NGA_GRP',1029.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_FT_NGA_GRP',803.87,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2050,'ELC_FT_NGA_GRP',0.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2007,'ELC_FT_OIL_PROD_GRP',377.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_FT_OIL_PROD_GRP',285.35,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_FT_OIL_PROD_GRP',206.18,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2014,'ELC_FT_OIL_PROD_GRP',173.34,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_FT_OIL_PROD_GRP',168.67,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2018,'ELC_FT_OIL_PROD_GRP',155.46,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_FT_OIL_PROD_GRP',139.33,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_BMU_GRP',7.34/0.50,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_BMU_GRP',8.82/0.50,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2050,'ELC_BMU_GRP',0.00/0.50,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_BIO_GRP',60.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2050,'ELC_BIO_GRP',72.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_HYD_GRP',158.72,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_HYD_GRP',159.61,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2014,'ELC_HYD_GRP',164.06,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_HYD_GRP',133.30,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2018,'ELC_HYD_GRP',159.82,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_HYD_GRP',160.36,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_SOL_GRP',15.25,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_SOL_GRP',69.17,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2014,'ELC_SOL_GRP',77.38,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2016,'ELC_SOL_GRP',79.48,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2018,'ELC_SOL_GRP',79.25,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_SOL_GRP',85.30,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2030,'ELC_SOL_GRP',90.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2050,'ELC_SOL_GRP',90.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('IT',2010,'ELC_WIN_GRP',0.75*27.57,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2012,'ELC_WIN_GRP',0.75*38.21,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2020,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2022,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2025,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2030,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2035,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2040,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2045,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check
INSERT INTO "MinActivityGroup" VALUES ('IT',2050,'ELC_WIN_GRP',0.75*60.79,'PJ'); -- Check

CREATE TABLE "MaxActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("periods","group_name")
);
-- Electricity sector
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_FT_BLQ_GRP',20.25,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2012,'ELC_FT_BLQ_GRP',29.21,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2014,'ELC_FT_BLQ_GRP',39.26,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_FT_BLQ_GRP',38.84,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2018,'ELC_FT_BLQ_GRP',38.40,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_FT_BLQ_GRP',43.66,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_FT_SLB_GRP',82.02,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2012,'ELC_FT_SLB_GRP',112.86,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2014,'ELC_FT_SLB_GRP',82.53,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_FT_SLB_GRP',118.57,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2018,'ELC_FT_SLB_GRP',117.66,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_FT_SLB_GRP',119.53,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2007,'ELC_FT_COA_GRP',498.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_FT_COA_GRP',447.15,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_FT_COA_GRP',372.63,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2030,'ELC_FT_COA_GRP',0.00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2050,'ELC_FT_COA_GRP',0.00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_FT_GEO_GRP',206.29,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2012,'ELC_FT_GEO_GRP',212.64,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2014,'ELC_FT_GEO_GRP',228.71,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_FT_GEO_GRP',236.06,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2018,'ELC_FT_GEO_GRP',230.21,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_FT_GEO_GRP',227.79,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2007,'ELC_GEO_HET_GRP',32.0,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_GEO_HET_GRP',32.0,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_GEO_HET_GRP',50.2,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2050,'ELC_GEO_HET_GRP',75.3,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2008,'ELC_BGS_GRP',6.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_BGS_GRP',8.98,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2012,'ELC_BGS_GRP',22.81,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2014,'ELC_BGS_GRP',31.02,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_BGS_GRP',31.29,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2018,'ELC_BGS_GRP',31.33,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_BGS_GRP',30.87,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2010,'ELC_BMU_GRP',8.08/0.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_BMU_GRP',9.70/0.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_BMU_GRP',11.64/0.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2030,'ELC_BMU_GRP',17.46/0.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2050,'ELC_BMU_GRP',26.20/0.50,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2007,'ELC_COA_GRP',207.19,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2016,'ELC_COA_GRP',144.00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2020,'ELC_COA_GRP',170.29,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2025,'ELC_COA_GRP',46.83,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2030,'ELC_COA_GRP',0.00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('IT',2050,'ELC_COA_GRP',0.00,'PJ');

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
-- Electricity sector
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2007,'ELC_BLQ_GRP',0.120,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2020,'ELC_BLQ_GRP',0.801,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2030,'ELC_BLQ_GRP',1.202,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2050,'ELC_BLQ_GRP',1.954,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2007,'ELC_HYD_N_GRP',0.10,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2010,'ELC_HYD_N_GRP',0.80,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2016,'ELC_HYD_N_GRP',2.10,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2020,'ELC_HYD_N_GRP',2.30,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2030,'ELC_HYD_N_GRP',2.50,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2007,'ELC_GEO_GRP',0.81,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2010,'ELC_GEO_GRP',0.77,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2020,'ELC_GEO_GRP',1.00,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2030,'ELC_GEO_GRP',1.15,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2040,'ELC_GEO_GRP',1.31,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2050,'ELC_GEO_GRP',1.43,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2008,'ELC_WIN_GRP',3.74,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2010,'ELC_WIN_GRP',5.79,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2012,'ELC_WIN_GRP',8.10,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2016,'ELC_WIN_GRP',9.38,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2020,'ELC_WIN_GRP',10.68,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2025,'ELC_WIN_GRP',15.69,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2030,'ELC_WIN_GRP',19.41,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2050,'ELC_WIN_GRP',70.35,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2035,'ELC_NUC_GRP',0.00,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('IT',2050,'ELC_NUC_GRP',0.00,'GW');

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
-- Electricity sector
INSERT INTO "MinInputGroup" VALUES ('IT',2020,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');
INSERT INTO "MinInputGroup" VALUES ('IT',2050,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');

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

-- Electricity sector
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COA_HCO','ELC_FT_COA_GRP',0.89,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'COA_OVC','ELC_FT_COA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'GAS_BFG','ELC_FT_COA_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'GAS_COG','ELC_FT_COA_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COA_HCO','ELC_FT_COA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'COA_OVC','ELC_FT_COA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'GAS_BFG','ELC_FT_COA_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'GAS_COG','ELC_FT_COA_GRP',0.04,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_CRD','ELC_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_DST','ELC_FT_OIL_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_GSL','ELC_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_HFO','ELC_FT_OIL_GRP',0.99,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_KER','ELC_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_LPG','ELC_FT_OIL_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'OIL_NAP','ELC_FT_OIL_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_CRD','ELC_FT_OIL_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_DST','ELC_FT_OIL_GRP',0.13,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_GSL','ELC_FT_OIL_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_HFO','ELC_FT_OIL_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_KER','ELC_FT_OIL_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_LPG','ELC_FT_OIL_GRP',0.10,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'OIL_NAP','ELC_FT_OIL_GRP',0.11,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'SYN_NGA','ELC_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'SYN_NGA','ELC_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'SYN_NGA','ELC_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'SYN_NGA','ELC_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'SYN_NGA','ELC_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2007,'BIO_METH','ELC_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2014,'BIO_METH','ELC_FT_NGA_GRP',0.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'BIO_METH','ELC_FT_NGA_GRP',2E-3,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'BIO_METH','ELC_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'BIO_METH','ELC_FT_NGA_GRP',0.05,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'BIO_METH','ELC_FT_NGA_GRP',1.00,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'H2_BL','ELC_FT_NGA_GRP',0.01,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2025,'H2_BL','ELC_FT_NGA_GRP',0.03,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2030,'H2_BL','ELC_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'H2_BL','ELC_FT_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2020,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('IT',2050,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');

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
-- Upstream
INSERT INTO "MinActivity" VALUES ('IT',2007,'UPS_IMP_ELC_CEN',0.90*193.77,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2008,'UPS_IMP_ELC_CEN',0.90*171.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2010,'UPS_IMP_ELC_CEN',0.90*182.10,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2012,'UPS_IMP_ELC_CEN',0.90*185.03,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'UPS_IMP_ELC_CEN',0.90*199.04,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'UPS_IMP_ELC_CEN',0.90*194.59,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2022,'UPS_IMP_ELC_CEN',0.90*182.57,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2050,'UPS_IMP_ELC_CEN',0.00,'PJ','');
-- Electricity sector
-- Base year technologies
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_BIO_DST_E',1.43,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2008,'ELC_BIO_DST_E',0.00,'PJ','');
--INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_BGS_COG_E',0.74,'PJ',''); -- Check
--INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_CHP_BGS_COG_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_BMU_E',5.59,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_BMU_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2008,'ELC_CHP_HHC_CC_E',24.20,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_CHP_HHC_CC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_NGA_CC_E',90.07,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_NGA_STM_COND_E',6.20,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_NGA_STM_COND_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_CEN_E',12.80,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_NGA_TURB_CEN_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_DST_E',12.59,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_NGA_TURB_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E',5.73,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_CHP_OIL_STM_COND_CEN_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E',9.74,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_CHP_OIL_STM_COND_DST_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_COA_COND_E',73.10,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2022,'ELC_COA_COND_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_COA_OIL_E',20.78,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_COA_OIL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_DERGAS_CC_E',4.72,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_DERGAS_CC_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_DST_TURB_E',0.29,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_DST_TURB_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_GEO_E',19.29,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2022,'ELC_GEO_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_NGA_OIL_E',10.54,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_NGA_OIL_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_NGA_STM_REP_E',18.08,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2008,'ELC_NGA_STM_REP_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_NGA_TURB_E',0.78,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2014,'ELC_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2007,'ELC_OIL_STM_E',51.29,'PJ','');
INSERT INTO "MinActivity" VALUES ('IT',2018,'ELC_OIL_STM_E',0.00,'PJ','');
-- Storage
INSERT INTO "MinActivity" VALUES ('IT',2007,'STG_ELC_HYD_PUM_E',20.38,'PJ','TIMES-Italy');
INSERT INTO "MinActivity" VALUES ('IT',2008,'STG_ELC_HYD_PUM_E',18.00,'PJ','TIMES-Italy');
INSERT INTO "MinActivity" VALUES ('IT',2022,'STG_ELC_HYD_PUM_E',0.00,'PJ','TIMES-Italy');

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
-- Upstream sector
-- Import/export prices
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'UPS_IMP_ELC_CEN',7.63,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2016,'UPS_IMP_ELC_CEN',7.63,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2022,'UPS_IMP_ELC_CEN',9.93,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'UPS_IMP_ELC_CEN',14.89,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'UPS_EXP_ELC_CEN',4.10,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2016,'UPS_EXP_ELC_CEN',4.10,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2022,'UPS_EXP_ELC_CEN',5.69,'GW','TERNA');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'UPS_EXP_ELC_CEN',8.53,'GW','TERNA');
-- Electricity sector
-- Planned technologies
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_COA_STM_P',0.80,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2014,'ELC_COA_STM_P',2.00,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_NGA_CC_P',5.84,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2008,'ELC_NGA_CC_P',8.50,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_NGA_CC_P',11.17,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2012,'ELC_NGA_CC_P',11.94,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_CHP_NGA_CC_P',1.64,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2008,'ELC_CHP_NGA_CC_P',2.51,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_CHP_NGA_CC_P',3.25,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_P',0.10,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_WIN_P',0.60,'GW','');
INSERT INTO "MaxCapacity" VALUES ('IT',2008,'ELC_WIN_P',1.62,'GW','');
-- New technologies
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_HYD_MICRO_N',0.500,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_HYD_MICRO_N',0.500,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_HYD_MICRO_N',0.837,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_HYD_MICRO_N',0.875,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2008,'ELC_HYD_MINI_N',1.500,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_HYD_MINI_N',2.284,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_HYD_MINI_N',2.352,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_WIN_N',10.84,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_WIN_N',12.02,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2025,'ELC_WIN_N',14.42,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_WIN_N',17.30,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_WIN_N',55.65,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_WIN_OFF_N',0.00,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_WIN_OFF_N',0.00,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2025,'ELC_WIN_OFF_N',0.10,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_WIN_OFF_N',2.10,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_WIN_OFF_N',8.40,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_WIN_OFF_DEEP_N',0.00,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2040,'ELC_WIN_OFF_DEEP_N',1.26,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_WIN_OFF_DEEP_N',6.30,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_GRO_ITC_N',4.40,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_GRO_ITC_N',15.95,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_GRO_ITF_N',2.99,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_GRO_ITF_N',28.18,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_GRO_ITG_N',1.75,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_GRO_ITG_N',18.20,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_GRO_ITH_N',4.92,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_GRO_ITH_N',20.20,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_GRO_ITI_N',2.81,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_GRO_ITI_N',19.39,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_ROOF_ITC_N',0.87,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_ROOF_ITC_N',6.22,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_ROOF_ITF_N',3.78,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_ROOF_ITF_N',5.50,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_ROOF_ITG_N',1.20,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_ROOF_ITG_N',2.67,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_ROOF_ITH_N',1.41,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_ROOF_ITH_N',4.74,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_PV_ROOF_ITI_N',1.89,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_PV_ROOF_ITI_N',4.67,'GW','ENSPRESO');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_BGS_AGR_N',0.18,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_BGS_AGR_N',0.27,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_BGS_AGR_N',0.38,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_BGS_AGR_N',0.67,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_BGS_LAN_N',0.22,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2008,'ELC_BGS_LAN_N',0.25,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_BGS_LAN_N',0.29,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_BGS_LAN_N',0.35,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_BGS_LAN_N',0.54,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_BGS_LAN_N',0.72,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_BIO_5C_N',0.73,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_BIO_5C_N',0.57,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_BIO_5C_N',0.83,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_BIO_5C_N',1.57,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_BIO_5C_N',2.56,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2007,'ELC_BIO_12C_N',0.30,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2010,'ELC_BIO_12C_N',0.24,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2020,'ELC_BIO_12C_N',0.32,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2030,'ELC_BIO_12C_N',0.83,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2040,'ELC_BIO_12C_N',0.61,'GW','TIMES-Italy');
INSERT INTO "MaxCapacity" VALUES ('IT',2050,'ELC_BIO_12C_N',1.20,'GW','TIMES-Italy');

CREATE TABLE "DiscreteCapacity" (
	"tech"	text,
	"dsccap"	real,
	"dsccap_units"	text,
	"dsccap_notes"	text,
	PRIMARY KEY("tech"),
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
-- Upstream
INSERT INTO "MaxActivity" VALUES ('IT',2007,'UPS_IMP_ELC_CEN',193.77,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'UPS_IMP_ELC_CEN',171.99,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'UPS_IMP_ELC_CEN',182.10,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'UPS_IMP_ELC_CEN',185.03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'UPS_IMP_ELC_CEN',199.04,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'UPS_IMP_ELC_CEN',194.59,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'UPS_IMP_ELC_CEN',182.57,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'UPS_IMP_ELC_CEN',191.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'UPS_IMP_ELC_CEN',209.59,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'UPS_IMP_ELC_CEN',214.51,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_IMP_ELC_CEN',241.49,'PJ','');
-- Export
INSERT INTO "MaxActivity" VALUES ('IT',2007,'UPS_EXP_ELC_CEN',10.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'UPS_EXP_ELC_CEN',13.46,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'UPS_EXP_ELC_CEN',7.23,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'UPS_EXP_ELC_CEN',10.51,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'UPS_EXP_ELC_CEN',16.23,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'UPS_EXP_ELC_CEN',23.64,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'UPS_EXP_ELC_CEN',23.30,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'UPS_EXP_ELC_CEN',23.47,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'UPS_EXP_ELC_CEN',22.15,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'UPS_EXP_ELC_CEN',24.10,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'UPS_EXP_ELC_CEN',26.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'UPS_EXP_ELC_CEN',28.15,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'UPS_EXP_ELC_CEN',30.01,'PJ','');
-- Electricity sector
-- Fuel technologies
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_FT_NGA',1.172E+03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_FT_NGA',1.172E+04,'PJ','');
-- Base year technologies
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_BGS_E',3.91,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_BGS_E',3.91,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_BGS_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_BIO_CEN_E',4.67,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_BIO_CEN_E',4.67,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_BIO_CEN_E',3.79,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_BIO_CEN_E',3.57,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_BIO_CEN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_BIO_DST_E',5.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_BIO_DST_E',5.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_BIO_DST_E',2.58,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_BIO_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_BGS_COG_E',2.11,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_BGS_COG_E',2.11,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_BGS_COG_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_BIO_CEN_E',6.34,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_BIO_CEN_E',6.34,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_BIO_CEN_E',4.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_CHP_BIO_CEN_E',1.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_CHP_BIO_CEN_E',1.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_BIO_CEN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_BMU_E',16.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_BMU_E',16.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_CHP_BMU_E',16.14,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_CHP_BMU_E',16.14,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_CHP_BMU_E',16.02,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_CHP_BMU_E',6.30,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_CHP_BMU_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_COA_IGCC_E',21.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_COA_IGCC_E',21.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_COA_IGCC_E',20.77,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_CHP_COA_IGCC_E',19.46,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_CHP_COA_IGCC_E',16.86,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_COA_IGCC_E',16.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_COA_IGCC_E',16.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_COA_IGCC_E',15.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_CHP_COA_IGCC_E',14.80,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_CHP_COA_IGCC_E',2.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_CHP_COA_IGCC_E',0.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_CHP_COA_IGCC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_GASDER_CC_E',49.89,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_GASDER_CC_E',45.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_CHP_GASDER_CC_E',45.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_HHC_CC_E',70.50,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_CHP_HHC_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_NGA_CC_E',254.22,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_NGA_CC_E',250.19,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_NGA_CC_E',234.97,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_CHP_NGA_CC_E',220.76,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_CHP_NGA_CC_E',194.18,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_NGA_CC_E',178.31,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_NGA_CC_E',163.24,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_NGA_CC_E',159.54,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_CHP_NGA_CC_E',157.07,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_CHP_NGA_CC_E',141.82,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_CHP_NGA_CC_E',132.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_CHP_NGA_CC_E',24.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_CHP_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_NGA_STM_COND_E',24.78,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_CHP_NGA_STM_COND_E',24.78,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_CHP_NGA_STM_COND_E',18.98,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_NGA_STM_COND_E',13.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_NGA_STM_COND_E',13.16,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_NGA_STM_COND_E',0.28,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_CHP_NGA_STM_COND_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_CEN_E',49.21,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_NGA_TURB_CEN_E',49.21,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_NGA_TURB_CEN_E',47.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_NGA_TURB_CEN_E',47.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_NGA_TURB_CEN_E',18.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_CHP_NGA_TURB_CEN_E',18.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_CHP_NGA_TURB_CEN_E',14.62,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_CHP_NGA_TURB_CEN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_DST_E',48.40,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_CHP_NGA_TURB_DST_E',48.40,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_CHP_NGA_TURB_DST_E',46.58,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_NGA_TURB_DST_E',46.58,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_NGA_TURB_DST_E',17.96,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_CHP_NGA_TURB_DST_E',17.96,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_CHP_NGA_TURB_DST_E',14.37,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_CHP_NGA_TURB_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_CEN_E',11.75,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_CHP_OIL_STM_COND_CEN_E',11.75,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_CHP_OIL_STM_COND_CEN_E',5.87,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_OIL_STM_COND_CEN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_CHP_OIL_STM_COND_DST_E',27.92,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_CHP_OIL_STM_COND_DST_E',27.92,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_CHP_OIL_STM_COND_DST_E',21.03,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_CHP_OIL_STM_COND_DST_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_COA_COND_E',94.31,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_COA_COND_E',94.31,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_COA_COND_E',81.99,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_COA_COND_E',81.19,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_COA_COND_E',81.19,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_COA_COND_E',73.07,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_COA_COND_E',65.77,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_COA_COND_E',59.19,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_COA_COND_E',53.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_COA_COND_E',26.64,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_COA_COND_E',0.27,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_COA_COND_E',0.07,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_COA_COND_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_COA_OIL_E',37.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_COA_OIL_E',37.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_COA_OIL_E',31.54,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_COA_OIL_E',23.65,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_COA_OIL_E',15.77,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_COA_OIL_E',11.04,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_COA_OIL_E',7.73,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_COA_OIL_E',5.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_COA_OIL_E',3.79,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_COA_OIL_E',2.65,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_COA_OIL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_DERGAS_CC_E',9.45,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_DERGAS_CC_E',5.99,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_DERGAS_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_DST_TURB_E',0.53,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_DST_TURB_E',0.48,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_DST_TURB_E',0.48,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_DST_TURB_E',0.45,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_DST_TURB_E',0.42,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_DST_TURB_E',0.42,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_DST_TURB_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_GEO_E',19.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_GEO_E',19.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_GEO_E',16.76,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_GEO_E',15.76,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_GEO_E',13.48,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_GEO_E',10.71,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_GEO_E',8.44,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_GEO_E',6.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_GEO_E',1.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_GEO_E',0.25,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_GEO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_HYD_FLO_E',34.89,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_HYD_FLO_E',48.50,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_HYD_FLO_E',48.50,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_HYD_FLO_E',38.91,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_HYD_FLO_E',48.50,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_HYD_FLO_L10MW_E',26.60,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_HYD_FLO_L10MW_E',33.72,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_HYD_FLO_L10MW_E',33.72,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_HYD_FLO_L10MW_E',27.23,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_HYD_FLO_L10MW_E',28.79,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_HYD_FLO_L10MW_E',29.62,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_HYD_RES_E',85.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_HYD_RES_E',107.98,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_HYD_RES_E',107.98,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_HYD_RES_E',91.98,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_HYD_RES_E',102.51,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_NGA_CC_E',256.74,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_NGA_CC_E',256.74,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_NGA_CC_E',256.53,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_NGA_CC_E',256.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_NGA_CC_E',256.32,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_NGA_CC_E',256.08,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_NGA_CC_E',247.22,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_NGA_CC_E',221.22,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_NGA_CC_E',27.20,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'ELC_NGA_CC_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_NGA_MIN_E',4.89,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_NGA_MIN_E',4.89,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_NGA_MIN_E',4.82,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_NGA_MIN_E',4.76,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_NGA_MIN_E',4.64,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_NGA_MIN_E',3.68,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_NGA_MIN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_NGA_OIL_E',16.08,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_NGA_OIL_E',16.08,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_NGA_OIL_E',15.13,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_NGA_OIL_E',13.60,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_NGA_OIL_E',13.60,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_NGA_OIL_E',10.88,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_NGA_OIL_E',9.52,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_NGA_OIL_E',4.87,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_NGA_OIL_E',4.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_NGA_OIL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_NGA_STM_REP_E',36.29,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_NGA_STM_REP_E',36.29,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_NGA_STM_REP_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_NGA_TURB_E',1.42,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_NGA_TURB_E',0.86,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_NGA_TURB_E',0.86,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_NGA_TURB_E',0.68,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_NGA_TURB_E',0.50,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_NGA_TURB_E',0.46,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_NGA_TURB_E',0.35,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_NGA_TURB_E',0.21,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_NGA_TURB_E',0.06,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_NGA_TURB_E',0.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2040,'ELC_NGA_TURB_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_OIL_STM_E',65.41,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_OIL_STM_E',53.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_OIL_STM_E',53.49,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_OIL_STM_E',29.42,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_OIL_STM_E',20.74,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_OIL_STM_E',20.74,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_OIL_STM_E',8.55,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_OIL_STM_E',8.55,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_OIL_STM_E',3.55,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_OIL_STM_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_SOL_E',0.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_SOL_E',0.09,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_SOL_E',0.10,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_SOL_E',0.11,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_SOL_E',0.07,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_SOL_E',0.07,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_SOL_E',0.08,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_SOL_E',0.04,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_SOL_E',0.04,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2025,'ELC_SOL_E',0.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'ELC_SOL_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'ELC_WIN_E',10.70,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2008,'ELC_WIN_E',11.34,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2010,'ELC_WIN_E',10.96,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2012,'ELC_WIN_E',11.20,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2014,'ELC_WIN_E',9.37,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2016,'ELC_WIN_E',7.17,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2018,'ELC_WIN_E',6.80,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2020,'ELC_WIN_E',1.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2022,'ELC_WIN_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'HET_GEO_E',17.83,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'HET_GEO_E',0.00,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2007,'HET_NGA_E',12.10,'PJ','');
INSERT INTO "MaxActivity" VALUES ('IT',2030,'HET_NGA_E',0.00,'PJ','');
-- Storage
INSERT INTO "MaxActivity" VALUES ('IT',2007,'STG_ELC_HYD_PUM_E',22.15,'PJ','TIMES-Italy');
INSERT INTO "MaxActivity" VALUES ('IT',2050,'STG_ELC_HYD_PUM_E',25.81,'PJ','TIMES-Italy');

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_SLB_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_H2_PEMFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_TV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_BLQ_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_STR_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_H2_PEMFC_N',20,'');
-- Electricity sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_BGS',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_BLQ',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_BMU',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_COA',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_DERGAS',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_GEO',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_HHC',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_HYD',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_NGA',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_OIL',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_SLB',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_SOL',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_WIN',60,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_FT_H2',20,'');
-- Existing technologies
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_E',2,'Fictitious');
-- Planned technologies
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_COA_STM_P',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NGA_CC_P',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_CC_P',25,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_TURB_P',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_P',30,'');
-- New technologies
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NGA_CT_N',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NGA_CC_N',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_COA_STM_N',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_OIL_STM_N',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BLQ_N',15,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BIO_5C_N',15,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BIO_12C_N',15,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BGS_AGR_N',9,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_BGS_LAN_N',9,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_HYD_MICRO_N',30,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_HYD_MINI_N',30,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_GEO_HENT_N',15,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_GEO_LENT_N',15,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_OFF_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_WIN_OFF_DEEP_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_GRO_ITC_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_GRO_ITF_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_GRO_ITG_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_GRO_ITH_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_GRO_ITI_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_ROOF_ITC_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_ROOF_ITF_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_ROOF_ITG_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_ROOF_ITH_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_PV_ROOF_ITI_N',20,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_H2_PEMFC_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NUC_LWR_N',60,'ATB 2022');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_NUC_SMR_N',60,'ATB 2022');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_BMU_N',20,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_TURB_N',25,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_CC_N',30,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_CP_N',35,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','ELC_CHP_NGA_TAP_N',35,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_NGA_N',60,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_OIL_N',60,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_BIO_N',60,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_COA_N',60,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_GEO_N',60,'TIMES-Italy');
INSERT INTO "LifetimeTech" VALUES ('IT','HET_GEO_SHA_N',60,'TIMES-Italy');
-- CCUS
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_COA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_COA_LINKED',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_NGA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('IT','CCUS_ELC_NGA_LINKED',30,'NREL');
-- Storage
INSERT INTO "LifetimeTech" VALUES ('IT','STG_ELC_CEN_BTT',15,'ATB 2022');
INSERT INTO "LifetimeTech" VALUES ('IT','STG_ELC_DST_BTT',15,'ATB 2022');


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
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2022,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2022,20,'');
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
-- Upstream sector
-- Import/export prices
INSERT INTO "ExistingCapacity" VALUES ('IT','UPS_IMP_ELC_CEN',2006,7.63,'PJ','TERNA');
INSERT INTO "ExistingCapacity" VALUES ('IT','UPS_EXP_ELC_CEN',2006,4.10,'PJ','TERNA');
-- Electricity sector
-- Base year technologies
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_COA_COND_E',2006,4.60,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_COA_OIL_E',2006,2.38,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_DERGAS_CC_E',2006,0.71,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_NGA_CC_E',2006,14.86,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_NGA_OIL_E',2006,3.89,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_NGA_STM_REP_E',2006,3.29,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_NGA_TURB_E',2006,1.80,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_NGA_MIN_E',2006,1.48,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_DST_TURB_E',2006,0.67,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_OIL_STM_E',2006,6.99,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_BGS_E',2006,0.27,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_BIO_CEN_E',2006,0.23,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_BIO_DST_E',2006,0.26,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_GEO_E',2006,0.75,'GW','Modified from 0.79 to be consistent with MaxActivityGroup on ELC_GEO_GRP');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_SOL_E',2006,0.02,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_WIN_E',2006,2.12,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_HYD_FLO_E',2006,2.69,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_HYD_FLO_L10MW_E',2006,2.05,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_HYD_RES_E',2006,9.55,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_GASDER_CC_E',2006,1.26,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_HHC_CC_E',2006,1.65,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_NGA_CC_E',2006,8.74,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_NGA_TURB_CEN_E',2006,1.34,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_NGA_TURB_DST_E',2006,1.34,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_NGA_STM_COND_E',2006,0.71,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_OIL_STM_COND_CEN_E',2006,0.34,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_OIL_STM_COND_DST_E',2006,0.93,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_BMU_E',2006,0.58,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_BGS_COG_E',2006,0.07,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_COA_IGCC_E',2006,0.83,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','ELC_CHP_BIO_CEN_E',2006,0.17,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('IT','HET_NGA_E',2006,12.10,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('IT','HET_GEO_E',2006,17.83,'PJ','');
-- Storage
INSERT INTO "ExistingCapacity" VALUES ('IT','STG_ELC_HYD_PUM_E',2006,7.09,'GW','TIMES-Italy');

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
-- Electricity sector
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','BIO_METH','ELC_FT_NGA',2007,'ELC_NGA',-56.10,'[kt/act]','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','H2_BL','ELC_FT_NGA',2020,'ELC_NGA',-56.10,'[kt/act]','');
-- CCUS
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-101.16/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_COA','CCUS_ELC_COA',2030,'ELC_CEN',-101.16/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',101.16/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2030,'ELC_CEN',101.16/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-56.10/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-56.10/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',56.10/0.55*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('IT','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',56.10/0.55*0.90,'kt/PJ','');

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
-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CO2',56.10,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CO2',101.16,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_CO2',79.55,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB','ELC_CO2',0.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_CO2',85.85,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_CO2',0.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CH4',0.13,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CH4',1.15,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_CH4',0.81,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB','ELC_CH4',30.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_CH4',0.02,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_CH4',300.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_N2O',0.54,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_N2O',1.91,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_N2O',3.18,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_SLB','ELC_N2O',4.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BMU','ELC_N2O',4.00,'[kt/PJ]','');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_N2O',4.00,'[kt/PJ]','');

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
-- Upstream
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_ELC_CEN',2006,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_COA',2007,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_COA',2007,'COA_OVC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_NGA',2007,'GAS_BFG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_NGA',2007,'GAS_COG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_NGA',2007,'GAS_RFG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_NGA',2007,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_NGA',2007,'SYN_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_NSP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_PTC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_CRD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_GSL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_HFO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_KER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_LPG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_OIL',2007,'OIL_NAP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_H2',2007,'H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_H2',2007,'H2_BL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_H2',2007,'H2_EL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_IMP_NUC',2035,'NUC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_GAS',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_BIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_BMU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_METH',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_BIO',2007,'BIO_SLB',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_WIN',2007,'WIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_HYD',2007,'HYD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_GEO',2007,'GEO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','UPS_SOL',2007,'SOL',1.00,'');
-- Export
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','UPS_EXP_ELC_CEN',2006,'DMY_OUT',1.0,'');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'HET',0.520,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'HET',0.510,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'HET',0.500,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'HET',0.480,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'HET',0.412,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'ELC_DST',0.390,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'HET',0.402,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/PJ');
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
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'HET',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'HET',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'HET',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'HET',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'HET',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'HET',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'HET',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'HET',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'HET',0.870,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'HET',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'HET',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'HET',0.931,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'HET',0.432,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'HET',0.520,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'HET',0.510,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'HET',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'HET',0.480,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'ELC_DST',0.16,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'HET',0.64,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.20,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'HET',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'ELC_DST',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'HET',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/PJ');
-- Electricity sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('IT','BIO_GAS','ELC_FT_BGS',2007,'ELC_BGS',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_DST','ELC_FT_BLQ',2007,'ELC_BLQ',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BIN','ELC_FT_BMU',2007,'ELC_BMU',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_BMU','ELC_FT_BMU',2007,'ELC_BMU',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_HCO','ELC_FT_COA',2007,'ELC_COA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','COA_OVC','ELC_FT_COA',2007,'ELC_COA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_BFG','ELC_FT_COA',2007,'ELC_COA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_COG','ELC_FT_COA',2007,'ELC_COA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_RFG','ELC_FT_DERGAS',2007,'ELC_GASDER',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GEO','ELC_FT_GEO',2007,'ELC_GEO',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NSP','ELC_FT_HHC',2007,'ELC_HHC',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_PTC','ELC_FT_HHC',2007,'ELC_HHC',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','HYD','ELC_FT_HYD',2007,'ELC_HYD',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','GAS_NGA','ELC_FT_NGA',2007,'ELC_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SYN_NGA','ELC_FT_NGA',2007,'ELC_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_METH','ELC_FT_NGA',2007,'ELC_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','H2_BL','ELC_FT_NGA',2020,'ELC_NGA',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','NUC','ELC_FT_NUC',2035,'ELC_NUC',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_CRD','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_DST','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_GSL','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_HFO','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_KER','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_LPG','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','OIL_NAP','ELC_FT_OIL',2007,'ELC_OIL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','BIO_SLB','ELC_FT_SLB',2007,'ELC_SLB',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','SOL','ELC_FT_SOL',2007,'ELC_SOL',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','WIN','ELC_FT_WIN',2007,'ELC_WIN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','H2','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','H2_EL','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');
-- Base year technologies
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_COND_E',2006,'ELC_CEN',0.34,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_COND_E',2010,'ELC_CEN',0.32,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_OIL_E',2006,'ELC_CEN',0.27,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_COA_OIL_E',2006,'ELC_CEN',0.27,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GASDER','ELC_DERGAS_CC_E',2006,'ELC_CEN',0.36,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CC_E',2006,'ELC_CEN',0.50,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CC_E',2010,'ELC_CEN',0.46,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_OIL_E',2006,'ELC_CEN',0.39,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_OIL_E',2010,'ELC_CEN',0.30,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_NGA_OIL_E',2006,'ELC_CEN',0.39,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_NGA_OIL_E',2010,'ELC_CEN',0.30,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_STM_REP_E',2006,'ELC_CEN',0.42,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_TURB_E',2006,'ELC_CEN',0.42,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_MIN_E',2006,'ELC_CEN',0.35,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_DST_TURB_E',2006,'ELC_CEN',0.27,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_OIL_STM_E',2006,'ELC_CEN',0.36,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_OIL_STM_E',2010,'ELC_CEN',0.27,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_BGS_E',2006,'ELC_DST',0.35,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_CEN_E',2006,'ELC_CEN',0.23,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_DST_E',2006,'ELC_DST',0.23,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','ELC_GEO_E',2006,'ELC_CEN',0.10,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_SOL_E',2006,'ELC_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_E',2006,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_FLO_E',2006,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_FLO_L10MW_E',2006,'ELC_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_RES_E',2006,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_GASDER_CC_E',2006,'ELC_CEN',0.85,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_GASDER_CC_E',2006,'HET',0.85,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HHC','ELC_CHP_HHC_CC_E',2006,'ELC_CEN',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HHC','ELC_CHP_HHC_CC_E',2006,'HET',0.80,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_E',2006,'ELC_CEN',0.71,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_E',2006,'HET',0.71,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_CEN_E',2006,'ELC_CEN',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_CEN_E',2006,'HET',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_DST_E',2006,'ELC_DST',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_DST_E',2006,'HET',0.70,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2006,'ELC_CEN',0.73,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_STM_COND_E',2006,'HET',0.73,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_CEN_E',2006,'ELC_CEN',0.55,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_CEN_E',2006,'HET',0.55,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_DST_E',2006,'ELC_DST',0.55,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_CHP_OIL_STM_COND_DST_E',2006,'HET',0.55,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BMU','ELC_CHP_BMU_E',2006,'ELC_CEN',0.48,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BMU','ELC_CHP_BMU_E',2006,'HET',0.48,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_CHP_BGS_COG_E',2006,'ELC_CEN',0.66,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_CHP_BGS_COG_E',2006,'HET',0.66,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_CHP_COA_IGCC_E',2006,'ELC_CEN',0.47,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_CHP_COA_IGCC_E',2006,'HET',0.47,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_CHP_BIO_CEN_E',2006,'ELC_CEN',0.49,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_CHP_BIO_CEN_E',2006,'HET',0.49,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','HET_NGA_E',2006,'HET',0.8,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','HET_GEO_E',2006,'HET',0.8,'');
-- Planned technologies
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_STM_P',2007,'ELC_CEN',0.42,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CC_P',2007,'ELC_CEN',0.47,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_P',2007,'ELC_CEN',0.65,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_P',2007,'HET',0.65,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_P',2007,'ELC_CEN',0.67,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_P',2007,'HET',0.67,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_P',2007,'ELC_CEN',1.00,'');
-- New technologies
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CT_N',2007,'ELC_CEN',0.35,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CT_N',2050,'ELC_CEN',1.10*0.35,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CC_N',2007,'ELC_CEN',0.54,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_NGA_CC_N',2050,'ELC_CEN',1.10*0.54,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_STM_N',2007,'ELC_CEN',0.40,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','ELC_COA_STM_N',2050,'ELC_CEN',1.10*0.40,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_OIL_STM_N',2007,'ELC_CEN',0.40,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','ELC_OIL_STM_N',2050,'ELC_CEN',1.10*0.40,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','ELC_BLQ_N',2007,'ELC_CEN',0.35,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','ELC_BLQ_N',2050,'ELC_CEN',1.10*0.35,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_5C_N',2007,'ELC_CEN',0.25,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_5C_N',2050,'ELC_CEN',1.10*0.25,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_12C_N',2007,'ELC_CEN',0.25,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','ELC_BIO_12C_N',2050,'ELC_CEN',1.10*0.25,'Assumption');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_BGS_AGR_N',2007,'ELC_DST',0.32,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_BGS_AGR_N',2040,'ELC_DST',0.40,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_BGS_LAN_N',2007,'ELC_DST',0.32,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BGS','ELC_BGS_LAN_N',2040,'ELC_DST',0.40,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_MICRO_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_HYD','ELC_HYD_MINI_N',2008,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','ELC_GEO_HENT_N',2007,'ELC_CEN',0.1,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','ELC_GEO_LENT_N',2007,'ELC_CEN',0.1,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_OFF_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_WIN','ELC_WIN_OFF_DEEP_N',2030,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_GRO_ITC_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_GRO_ITF_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_GRO_ITG_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_GRO_ITH_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_GRO_ITI_N',2007,'ELC_CEN',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_ROOF_ITC_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_ROOF_ITF_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_ROOF_ITG_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_ROOF_ITH_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SOL','ELC_PV_ROOF_ITI_N',2007,'ELC_DST',1.0,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','ELC_H2_PEMFC_N',2022,'ELC_DST',0.45,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','ELC_H2_PEMFC_N',2030,'ELC_DST',0.46,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','ELC_H2_PEMFC_N',2040,'ELC_DST',0.47,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NUC','ELC_NUC_LWR_N',2035,'ELC_CEN',0.33,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NUC','ELC_NUC_SMR_N',2035,'ELC_CEN',0.33,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BMU','ELC_CHP_BMU_N',2007,'ELC_CEN',0.38,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BMU','ELC_CHP_BMU_N',2007,'HET',0.38,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2007,'ELC_CEN',0.77,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2007,'HET',0.77,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'ELC_CEN',0.86,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TURB_N',2040,'HET',0.86,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_N',2007,'ELC_CEN',0.90,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CC_N',2007,'HET',0.90,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CP_N',2007,'ELC_CEN',0.84,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_CP_N',2007,'HET',0.84,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2007,'ELC_CEN',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'ELC_CEN',0.82,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','ELC_CHP_NGA_TAP_N',2040,'HET',0.82,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','HET_NGA_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_OIL','HET_OIL_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','HET_BIO_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','HET_COA_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','HET_GEO_N',2007,'HET',0.80,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_GEO','HET_GEO_SHA_N',2007,'HET',0.10,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','HET_GEO_SHA_N',2007,'HET',0.10,'TIMES-Italy');
-- Dummy
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'HYD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'SOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'WIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'HET',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_BGS',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_BLQ',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_BMU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_COA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_GASDER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_GEO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_HHC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_HYD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_OIL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_SLB',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_SOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'ELC_WIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_PHY_NON_ANNUAL',2007,'SYN_NGA',1.00,'');
-- CCUS
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',0.32,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',0.35,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',0.48,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',0.55,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_COA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','CCUS_ELC_NGA_LINKED',2020,'SNK_ELC_CO2',1.00,'');
-- Storage
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','STG_ELC_HYD_PUM_E',2006,'ELC_CEN',0.67,'TIMES-Italy');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','STG_ELC_HYD_PUM_E',2050,'ELC_CEN',0.80,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','STG_ELC_CEN_BTT',2020,'ELC_CEN',0.85,'ATB 2022');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','STG_ELC_DST_BTT',2020,'ELC_DST',0.85,'ATB 2022');
-- Distrib and demand
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','DISTR_ELC',2007,'ELC_DST',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','END_USES_ELC',2007,'ELC_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','END_USES_HET',2007,'HET_DEM',1.00,'');
-- Dummy
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Efficiency" VALUES ('IT','SNK_ELC_CO2','DMY_ELC_TECH',2007,'DMY_OUT',1.00,'');
-- Materials
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_ALU',2007,'ALU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_BOR',2007,'BOR',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_CER',2007,'CER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_COB',2007,'COB',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_COP',2007,'COP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_DYS',2007,'DYS',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_EUP',2007,'EUP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_FLU',2007,'FLU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GAD',2007,'GAD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GAL',2007,'GAL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GER',2007,'GER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GRA',2007,'GRA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_IND',2007,'IND',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_IRI',2007,'IRI',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_LIT',2007,'LIT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MAG',2007,'MAG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MAN',2007,'MAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MOL',2007,'MOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NEO',2007,'NEO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NIO',2007,'NIO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PAL',2007,'PAL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PHO',2007,'PHO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PLA',2007,'PLA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PRA',2007,'PRA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_SIL',2007,'SIL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_SIV',2007,'SIV',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TAN',2007,'TAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TER',2007,'TER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TIT',2007,'TIT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_VAN',2007,'VAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_YTT',2007,'YTT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_ZIR',2007,'ZIR',1.00,'');

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

-- Electricity sector
-- New technologies
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NGA_CT_N',2007,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NGA_CC_N',2007,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_COA_STM_N',2007,0.062,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_OIL_STM_N',2007,0.062,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BLQ_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BIO_5C_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BIO_12C_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BGS_AGR_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_BGS_LAN_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_HYD_MICRO_N',2007,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_HYD_MINI_N',2008,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_GEO_HENT_N',2007,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_GEO_LENT_N',2007,0.052,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_WIN_N',2007,0.076,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_WIN_OFF_N',2007,0.086,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_WIN_OFF_DEEP_N',2030,0.086,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_GRO_ITC_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_GRO_ITF_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_GRO_ITG_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_GRO_ITH_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_GRO_ITI_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_ROOF_ITC_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_ROOF_ITF_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_ROOF_ITG_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_ROOF_ITH_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_PV_ROOF_ITI_N',2007,0.057,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_H2_PEMFC_N',2022,0.080,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NUC_LWR_N',2035,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_NUC_SMR_N',2035,0.100,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_CHP_BMU_N',2007,0.067,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_CHP_NGA_TURB_N',2007,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_CHP_NGA_CC_N',2007,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_CHP_NGA_CP_N',2007,0.027,'');
INSERT INTO "DiscountRate" VALUES ('IT','ELC_CHP_NGA_TAP_N',2007,0.027,'');
-- CCUS
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_COA',2020,0.062,'');
INSERT INTO "DiscountRate" VALUES ('IT','CCUS_ELC_NGA',2020,0.027,'');
-- Storage
INSERT INTO "DiscountRate" VALUES ('IT','STG_ELC_CEN_BTT',2020,0.080,'Assumption');
INSERT INTO "DiscountRate" VALUES ('IT','STG_ELC_DST_BTT',2020,0.080,'Assumption');

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
INSERT INTO "Demand" VALUES ('IT',2007,'ELC_DEM',1129.99,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2008,'ELC_DEM',1148.87,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2010,'ELC_DEM',1087.43,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2012,'ELC_DEM',1077.40,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2014,'ELC_DEM',1007.38,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2016,'ELC_DEM',1043.16,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2018,'ELC_DEM',1042.95,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2020,'ELC_DEM',1009.91,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2022,'ELC_DEM',1022.26,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2025,'ELC_DEM',984.13,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2030,'ELC_DEM',1085.99,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2035,'ELC_DEM',1191.04,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2040,'ELC_DEM',1295.30,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2045,'ELC_DEM',1393.12,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2050,'ELC_DEM',1432.38,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2025,'HET_DEM',203.89,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2030,'HET_DEM',214.08,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2035,'HET_DEM',224.79,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2040,'HET_DEM',236.03,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2045,'HET_DEM',247.83,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2050,'HET_DEM',260.22,'PJ','Decarbonization Scenario of TEMOA-Italy');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Demand" VALUES ('IT',2006,'DMY_OUT',1E6,'PJ','');

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
-- Upstream
INSERT INTO "CostVariable" VALUES ('IT',2006,'UPS_IMP_ELC_CEN',2006,26.29,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'UPS_IMP_ELC_CEN',2007,25.91,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2008,'UPS_IMP_ELC_CEN',2008,25.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2010,'UPS_IMP_ELC_CEN',2010,18.63,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2012,'UPS_IMP_ELC_CEN',2012,23.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'UPS_IMP_ELC_CEN',2014,17.06,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2016,'UPS_IMP_ELC_CEN',2016,13.20,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2018,'UPS_IMP_ELC_CEN',2018,17.59,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'UPS_IMP_ELC_CEN',2020,26.81,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'UPS_IMP_ELC_CEN',2022,81.74,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_IMP_ELC_CEN',2025,42.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'UPS_IMP_ELC_CEN',2030,23.18,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2040,'UPS_IMP_ELC_CEN',2040,24.13,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_IMP_ELC_CEN',2050,25.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_COA',2007,3.03,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2030,'UPS_COA',2030,2.63,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_COA',2050,2.84,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_NGA',2007,11.98,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2030,'UPS_NGA',2030,6.55,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_NGA',2050,7.09,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_OIL',2007,6.93,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2030,'UPS_OIL',2030,10.49,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_OIL',2050,12.15,'M€/PJ','Import Price');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_H2',2007,100.00,'M€/PJ','Assuming 12 €/kg');
INSERT INTO "CostVariable" VALUES ('IT',2035,'UPS_IMP_NUC',2035,0.960,'M$/ton','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_BIO',2007,5.00,'M€/PJ','Import Price');
-- Export
INSERT INTO "CostVariable" VALUES ('IT',2006,'UPS_EXP_ELC_CEN',2006,-26.59,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'UPS_EXP_ELC_CEN',2007,-27.30,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2008,'UPS_EXP_ELC_CEN',2008,-27.61,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2010,'UPS_EXP_ELC_CEN',2010,-20.53,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2012,'UPS_EXP_ELC_CEN',2012,-22.74,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2014,'UPS_EXP_ELC_CEN',2014,-16.88,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2016,'UPS_EXP_ELC_CEN',2016,-13.49,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2018,'UPS_EXP_ELC_CEN',2018,-17.59,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2020,'UPS_EXP_ELC_CEN',2020,-23.68,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2022,'UPS_EXP_ELC_CEN',2022,-84.97,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2025,'UPS_EXP_ELC_CEN',2025,-44.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'UPS_EXP_ELC_CEN',2030,-24.09,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2040,'UPS_EXP_ELC_CEN',2040,-25.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'UPS_EXP_ELC_CEN',2050,-26.08,'M€/PJ','');
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
-- Electricity sector
-- Fuel technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_FT_BMU',2007,3.00,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('IT',2020,'ELC_FT_H2',2020,0.32,'M€/PJ','Distribution');

-- Base year technologies
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_COA_COND_E',2006,0.58,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_COA_OIL_E',2006,0.34,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_DERGAS_CC_E',2006,0.49,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_NGA_CC_E',2006,0.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_NGA_OIL_E',2006,0.35,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_NGA_STM_REP_E',2006,0.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_NGA_TURB_E',2006,0.50,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_NGA_MIN_E',2006,0.85,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_DST_TURB_E',2006,0.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_OIL_STM_E',2006,0.45,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_BGS_E',2006,0.36,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_BIO_CEN_E',2006,0.36,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_BIO_DST_E',2006,0.36,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_GEO_E',2006,3.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_SOL_E',2006,13.89,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_WIN_E',2006,0.00,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_HYD_FLO_E',2006,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_HYD_FLO_L10MW_E',2006,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_HYD_RES_E',2006,0.08,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_GASDER_CC_E',2006,0.64,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_HHC_CC_E',2006,0.45,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_NGA_CC_E',2006,0.79,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_NGA_TURB_CEN_E',2006,0.57,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_NGA_TURB_DST_E',2006,0.57,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_NGA_STM_COND_E',2006,0.48,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_OIL_STM_COND_CEN_E',2006,0.49,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_OIL_STM_COND_DST_E',2006,0.47,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_BMU_E',2006,0.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_BGS_COG_E',2006,0.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_COA_IGCC_E',2006,0.83,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2006,'ELC_CHP_BIO_CEN_E',2006,0.83,'M€/PJ','');
-- Planned technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_COA_STM_P',2007,0.46,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_NGA_CC_P',2007,1.41,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_CC_P',2007,0.49,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_P',2007,0.50,'M€/PJ','');
-- New technologies
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_NGA_CT_N',2007,1.39,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_NGA_CC_N',2007,0.56,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_COA_STM_N',2007,2.22,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_OIL_STM_N',2007,2.22,'M$/PJ','Assumption');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_BLQ_N',2007,1.61,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_BIO_5C_N',2007,1.61,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_BIO_12C_N',2007,1.61,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_BGS_LAN_N',2007,1.61,'M$/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2022,'ELC_H2_PEMFC_N',2022,29.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2030,'ELC_H2_PEMFC_N',2030,22.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2040,'ELC_H2_PEMFC_N',2040,18.06,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2050,'ELC_H2_PEMFC_N',2050,8.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_BMU_N',2007,12.50,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2030,'ELC_CHP_BMU_N',2030,9.50,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_N',2007,1.67,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2014,'ELC_CHP_NGA_TURB_N',2014,1.53,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2022,'ELC_CHP_NGA_TURB_N',2022,1.39,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2030,'ELC_CHP_NGA_TURB_N',2030,1.25,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2040,'ELC_CHP_NGA_TURB_N',2040,1.11,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_CC_N',2007,0.50,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2014,'ELC_CHP_NGA_CC_N',2014,0.44,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2022,'ELC_CHP_NGA_CC_N',2022,0.42,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2030,'ELC_CHP_NGA_CC_N',2030,0.37,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2040,'ELC_CHP_NGA_CC_N',2040,0.33,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_CP_N',2007,1.39,'M€/PJ','TIMES-Italy');
INSERT INTO "CostVariable" VALUES ('IT',2007,'ELC_CHP_NGA_TAP_N',2007,1.39,'M€/PJ','TIMES-Italy');
-- CCUS
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_COA',2020,15,'M€/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('IT',2020,'CCUS_ELC_NGA',2020,6,'M€/PJ','ATB 2022');
-- Storage
INSERT INTO "CostVariable" VALUES ('IT',2006,'STG_ELC_HYD_PUM_E',2006,0.51,'M$/PJ','ATB 2022');

-- Dummy
INSERT INTO "CostVariable" VALUES ('IT',2007,'DMY_PHY_NON_ANNUAL',2007,5E4,'M€/PJ','');

CREATE TABLE "CostEmission" (
    "regions"  text NOT NULL,
    "periods"  integer NOT NULL,
    "emis_comm" text NOT NULL,
    "cost_emission"    real,
    "cost_emission_units"  text,
    "cost_emission_notes"  text,
    FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
    FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name"),
    PRIMARY KEY("regions","periods","emis_comm")
);
INSERT INTO "CostEmission" VALUES ('IT',2007,'ELC_CO2',0.010,'M€/kt','ETS');
INSERT INTO "CostEmission" VALUES ('IT',2030,'ELC_CO2',0.080,'M€/kt','ETS');
INSERT INTO "CostEmission" VALUES ('IT',2050,'ELC_CO2',0.150,'M€/kt','ETS');

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
-- Upstream
-- Import/export prices
INSERT INTO "CostInvest" VALUES ('IT','UPS_IMP_ELC_CEN',2007,1000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','UPS_EXP_ELC_CEN',2007,1000,'M€/GW','');
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
-- Electricity sector
-- Fuel technologies
INSERT INTO "CostInvest" VALUES ('IT','ELC_FT_H2',2020,30.29,'M€/PJ','');
-- New technologies
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CT_N',2007,922,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CT_N',2020,922,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CT_N',2050,703,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CC_N',2007,1038,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CC_N',2020,1038,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NGA_CC_N',2030,838,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_COA_STM_N',2007,3075,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_COA_STM_N',2020,3075,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_COA_STM_N',2050,2240,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_OIL_STM_N',2007,3075,'M$/GW','Assumption');
INSERT INTO "CostInvest" VALUES ('IT','ELC_OIL_STM_N',2020,3075,'M$/GW','Assumption');
INSERT INTO "CostInvest" VALUES ('IT','ELC_OIL_STM_N',2050,2240,'M$/GW','Assumption');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BLQ_N',2007,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BLQ_N',2020,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BLQ_N',2050,3626,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_5C_N',2007,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_5C_N',2020,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_5C_N',2050,3626,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_12C_N',2007,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_12C_N',2020,4416,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BIO_12C_N',2050,3626,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_AGR_N',2007,3500,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_AGR_N',2014,3000,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_AGR_N',2022,2500,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_AGR_N',2030,2250,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_AGR_N',2040,2025,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_LAN_N',2007,1100,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_LAN_N',2014,1050,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_LAN_N',2022,950,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_LAN_N',2030,915,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_BGS_LAN_N',2040,900,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_HYD_MICRO_N',2007,4500,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_HYD_MINI_N',2008,2250,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_HENT_N',2007,4000,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_HENT_N',2014,3800,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_HENT_N',2022,3500,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_HENT_N',2030,3350,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_HENT_N',2040,3200,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_LENT_N',2007,6000,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_LENT_N',2014,5700,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_LENT_N',2022,5250,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_LENT_N',2030,4690,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_GEO_LENT_N',2040,4480,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_N',2007,2532,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_N',2020,1462,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_N',2030,956,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_N',2050,765,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_N',2007,5000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_N',2020,3739,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_N',2030,2758,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_N',2050,2343,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_DEEP_N',2030,4049,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_WIN_OFF_DEEP_N',2050,3467,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITC_N',2007,6000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITC_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITC_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITC_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITF_N',2007,6000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITF_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITF_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITF_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITG_N',2007,6000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITG_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITG_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITG_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITH_N',2007,6000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITH_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITH_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITH_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITI_N',2007,6000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITI_N',2020,1333,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITI_N',2030,754,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_GRO_ITI_N',2050,620,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITC_N',2007,8000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITC_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITC_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITC_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITF_N',2007,8000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITF_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITF_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITF_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITG_N',2007,8000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITG_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITG_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITG_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITH_N',2007,8000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITH_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITH_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITH_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITI_N',2007,8000,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITI_N',2020,2263,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITI_N',2030,972,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_PV_ROOF_ITI_N',2050,751,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','ELC_H2_PEMFC_N',2022,3000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_H2_PEMFC_N',2030,2000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_H2_PEMFC_N',2040,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_H2_PEMFC_N',2050,1000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_LWR_N',2035,5289*1.000,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_LWR_N',2040,5289*1.276,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_LWR_N',2045,5289*1.409,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_LWR_N',2050,5289*1.409,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_SMR_N',2035,5491*1.000,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_SMR_N',2040,5491*1.276,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_SMR_N',2045,5491*1.409,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_NUC_SMR_N',2050,5491*1.409,'M$/GW','');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2007,4000,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2010,3600,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2014,3429,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2022,2895,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2030,2287,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_BMU_N',2040,2059,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_NGA_TURB_N',2007,960,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_NGA_CC_N',2007,720,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_NGA_CP_N',2007,702,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','ELC_CHP_NGA_TAP_N',2007,702,'M€/GW','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_NGA_N',2007,4.5,'M€/PJ','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_OIL_N',2007,5.0,'M€/PJ','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_BIO_N',2007,6.0,'M€/PJ','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_COA_N',2007,6.0,'M€/PJ','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_GEO_N',2007,12.0,'M€/PJ','TIMES-Italy');
INSERT INTO "CostInvest" VALUES ('IT','HET_GEO_SHA_N',2007,12.0,'M€/PJ','TIMES-Italy');
-- CCUS
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_COA',2020,5542,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_COA',2030,3416,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_NGA',2020,2630,'M€/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','CCUS_ELC_NGA',2050,1582,'M€/GW','ATB 2022');
-- Storage
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_CEN_BTT',2020,2466,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_CEN_BTT',2030,1210,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_CEN_BTT',2050,908,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_DST_BTT',2020,2869,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_DST_BTT',2030,1337,'M$/GW','ATB 2022');
INSERT INTO "CostInvest" VALUES ('IT','STG_ELC_DST_BTT',2050,1002,'M$/GW','ATB 2022');
-- Distrib and demand
INSERT INTO "CostInvest" VALUES ('IT','DISTR_ELC',2025,20,'M€/GW','Assumption');


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
-- Electricity sector
-- Fuel technologies
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_FT_H2',2020,1.57,'M€/PJ','');
-- Base year technologies
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_COA_COND_E',2006,32.32,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_COA_OIL_E',2006,30.42,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_DERGAS_CC_E',2006,37.89,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_NGA_CC_E',2006,13.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_NGA_OIL_E',2006,17.86,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_NGA_STM_REP_E',2006,15.40,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_NGA_TURB_E',2006,26.24,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_NGA_MIN_E',2006,17.98,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_DST_TURB_E',2006,22.19,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_OIL_STM_E',2006,42.61,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_BGS_E',2006,12.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_BIO_CEN_E',2006,12.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_BIO_DST_E',2006,12.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_GEO_E',2006,94.03,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_SOL_E',2006,30.80,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_WIN_E',2006,34.00,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_HYD_FLO_E',2006,33.65,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_HYD_FLO_L10MW_E',2006,33.65,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_HYD_RES_E',2006,13.29,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_GASDER_CC_E',2006,22.42,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_HHC_CC_E',2006,29.14,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_NGA_CC_E',2006,20.11,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_NGA_TURB_CEN_E',2006,32.85,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_NGA_TURB_DST_E',2006,32.85,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_NGA_STM_COND_E',2006,34.27,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_OIL_STM_COND_CEN_E',2006,23.71,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_OIL_STM_COND_DST_E',2006,43.60,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_BMU_E',2006,220.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_BGS_COG_E',2006,220.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_COA_IGCC_E',2006,220.50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2006,'ELC_CHP_BIO_CEN_E',2006,220.50,'M€/GW','');
-- Planned technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_COA_STM_P',2007,32.04,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_NGA_CC_P',2007,12.91,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_CHP_NGA_CC_P',2007,21.45,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_P',2007,23.10,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_WIN_P',2007,34.00,'M€/GW','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_NGA_CT_N',2007,21.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_NGA_CC_N',2007,28.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_COA_STM_N',2007,74.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_OIL_STM_N',2007,74.00,'M$/GW','Assumption');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_BLQ_N',2007,150.85,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_BIO_5C_N',2007,150.85,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_BIO_12C_N',2007,150.85,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_BGS_AGR_N',2007,75.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2014,'ELC_BGS_AGR_N',2014,66.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2022,'ELC_BGS_AGR_N',2022,55.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_BGS_AGR_N',2030,45.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2040,'ELC_BGS_AGR_N',2040,40.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_HYD_MICRO_N',2007,78.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2008,'ELC_HYD_MINI_N',2008,33.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_GEO_HENT_N',2007,86.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2014,'ELC_GEO_HENT_N',2014,84.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2022,'ELC_GEO_HENT_N',2022,75.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_GEO_HENT_N',2030,71.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2040,'ELC_GEO_HENT_N',2040,60.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_GEO_LENT_N',2007,86.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2014,'ELC_GEO_LENT_N',2014,84.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2022,'ELC_GEO_LENT_N',2022,75.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_GEO_LENT_N',2030,71.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2040,'ELC_GEO_LENT_N',2040,60.00,'M€/GW','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_WIN_N',2007,49.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_WIN_N',2020,43.00,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_WIN_N',2030,38.95,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_WIN_N',2050,33.11,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_WIN_OFF_N',2007,111.34,'M$/GW','Assumption');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_WIN_OFF_N',2020,111.34,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_WIN_OFF_N',2030,86.19,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_WIN_OFF_N',2050,70.21,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_WIN_OFF_DEEP_N',2030,68.89,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_WIN_OFF_DEEP_N',2050,57.15,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_GRO_ITC_N',2007,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_GRO_ITC_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_GRO_ITC_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_GRO_ITC_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_GRO_ITF_N',2007,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_GRO_ITF_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_GRO_ITF_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_GRO_ITF_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_GRO_ITG_N',2007,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_GRO_ITG_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_GRO_ITG_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_GRO_ITG_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_GRO_ITH_N',2007,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_GRO_ITH_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_GRO_ITH_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_GRO_ITH_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_GRO_ITI_N',2007,43.24,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_GRO_ITI_N',2020,22.62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_GRO_ITI_N',2030,15.22,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_GRO_ITI_N',2050,13.25,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_ROOF_ITC_N',2007,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_ROOF_ITC_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_ROOF_ITC_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_ROOF_ITC_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_ROOF_ITF_N',2007,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_ROOF_ITF_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_ROOF_ITF_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_ROOF_ITF_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_ROOF_ITG_N',2007,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_ROOF_ITG_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_ROOF_ITG_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_ROOF_ITG_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_ROOF_ITH_N',2007,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_ROOF_ITH_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_ROOF_ITH_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_ROOF_ITH_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2007,'ELC_PV_ROOF_ITI_N',2007,48.08,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'ELC_PV_ROOF_ITI_N',2020,24.04,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'ELC_PV_ROOF_ITI_N',2030,12.44,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'ELC_PV_ROOF_ITI_N',2050,10.35,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2035,'ELC_NUC_LWR_N',2035,154,'M$/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2035,'ELC_NUC_SMR_N',2035,154,'M$/GW','');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_NGA_N',2007,2.4,'M€/PJ','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_OIL_N',2007,2.5,'M€/PJ','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_BIO_N',2007,2.8,'M€/PJ','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_COA_N',2007,2.8,'M€/PJ','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_GEO_N',2007,2.5,'M€/PJ','TIMES-Italy');
INSERT INTO "CostFixed" VALUES ('IT',2007,'HET_GEO_SHA_N',2007,2.5,'M€/PJ','TIMES-Italy');
-- CCUS
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_COA',2020,125,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2035,'CCUS_ELC_COA',2035,108,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'CCUS_ELC_NGA',2020,67,'M€/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2035,'CCUS_ELC_NGA',2035,60,'M€/GW','ATB 2022');
-- Storage
INSERT INTO "CostFixed" VALUES ('IT',2006,'STG_ELC_HYD_PUM_E',2006,17.82,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'STG_ELC_CEN_BTT',2020,62,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'STG_ELC_CEN_BTT',2030,30,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'STG_ELC_CEN_BTT',2050,23,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2020,'STG_ELC_DST_BTT',2020,72,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2030,'STG_ELC_DST_BTT',2030,33,'M$/GW','ATB 2022');
INSERT INTO "CostFixed" VALUES ('IT',2050,'STG_ELC_DST_BTT',2050,25,'M$/GW','ATB 2022');
--Distrib and demand
INSERT INTO "CostFixed" VALUES ('IT',2025,'DISTR_ELC',2025,0.02*20,'M€/GW','Assumption');

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
INSERT INTO "Currency" VALUES ('USD01',1.55,'');
INSERT INTO "Currency" VALUES ('USD02',1.43,'');
INSERT INTO "Currency" VALUES ('USD03',1.07,'');
INSERT INTO "Currency" VALUES ('USD04',1.03,'');
INSERT INTO "Currency" VALUES ('USD05',0.93,'');
INSERT INTO "Currency" VALUES ('USD06',0.98,'');
INSERT INTO "Currency" VALUES ('USD07',0.88,'');
INSERT INTO "Currency" VALUES ('USD08',0.79,'');
INSERT INTO "Currency" VALUES ('USD09',0.83,'');
INSERT INTO "Currency" VALUES ('USD10',0.85,'');
INSERT INTO "Currency" VALUES ('USD11',0.80,'');
INSERT INTO "Currency" VALUES ('USD12',0.83,'');
INSERT INTO "Currency" VALUES ('USD13',0.80,'');
INSERT INTO "Currency" VALUES ('USD14',0.80,'');
INSERT INTO "Currency" VALUES ('USD15',0.95,'');
INSERT INTO "Currency" VALUES ('USD16',0.95,'');
INSERT INTO "Currency" VALUES ('USD17',0.92,'');
INSERT INTO "Currency" VALUES ('USD18',0.87,'');
INSERT INTO "Currency" VALUES ('USD19',0.90,'');
INSERT INTO "Currency" VALUES ('USD20',0.88,'');
INSERT INTO "Currency" VALUES ('USD21',0.82,'');
INSERT INTO "Currency" VALUES ('USD22',0.86,'');

CREATE TABLE "CurrencyTech" (
	"tech"	text,
	"curr"	text,
	PRIMARY KEY("tech","curr")
);
-- Upstream
INSERT INTO "CurrencyTech" VALUES ('UPS_IMP_ELC_CEN','EUR20');
INSERT INTO "CurrencyTech" VALUES ('UPS_IMP_NUC','USD22');
-- Export
INSERT INTO "CurrencyTech" VALUES ('UPS_EXP_ELC_CEN','EUR20');
-- Micro-CHP
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_SLB_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_H2_PEMFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TG_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TV_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_BLQ_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_STR_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_H2_PEMFC_N','EUR20');
-- Electricity sector
INSERT INTO "CurrencyTech" VALUES ('ELC_FT_H2','EUR12');
INSERT INTO "CurrencyTech" VALUES ('ELC_COA_COND_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_COA_OIL_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_DERGAS_CC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_CC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_OIL_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_STM_REP_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_TURB_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_MIN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_DST_TURB_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_OIL_STM_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_BGS_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_BIO_CEN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_BIO_DST_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_GEO_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_SOL_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_FLO_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_FLO_L10MW_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_RES_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_GASDER_CC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_HHC_CC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_CC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_TURB_CEN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_TURB_DST_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_STM_COND_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_OIL_STM_COND_CEN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_OIL_STM_COND_DST_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_BMU_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_BGS_COG_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_COA_IGCC_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_BIO_CEN_E','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_H2_PEMFC_N','EUR13');
INSERT INTO "CurrencyTech" VALUES ('ELC_NUC_LWR_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_NUC_SMR_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_COA_STM_P','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_CC_P','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_CC_P','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_TURB_P','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_P','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_CT_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_NGA_CC_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_COA_STM_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_OIL_STM_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_BLQ_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_BIO_5C_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_BIO_12C_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_BGS_AGR_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_BGS_LAN_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_HYD_MINI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_GEO_HENT_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_GEO_LENT_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_OFF_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_WIN_OFF_DEEP_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_GRO_ITC_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_GRO_ITF_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_GRO_ITG_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_GRO_ITH_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_GRO_ITI_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_ROOF_ITC_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_ROOF_ITF_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_ROOF_ITG_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_ROOF_ITH_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_PV_ROOF_ITI_N','USD20');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_BMU_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_TURB_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_CP_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('ELC_CHP_NGA_TAP_N','EUR09');
-- CCUS
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_COA','USD20');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_NGA','USD20');
-- Storage
INSERT INTO "CurrencyTech" VALUES ('STG_ELC_HYD_PUM_E','USD20');
INSERT INTO "CurrencyTech" VALUES ('STG_ELC_CEN_BTT','USD20');
INSERT INTO "CurrencyTech" VALUES ('STG_ELC_DST_BTT','USD20');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Upstream sector
-- Import/export prices
INSERT INTO "CapacityToActivity" VALUES ('IT','UPS_IMP_ELC_CEN',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','UPS_EXP_ELC_CEN',31.536,'PJ/GW');
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_SLB_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_H2_PEMFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TG_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TV_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_BLQ_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_STR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_H2_PEMFC_N',31.536,'PJ/GW');
-- Electricity sector
-- Base year technologies
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_COA_COND_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_COA_OIL_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_DERGAS_CC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_CC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_OIL_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_STM_REP_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_TURB_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_MIN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_DST_TURB_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_OIL_STM_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BGS_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BIO_CEN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BIO_DST_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_GEO_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_SOL_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_FLO_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_FLO_L10MW_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_RES_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_GASDER_CC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_HHC_CC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_CC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_TURB_CEN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_TURB_DST_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_STM_COND_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_OIL_STM_COND_CEN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_OIL_STM_COND_DST_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_BMU_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_BGS_COG_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_COA_IGCC_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_BIO_CEN_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','HET_NGA_E',1.00,'PJ/PJ');
INSERT INTO "CapacityToActivity" VALUES ('IT','HET_GEO_E',1.00,'PJ/PJ');
-- Planned plants
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_COA_STM_P',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_CC_P',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_CC_P',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_TURB_P',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_P',31.536,'PJ/GW');
-- New technologies
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_CT_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_COA_STM_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_OIL_STM_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BLQ_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BIO_5C_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BIO_12C_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BGS_AGR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_BGS_LAN_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_HYD_MINI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_GEO_HENT_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_GEO_LENT_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_OFF_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_WIN_OFF_DEEP_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_GRO_ITC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_GRO_ITF_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_GRO_ITG_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_GRO_ITH_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_GRO_ITI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_ROOF_ITC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_ROOF_ITF_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_ROOF_ITG_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_ROOF_ITH_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_PV_ROOF_ITI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_H2_PEMFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NUC_LWR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_NUC_SMR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_BMU_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_TURB_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_CP_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','ELC_CHP_NGA_TAP_N',31.536,'PJ/GW');
-- CCUS
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_COA',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','CCUS_ELC_NGA',31.536,'PJ/GW');
-- Storage
INSERT INTO "CapacityToActivity" VALUES ('IT','STG_ELC_HYD_PUM_E',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','STG_ELC_CEN_BTT',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','STG_ELC_DST_BTT',31.536,'PJ/GW');
-- Distrib and demand
INSERT INTO "CapacityToActivity" VALUES ('IT','DISTR_ELC',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','END_USES_ELC',31.536,'PJ/GW');

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
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_SLB_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CC_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_H2_PEMFC_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_CI_N',2007,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TG_N',2007,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TV_N',2007,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_BLQ_CI_N',2014,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CC_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_STR_N',2022,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_H2_PEMFC_N',2020,0.90,'');
-- Electricity sector
-- Fuel technologies
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_FT_H2',2020,0.75,'');
-- Base year technologies
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_COND_E',2006,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_OIL_E',2006,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_DERGAS_CC_E',2006,0.38,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_E',2006,0.55,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_OIL_E',2006,0.16,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_STM_REP_E',2006,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_TURB_E',2006,0.03,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_MIN_E',2006,0.11,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_DST_TURB_E',2006,0.03,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_OIL_STM_E',2006,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_E',2006,0.51,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_CEN_E',2006,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_DST_E',2006,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_E',2006,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_GASDER_CC_E',2006,0.69,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_HHC_CC_E',2006,0.84,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_E',2006,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_CEN_E',2006,0.61,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_DST_E',2006,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_STM_COND_E',2006,0.55,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_OIL_STM_COND_CEN_E',2006,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_OIL_STM_COND_DST_E',2006,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_E',2006,0.44,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BGS_COG_E',2006,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_COA_IGCC_E',2006,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BIO_CEN_E',2006,0.61,'');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_NGA_E',2006,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_GEO_E',2006,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_E',2010,0.55,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_OIL_E',2010,0.16,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_STM_REP_E',2010,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_TURB_E',2010,0.03,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_DST_TURB_E',2010,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_OIL_STM_E',2010,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_E',2010,0.51,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_CEN_E',2010,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_DST_E',2010,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_GASDER_CC_E',2010,0.69,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_HHC_CC_E',2010,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_E',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_CEN_E',2010,0.61,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_OIL_STM_COND_DST_E',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_COND_E',2020,0.75,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_OIL_E',2020,0.72,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_DERGAS_CC_E',2020,0.83,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_E',2020,0.89,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_OIL_E',2020,0.83,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_STM_REP_E',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_TURB_E',2020,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_MIN_E',2020,0.66,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_DST_TURB_E',2020,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_OIL_STM_E',2020,0.87,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_E',2020,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_CEN_E',2020,0.68,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_DST_E',2020,0.68,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_E',2020,0.83,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_GASDER_CC_E',2020,0.79,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_HHC_CC_E',2020,0.86,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_E',2020,0.77,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_CEN_E',2020,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_DST_E',2020,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_STM_COND_E',2020,0.59,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_OIL_STM_COND_CEN_E',2020,0.62,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_OIL_STM_COND_DST_E',2020,0.56,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_E',2020,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BGS_COG_E',2020,0.57,'');
-- Planned technologies
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_STM_P',2007,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_P',2007,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_P',2007,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_P',2007,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_STM_P',2030,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_P',2030,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_P',2030,0.72,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_P',2030,0.62,'');
-- New technologies
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CT_N',2007,0.95,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NGA_CC_N',2007,0.90,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_COA_STM_N',2007,0.76,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_OIL_STM_N',2007,0.85,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BLQ_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_5C_N',2007,0.57,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BIO_12C_N',2007,0.57,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_AGR_N',2007,0.58,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_AGR_N',2022,0.65,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_LAN_N',2007,0.49,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_BGS_LAN_N',2030,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_HENT_N',2007,0.86,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_LENT_N',2007,0.88,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_GEO_LENT_N',2040,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_H2_PEMFC_N',2022,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NUC_LWR_N',2035,0.94,'ATB 2022');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_NUC_SMR_N',2035,0.94,'ATB 2022');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TURB_N',2007,0.57,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CC_N',2007,0.34,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_CP_N',2007,0.74,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_NGA_TAP_N',2007,0.74,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_N',2014,0.74,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_N',2022,0.78,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','ELC_CHP_BMU_N',2030,0.80,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_NGA_N',2007,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_OIL_N',2007,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_BIO_N',2007,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_COA_N',2007,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_GEO_N',2007,0.60,'TIMES-Italy');
INSERT INTO "CapacityFactor" VALUES ('IT','HET_GEO_SHA_N',2007,0.60,'TIMES-Italy');
-- CCUS
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_COA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('IT','CCUS_ELC_NGA',2020,0.90,'Assumption');
-- Storage
INSERT INTO "CapacityFactor" VALUES ('IT','STG_ELC_HYD_PUM_E',2006,0.11,'TIMES-Italy');

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
-- Electricity sector
-- Base year technologies
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_SOL_E',0.167,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_SOL_E',0.391,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_SOL_E',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_SOL_E',0.297,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_SOL_E',0.496,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_SOL_E',0.136,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_SOL_E',0.307,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_SOL_E',0.539,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_SOL_E',0.144,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_SOL_E',0.159,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_SOL_E',0.330,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_SOL_E',0.052,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_E',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_E',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_E',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_E',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_E',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_E',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_E',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_E',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_E',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_E',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_E',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_E',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_E',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_E',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_E',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_FLO_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_FLO_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_FLO_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_FLO_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_FLO_L10MW_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_FLO_L10MW_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_FLO_L10MW_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_FLO_L10MW_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_RES_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_RES_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_RES_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_RES_E',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_RES_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_RES_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_RES_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_RES_E',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_RES_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_RES_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_RES_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_RES_E',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_RES_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_RES_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_RES_E',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_RES_E',0.201,'');
-- Planned technologies
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_P',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_P',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_P',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_P',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_P',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_P',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_P',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_P',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_P',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_P',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_P',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_P',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_P',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_P',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_P',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_P',0.200,'');
-- New technologies
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_MICRO_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_MICRO_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_MICRO_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_MICRO_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_HYD_MINI_N',0.190,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_HYD_MINI_N',0.289,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_HYD_MINI_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_HYD_MINI_N',0.201,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_N',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_N',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_N',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_N',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_N',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_N',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_N',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_N',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_N',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_N',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_OFF_N',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_OFF_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_OFF_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_OFF_N',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_OFF_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_OFF_N',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_OFF_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_OFF_N',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_OFF_N',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_OFF_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_OFF_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_OFF_N',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_OFF_N',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_OFF_N',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_OFF_N',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_OFF_N',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_WIN_OFF_DEEP_N',0.226,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_WIN_OFF_DEEP_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_WIN_OFF_DEEP_N',0.257,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_WIN_OFF_DEEP_N',0.227,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_WIN_OFF_DEEP_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_WIN_OFF_DEEP_N',0.132,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_WIN_OFF_DEEP_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_WIN_OFF_DEEP_N',0.147,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_WIN_OFF_DEEP_N',0.087,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_WIN_OFF_DEEP_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_WIN_OFF_DEEP_N',0.123,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_WIN_OFF_DEEP_N',0.117,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_WIN_OFF_DEEP_N',0.203,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_WIN_OFF_DEEP_N',0.206,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_WIN_OFF_DEEP_N',0.224,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_WIN_OFF_DEEP_N',0.200,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_GRO_ITC_N',0.168,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_GRO_ITC_N',0.452,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_GRO_ITC_N',0.120,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_GRO_ITC_N',0.302,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_GRO_ITC_N',0.546,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_GRO_ITC_N',0.177,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_GRO_ITC_N',0.307,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_GRO_ITC_N',0.589,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_GRO_ITC_N',0.185,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_GRO_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_GRO_ITC_N',0.148,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_GRO_ITC_N',0.363,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_GRO_ITC_N',0.070,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_GRO_ITF_N',0.225,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_GRO_ITF_N',0.455,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_GRO_ITF_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_GRO_ITF_N',0.384,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_GRO_ITF_N',0.586,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_GRO_ITF_N',0.149,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_GRO_ITF_N',0.392,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_GRO_ITF_N',0.623,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_GRO_ITF_N',0.154,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_GRO_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_GRO_ITF_N',0.225,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_GRO_ITF_N',0.400,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_GRO_ITF_N',0.058,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_GRO_ITG_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_GRO_ITG_N',0.502,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_GRO_ITG_N',0.120,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_GRO_ITG_N',0.369,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_GRO_ITG_N',0.642,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_GRO_ITG_N',0.181,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_GRO_ITG_N',0.373,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_GRO_ITG_N',0.671,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_GRO_ITG_N',0.186,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_GRO_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_GRO_ITG_N',0.229,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_GRO_ITG_N',0.448,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_GRO_ITG_N',0.079,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_GRO_ITH_N',0.180,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_GRO_ITH_N',0.443,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_GRO_ITH_N',0.104,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_GRO_ITH_N',0.324,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_GRO_ITH_N',0.545,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_GRO_ITH_N',0.163,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_GRO_ITH_N',0.329,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_GRO_ITH_N',0.585,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_GRO_ITH_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_GRO_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_GRO_ITH_N',0.159,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_GRO_ITH_N',0.353,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_GRO_ITH_N',0.060,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_GRO_ITI_N',0.202,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_GRO_ITI_N',0.459,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_GRO_ITI_N',0.106,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_GRO_ITI_N',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_GRO_ITI_N',0.571,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_GRO_ITI_N',0.163,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_GRO_ITI_N',0.361,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_GRO_ITI_N',0.623,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_GRO_ITI_N',0.173,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_GRO_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_GRO_ITI_N',0.192,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_GRO_ITI_N',0.391,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_GRO_ITI_N',0.065,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_ROOF_ITC_N',0.168,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_ROOF_ITC_N',0.452,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_ROOF_ITC_N',0.120,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_ROOF_ITC_N',0.302,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_ROOF_ITC_N',0.546,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_ROOF_ITC_N',0.177,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_ROOF_ITC_N',0.307,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_ROOF_ITC_N',0.589,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_ROOF_ITC_N',0.185,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_ROOF_ITC_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_ROOF_ITC_N',0.148,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_ROOF_ITC_N',0.363,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_ROOF_ITC_N',0.070,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_ROOF_ITF_N',0.225,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_ROOF_ITF_N',0.455,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_ROOF_ITF_N',0.092,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_ROOF_ITF_N',0.384,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_ROOF_ITF_N',0.586,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_ROOF_ITF_N',0.149,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_ROOF_ITF_N',0.392,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_ROOF_ITF_N',0.623,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_ROOF_ITF_N',0.154,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_ROOF_ITF_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_ROOF_ITF_N',0.225,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_ROOF_ITF_N',0.400,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_ROOF_ITF_N',0.058,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_ROOF_ITG_N',0.228,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_ROOF_ITG_N',0.502,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_ROOF_ITG_N',0.120,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_ROOF_ITG_N',0.369,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_ROOF_ITG_N',0.642,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_ROOF_ITG_N',0.181,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_ROOF_ITG_N',0.373,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_ROOF_ITG_N',0.671,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_ROOF_ITG_N',0.186,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_ROOF_ITG_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_ROOF_ITG_N',0.229,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_ROOF_ITG_N',0.448,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_ROOF_ITG_N',0.079,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_ROOF_ITH_N',0.180,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_ROOF_ITH_N',0.443,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_ROOF_ITH_N',0.104,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_ROOF_ITH_N',0.324,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_ROOF_ITH_N',0.545,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_ROOF_ITH_N',0.163,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_ROOF_ITH_N',0.329,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_ROOF_ITH_N',0.585,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_ROOF_ITH_N',0.170,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_ROOF_ITH_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_ROOF_ITH_N',0.159,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_ROOF_ITH_N',0.353,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_ROOF_ITH_N',0.060,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','morning','ELC_PV_ROOF_ITI_N',0.202,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','noon','ELC_PV_ROOF_ITI_N',0.459,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','winter','afternoon','ELC_PV_ROOF_ITI_N',0.106,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','morning','ELC_PV_ROOF_ITI_N',0.351,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','noon','ELC_PV_ROOF_ITI_N',0.571,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','spring','afternoon','ELC_PV_ROOF_ITI_N',0.163,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','morning','ELC_PV_ROOF_ITI_N',0.361,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','noon','ELC_PV_ROOF_ITI_N',0.623,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','summer','afternoon','ELC_PV_ROOF_ITI_N',0.173,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','night','ELC_PV_ROOF_ITI_N',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','morning','ELC_PV_ROOF_ITI_N',0.192,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','noon','ELC_PV_ROOF_ITI_N',0.391,'');
INSERT INTO "CapacityFactorTech" VALUES ('IT','fall','afternoon','ELC_PV_ROOF_ITI_N',0.065,'');

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
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N',2020,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N',2025,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N',2022,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N',2020,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N',2020,0.20,'Assumption');
-- Electricity sector
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_SOL_E',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_WIN_E',2007,0.25,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_HYD_FLO_E',2007,0.50,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_HYD_FLO_L10MW_E',2007,0.50,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_BGS_AGR_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_BGS_LAN_N',2007,0.50,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_HYD_MICRO_N',2007,0.30,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2008,'ELC_HYD_MINI_N',2008,0.30,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_WIN_N',2007,0.25,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_WIN_OFF_N',2007,0.30,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2030,'ELC_WIN_OFF_DEEP_N',2030,0.35,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_GRO_ITC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_GRO_ITF_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_GRO_ITG_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_GRO_ITH_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_GRO_ITI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_ROOF_ITC_N',2007,0.15,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_ROOF_ITF_N',2007,0.15,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_ROOF_ITG_N',2007,0.15,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_ROOF_ITH_N',2007,0.15,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_PV_ROOF_ITI_N',2007,0.15,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2035,'ELC_NUC_LWR_N',2035,1.00,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2035,'ELC_NUC_SMR_N',2035,1.00,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_CHP_BMU_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_CHP_NGA_TURB_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_CHP_NGA_CC_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_CHP_NGA_CP_N',2007,0.70,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'ELC_CHP_NGA_TAP_N',2007,0.70,'TIMES-Italy');
-- Storage
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'STG_ELC_CEN_BTT',2020,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'STG_ELC_DST_BTT',2020,0.70,'Assumption');

CREATE TABLE "MaxMaterialReserve" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);

CREATE TABLE "MaterialIntensity" (
	"regions"	text,
	"comm_name" text,
	"tech"	text,
	"vintage"	integer,
	"mat_int"	real,
	"mat_int_units"	text,
	"mat_int_notes"	text,
	PRIMARY KEY("regions","tech","comm_name","vintage"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Electricity sector
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_DERGAS_CC_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_DERGAS_CC_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_DERGAS_CC_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_CC_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_CC_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_CC_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_OIL_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_OIL_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_OIL_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_STM_REP_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_STM_REP_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_STM_REP_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_TURB_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_TURB_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_TURB_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_MIN_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_MIN_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_MIN_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_DST_TURB_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_DST_TURB_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_DST_TURB_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_OIL_STM_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_OIL_STM_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_OIL_STM_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_GASDER_CC_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_GASDER_CC_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_GASDER_CC_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_HHC_CC_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_HHC_CC_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_HHC_CC_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_CC_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_CC_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_CC_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_TURB_CEN_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_TURB_CEN_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_TURB_CEN_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_TURB_DST_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_TURB_DST_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_TURB_DST_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_STM_COND_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_STM_COND_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_STM_COND_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_OIL_STM_COND_CEN_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_OIL_STM_COND_CEN_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_OIL_STM_COND_CEN_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_OIL_STM_COND_DST_E',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_OIL_STM_COND_DST_E',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_OIL_STM_COND_DST_E',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_CC_P',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_CC_P',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_CC_P',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_CC_P',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_CC_P',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_CC_P',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_TURB_P',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_TURB_P',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_TURB_P',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_CT_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_CT_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_CT_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NGA_CC_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NGA_CC_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NGA_CC_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_OIL_STM_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_OIL_STM_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_OIL_STM_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_TURB_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_TURB_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_TURB_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_CC_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_CC_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_CC_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_CP_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_CP_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_CP_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_NGA_TAP_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_NGA_TAP_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_NGA_TAP_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_COA_COND_E',2007,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_COA_COND_E',2007,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_COA_COND_E',2007,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_COA_COND_E',2007,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_COA_COND_E',2007,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_COA_OIL_E',2007,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_COA_OIL_E',2007,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_COA_OIL_E',2007,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_COA_OIL_E',2007,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_COA_OIL_E',2007,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_CHP_COA_IGCC_E',2007,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_CHP_COA_IGCC_E',2007,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_COA_IGCC_E',2007,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_CHP_COA_IGCC_E',2007,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_CHP_COA_IGCC_E',2007,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_COA_STM_P',2007,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_COA_STM_P',2007,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_COA_STM_P',2007,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_COA_STM_P',2007,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_COA_STM_P',2007,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_COA_STM_N',2007,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_COA_STM_N',2007,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_COA_STM_N',2007,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_COA_STM_N',2007,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_COA_STM_N',2007,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BGS_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BGS_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BIO_CEN_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BIO_CEN_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BIO_DST_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BIO_DST_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_BMU_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_CHP_BMU_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_BGS_COG_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_CHP_BGS_COG_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_BIO_CEN_E',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_CHP_BIO_CEN_E',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BLQ_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BLQ_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BIO_5C_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BIO_5C_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BIO_12C_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BIO_12C_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BGS_AGR_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BGS_AGR_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_BGS_LAN_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_BGS_LAN_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_CHP_BMU_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_CHP_BMU_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_NUC_LWR_N',2035,7.64E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_NUC_LWR_N',2035,5.35E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','CER','ELC_NUC_LWR_N',2035,4.05E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NUC_LWR_N',2035,4.59E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_NUC_LWR_N',2035,9.00E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NUC_LWR_N',2035,1.50E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_NUC_LWR_N',2035,2.12E-04,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','EUP','ELC_NUC_LWR_N',2035,1.63E-02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','FLU','ELC_NUC_LWR_N',2035,4.55E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAD','ELC_NUC_LWR_N',2035,5.69E-02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_NUC_LWR_N',2035,2.12E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','ELC_NUC_LWR_N',2035,9.58E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_NUC_LWR_N',2035,1.90E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','ELC_NUC_LWR_N',2035,1.87E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','LIT','ELC_NUC_LWR_N',2035,9.87E-05,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAG','ELC_NUC_LWR_N',2035,1.35E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_NUC_LWR_N',2035,6.18E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_NUC_LWR_N',2035,3.12E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_NUC_LWR_N',2035,1.50E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NUC_LWR_N',2035,3.42E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIO','ELC_NUC_LWR_N',2035,5.07E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PAL','ELC_NUC_LWR_N',2035,1.92E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PHO','ELC_NUC_LWR_N',2035,2.13E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PLA','ELC_NUC_LWR_N',2035,9.83E-04,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_NUC_LWR_N',2035,5.02E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_NUC_LWR_N',2035,4.88E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_NUC_LWR_N',2035,3.47E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TAN','ELC_NUC_LWR_N',2035,3.89E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_NUC_LWR_N',2035,6.42E-05,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_NUC_LWR_N',2035,6.01E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','ELC_NUC_LWR_N',2035,2.16E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','ELC_NUC_LWR_N',2035,1.19E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','ELC_NUC_LWR_N',2035,6.13E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_NUC_SMR_N',2035,7.64E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_NUC_SMR_N',2035,5.35E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','CER','ELC_NUC_SMR_N',2035,4.05E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_NUC_SMR_N',2035,4.59E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','ELC_NUC_SMR_N',2035,9.00E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_NUC_SMR_N',2035,1.50E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_NUC_SMR_N',2035,2.12E-04,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','EUP','ELC_NUC_SMR_N',2035,1.63E-02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','FLU','ELC_NUC_SMR_N',2035,4.55E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAD','ELC_NUC_SMR_N',2035,5.69E-02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_NUC_SMR_N',2035,2.12E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','ELC_NUC_SMR_N',2035,9.58E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_NUC_SMR_N',2035,1.90E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','ELC_NUC_SMR_N',2035,1.87E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','LIT','ELC_NUC_SMR_N',2035,9.87E-05,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAG','ELC_NUC_SMR_N',2035,1.35E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_NUC_SMR_N',2035,6.18E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_NUC_SMR_N',2035,3.12E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_NUC_SMR_N',2035,1.50E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_NUC_SMR_N',2035,3.42E+03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIO','ELC_NUC_SMR_N',2035,5.07E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PAL','ELC_NUC_SMR_N',2035,1.92E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PHO','ELC_NUC_SMR_N',2035,2.13E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PLA','ELC_NUC_SMR_N',2035,9.83E-04,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_NUC_SMR_N',2035,5.02E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_NUC_SMR_N',2035,4.88E+02,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_NUC_SMR_N',2035,3.47E-01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TAN','ELC_NUC_SMR_N',2035,3.89E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_NUC_SMR_N',2035,6.42E-05,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','ELC_NUC_SMR_N',2035,6.01E+01,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','ELC_NUC_SMR_N',2035,2.16E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','ELC_NUC_SMR_N',2035,1.19E-03,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','ELC_NUC_SMR_N',2035,6.13E+00,'t/GW','');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_HYD_FLO_E',2007,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_HYD_FLO_E',2007,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_HYD_FLO_E',2007,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_HYD_FLO_L10MW_E',2007,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_HYD_FLO_L10MW_E',2007,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_HYD_FLO_L10MW_E',2007,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_HYD_RES_E',2007,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_HYD_RES_E',2007,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_HYD_RES_E',2007,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_HYD_MICRO_N',2007,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_HYD_MICRO_N',2007,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_HYD_MICRO_N',2007,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_HYD_MINI_N',2008,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_HYD_MINI_N',2008,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_HYD_MINI_N',2008,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_GEO_E',2007,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_GEO_E',2007,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_GEO_HENT_N',2007,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_GEO_HENT_N',2007,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_GEO_LENT_N',2007,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_GEO_LENT_N',2007,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_WIN_E',2007,1.25E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_WIN_E',2007,9.40E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_WIN_E',2007,4.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_WIN_E',2007,1.80E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_WIN_E',2007,4.74E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_WIN_E',2007,7.84E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_WIN_E',2007,1.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_WIN_E',2007,4.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_WIN_E',2007,3.99E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_WIN_E',2007,5.84E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_WIN_E',2007,1.14E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_WIN_P',2007,1.25E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_WIN_P',2007,9.40E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_WIN_P',2007,4.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_WIN_P',2007,1.80E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_WIN_P',2007,4.74E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_WIN_P',2007,7.84E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_WIN_P',2007,1.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_WIN_P',2007,4.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_WIN_P',2007,3.99E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_WIN_P',2007,5.84E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_WIN_P',2007,1.14E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_WIN_N',2007,1.25E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_WIN_N',2007,9.40E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_WIN_N',2007,4.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_WIN_N',2007,1.80E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_WIN_N',2007,4.74E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_WIN_N',2007,7.84E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_WIN_N',2007,1.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_WIN_N',2007,4.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_WIN_N',2007,3.99E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_WIN_N',2007,5.84E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_WIN_N',2007,1.14E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_WIN_OFF_N',2007,6.65E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_WIN_OFF_N',2007,5.25E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_WIN_OFF_N',2007,5.33E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_WIN_OFF_N',2007,2.69E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_WIN_OFF_N',2007,1.54E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_WIN_OFF_N',2007,7.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_WIN_OFF_N',2007,1.11E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_WIN_OFF_N',2007,1.61E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_WIN_OFF_N',2007,2.70E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_WIN_OFF_N',2007,3.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_WIN_OFF_N',2007,6.10E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_WIN_OFF_DEEP_N',2030,6.65E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','BOR','ELC_WIN_OFF_DEEP_N',2030,5.25E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','ELC_WIN_OFF_DEEP_N',2030,5.33E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_WIN_OFF_DEEP_N',2030,2.69E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','DYS','ELC_WIN_OFF_DEEP_N',2030,1.54E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','ELC_WIN_OFF_DEEP_N',2030,7.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','ELC_WIN_OFF_DEEP_N',2030,1.11E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NEO','ELC_WIN_OFF_DEEP_N',2030,1.61E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','ELC_WIN_OFF_DEEP_N',2030,2.70E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PRA','ELC_WIN_OFF_DEEP_N',2030,3.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TER','ELC_WIN_OFF_DEEP_N',2030,6.10E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_SOL_E',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_SOL_E',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_SOL_E',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_SOL_E',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_SOL_E',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_SOL_E',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_GRO_ITC_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_GRO_ITC_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_GRO_ITC_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_GRO_ITC_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_GRO_ITC_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_GRO_ITC_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_GRO_ITF_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_GRO_ITF_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_GRO_ITF_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_GRO_ITF_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_GRO_ITF_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_GRO_ITF_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_GRO_ITG_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_GRO_ITG_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_GRO_ITG_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_GRO_ITG_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_GRO_ITG_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_GRO_ITG_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_GRO_ITH_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_GRO_ITH_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_GRO_ITH_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_GRO_ITH_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_GRO_ITH_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_GRO_ITH_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_GRO_ITI_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_GRO_ITI_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_GRO_ITI_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_GRO_ITI_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_GRO_ITI_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_GRO_ITI_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_ROOF_ITC_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_ROOF_ITC_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_ROOF_ITC_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_ROOF_ITC_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_ROOF_ITC_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_ROOF_ITC_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_ROOF_ITF_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_ROOF_ITF_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_ROOF_ITF_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_ROOF_ITF_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_ROOF_ITF_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_ROOF_ITF_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_ROOF_ITG_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_ROOF_ITG_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_ROOF_ITG_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_ROOF_ITG_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_ROOF_ITG_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_ROOF_ITG_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_ROOF_ITH_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_ROOF_ITH_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_ROOF_ITH_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_ROOF_ITH_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_ROOF_ITH_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_ROOF_ITH_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','ELC_PV_ROOF_ITI_N',2007,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','ELC_PV_ROOF_ITI_N',2007,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GAL','ELC_PV_ROOF_ITI_N',2007,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','IND','ELC_PV_ROOF_ITI_N',2007,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIL','ELC_PV_ROOF_ITI_N',2007,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','SIV','ELC_PV_ROOF_ITI_N',2007,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
-- Commercial
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','COM_CHP_NGA_CI_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','COM_CHP_NGA_CI_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','COM_CHP_NGA_CI_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','COM_CHP_NGA_MICRO_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','COM_CHP_NGA_MICRO_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','COM_CHP_NGA_MICRO_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','COM_CHP_NGA_CC_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','COM_CHP_NGA_CC_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','COM_CHP_NGA_CC_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','COM_CHP_SLB_CI_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','COM_CHP_SLB_CI_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','COM_CHP_NGA_SOFC_N',2020,6.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','COM_CHP_NGA_SOFC_N',2020,1.00E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','COM_CHP_NGA_SOFC_N',2020,1.28E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','COM_CHP_NGA_SOFC_N',2020,1.79E+00,'t/GW','10.1016/j.mtener.2025.101805');
-- Industrial
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_CI_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_CI_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_CI_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_TG_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_TG_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_TG_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_TV_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_TV_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_TV_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_BLQ_CI_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','IND_CHP_BLQ_CI_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
-- Residential
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_CI_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_CI_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_CI_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_MICRO_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_MICRO_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_MICRO_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_CC_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_CC_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_CC_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_STR_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_STR_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_STR_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_SOFC_N',2020,6.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','RES_CHP_NGA_SOFC_N',2020,1.00E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','RES_CHP_NGA_SOFC_N',2020,1.28E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','RES_CHP_NGA_SOFC_N',2020,1.79E+00,'t/GW','10.1016/j.mtener.2025.101805');
-- Storage
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','STG_ELC_CEN_BTT',2020,1.35E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','STG_ELC_CEN_BTT',2020,6.22E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','STG_ELC_CEN_BTT',2020,5.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','FLU','STG_ELC_CEN_BTT',2020,2.31E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','STG_ELC_CEN_BTT',2020,7.31E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','LIT','STG_ELC_CEN_BTT',2020,8.68E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','STG_ELC_CEN_BTT',2020,7.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','STG_ELC_CEN_BTT',2020,2.00E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PHO','STG_ELC_CEN_BTT',2020,4.14E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ALU','STG_ELC_DST_BTT',2020,1.35E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','STG_ELC_DST_BTT',2020,6.22E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','STG_ELC_DST_BTT',2020,5.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','FLU','STG_ELC_DST_BTT',2020,2.31E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','STG_ELC_DST_BTT',2020,7.31E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','LIT','STG_ELC_DST_BTT',2020,8.68E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','STG_ELC_DST_BTT',2020,7.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','STG_ELC_DST_BTT',2020,2.00E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','PHO','STG_ELC_DST_BTT',2020,4.14E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','COP','STG_ELC_CEN_VRFB',2020,2.23E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','STG_ELC_CEN_VRFB',2020,1.98E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','STG_ELC_CEN_VRFB',2020,2.03E+04,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','COP','STG_ELC_DST_VRFB',2020,2.23E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','GRA','STG_ELC_DST_VRFB',2020,1.98E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','STG_ELC_DST_VRFB',2020,2.03E+04,'t/GW','10.1016/j.mtener.2025.101805');
-- Hydrogen
--INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','H2_EL_ALK',2020,3.94,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','H2_EL_ALK',2020,0.49,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','IRI','H2_EL_PEM',2020,0.000353,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','PAL','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','PLA','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','H2_EL_SOEC',2020,0.6,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','H2_EL_SOEC',2020,0.16,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','H2_EL_SOEC',2020,0.09,'t/PJ','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','H2_EL_SOEC',2020,0.01,'t/PJ','10.1016/j.mtener.2025.101805');
-- CCUS
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','CCUS_ELC_COA',2020,3.26E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','CCUS_ELC_COA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','CCUS_ELC_COA',2020,6.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','CCUS_ELC_COA',2020,3.76E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','CCUS_ELC_COA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','CCUS_ELC_COA',2020,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIO','CCUS_ELC_COA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','CCUS_ELC_COA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','CCUS_ELC_NGA',2020,3.26E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COB','CCUS_ELC_NGA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','CCUS_ELC_NGA',2020,6.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MAN','CCUS_ELC_NGA',2020,3.76E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','MOL','CCUS_ELC_NGA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','CCUS_ELC_NGA',2020,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIO','CCUS_ELC_NGA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','VAN','CCUS_ELC_NGA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');

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
CREATE TABLE "Output_VMat_Cons" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"material_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"vmat_cons"	real,
	PRIMARY KEY("regions","scenario","material_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("material_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_MaterialSupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"materialSR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_EnergySupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"energySR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalCosts" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_costs"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalEmissions" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_VSlack" (
	"scenario"	text,
	"moo_f"		text,
	"slack"		real,
	PRIMARY KEY("scenario","moo_f")
);
COMMIT;