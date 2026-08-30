BEGIN TRANSACTION;

CREATE TABLE commodity_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "commodity_type" VALUES('p','physical commodity');
INSERT INTO "commodity_type" VALUES('e','emissions commodity');
INSERT INTO "commodity_type" VALUES('d','demand commodity');
INSERT INTO "commodity_type" VALUES('w','waste commodity');
INSERT INTO "commodity_type" VALUES('wa','waste annual commodity');
INSERT INTO "commodity_type" VALUES('wp','waste physical commodity');
INSERT INTO "commodity_type" VALUES('a','annual commodity');
INSERT INTO "commodity_type" VALUES('s','source commodity');

CREATE TABLE commodity (
    name        TEXT PRIMARY KEY,
    flag        TEXT REFERENCES commodity_type(label),
    description TEXT,
    units       TEXT
);
INSERT INTO "commodity" VALUES('IND_CH','d','Chemicals','Mt');
INSERT INTO "commodity" VALUES('IND_IS','d','Iron and steel','Mt');
INSERT INTO "commodity" VALUES('IND_PP','d','Pulp and paper','Mt');
INSERT INTO "commodity" VALUES('IND_NF','d','Non-ferrous metals','Mt');
INSERT INTO "commodity" VALUES('IND_NM','d','Non-metallic minerals','Mt');
INSERT INTO "commodity" VALUES('IND_OTH','d','Other industries','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_NEU','d','Industrial and other non-energy uses','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_NSP','d','Other non-specified','PJ');
INSERT INTO "commodity" VALUES('IND_MD','a','Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_SB','a','Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_BFG','a','Blast furnace gas','PJ');
INSERT INTO "commodity" VALUES('IND_BIO','a','Biofuels','PJ');
INSERT INTO "commodity" VALUES('IND_COA','a','Coal','PJ');
INSERT INTO "commodity" VALUES('IND_COG','a','Coke oven gas','PJ');
INSERT INTO "commodity" VALUES('IND_COK','a','Coke oven coke','PJ');
INSERT INTO "commodity" VALUES('IND_ELC','a','Electricity','PJ');
INSERT INTO "commodity" VALUES('IND_ELC_BP','a','Electricity - Byproduct','PJ');
INSERT INTO "commodity" VALUES('IND_ETH','a','Ethane','PJ');
INSERT INTO "commodity" VALUES('IND_GEO','a','Geothermal','PJ');
INSERT INTO "commodity" VALUES('IND_HET','a','Heat','PJ');
INSERT INTO "commodity" VALUES('IND_HFO','a','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('IND_H2','a','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('IND_H2E','a','Hydrogen from electrolysis','PJ');
INSERT INTO "commodity" VALUES('IND_LPG','a','Liquified petroleum gas','PJ');
INSERT INTO "commodity" VALUES('IND_NAP','a','Naphtha','PJ');
INSERT INTO "commodity" VALUES('IND_NGA','a','Natural gas','PJ');
INSERT INTO "commodity" VALUES('IND_OIL','a','Refined petroleum products','PJ');
INSERT INTO "commodity" VALUES('IND_PTC','a','Petroleum coke','PJ');
INSERT INTO "commodity" VALUES('SNK_IND_CO2','a','Industry - Physical CO2 for storage/utilization','kt');
INSERT INTO "commodity" VALUES('IND_CH_HVC','a','HVC','Mt');
INSERT INTO "commodity" VALUES('IND_CH_BTX','a','Aromatics','Mt');
INSERT INTO "commodity" VALUES('IND_CH_OLF','a','Olefins','Mt');
INSERT INTO "commodity" VALUES('IND_CH_AMM','a','Ammonia','Mt');
INSERT INTO "commodity" VALUES('IND_CH_MTH','a','Methanol','Mt');
INSERT INTO "commodity" VALUES('IND_CH_CHL','a','Chlorine','Mt');
INSERT INTO "commodity" VALUES('IND_CH_OTH_PROD','a','Other chemical products','Mt');
INSERT INTO "commodity" VALUES('IND_CH_EC','a','Chemical - Electro-chemical process','PJ');
INSERT INTO "commodity" VALUES('IND_CH_MD','a','Chemical - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS','a','Chemical - Feedstock','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_BIO','a','Chemical - Feedstock - Biomass','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_DST','a','Chemical - Feedstock - Gas oil','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_ETH','a','Chemical - Feedstock - Ethane','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_HCO','a','Chemical - Feedstock - Hard coal','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_LPG','a','Chemical - Feedstock - LPG','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_MTH','a','Chemical - Feedstock - Methanol','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_NAP','a','Chemical - Feedstock - Naphtha','PJ');
INSERT INTO "commodity" VALUES('IND_CH_FS_NGA','a','Chemical - Feedstock - Natural gas','PJ');
INSERT INTO "commodity" VALUES('IND_CH_OTH','a','Chemical - Other energy use','PJ');
INSERT INTO "commodity" VALUES('IND_CH_SB','a','Chemical - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_IS_BOF','a','BOF steel','Mt');
INSERT INTO "commodity" VALUES('IND_IS_EAF','a','EAF steel','Mt');
INSERT INTO "commodity" VALUES('IND_IS_FS','a','Iron and steel - Feedstock','PJ');
INSERT INTO "commodity" VALUES('IND_IS_MD','a','Iron and steel - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_IS_OTH','a','Iron and steel - Other energy use','PJ');
INSERT INTO "commodity" VALUES('IND_IS_SB','a','Iron and steel - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_NF_AMN','a','Alumina','Mt');
INSERT INTO "commodity" VALUES('IND_NF_ALU','a','Aluminum','Mt');
INSERT INTO "commodity" VALUES('IND_NF_COP','a','Copper','Mt');
INSERT INTO "commodity" VALUES('IND_NF_ZNC','a','Zinc','Mt');
INSERT INTO "commodity" VALUES('IND_NF_OTH_PROD','a','Other non-ferrous metals','Mt');
INSERT INTO "commodity" VALUES('IND_NF_EC','a','Non-ferrous metals - Electro-chemical process','PJ');
INSERT INTO "commodity" VALUES('IND_NF_MD','a','Non-ferrous metals - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_NF_OTH','a','Non-ferrous metals - Other','PJ');
INSERT INTO "commodity" VALUES('IND_NF_SB','a','Non-ferrous metals - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_NM_CMT','a','Cement','Mt');
INSERT INTO "commodity" VALUES('IND_NM_CLK','a','Clinker','Mt');
INSERT INTO "commodity" VALUES('IND_NM_LIM','a','Lime','Mt');
INSERT INTO "commodity" VALUES('IND_NM_GLS','a','Glass','Mt');
INSERT INTO "commodity" VALUES('IND_NM_CRM','a','Ceramics','Mt');
INSERT INTO "commodity" VALUES('IND_NM_EC','a','Non-metallic minerals - Electro-chemical process','PJ');
INSERT INTO "commodity" VALUES('IND_NM_MD','a','Non-metallic minerals - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_NM_OTH','a','Non-metallic minerals - Other','PJ');
INSERT INTO "commodity" VALUES('IND_NM_SB','a','Non-metallic minerals - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_PP_PUL','a','Pulp for paper and paperboard','Mt');
INSERT INTO "commodity" VALUES('IND_PP_PUC','a','Chemical pulp for paper and paperboard','Mt');
INSERT INTO "commodity" VALUES('IND_PP_PUM','a','Mechanical pulp for paper and paperboard','Mt');
INSERT INTO "commodity" VALUES('IND_PP_PUR','a','Recycled pulp for paper and paperboard','Mt');
INSERT INTO "commodity" VALUES('IND_PP_PAP','a','Paper and paperboard','Mt');
INSERT INTO "commodity" VALUES('IND_PP_MD','a','Pulp and paper - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_PP_OTH','a','Pulp and paper - Other energy use','PJ');
INSERT INTO "commodity" VALUES('IND_PP_PH','a','Pulp and paper - Process heat','PJ');
INSERT INTO "commodity" VALUES('IND_PP_DH','a','Pulp and paper - Direct heat','PJ');
INSERT INTO "commodity" VALUES('IND_PP_SB','a','Pulp and paper - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_MD','a','Other industries - Machine drive','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_OTH','a','Other industries - Other','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_PH','a','Other industries - Process heat','PJ');
INSERT INTO "commodity" VALUES('IND_OTH_SB','a','Other industries - Steam boiler','PJ');
INSERT INTO "commodity" VALUES('IND_CH4','e','Industry - CH4 emission','t');
INSERT INTO "commodity" VALUES('IND_CO2','e','Industry - CO2 emission','kt');
INSERT INTO "commodity" VALUES('IND_CO2_PRC','e','Industry - Process CO2 emission','kt');
INSERT INTO "commodity" VALUES('IND_N2O','e','Industry - N2O emission','t');
INSERT INTO "commodity" VALUES('IND_SOX','e','Industry - SOX emission','t');
INSERT INTO "commodity" VALUES('CHR','a','Chromium','t');
INSERT INTO "commodity" VALUES('COP','a','Copper','t');
INSERT INTO "commodity" VALUES('NIC','a','Nickel','t');
INSERT INTO "commodity" VALUES('TIT','a','Titanium','t');
INSERT INTO "commodity" VALUES('ethos','s','Dummy input commodity for primary energy technologies','ethos');
INSERT INTO "commodity" VALUES('DMY_OUT','d','Dummy output commodity','DMY_OUT');
INSERT INTO "commodity" VALUES('SNK_CO2_EM','e','Captured CO2 for storage/utilization - Emission','kt');
INSERT INTO "commodity" VALUES('BIO_BIN','s','Industrial waste-sludge','PJ');
INSERT INTO "commodity" VALUES('BIO_BMU','s','Municipal waste','PJ');
INSERT INTO "commodity" VALUES('BIO_GAS','s','Biogas','PJ');
INSERT INTO "commodity" VALUES('BIO_LIQ','s','Liquid biofuels','PJ');
INSERT INTO "commodity" VALUES('BIO_METH','s','Biomethane','PJ');
INSERT INTO "commodity" VALUES('BIO_NAP','s','Bio-naphtha','PJ');
INSERT INTO "commodity" VALUES('BIO_SLB','s','Solid biomass','PJ');
INSERT INTO "commodity" VALUES('COA_HCO','s','Hard coal','PJ');
INSERT INTO "commodity" VALUES('COA_OVC','s','Coke oven coke','PJ');
INSERT INTO "commodity" VALUES('ELC_BLQ','s','Bioliquids','PJ');
INSERT INTO "commodity" VALUES('ELC_CEN','s','Electricity (centralized)','PJ');
INSERT INTO "commodity" VALUES('ELC_DST','p','Electricity (distributed)','PJ');
INSERT INTO "commodity" VALUES('ELC_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_BFG','s','Blast furnace gas','PJ');
INSERT INTO "commodity" VALUES('GAS_COG','s','Coke oven gas','PJ');
INSERT INTO "commodity" VALUES('GAS_ETH','s','Ethane','PJ');
INSERT INTO "commodity" VALUES('GAS_NGA','s','Natural gas','PJ');
INSERT INTO "commodity" VALUES('GAS_RFG','s','Refinery gas','PJ');
INSERT INTO "commodity" VALUES('GEO','s','Geothermal energy','PJ');
INSERT INTO "commodity" VALUES('H2','s','Hydrogen','PJ');
INSERT INTO "commodity" VALUES('H2_EL','s','Hydrogen from electrolysis','PJ');
INSERT INTO "commodity" VALUES('H2_EL_SOEC','s','Hydrogen from SOEC','PJ');
INSERT INTO "commodity" VALUES('H2_BL','s','Hydrogen for blending','PJ');
INSERT INTO "commodity" VALUES('HET','s','Heat','PJ');
INSERT INTO "commodity" VALUES('OIL_DST','s','Distillates','PJ');
INSERT INTO "commodity" VALUES('OIL_GSL','s','Gasoline','PJ');
INSERT INTO "commodity" VALUES('OIL_HFO','s','Heavy fuel oil','PJ');
INSERT INTO "commodity" VALUES('OIL_JTK','s','Jet kerosene','PJ');
INSERT INTO "commodity" VALUES('OIL_KER','s','Other kerosene','PJ');
INSERT INTO "commodity" VALUES('OIL_LPG','s','Liquid petroleum gas','PJ');
INSERT INTO "commodity" VALUES('OIL_NAP','s','Naphtha','PJ');
INSERT INTO "commodity" VALUES('OIL_NSP','s','Non specified oil','PJ');
INSERT INTO "commodity" VALUES('OIL_PTC','s','Petroleum coke','PJ');
INSERT INTO "commodity" VALUES('SYN_DST','s','Synthetic diesel fuel','PJ');
INSERT INTO "commodity" VALUES('SYN_KER','s','Synthetic kerosene','PJ');
INSERT INTO "commodity" VALUES('SYN_MET','s','Synthetic methanol','PJ');
INSERT INTO "commodity" VALUES('SYN_NGA','s','Synthetic natural gas','PJ');

CREATE TABLE allocation (
    demand_comm TEXT REFERENCES commodity(name),
    driver_name TEXT,
    notes       TEXT,
    PRIMARY KEY(demand_comm, driver_name)
);
INSERT INTO "allocation" VALUES('IND_CH','PCHEM','');
INSERT INTO "allocation" VALUES('IND_IS','PIS','');
INSERT INTO "allocation" VALUES('IND_PP','PLP','');
INSERT INTO "allocation" VALUES('IND_NF','PISNF','');
INSERT INTO "allocation" VALUES('IND_NM','PNM','');
INSERT INTO "allocation" VALUES('IND_OTH','POI','');
INSERT INTO "allocation" VALUES('IND_OTH_NEU','GDP','');
INSERT INTO "allocation" VALUES('IND_OTH_NSP','GDP','');

CREATE TABLE sector_label (
    sector TEXT PRIMARY KEY,
    notes  TEXT
);
INSERT INTO "sector_label" VALUES('AGR','agriculture');
INSERT INTO "sector_label" VALUES('COM','commercial');
INSERT INTO "sector_label" VALUES('RES','residential');
INSERT INTO "sector_label" VALUES('TRA','transport');
INSERT INTO "sector_label" VALUES('IND','industry');
INSERT INTO "sector_label" VALUES('ELC','electricity');
INSERT INTO "sector_label" VALUES('GEN','generation');
INSERT INTO "sector_label" VALUES('STG','storage');
INSERT INTO "sector_label" VALUES('IMP','import');
INSERT INTO "sector_label" VALUES('UPS','upstream');
INSERT INTO "sector_label" VALUES('H2','hydrogen');
INSERT INTO "sector_label" VALUES('CCUS','ccus');
INSERT INTO "sector_label" VALUES('MAT','materials');

CREATE TABLE technology_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "technology_type" VALUES('r','resource technology');
INSERT INTO "technology_type" VALUES('p','production technology');
INSERT INTO "technology_type" VALUES('pb','baseload production technology');
INSERT INTO "technology_type" VALUES('ps','storage production technology');

CREATE TABLE technology (
    tech         TEXT NOT NULL PRIMARY KEY,
    flag         TEXT NOT NULL REFERENCES technology_type(label),
    sector       TEXT REFERENCES sector_label(sector),
    category     TEXT,
    sub_category TEXT,
    unlim_cap    INTEGER NOT NULL DEFAULT 0,
    annual       INTEGER NOT NULL DEFAULT 0,
    reserve      INTEGER NOT NULL DEFAULT 0,
    curtail      INTEGER NOT NULL DEFAULT 0,
    retire       INTEGER NOT NULL DEFAULT 0,
    flex         INTEGER NOT NULL DEFAULT 0,
    exchange     INTEGER NOT NULL DEFAULT 0,
    seas_stor    INTEGER NOT NULL DEFAULT 0,
    description  TEXT
);
INSERT INTO "technology" VALUES('IND_FT_BFG','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Blast furnace gas');
INSERT INTO "technology" VALUES('IND_FT_BIO','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Biofuels');
INSERT INTO "technology" VALUES('IND_FT_COA','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Coal');
INSERT INTO "technology" VALUES('IND_FT_COG','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Coke oven gas');
INSERT INTO "technology" VALUES('IND_FT_COK','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Oven coke');
INSERT INTO "technology" VALUES('IND_FT_ELC','p','IND','',NULL,0,0,0,0,0,0,0,0,'Fuel Technology - Electricity');
INSERT INTO "technology" VALUES('IND_FT_ETH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Ethane');
INSERT INTO "technology" VALUES('IND_FT_GEO','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Geothermal');
INSERT INTO "technology" VALUES('IND_FT_HET','p','IND','',NULL,0,0,0,0,0,0,0,0,'Fuel Technology - Heat');
INSERT INTO "technology" VALUES('IND_FT_HFO','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Heavy fuel oil');
INSERT INTO "technology" VALUES('IND_FT_LPG','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - LPG');
INSERT INTO "technology" VALUES('IND_FT_NAP','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Naphtha');
INSERT INTO "technology" VALUES('IND_FT_NGA','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Natural gas mix');
INSERT INTO "technology" VALUES('IND_FT_OIL','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Refined petroleum products');
INSERT INTO "technology" VALUES('IND_FT_PTC','p','IND','',NULL,0,1,0,0,0,0,0,0,'Fuel Technology - Petroleum coke');
INSERT INTO "technology" VALUES('IND_FT_H2','p','IND','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydrogen');
INSERT INTO "technology" VALUES('IND_FT_H2E','p','IND','',NULL,0,0,0,0,0,0,0,0,'Fuel technology - Hydrogen from electrolysis');
INSERT INTO "technology" VALUES('IND_MD_TECH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to produce sector-specific Machine Drive');
INSERT INTO "technology" VALUES('IND_MD_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine Drive - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_MD_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine Drive - Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_STM_TECH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to produce sector-specific steam');
INSERT INTO "technology" VALUES('IND_STM_BYPROD','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to allow production of steam as by product');
INSERT INTO "technology" VALUES('IND_STM_BIO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Biomass - Existing');
INSERT INTO "technology" VALUES('IND_STM_COA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Coal - Existing');
INSERT INTO "technology" VALUES('IND_STM_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_STM_HET_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Heat - Existing');
INSERT INTO "technology" VALUES('IND_STM_HFO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Heavy fuel oil - Existing');
INSERT INTO "technology" VALUES('IND_STM_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - LPG - Existing');
INSERT INTO "technology" VALUES('IND_STM_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_CH_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Chemical demand production');
INSERT INTO "technology" VALUES('IND_CH_OLF_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Olefins – Existing');
INSERT INTO "technology" VALUES('IND_CH_BTX_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Aromatics – Existing');
INSERT INTO "technology" VALUES('IND_CH_AMM_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia – Existing');
INSERT INTO "technology" VALUES('IND_CH_MTH_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol – Existing');
INSERT INTO "technology" VALUES('IND_CH_CHL_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chlorine – Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other chemicals – Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert distillate to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_GSL_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert gasoline to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_HFO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert heavy fuel oil to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_KER_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert kerosene to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert LPG to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_NAP_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert naphtha to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert natural gas to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_NSP_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert oil non-specified to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_FS_RFG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Technology to convert refinery gas to non-energy petrochemical feedstock - Existing');
INSERT INTO "technology" VALUES('IND_CH_EC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Electro-chemical process for Chemicals - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_COK_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Coke - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Distillate Oil - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Electric - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_ETH_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Ethane - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_HFO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Heavy fuel oil - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_CH_OTH_PTC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Petroleum coke - Existing');
INSERT INTO "technology" VALUES('IND_IS_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Iron and steel demand production');
INSERT INTO "technology" VALUES('IND_IS_BOF_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Basic oxygen furnace - Existing');
INSERT INTO "technology" VALUES('IND_IS_EAF_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'EAF - Existing');
INSERT INTO "technology" VALUES('IND_IS_FS_PTC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Petroleum coke consumption in Iron and Steel - Existing');
INSERT INTO "technology" VALUES('IND_IS_FS_COK_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Coke consumption in Iron and Steel - Existing');
INSERT INTO "technology" VALUES('IND_IS_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Iron and Steel - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_NF_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Non-ferrous metals demand production');
INSERT INTO "technology" VALUES('IND_NF_ALU_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Aluminum - Existing');
INSERT INTO "technology" VALUES('IND_NF_COP_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Copper - Existing');
INSERT INTO "technology" VALUES('IND_NF_ZNC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Zinc - Existing');
INSERT INTO "technology" VALUES('IND_NF_OTH_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other Non-ferrous metals- Existing');
INSERT INTO "technology" VALUES('IND_NF_EC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Electro-chemical process for Non-ferrous metals - Existing');
INSERT INTO "technology" VALUES('IND_NF_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_NF_OTH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Distillate Oil - Existing');
INSERT INTO "technology" VALUES('IND_NF_OTH_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_NF_OTH_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - LPG - Existing');
INSERT INTO "technology" VALUES('IND_NM_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Non-metallic minerals demand production');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRY_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process - Existing');
INSERT INTO "technology" VALUES('IND_NM_CLK_WET_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Wet process - Existing');
INSERT INTO "technology" VALUES('IND_NM_CRM_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ceramics - Existing');
INSERT INTO "technology" VALUES('IND_NM_GLS_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Glass - Existing');
INSERT INTO "technology" VALUES('IND_NM_LIM_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Lime - Existing');
INSERT INTO "technology" VALUES('IND_NM_OTH_COK_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-metallic minerals - Coke - Existing');
INSERT INTO "technology" VALUES('IND_NM_OTH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-metallic minerals - Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_NM_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-metallic minerals - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_NM_OTH_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-metallic minerals - LPG - Existing');
INSERT INTO "technology" VALUES('IND_NM_OTH_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-metallic minerals - Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_PP_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Pulp and paper demand production');
INSERT INTO "technology" VALUES('IND_PP_PUL_TECH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Pulp commodities collection');
INSERT INTO "technology" VALUES('IND_PP_PAP_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Paper mill - Existing');
INSERT INTO "technology" VALUES('IND_PP_PUL_CHEM_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chemical pulping - Existing');
INSERT INTO "technology" VALUES('IND_PP_PUL_MEC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Mechanical pulping - Existing');
INSERT INTO "technology" VALUES('IND_PP_PUL_REC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Recycled fiber pulping - Existing');
INSERT INTO "technology" VALUES('IND_PP_PH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Pulp and Paper - Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_PP_PH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Pulp and Paper - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_PP_PH_HFO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Pulp and Paper - Heavy fuel oil - Existing');
INSERT INTO "technology" VALUES('IND_PP_PH_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Pulp and Paper - Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_PP_OTH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Pulp and Paper - Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_PP_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Pulp and Paper - Electric - Existing');
INSERT INTO "technology" VALUES('IND_PP_OTH_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Pulp and Paper - LPG - Existing');
INSERT INTO "technology" VALUES('IND_OTH_TECH','p','IND','',NULL,1,1,0,0,0,0,0,0,'Other industries demand production');
INSERT INTO "technology" VALUES('IND_OTH_PH_DST_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Distillate oil - Existing');
INSERT INTO "technology" VALUES('IND_OTH_PH_HFO_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Heavy fuel oil - Existing');
INSERT INTO "technology" VALUES('IND_OTH_PH_LPG_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry LPG - Existing');
INSERT INTO "technology" VALUES('IND_OTH_PH_NGA_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Natural gas - Existing');
INSERT INTO "technology" VALUES('IND_OTH_OTH_ELC_E','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Other Industry - Electricity - Existing');
INSERT INTO "technology" VALUES('IND_NEU_TECH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other non-energy uses demand production');
INSERT INTO "technology" VALUES('IND_ONS_TECH','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other non-specified industrial demand production');
INSERT INTO "technology" VALUES('IND_MD_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine drive - Distillate oil - New');
INSERT INTO "technology" VALUES('IND_MD_LPG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine drive - LPG - New');
INSERT INTO "technology" VALUES('IND_MD_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine drive - Natural gas - New');
INSERT INTO "technology" VALUES('IND_MD_ELC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Machine drive - Electricity - New');
INSERT INTO "technology" VALUES('IND_STM_BFG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Blast furnace gas - New');
INSERT INTO "technology" VALUES('IND_STM_BIO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Biomass - New');
INSERT INTO "technology" VALUES('IND_STM_COA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Coal - New');
INSERT INTO "technology" VALUES('IND_STM_COG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Coke oven gas - New');
INSERT INTO "technology" VALUES('IND_STM_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Distillate oil - New');
INSERT INTO "technology" VALUES('IND_STM_ETH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Ethane - New');
INSERT INTO "technology" VALUES('IND_STM_HET_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Heat - New');
INSERT INTO "technology" VALUES('IND_STM_HFO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Heavy fuel oil - New');
INSERT INTO "technology" VALUES('IND_STM_LPG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - LPG - New');
INSERT INTO "technology" VALUES('IND_STM_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Natural gas - New');
INSERT INTO "technology" VALUES('IND_STM_PTC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Steam - Petroleum coke - New');
INSERT INTO "technology" VALUES('IND_CH_HVC_NAPSC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Naphtha steam cracking');
INSERT INTO "technology" VALUES('IND_CH_HVC_ETHSC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Ethane steam cracking');
INSERT INTO "technology" VALUES('IND_CH_HVC_GSOSC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Gas oil steam cracking');
INSERT INTO "technology" VALUES('IND_CH_HVC_LPGSC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - LPG steam cracking');
INSERT INTO "technology" VALUES('IND_CH_HVC_NCC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Naphtha catalytic cracking');
INSERT INTO "technology" VALUES('IND_CH_HVC_BDH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Bioethanol dehydration');
INSERT INTO "technology" VALUES('IND_CH_HVC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HVC - Olefins and BTX production');
INSERT INTO "technology" VALUES('IND_CH_OLF_PDH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Olefins - Prophane dehydrogenation');
INSERT INTO "technology" VALUES('IND_CH_OLF_MTO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Olefins - Methanol-to-olefins');
INSERT INTO "technology" VALUES('IND_CH_AMM_NGASR_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Natural gas steam reforming');
INSERT INTO "technology" VALUES('IND_CH_AMM_NGASR_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Natural gas steam reforming CCS');
INSERT INTO "technology" VALUES('IND_CH_AMM_NGASR_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Natural gas steam reforming CCS - Linked');
INSERT INTO "technology" VALUES('IND_CH_AMM_NAPPOX_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Naphtha partial oxidation');
INSERT INTO "technology" VALUES('IND_CH_AMM_COAGSF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Coal gasification');
INSERT INTO "technology" VALUES('IND_CH_AMM_BIOGSF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Biomass gasification');
INSERT INTO "technology" VALUES('IND_CH_AMM_ELCSYS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ammonia - Synthesis via electrolysis');
INSERT INTO "technology" VALUES('IND_CH_MTH_NGASR_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Natural gas steam reforming');
INSERT INTO "technology" VALUES('IND_CH_MTH_NGASR_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Natural gas steam reforming CCS');
INSERT INTO "technology" VALUES('IND_CH_MTH_NGASR_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Natural gas steam reforming CCS - Linked');
INSERT INTO "technology" VALUES('IND_CH_MTH_COGSR_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Coke oven gas steam reforming');
INSERT INTO "technology" VALUES('IND_CH_MTH_LPGSR_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - LPG partial oxidation');
INSERT INTO "technology" VALUES('IND_CH_MTH_COAGSF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Coal gasification');
INSERT INTO "technology" VALUES('IND_CH_MTH_BIOGSF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Biomass gasification');
INSERT INTO "technology" VALUES('IND_CH_MTH_ELCSYS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Methanol - Synthesis via electrolysis');
INSERT INTO "technology" VALUES('IND_CH_CHL_MERC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chlorine - Mercury cell');
INSERT INTO "technology" VALUES('IND_CH_CHL_DIAP_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chlorine - Diaphragm cell');
INSERT INTO "technology" VALUES('IND_CH_CHL_MEMB_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chlorine - Membrane cell');
INSERT INTO "technology" VALUES('IND_CH_EC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Electro-chemical process for Chemicals - New');
INSERT INTO "technology" VALUES('IND_CH_FS_BIO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Biomass - New');
INSERT INTO "technology" VALUES('IND_CH_FS_COA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Coal - New');
INSERT INTO "technology" VALUES('IND_CH_FS_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Distillate oil - New');
INSERT INTO "technology" VALUES('IND_CH_FS_ETH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Ethane - New');
INSERT INTO "technology" VALUES('IND_CH_FS_LPG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - LPG - New');
INSERT INTO "technology" VALUES('IND_CH_FS_MTH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Methanol - New');
INSERT INTO "technology" VALUES('IND_CH_FS_NAP_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Naphtha - New');
INSERT INTO "technology" VALUES('IND_CH_FS_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Feedstock for Chemicals - Natural gas - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_COK_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Coke - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Distillate Oil - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_ELC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Electric - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_ETH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Ethane - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_HFO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Heavy fuel oil - New');
INSERT INTO "technology" VALUES('IND_CH_OTH_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Chemicals - Natural gas - New');
INSERT INTO "technology" VALUES('IND_IS_BOF_BFBOF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Blast furnace-Basic oxygen furnace (BF-BOF)');
INSERT INTO "technology" VALUES('IND_IS_BOF_BFBOF_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'BF-BOF CCS');
INSERT INTO "technology" VALUES('IND_IS_BOF_BFBOF_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'BF-BOF CCS - Linked');
INSERT INTO "technology" VALUES('IND_IS_BOF_BFTGRBOF_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'BF-TGR-BOF CCS');
INSERT INTO "technology" VALUES('IND_IS_BOF_BFTGRBOF_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'BF-TGR-BOF CCS - Linked');
INSERT INTO "technology" VALUES('IND_IS_DRI_DRIEAF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Direct reduced iron-Electric arc furnace (DRI-EAF)');
INSERT INTO "technology" VALUES('IND_IS_DRI_DRIEAF_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'DRI-EAF CCS');
INSERT INTO "technology" VALUES('IND_IS_DRI_DRIEAF_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'DRI-EAF CCS - Linked');
INSERT INTO "technology" VALUES('IND_IS_DRI_HDREAF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Hydrogen direct reduction (HDR)-EAF');
INSERT INTO "technology" VALUES('IND_IS_BOF_HISBOF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HIsarna-BOF');
INSERT INTO "technology" VALUES('IND_IS_BOF_HISBOF_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'HIsarna-BOF CCS');
INSERT INTO "technology" VALUES('IND_IS_BOF_HISBOF_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'HIsarna-BOF CCS - Linked');
INSERT INTO "technology" VALUES('IND_IS_BOF_ULCOWIN_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ulcowin');
INSERT INTO "technology" VALUES('IND_IS_BOF_ULCOLYSIS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ulcolysis');
INSERT INTO "technology" VALUES('IND_IS_BOF_ULCORED_CCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ulcored CCS');
INSERT INTO "technology" VALUES('IND_IS_BOF_ULCORED_CCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ulcored CCS - Linked');
INSERT INTO "technology" VALUES('IND_NF_AMN_BAY_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Alumina - Bayer process');
INSERT INTO "technology" VALUES('IND_NF_ALU_HLH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Primary aluminum - Hall-Héroult process');
INSERT INTO "technology" VALUES('IND_NF_ALU_SEC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Secondary aluminum - Production from scrap');
INSERT INTO "technology" VALUES('IND_NF_ALU_HLHIA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Primary aluminum - Hall-Héroult with inert anodes');
INSERT INTO "technology" VALUES('IND_NF_ALU_CBT_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Aluminum - Carbothermic reduction of alumina');
INSERT INTO "technology" VALUES('IND_NF_ALU_KAO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Aluminum - Kaolinite reduction');
INSERT INTO "technology" VALUES('IND_NF_COP_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Copper - New');
INSERT INTO "technology" VALUES('IND_NF_ZNC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Zinc - New');
INSERT INTO "technology" VALUES('IND_NF_EC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Electro-chemical process for Non-ferrous metals - New');
INSERT INTO "technology" VALUES('IND_NF_OTH_ELC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Electricity - New');
INSERT INTO "technology" VALUES('IND_NF_OTH_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Distillate Oil - New');
INSERT INTO "technology" VALUES('IND_NF_OTH_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Non-ferrous metals - Natural gas - New');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRY_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRY_BIO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process - Biomass');
INSERT INTO "technology" VALUES('IND_NM_CLK_WET_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Wet process');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_PCCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with post-combustion CCS');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_PCCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with post-combustion CCS - Linked');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_PCCS_BIO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with post-combustion CCS - Biomass');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with post-combustion CCS - Biomass - Linked');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_OCCS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with oxy-fuel CCS');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_OCCS_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with oxy-fuel CCS - Linked');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_OCCS_BIO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with oxy-fuel CCS - Biomass');
INSERT INTO "technology" VALUES('IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED','p','IND','',NULL,0,1,0,0,0,0,0,0,'Clinker - Dry process with oxy-fuel CCS - Biomass - Linked');
INSERT INTO "technology" VALUES('IND_NM_CEM_BLN_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Cement blending');
INSERT INTO "technology" VALUES('IND_NM_CEM_AAC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Alkali-activated cement-based binders (AAC)');
INSERT INTO "technology" VALUES('IND_NM_CEM_BEL_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Belite cement');
INSERT INTO "technology" VALUES('IND_NM_LIM_LRK_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Lime - Long rotary kiln');
INSERT INTO "technology" VALUES('IND_NM_GLS_FOSS_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Glass - Fossil fuel-fired furnace');
INSERT INTO "technology" VALUES('IND_NM_GLS_ELEC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Glass - All-electric furnace');
INSERT INTO "technology" VALUES('IND_NM_CRM_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Ceramics production');
INSERT INTO "technology" VALUES('IND_NM_EC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Electro-chemical process for Non-metallic minerals - New');
INSERT INTO "technology" VALUES('IND_PP_PUL_KRF_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chemical pulping - Kraft process');
INSERT INTO "technology" VALUES('IND_PP_PUL_SUL_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Chemical pulping - Sulfite process');
INSERT INTO "technology" VALUES('IND_PP_PUL_MEC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Mechanical pulping');
INSERT INTO "technology" VALUES('IND_PP_PUL_SCH_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Semi-chemical pulping');
INSERT INTO "technology" VALUES('IND_PP_PUL_REC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Recycled fiber pulping');
INSERT INTO "technology" VALUES('IND_PP_PAP_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Paper production and printing');
INSERT INTO "technology" VALUES('IND_PP_PH_HFO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process heat for Pulp and Paper - Heavy fuel oil');
INSERT INTO "technology" VALUES('IND_PP_PH_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process heat for Pulp and Paper - Natural gas');
INSERT INTO "technology" VALUES('IND_OTH_PH_DST_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Distillate oil - New');
INSERT INTO "technology" VALUES('IND_OTH_PH_HFO_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Heavy fuel oil - New');
INSERT INTO "technology" VALUES('IND_OTH_PH_LPG_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry LPG - New');
INSERT INTO "technology" VALUES('IND_OTH_PH_NGA_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Process Heat for Other Industry Natural gas - New');
INSERT INTO "technology" VALUES('IND_OTH_OTH_ELC_N','p','IND','',NULL,0,1,0,0,0,0,0,0,'Other energy use for Other Industry - Electricity');
INSERT INTO "technology" VALUES('IND_CHP_NGA_CI_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Internal combustion engine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_NGA_TG_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Simple cycle gas turbine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_NGA_TV_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Steam turbine - Natural gas');
INSERT INTO "technology" VALUES('IND_CHP_BLQ_CI_N','p','IND','',NULL,0,0,1,0,0,0,0,0,'mCHP - Industry - Internal combustion engine - Bioliquid');
INSERT INTO "technology" VALUES('DMY_OUT_TECH','p','UPS','',NULL,1,1,0,0,0,0,0,0,'Dummy technology to produce DMY_OUT');
INSERT INTO "technology" VALUES('MAT_SUP_CHR','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Chromium');
INSERT INTO "technology" VALUES('MAT_SUP_COP','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Copper');
INSERT INTO "technology" VALUES('MAT_SUP_NIC','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Nickel');
INSERT INTO "technology" VALUES('MAT_SUP_TIT','p','MAT','',NULL,1,1,0,0,0,0,0,0,'Material Supply - Titanium');

CREATE TABLE time_period_type (
    label       TEXT PRIMARY KEY,
    description TEXT
);
INSERT INTO "time_period_type" VALUES('e','existing vintages');
INSERT INTO "time_period_type" VALUES('f','future vintages');

CREATE TABLE time_period (
    sequence INTEGER UNIQUE,
    period   INTEGER PRIMARY KEY,
    flag     TEXT REFERENCES time_period_type(label)
);
INSERT INTO "time_period" VALUES(1,2006,'e');
INSERT INTO "time_period" VALUES(2,2007,'f');
INSERT INTO "time_period" VALUES(3,2008,'f');
INSERT INTO "time_period" VALUES(4,2010,'f');
INSERT INTO "time_period" VALUES(5,2012,'f');
INSERT INTO "time_period" VALUES(6,2014,'f');
INSERT INTO "time_period" VALUES(7,2016,'f');
INSERT INTO "time_period" VALUES(8,2018,'f');
INSERT INTO "time_period" VALUES(9,2020,'f');
INSERT INTO "time_period" VALUES(10,2022,'f');
INSERT INTO "time_period" VALUES(11,2025,'f');
INSERT INTO "time_period" VALUES(12,2030,'f');
INSERT INTO "time_period" VALUES(13,2035,'f');
INSERT INTO "time_period" VALUES(14,2040,'f');
INSERT INTO "time_period" VALUES(15,2045,'f');
INSERT INTO "time_period" VALUES(16,2050,'f');
INSERT INTO "time_period" VALUES(17,2060,'f');

CREATE TABLE capacity_credit (
    region  TEXT,
    period  INTEGER REFERENCES time_period(period),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    credit  REAL,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage),
    CHECK(credit >= 0 AND credit <= 1)
);
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_CI_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_TG_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2007,'IND_CHP_NGA_TV_N',2007,0.2,'');
INSERT INTO "capacity_credit" VALUES('IT',2014,'IND_CHP_BLQ_CI_N',2014,0.2,'');

CREATE TABLE time_of_day (
    sequence INTEGER UNIQUE,
    tod      TEXT PRIMARY KEY,
    hours    REAL NOT NULL DEFAULT 1,
    notes    TEXT,
    CHECK(hours > 0)
);
INSERT INTO "time_of_day" VALUES(1,'afternoon',6.0,NULL);
INSERT INTO "time_of_day" VALUES(2,'morning',6.0,NULL);
INSERT INTO "time_of_day" VALUES(3,'night',9.0,NULL);
INSERT INTO "time_of_day" VALUES(4,'noon',3.0,NULL);

CREATE TABLE time_season (
    sequence         INTEGER UNIQUE,
    season           TEXT PRIMARY KEY,
    segment_fraction REAL NOT NULL DEFAULT 0,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
INSERT INTO "time_season" VALUES(1,'fall',0.252,NULL);
INSERT INTO "time_season" VALUES(2,'spring',0.2493,NULL);
INSERT INTO "time_season" VALUES(3,'summer',0.252,NULL);
INSERT INTO "time_season" VALUES(4,'winter',0.2467,NULL);

CREATE TABLE capacity_factor_process (
    region  TEXT,
    season  TEXT REFERENCES time_season(season),
    tod     TEXT REFERENCES time_of_day(tod),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    factor  REAL,
    notes   TEXT,
    PRIMARY KEY(region, season, tod, tech, vintage),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE capacity_factor_tech (
    region TEXT,
    season TEXT REFERENCES time_season(season),
    tod    TEXT REFERENCES time_of_day(tod),
    tech   TEXT REFERENCES technology(tech),
    factor REAL,
    notes  TEXT,
    PRIMARY KEY(region, season, tod, tech),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE capacity_to_activity (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    c2a    REAL,
    units  TEXT,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_CI_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_TG_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_NGA_TV_N',31.536,'PJ/(GW)','');
INSERT INTO "capacity_to_activity" VALUES('IT','IND_CHP_BLQ_CI_N',31.536,'PJ/(GW)','');

CREATE TABLE commodity_emission_factor (
    emis_comm  TEXT REFERENCES commodity(name),
    input_comm TEXT REFERENCES commodity(name),
    ef         REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(emis_comm, input_comm)
);
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_NGA',56.1,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_LPG',63.07,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_COA',98.27,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_COK',94.6,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_COG',108.17,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_BFG',108.17,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_HFO',77.37,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_OIL',71.98,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_ETH',54.1,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_NAP',73.33,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_PTC',100.8,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CO2','IND_BIO',0.0001,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_NGA',1.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_LPG',5.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_COA',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_COK',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_COG',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_BFG',0.54,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_HFO',0.72,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_OIL',3.82,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_ETH',1.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_NAP',5.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_PTC',5.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_CH4','IND_BIO',300.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_NGA',1.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_LPG',0.1,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_COA',1.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_COK',1.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_COG',1.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_BFG',1.81,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_HFO',3.11,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_OIL',4.82,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_ETH',1.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_NAP',0.6,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_PTC',1.4,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_N2O','IND_BIO',4.0,'t/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_NGA',0.0,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_LPG',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_COA',1.2,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_COK',1.2,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_COG',1.2,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_BFG',0.0,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_HFO',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_OIL',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_ETH',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_NAP',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_PTC',0.57,'kt/(PJ)','');
INSERT INTO "commodity_emission_factor" VALUES('IND_SOX','IND_BIO',0.0,'kt/(PJ)','');

CREATE TABLE construction_input (
    region     TEXT,
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    vintage    INTEGER REFERENCES time_period(period),
    value      REAL,
    units      TEXT,
    notes      TEXT,
    PRIMARY KEY(region, input_comm, tech, vintage)
);
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_CI_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_CI_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_CI_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_TG_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_TG_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_TG_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','CHR','IND_CHP_NGA_TV_N',2007,48.3,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_NGA_TV_N',2007,1100.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','NIC','IND_CHP_NGA_TV_N',2007,15.8,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','COP','IND_CHP_BLQ_CI_N',2014,2270.0,'t/(GW)','10.1016/j.mtener.2025.101805');
INSERT INTO "construction_input" VALUES('IT','TIT','IND_CHP_BLQ_CI_N',2014,400.0,'t/(GW)','10.1016/j.mtener.2025.101805');

CREATE TABLE cost_emission (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT NOT NULL REFERENCES commodity(name),
    cost      REAL NOT NULL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, emis_comm)
);
INSERT INTO "cost_emission" VALUES('IT',2007,'IND_CO2',0.01,'MEUR/(kt)','ETS');
INSERT INTO "cost_emission" VALUES('IT',2030,'IND_CO2',0.08,'MEUR/(kt)','ETS');
INSERT INTO "cost_emission" VALUES('IT',2050,'IND_CO2',0.15,'MEUR/(kt)','ETS');

CREATE TABLE cost_fixed (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL REFERENCES time_period(period),
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_BFG',2006,1.64,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_BIO',2006,1.44,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_COA',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_FT_COG',2007,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_COK',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_ETH',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_HFO',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_LPG',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_NAP',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_NGA',2006,2.05,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_OIL',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2006,'IND_FT_PTC',2006,3.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2014,'IND_FT_H2',2014,1.57,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_MD_DST_N',2007,1.93,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_MD_LPG_N',2007,1.93,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_MD_NGA_N',2007,2.31,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_MD_ELC_N',2007,0.08,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2016,'IND_MD_ELC_N',2016,0.45,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_BFG_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_BIO_N',2007,1.52,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_COA_N',2007,1.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_COG_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_DST_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_ETH_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_HET_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_HFO_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_LPG_N',2007,0.3,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_NGA_N',2007,0.32,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_STM_PTC_N',2007,1.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_HVC_NAPSC_N',2007,21.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_HVC_NAPSC_N',2030,16.6,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_HVC_ETHSC_N',2007,15.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_HVC_ETHSC_N',2030,9.3,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_HVC_GSOSC_N',2007,24.3,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_HVC_LPGSC_N',2007,19.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_HVC_LPGSC_N',2030,12.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'IND_CH_HVC_NCC_N',2020,34.1,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'IND_CH_HVC_BDH_N',2020,33.2,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2010,'IND_CH_OLF_PDH_N',2010,42.3,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OLF_MTO_N',2007,11.9,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_AMM_NGASR_N',2007,2.09,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_AMM_NGASR_N',2030,1.73,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_AMM_NGASR_CCS_N',2025,4.95,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_AMM_NAPPOX_N',2007,3.2,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_AMM_NAPPOX_N',2030,2.81,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_AMM_COAGSF_N',2007,20.6,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_AMM_COAGSF_N',2030,17.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_AMM_BIOGSF_N',2025,300.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_AMM_ELCSYS_N',2025,2.6,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_MTH_NGASR_N',2007,5.38,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_MTH_NGASR_CCS_N',2025,12.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_MTH_COGSR_N',2007,3.31,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_MTH_LPGSR_N',2007,5.51,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_MTH_COAGSF_N',2007,2.73,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_MTH_BIOGSF_N',2025,35.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_CH_MTH_ELCSYS_N',2025,1.1,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_MTH_ELCSYS_N',2030,0.663,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'IND_CH_MTH_ELCSYS_N',2050,0.355,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_CHL_MERC_N',2007,4.72,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_CHL_MERC_N',2030,3.64,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_CHL_DIAP_N',2007,4.72,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_CHL_DIAP_N',2030,3.64,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_CHL_MEMB_N',2007,4.72,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_CH_CHL_MEMB_N',2030,3.64,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_EC_N',2007,1.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_COK_N',2007,0.53,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_DST_N',2007,0.53,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_ELC_N',2007,0.36,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_ETH_N',2007,0.53,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_HFO_N',2007,0.53,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_CH_OTH_NGA_N',2007,0.48,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_IS_BOF_BFBOF_N',2007,3.19,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_BOF_BFBOF_CCS_N',2030,3.14,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2040,'IND_IS_BOF_BFTGRBOF_CCS_N',2040,3.09,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_IS_DRI_DRIEAF_N',2007,17.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N',2030,17.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_DRI_HDREAF_N',2030,17.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2025,'IND_IS_BOF_HISBOF_N',2025,14.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_BOF_HISBOF_CCS_N',2030,14.9,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_BOF_ULCOWIN_N',2030,20.2,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_BOF_ULCOLYSIS_N',2030,17.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_IS_BOF_ULCORED_CCS_N',2030,16.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_AMN_BAY_N',2007,137.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_ALU_HLH_N',2007,68.4,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_ALU_SEC_N',2007,365.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_NF_ALU_HLHIA_N',2030,56.3,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'IND_NF_ALU_CBT_N',2050,54.7,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2050,'IND_NF_ALU_KAO_N',2050,137.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_COP_N',2007,10.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_ZNC_N',2007,10.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_EC_N',2007,5.28,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_OTH_ELC_N',2007,0.3,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_OTH_DST_N',2007,0.294,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NF_OTH_NGA_N',2007,0.266,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_CLK_DRY_N',2007,72.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_CLK_DRY_BIO_N',2007,72.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_CLK_WET_N',2007,72.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'IND_NM_CLK_DRYCL_PCCS_N',2020,145.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2020,'IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,145.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_NM_CLK_DRYCL_OCCS_N',2030,87.7,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,87.7,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_CEM_BLN_N',2007,3.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_NM_CEM_AAC_N',2030,230.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2030,'IND_NM_CEM_BEL_N',2030,75.8,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_LIM_LRK_N',2007,19.9,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_GLS_FOSS_N',2007,26.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_GLS_ELEC_N',2007,26.5,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_NM_CRM_N',2007,15.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PUL_KRF_N',2007,40.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PUL_SUL_N',2007,40.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PUL_MEC_N',2007,15.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PUL_SCH_N',2007,28.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PUL_REC_N',2007,30.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PAP_N',2007,89.0,'MEUR/(Mt/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PH_HFO_N',2007,5.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_PP_PH_NGA_N',2007,5.0,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_OTH_OTH_ELC_N',2007,0.01,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_OTH_PH_DST_N',2007,0.85,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_OTH_PH_HFO_N',2007,0.85,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_OTH_PH_LPG_N',2007,0.5,'MEUR/(PJ/year)','');
INSERT INTO "cost_fixed" VALUES('IT',2007,'IND_OTH_PH_NGA_N',2007,0.2,'MEUR/(PJ/year)','');

CREATE TABLE cost_invest (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "cost_invest" VALUES('IT','IND_FT_HET',2007,5.07,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_FT_NGA',2007,20.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_FT_H2',2014,30.29,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_MD_DST_N',2007,19.25,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_MD_LPG_N',2007,19.25,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_MD_NGA_N',2007,23.1,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_MD_ELC_N',2007,0.75,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_MD_ELC_N',2016,4.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_BFG_N',2007,5.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_BIO_N',2007,18.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_COA_N',2007,15.2,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_COG_N',2007,5.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_DST_N',2007,5.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_ETH_N',2007,4.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_HET_N',2007,4.7,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_HFO_N',2007,5.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_LPG_N',2007,3.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_NGA_N',2007,4.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_STM_PTC_N',2007,15.2,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_NAPSC_N',2007,857.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_NAPSC_N',2030,664.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_ETHSC_N',2007,620.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_ETHSC_N',2030,372.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_GSOSC_N',2007,970.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_LPGSC_N',2007,792.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_LPGSC_N',2030,500.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_NCC_N',2020,1360.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_HVC_BDH_N',2020,1330.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OLF_PDH_N',2010,1690.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OLF_MTO_N',2007,476.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_NGASR_N',2007,83.5,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_NGASR_N',2030,69.4,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_NGASR_CCS_N',2025,90.3,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_NAPPOX_N',2007,128.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_NAPPOX_N',2030,112.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_COAGSF_N',2007,825.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_COAGSF_N',2030,711.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_BIOGSF_N',2025,2220.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_AMM_ELCSYS_N',2025,104.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_NGASR_N',2007,73.8,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_NGASR_CCS_N',2025,79.8,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_COGSR_N',2007,45.4,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_LPGSR_N',2007,75.6,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_COAGSF_N',2007,109.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_BIOGSF_N',2025,710.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_ELCSYS_N',2025,44.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_ELCSYS_N',2030,26.5,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_MTH_ELCSYS_N',2050,14.2,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_MERC_N',2007,476.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_MERC_N',2030,367.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_DIAP_N',2007,476.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_DIAP_N',2030,367.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_MEMB_N',2007,476.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_CHL_MEMB_N',2030,367.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_EC_N',2007,10.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_COK_N',2007,3.09,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_DST_N',2007,2.95,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_ELC_N',2007,10.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_ETH_N',2007,3.09,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_HFO_N',2007,3.1,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CH_OTH_NGA_N',2007,2.6,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_BFBOF_N',2007,128.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',2030,178.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',2050,131.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,144.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_DRI_DRIEAF_N',2007,458.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,495.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_DRI_HDREAF_N',2030,634.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_HISBOF_N',2025,440.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N',2030,493.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_ULCOWIN_N',2030,6940.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_ULCOLYSIS_N',2030,6720.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N',2030,495.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_AMN_BAY_N',2007,1560.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ALU_HLH_N',2007,4410.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ALU_SEC_N',2007,1260.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ALU_HLHIA_N',2030,3870.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ALU_CBT_N',2050,1300.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ALU_KAO_N',2050,1560.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_COP_N',2007,4400.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_ZNC_N',2007,2000.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_EC_N',2007,81.5,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_OTH_ELC_N',2007,3.15,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_OTH_ELC_N',2040,4.09,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_OTH_DST_N',2007,2.94,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NF_OTH_NGA_N',2007,2.66,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRY_N',2007,349.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRY_BIO_N',2007,349.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_WET_N',2007,349.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N',2020,740.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,740.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,434.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,434.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CEM_BLN_N',2007,12.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CEM_AAC_N',2030,1100.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CEM_BEL_N',2030,361.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_LIM_LRK_N',2007,398.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_GLS_FOSS_N',2007,332.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_GLS_ELEC_N',2007,332.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_NM_CRM_N',2007,125.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PUL_KRF_N',2007,1360.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PUL_SUL_N',2007,1360.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PUL_MEC_N',2007,300.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PUL_SCH_N',2007,828.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PUL_REC_N',2007,642.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PAP_N',2007,1800.0,'MEUR/(Mt)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PH_HFO_N',2007,74.1,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_PP_PH_NGA_N',2007,74.1,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2007,1100.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2014,1050.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2022,1030.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_CI_N',2030,945.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_TG_N',2007,800.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_NGA_TV_N',2007,1500.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2014,2100.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2022,2060.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2030,1890.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_CHP_BLQ_CI_N',2050,1800.0,'MEUR/(GW)','');
INSERT INTO "cost_invest" VALUES('IT','IND_OTH_OTH_ELC_N',2007,12.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_OTH_PH_DST_N',2007,10.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_OTH_PH_HFO_N',2007,8.25,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_OTH_PH_LPG_N',2007,6.0,'MEUR/(PJ)','');
INSERT INTO "cost_invest" VALUES('IT','IND_OTH_PH_NGA_N',2007,5.0,'MEUR/(PJ)','');

CREATE TABLE cost_variable (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL REFERENCES time_period(period),
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    cost    REAL,
    units   TEXT,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_ELC',2006,17.78,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_HET',2006,5.0,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_BFG',2006,0.83,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_BIO',2006,0.73,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_COA',2006,2.0,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_FT_COG',2007,1.55,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_COK',2006,2.0,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_ETH',2006,1.55,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_HFO',2006,5.859999999999999,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_LPG',2006,1.55,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_NAP',2006,5.859999999999999,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_NGA',2006,1.4100000000000001,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_OIL',2006,5.859999999999999,'MEUR/(PJ)','Distribution + Excise');
INSERT INTO "cost_variable" VALUES('IT',2006,'IND_FT_PTC',2006,1.55,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_FT_H2',2014,0.32,'MEUR/(PJ)','Distribution');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_CI_N',2007,4.17,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_NGA_CI_N',2014,3.75,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_NGA_CI_N',2022,3.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'IND_CHP_NGA_CI_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_TG_N',2007,1.67,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_NGA_TG_N',2014,1.53,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_NGA_TG_N',2022,1.39,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2007,'IND_CHP_NGA_TV_N',2007,1.39,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2014,'IND_CHP_BLQ_CI_N',2014,3.75,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2022,'IND_CHP_BLQ_CI_N',2022,3.22,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2030,'IND_CHP_BLQ_CI_N',2030,2.78,'MEUR/(PJ)','');
INSERT INTO "cost_variable" VALUES('IT',2050,'IND_CHP_BLQ_CI_N',2050,2.5,'MEUR/(PJ)','');

CREATE TABLE currency (
    curr   TEXT,
    value  REAL,
    ref    TEXT,
    units  TEXT,
    notes  TEXT,
    PRIMARY KEY(curr)
);
INSERT INTO "currency" VALUES('EUR00',1.45,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR01',1.4,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR02',1.36,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR03',1.33,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR04',1.3,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR05',1.27,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR06',1.24,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR07',1.21,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR08',1.17,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR09',1.16,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR10',1.14,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR11',1.11,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR12',1.08,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR13',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR14',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR15',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR16',1.06,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR17',1.04,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR18',1.02,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR19',1.01,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR20',1.0,'REF',NULL,NULL);
INSERT INTO "currency" VALUES('EUR21',0.97,'',NULL,NULL);
INSERT INTO "currency" VALUES('EUR22',0.92,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD00',1.57,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD06',0.98,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD07',0.88,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD08',0.79,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD10',0.85,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD11',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD12',0.83,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD13',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD14',0.8,'',NULL,NULL);
INSERT INTO "currency" VALUES('USD16',0.95,'',NULL,NULL);

CREATE TABLE currency_tech (
    tech   TEXT REFERENCES technology(tech),
    curr   TEXT REFERENCES currency(curr),
    notes  TEXT,
    PRIMARY KEY(tech)
);
INSERT INTO "currency_tech" VALUES('IND_FT_H2','EUR12',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_NAPSC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_ETHSC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_GSOSC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_LPGSC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_NCC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_BDH_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_HVC_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OLF_PDH_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OLF_MTO_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_NGASR_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_NGASR_CCS_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_NAPPOX_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_COAGSF_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_BIOGSF_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_AMM_ELCSYS_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_NGASR_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_NGASR_CCS_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_COGSR_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_LPGSR_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_COAGSF_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_BIOGSF_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_MTH_ELCSYS_N','USD16',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_CHL_MERC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_CHL_DIAP_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_CHL_MEMB_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_EC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_BIO_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_COA_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_DST_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_ETH_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_LPG_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_MTH_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_NAP_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_FS_NGA_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_COK_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_DST_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_ELC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_ETH_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_HFO_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_CH_OTH_NGA_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_BFBOF_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_BFBOF_CCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_BFTGRBOF_CCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_DRI_DRIEAF_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_DRI_DRIEAF_CCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_DRI_HDREAF_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_HISBOF_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_HISBOF_CCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_ULCOWIN_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_ULCOLYSIS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_IS_BOF_ULCORED_CCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_AMN_BAY_N','USD12',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ALU_HLH_N','USD11',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ALU_SEC_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ALU_HLHIA_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ALU_CBT_N','USD13',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ALU_KAO_N','USD12',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_COP_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_ZNC_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_EC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_OTH_ELC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_OTH_DST_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_NF_OTH_NGA_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRY_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRY_BIO_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_WET_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRYCL_PCCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRYCL_PCCS_BIO_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRYCL_OCCS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CLK_DRYCL_OCCS_BIO_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CEM_BLN_N','USD11',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CEM_AAC_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CEM_BEL_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_LIM_LRK_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_GLS_FOSS_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_GLS_ELEC_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_CRM_N','USD06',NULL);
INSERT INTO "currency_tech" VALUES('IND_NM_EC_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PUL_KRF_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PUL_SUL_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PUL_MEC_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PUL_SCH_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PUL_REC_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PAP_N','USD10',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PH_HFO_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_PP_PH_NGA_N','USD00',NULL);
INSERT INTO "currency_tech" VALUES('IND_OTH_PH_DST_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_OTH_PH_HFO_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_OTH_PH_LPG_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_OTH_PH_NGA_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_OTH_OTH_ELC_N','USD08',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_CI_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_TG_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_NGA_TV_N','EUR09',NULL);
INSERT INTO "currency_tech" VALUES('IND_CHP_BLQ_CI_N','EUR09',NULL);

CREATE TABLE demand (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    commodity TEXT REFERENCES commodity(name),
    demand    REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, commodity)
);
INSERT INTO "demand" VALUES('IT',2006,'IND_CH',20.69,'Mt','');
INSERT INTO "demand" VALUES('IT',2007,'IND_CH',23.41,'Mt','');
INSERT INTO "demand" VALUES('IT',2008,'IND_CH',19.52,'Mt','');
INSERT INTO "demand" VALUES('IT',2010,'IND_CH',17.92,'Mt','');
INSERT INTO "demand" VALUES('IT',2012,'IND_CH',17.91,'Mt','');
INSERT INTO "demand" VALUES('IT',2014,'IND_CH',15.49,'Mt','');
INSERT INTO "demand" VALUES('IT',2016,'IND_CH',16.01,'Mt','');
INSERT INTO "demand" VALUES('IT',2018,'IND_CH',16.59,'Mt','');
INSERT INTO "demand" VALUES('IT',2020,'IND_CH',15.92,'Mt','');
INSERT INTO "demand" VALUES('IT',2022,'IND_CH',16.63,'Mt','');
INSERT INTO "demand" VALUES('IT',2025,'IND_CH',16.59,'Mt','');
INSERT INTO "demand" VALUES('IT',2030,'IND_CH',16.52,'Mt','');
INSERT INTO "demand" VALUES('IT',2035,'IND_CH',16.49,'Mt','');
INSERT INTO "demand" VALUES('IT',2040,'IND_CH',16.59,'Mt','');
INSERT INTO "demand" VALUES('IT',2045,'IND_CH',16.86,'Mt','');
INSERT INTO "demand" VALUES('IT',2050,'IND_CH',17.17,'Mt','');
INSERT INTO "demand" VALUES('IT',2006,'IND_IS',31.63,'Mt','');
INSERT INTO "demand" VALUES('IT',2007,'IND_IS',31.55,'Mt','');
INSERT INTO "demand" VALUES('IT',2008,'IND_IS',30.59,'Mt','');
INSERT INTO "demand" VALUES('IT',2010,'IND_IS',24.78,'Mt','');
INSERT INTO "demand" VALUES('IT',2012,'IND_IS',25.67,'Mt','');
INSERT INTO "demand" VALUES('IT',2014,'IND_IS',22.87,'Mt','');
INSERT INTO "demand" VALUES('IT',2016,'IND_IS',23.72,'Mt','');
INSERT INTO "demand" VALUES('IT',2018,'IND_IS',24.65,'Mt','');
INSERT INTO "demand" VALUES('IT',2020,'IND_IS',22.39,'Mt','');
INSERT INTO "demand" VALUES('IT',2022,'IND_IS',24.41,'Mt','');
INSERT INTO "demand" VALUES('IT',2025,'IND_IS',24.17,'Mt','');
INSERT INTO "demand" VALUES('IT',2030,'IND_IS',23.73,'Mt','');
INSERT INTO "demand" VALUES('IT',2035,'IND_IS',23.32,'Mt','');
INSERT INTO "demand" VALUES('IT',2040,'IND_IS',23.07,'Mt','');
INSERT INTO "demand" VALUES('IT',2045,'IND_IS',23.0,'Mt','');
INSERT INTO "demand" VALUES('IT',2050,'IND_IS',23.06,'Mt','');
INSERT INTO "demand" VALUES('IT',2006,'IND_NF',4.28,'Mt','');
INSERT INTO "demand" VALUES('IT',2007,'IND_NF',4.27,'Mt','');
INSERT INTO "demand" VALUES('IT',2008,'IND_NF',4.12,'Mt','');
INSERT INTO "demand" VALUES('IT',2010,'IND_NF',2.33,'Mt','');
INSERT INTO "demand" VALUES('IT',2012,'IND_NF',2.19,'Mt','');
INSERT INTO "demand" VALUES('IT',2014,'IND_NF',2.78,'Mt','');
INSERT INTO "demand" VALUES('IT',2016,'IND_NF',3.31,'Mt','');
INSERT INTO "demand" VALUES('IT',2018,'IND_NF',3.39,'Mt','');
INSERT INTO "demand" VALUES('IT',2020,'IND_NF',3.36,'Mt','');
INSERT INTO "demand" VALUES('IT',2022,'IND_NF',3.35,'Mt','');
INSERT INTO "demand" VALUES('IT',2025,'IND_NF',3.32,'Mt','');
INSERT INTO "demand" VALUES('IT',2030,'IND_NF',3.27,'Mt','');
INSERT INTO "demand" VALUES('IT',2035,'IND_NF',3.23,'Mt','');
INSERT INTO "demand" VALUES('IT',2040,'IND_NF',3.23,'Mt','');
INSERT INTO "demand" VALUES('IT',2045,'IND_NF',3.27,'Mt','');
INSERT INTO "demand" VALUES('IT',2050,'IND_NF',3.32,'Mt','');
INSERT INTO "demand" VALUES('IT',2006,'IND_NM',62.79,'Mt','');
INSERT INTO "demand" VALUES('IT',2007,'IND_NM',62.98,'Mt','');
INSERT INTO "demand" VALUES('IT',2008,'IND_NM',62.7,'Mt','');
INSERT INTO "demand" VALUES('IT',2010,'IND_NM',49.36,'Mt','');
INSERT INTO "demand" VALUES('IT',2012,'IND_NM',45.0,'Mt','');
INSERT INTO "demand" VALUES('IT',2014,'IND_NM',43.92,'Mt','');
INSERT INTO "demand" VALUES('IT',2016,'IND_NM',39.71,'Mt','');
INSERT INTO "demand" VALUES('IT',2018,'IND_NM',38.46,'Mt','');
INSERT INTO "demand" VALUES('IT',2020,'IND_NM',38.78,'Mt','');
INSERT INTO "demand" VALUES('IT',2022,'IND_NM',38.78,'Mt','');
INSERT INTO "demand" VALUES('IT',2025,'IND_NM',38.81,'Mt','');
INSERT INTO "demand" VALUES('IT',2030,'IND_NM',38.95,'Mt','');
INSERT INTO "demand" VALUES('IT',2035,'IND_NM',39.09,'Mt','');
INSERT INTO "demand" VALUES('IT',2040,'IND_NM',39.39,'Mt','');
INSERT INTO "demand" VALUES('IT',2045,'IND_NM',39.98,'Mt','');
INSERT INTO "demand" VALUES('IT',2050,'IND_NM',40.58,'Mt','');
INSERT INTO "demand" VALUES('IT',2006,'IND_PP',10.01,'Mt','');
INSERT INTO "demand" VALUES('IT',2007,'IND_PP',10.11,'Mt','');
INSERT INTO "demand" VALUES('IT',2008,'IND_PP',9.47,'Mt','');
INSERT INTO "demand" VALUES('IT',2010,'IND_PP',8.87,'Mt','');
INSERT INTO "demand" VALUES('IT',2012,'IND_PP',8.56,'Mt','');
INSERT INTO "demand" VALUES('IT',2014,'IND_PP',8.74,'Mt','');
INSERT INTO "demand" VALUES('IT',2016,'IND_PP',8.61,'Mt','');
INSERT INTO "demand" VALUES('IT',2018,'IND_PP',8.71,'Mt','');
INSERT INTO "demand" VALUES('IT',2020,'IND_PP',8.73,'Mt','');
INSERT INTO "demand" VALUES('IT',2022,'IND_PP',8.71,'Mt','');
INSERT INTO "demand" VALUES('IT',2025,'IND_PP',8.69,'Mt','');
INSERT INTO "demand" VALUES('IT',2030,'IND_PP',8.67,'Mt','');
INSERT INTO "demand" VALUES('IT',2035,'IND_PP',8.65,'Mt','');
INSERT INTO "demand" VALUES('IT',2040,'IND_PP',8.65,'Mt','');
INSERT INTO "demand" VALUES('IT',2045,'IND_PP',8.69,'Mt','');
INSERT INTO "demand" VALUES('IT',2050,'IND_PP',8.73,'Mt','');
INSERT INTO "demand" VALUES('IT',2006,'IND_OTH',467.38,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'IND_OTH',459.15,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'IND_OTH',447.25,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'IND_OTH',373.03,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'IND_OTH',342.35,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'IND_OTH',359.1,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'IND_OTH',383.29,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'IND_OTH',392.61,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'IND_OTH',394.39,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'IND_OTH',396.06,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'IND_OTH',397.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'IND_OTH',394.77,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'IND_OTH',391.09,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'IND_OTH',388.39,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'IND_OTH',387.68,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'IND_OTH',388.18,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'IND_OTH_NEU',160.47,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'IND_OTH_NEU',159.23,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'IND_OTH_NEU',165.69,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'IND_OTH_NEU',151.8,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'IND_OTH_NEU',129.77,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'IND_OTH_NEU',124.56,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'IND_OTH_NEU',129.22,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'IND_OTH_NEU',130.2,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'IND_OTH_NEU',130.28,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'IND_OTH_NEU',130.09,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'IND_OTH_NEU',129.84,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'IND_OTH_NEU',129.29,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'IND_OTH_NEU',128.92,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'IND_OTH_NEU',129.23,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'IND_OTH_NEU',130.45,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'IND_OTH_NEU',131.77,'PJ','');
INSERT INTO "demand" VALUES('IT',2006,'IND_OTH_NSP',138.37,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'IND_OTH_NSP',143.03,'PJ','');
INSERT INTO "demand" VALUES('IT',2008,'IND_OTH_NSP',136.5,'PJ','');
INSERT INTO "demand" VALUES('IT',2010,'IND_OTH_NSP',120.26,'PJ','');
INSERT INTO "demand" VALUES('IT',2012,'IND_OTH_NSP',116.1,'PJ','');
INSERT INTO "demand" VALUES('IT',2014,'IND_OTH_NSP',119.18,'PJ','');
INSERT INTO "demand" VALUES('IT',2016,'IND_OTH_NSP',125.23,'PJ','');
INSERT INTO "demand" VALUES('IT',2018,'IND_OTH_NSP',128.96,'PJ','');
INSERT INTO "demand" VALUES('IT',2020,'IND_OTH_NSP',130.99,'PJ','');
INSERT INTO "demand" VALUES('IT',2022,'IND_OTH_NSP',132.73,'PJ','');
INSERT INTO "demand" VALUES('IT',2025,'IND_OTH_NSP',134.65,'PJ','');
INSERT INTO "demand" VALUES('IT',2030,'IND_OTH_NSP',136.76,'PJ','');
INSERT INTO "demand" VALUES('IT',2035,'IND_OTH_NSP',138.35,'PJ','');
INSERT INTO "demand" VALUES('IT',2040,'IND_OTH_NSP',140.96,'PJ','');
INSERT INTO "demand" VALUES('IT',2045,'IND_OTH_NSP',145.71,'PJ','');
INSERT INTO "demand" VALUES('IT',2050,'IND_OTH_NSP',150.62,'PJ','');
INSERT INTO "demand" VALUES('IT',2007,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2008,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2010,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2012,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2014,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2016,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2018,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2020,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2022,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2025,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2030,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2035,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2040,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2045,'DMY_OUT',1000000.0,'','');
INSERT INTO "demand" VALUES('IT',2050,'DMY_OUT',1000000.0,'','');

CREATE TABLE demand_specific_distribution (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    demand_name TEXT REFERENCES commodity(name),
    dsd         REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, season, tod, demand_name),
    CHECK(dsd >= 0 AND dsd <= 1)
);

CREATE TABLE driver (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    driver_name TEXT,
    driver      REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, driver_name)
);
INSERT INTO "driver" VALUES('IT',2006,'GDP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'GDP',1.015,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'GDP',1.004,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'GDP',0.965,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'GDP',0.943,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'GDP',0.928,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'GDP',0.947,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'GDP',0.971,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'GDP',0.933,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'GDP',0.98,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'GDP',1.024,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'GDP',1.046,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'GDP',1.065,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'GDP',1.084,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'GDP',1.141,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'GDP',1.198,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PCHEM',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PCHEM',1.005,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PCHEM',0.971,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PCHEM',0.937,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PCHEM',0.887,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PCHEM',0.892,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PCHEM',0.936,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PCHEM',0.998,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PCHEM',0.997,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PCHEM',1.016,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PCHEM',1.046,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PCHEM',1.096,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PCHEM',1.145,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PCHEM',1.194,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PCHEM',1.247,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PCHEM',1.3,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PISNF',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PISNF',0.99,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PISNF',0.898,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PISNF',0.822,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PISNF',0.73,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PISNF',0.718,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PISNF',0.751,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PISNF',0.781,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PISNF',0.746,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PISNF',0.753,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PISNF',0.763,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PISNF',0.78,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PISNF',0.796,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PISNF',0.812,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PISNF',0.829,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PISNF',0.846,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PIS',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PIS',1.056,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PIS',1.011,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PIS',0.779,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PIS',0.751,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PIS',0.742,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PIS',0.738,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PIS',0.778,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PIS',0.704,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PIS',0.704,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PIS',0.705,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PIS',0.707,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PIS',0.708,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PIS',0.709,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PIS',0.71,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PIS',0.712,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PNM',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PNM',1.028,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PNM',0.967,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PNM',0.787,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PNM',0.721,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PNM',0.706,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PNM',0.742,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PNM',0.759,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PNM',0.706,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PNM',0.727,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PNM',0.758,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PNM',0.815,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PNM',0.871,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PNM',0.927,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PNM',0.99,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PNM',1.054,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'PLP',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'PLP',1.029,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'PLP',0.97,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'PLP',0.918,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'PLP',0.883,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'PLP',0.904,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'PLP',0.939,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'PLP',0.917,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'PLP',0.914,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'PLP',0.931,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'PLP',0.956,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'PLP',1.001,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'PLP',1.044,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'PLP',1.087,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'PLP',1.134,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'PLP',1.181,NULL,'');
INSERT INTO "driver" VALUES('IT',2006,'POI',1.0,NULL,'');
INSERT INTO "driver" VALUES('IT',2007,'POI',1.028,NULL,'');
INSERT INTO "driver" VALUES('IT',2008,'POI',0.994,NULL,'');
INSERT INTO "driver" VALUES('IT',2010,'POI',0.86,NULL,'');
INSERT INTO "driver" VALUES('IT',2012,'POI',0.81,NULL,'');
INSERT INTO "driver" VALUES('IT',2014,'POI',0.783,NULL,'');
INSERT INTO "driver" VALUES('IT',2016,'POI',0.809,NULL,'');
INSERT INTO "driver" VALUES('IT',2018,'POI',0.851,NULL,'');
INSERT INTO "driver" VALUES('IT',2020,'POI',0.8,NULL,'');
INSERT INTO "driver" VALUES('IT',2022,'POI',0.808,NULL,'');
INSERT INTO "driver" VALUES('IT',2025,'POI',0.82,NULL,'');
INSERT INTO "driver" VALUES('IT',2030,'POI',0.841,NULL,'');
INSERT INTO "driver" VALUES('IT',2035,'POI',0.86,NULL,'');
INSERT INTO "driver" VALUES('IT',2040,'POI',0.879,NULL,'');
INSERT INTO "driver" VALUES('IT',2045,'POI',0.9,NULL,'');
INSERT INTO "driver" VALUES('IT',2050,'POI',0.92,NULL,'');

CREATE TABLE efficiency (
    region      TEXT,
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, input_comm, tech, vintage, output_comm),
    CHECK(efficiency > 0)
);
INSERT INTO "efficiency" VALUES('IT','GAS_BFG','IND_FT_BFG',2006,'IND_BFG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_FT_BIO',2006,'IND_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_GAS','IND_FT_BIO',2006,'IND_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_BMU','IND_FT_BIO',2006,'IND_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_BIN','IND_FT_BIO',2006,'IND_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_LIQ','IND_FT_BIO',2006,'IND_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','IND_FT_COA',2006,'IND_COA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_COG','IND_FT_COG',2007,'IND_COG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_OVC','IND_FT_COK',2006,'IND_COK',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_DST','IND_FT_ELC',2006,'IND_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','IND_FT_ELC',2006,'IND_ELC',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC_BP','IND_FT_ELC',2006,'IND_ELC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_RFG','IND_FT_ETH',2006,'IND_ETH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_ETH','IND_FT_ETH',2006,'IND_ETH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GEO','IND_FT_GEO',2007,'IND_GEO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','HET','IND_FT_HET',2006,'IND_HET',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','IND_FT_HFO',2006,'IND_HFO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','IND_FT_HFO',2006,'IND_HFO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_KER','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_JTK','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_DST','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_KER','IND_FT_OIL',2006,'IND_OIL',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','IND_FT_LPG',2006,'IND_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NAP','IND_FT_NAP',2006,'IND_NAP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_NAP','IND_FT_NAP',2006,'IND_NAP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','IND_FT_NAP',2006,'IND_NAP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','IND_FT_NGA',2006,'IND_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_NGA','IND_FT_NGA',2006,'IND_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_METH','IND_FT_NGA',2006,'IND_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_BL','IND_FT_NGA',2020,'IND_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_PTC','IND_FT_PTC',2006,'IND_PTC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2','IND_FT_H2',2014,'IND_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','IND_FT_H2',2014,'IND_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL_SOEC','IND_FT_H2',2014,'IND_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_CEN','IND_FT_H2',2014,'IND_H2',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL','IND_FT_H2E',2014,'IND_H2E',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','H2_EL_SOEC','IND_FT_H2E',2014,'IND_H2E',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_IS_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_NF_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_CH_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_NM_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_PP_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_MD','IND_MD_TECH',2006,'IND_OTH_MD',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_MD_ELC_E',2006,'IND_MD',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_MD_DST_E',2006,'IND_MD',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_IS_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_NF_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_CH_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_NM_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_PP_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_SB','IND_STM_TECH',2006,'IND_OTH_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_SB','IND_STM_BYPROD',2007,'DMY_OUT',1.0,'DMY_OUT/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_STM_BIO_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_STM_DST_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_STM_COA_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_STM_HFO_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_STM_LPG_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_STM_NGA_E',2006,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_STM_HET_E',2006,'IND_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_OLF','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_BTX','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_AMM','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MTH','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_CHL','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_OTH_PROD','IND_CH_TECH',2006,'IND_CH',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_E',2006,'IND_CH_OLF',0.0133,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_BTX_E',2006,'IND_CH_BTX',0.0137,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_E',2006,'IND_CH_AMM',0.0313,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_E',2006,'IND_CH_AMM',0.0313,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_AMM_E',2006,'IND_CH_AMM',0.0313,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_AMM_E',2006,'IND_CH_AMM',0.0313,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_AMM_E',2006,'IND_CH_AMM',0.0313,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_MTH_E',2006,'IND_CH_MTH',0.0286,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_E',2006,'IND_CH_MTH',0.0286,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_MTH_E',2006,'IND_CH_MTH',0.0286,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_MTH_E',2006,'IND_CH_MTH',0.0286,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_E',2006,'IND_CH_MTH',0.0286,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_E',2006,'IND_CH_CHL',0.0778,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_E',2006,'IND_CH_CHL',0.0778,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_E',2006,'IND_CH_CHL',0.0778,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_OTH','IND_CH_OTH_E',2006,'IND_CH_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_OTH','IND_CH_OTH_E',2050,'IND_CH_OTH_PROD',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_EC_E',2006,'IND_CH_EC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COK','IND_CH_OTH_COK_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_OTH_DST_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_OTH_ELC_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_OTH_ETH_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_CH_OTH_HFO_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OTH_NGA_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_CH_OTH_PTC_E',2006,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_BOF','IND_IS_TECH',2006,'IND_IS',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_EAF','IND_IS_TECH',2006,'IND_IS',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_SB','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_OTH','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_IS_BOF_E',2006,'IND_IS_BOF',0.0774,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_SB','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_OTH','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_IS_EAF_E',2006,'IND_IS_EAF',0.23,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_OTH_ELC_E',2006,'IND_IS_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_ALU','IND_NF_TECH',2006,'IND_NF',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_COP','IND_NF_TECH',2006,'IND_NF',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_ZNC','IND_NF_TECH',2006,'IND_NF',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_OTH_PROD','IND_NF_TECH',2006,'IND_NF',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_ALU_E',2006,'IND_NF_ALU',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_E',2006,'IND_NF_ALU',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_E',2006,'IND_NF_ALU',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COK','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_COP_E',2006,'IND_NF_COP',0.0397,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_E',2006,'IND_NF_ZNC',0.0568,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ZNC_E',2006,'IND_NF_ZNC',0.0568,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_ZNC_E',2006,'IND_NF_ZNC',0.0568,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_E',2006,'IND_NF_ZNC',0.0568,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_E',2006,'IND_NF_ZNC',0.0568,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_OTH_E',2006,'IND_NF_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_OTH','IND_NF_OTH_E',2006,'IND_NF_OTH_PROD',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_EC_E',2006,'IND_NF_EC',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_OTH_ELC_E',2006,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NF_OTH_DST_E',2006,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_OTH_NGA_E',2006,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_NF_OTH_LPG_E',2006,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_CMT','IND_NM_TECH',2006,'IND_NM',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_LIM','IND_NM_TECH',2006,'IND_NM',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_GLS','IND_NM_TECH',2006,'IND_NM',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_CRM','IND_NM_TECH',2006,'IND_NM',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_OTH','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',0.389,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_OTH','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',0.216,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_OTH','IND_NM_LIM_E',2006,'IND_NM_LIM',0.145,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_OTH','IND_NM_GLS_E',2006,'IND_NM_GLS',0.0809,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_SB','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_OTH','IND_NM_CRM_E',2006,'IND_NM_CRM',0.0471,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COK','IND_NM_OTH_COK_E',2006,'IND_NM_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_OTH_DST_E',2006,'IND_NM_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_OTH_ELC_E',2006,'IND_NM_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_NM_OTH_LPG_E',2006,'IND_NM_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_OTH_NGA_E',2006,'IND_NM_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PAP','IND_PP_TECH',2006,'IND_PP',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUC','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUM','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUR','IND_PP_PUL_TECH',2007,'IND_PP_PUL',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',0.0724,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',0.0724,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_CHEM_E',2006,'IND_PP_PUC',0.0724,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_E',2006,'IND_PP_SB',0.54,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_E',2006,'IND_PP_PUM',0.54,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',0.682,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_DH','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',0.682,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',0.682,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_OTH','IND_PP_PUL_REC_E',2006,'IND_PP_PUR',0.682,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PAP_E',2006,'IND_PP_PAP',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_DH','IND_PP_PAP_E',2006,'IND_PP_PAP',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PAP_E',2006,'IND_PP_PAP',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_OTH','IND_PP_PAP_E',2006,'IND_PP_PAP',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUL','IND_PP_PAP_E',2006,'IND_PP_PAP',0.103,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_PP_PH_HFO_E',2006,'IND_PP_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_PP_PH_HFO_E',2006,'IND_PP_DH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_PP_PH_DST_E',2006,'IND_PP_DH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_PP_PH_NGA_E',2006,'IND_PP_DH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_PP_PH_ELC_E',2006,'IND_PP_DH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_PP_OTH_DST_E',2006,'IND_PP_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_PP_OTH_ELC_E',2006,'IND_PP_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_PP_OTH_LPG_E',2006,'IND_PP_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_SB','IND_OTH_TECH',2007,'IND_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_PH','IND_OTH_TECH',2007,'IND_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_MD','IND_OTH_TECH',2007,'IND_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_OTH','IND_OTH_TECH',2007,'IND_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_SB','IND_OTH_TECH',2010,'IND_OTH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_PH','IND_OTH_TECH',2010,'IND_OTH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_MD','IND_OTH_TECH',2010,'IND_OTH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_OTH','IND_OTH_TECH',2010,'IND_OTH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_SB','IND_OTH_TECH',2030,'IND_OTH',1.11,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_PH','IND_OTH_TECH',2030,'IND_OTH',1.11,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_MD','IND_OTH_TECH',2030,'IND_OTH',1.11,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_OTH','IND_OTH_TECH',2030,'IND_OTH',1.11,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_SB','IND_OTH_TECH',2050,'IND_OTH',1.18,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_PH','IND_OTH_TECH',2050,'IND_OTH',1.18,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_MD','IND_OTH_TECH',2050,'IND_OTH',1.18,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OTH_OTH','IND_OTH_TECH',2050,'IND_OTH',1.18,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_OTH_PH_DST_E',2006,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_OTH_PH_HFO_E',2006,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_OTH_PH_LPG_E',2006,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_OTH_PH_NGA_E',2006,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_OTH_OTH_ELC_E',2006,'IND_OTH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_GEO','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_ONS_TECH',2006,'IND_OTH_NSP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_GEO','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_ONS_TECH',2010,'IND_OTH_NSP',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_GEO','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_ONS_TECH',2020,'IND_OTH_NSP',1.3,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_GEO','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_ONS_TECH',2050,'IND_OTH_NSP',1.5,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','IND_NEU_TECH',2020,'IND_OTH_NEU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','IND_NEU_TECH',2020,'IND_OTH_NEU',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','IND_NEU_TECH',2050,'IND_OTH_NEU',1.2,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NSP','IND_NEU_TECH',2050,'IND_OTH_NEU',1.2,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_MD_DST_N',2007,'IND_MD',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_MD_DST_N',2050,'IND_MD',0.4,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_MD_LPG_N',2007,'IND_MD',0.38,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_MD_LPG_N',2050,'IND_MD',0.44,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_MD_NGA_N',2007,'IND_MD',0.38,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_MD_NGA_N',2050,'IND_MD',0.44,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_MD_ELC_N',2007,'IND_MD',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_MD_ELC_N',2050,'IND_MD',0.93,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_STM_BFG_N',2007,'IND_SB',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_STM_BFG_N',2050,'IND_SB',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_STM_BIO_N',2007,'IND_SB',0.79,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_STM_BIO_N',2050,'IND_SB',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_STM_COA_N',2007,'IND_SB',0.82,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_STM_COA_N',2050,'IND_SB',0.89,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_STM_COG_N',2007,'IND_SB',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_STM_COG_N',2050,'IND_SB',0.91,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_STM_DST_N',2007,'IND_SB',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_STM_DST_N',2050,'IND_SB',0.91,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_STM_ETH_N',2007,'IND_SB',0.85,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_STM_ETH_N',2050,'IND_SB',0.91,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_STM_HET_N',2007,'IND_SB',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HET','IND_STM_HET_N',2050,'IND_SB',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_STM_HFO_N',2007,'IND_SB',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_STM_HFO_N',2050,'IND_SB',0.9,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_STM_LPG_N',2007,'IND_SB',0.83,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_STM_LPG_N',2050,'IND_SB',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_STM_NGA_N',2007,'IND_SB',0.84,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_STM_NGA_N',2050,'IND_SB',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_STM_PTC_N',2007,'IND_SB',0.81,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PTC','IND_STM_PTC_N',2050,'IND_SB',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',0.0255,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',0.0255,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB',0.0255,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',0.0255,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',0.0255,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC',0.0255,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',0.0366,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',0.0366,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_SB',0.0366,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',0.0366,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',0.0366,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N',2030,'IND_CH_HVC',0.0366,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',0.034,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',0.034,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB',0.034,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',0.034,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',0.034,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC',0.034,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',0.063,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',0.063,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_SB',0.063,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',0.063,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',0.063,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N',2030,'IND_CH_HVC',0.063,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',0.0235,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',0.0235,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB',0.0235,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',0.0235,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',0.0235,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC',0.0235,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',0.0261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',0.0261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_SB',0.0261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',0.0261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',0.0261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_DST','IND_CH_HVC_GSOSC_N',2030,'IND_CH_HVC',0.0261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',0.0258,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',0.0258,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB',0.0258,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',0.0258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',0.0258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC',0.0258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',0.0454,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',0.0454,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_SB',0.0454,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',0.0454,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',0.0454,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N',2030,'IND_CH_HVC',0.0454,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',0.0297,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',0.0297,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_SB',0.0297,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',0.0297,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',0.0297,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC',0.0297,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',0.033,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',0.033,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_SB',0.033,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',0.033,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',0.033,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_HVC_NCC_N',2030,'IND_CH_HVC',0.033,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',0.0105,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',0.0105,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',0.0105,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_BIO','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC',0.0105,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_HVC','IND_CH_HVC_N',2007,'IND_CH_BTX',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_HVC','IND_CH_HVC_N',2007,'IND_CH_OLF',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',0.0144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',0.0144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',0.0144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF',0.0144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',0.0163,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',0.0163,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',0.0163,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_OLF_PDH_N',2030,'IND_CH_OLF',0.0163,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',0.0319,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',0.0319,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF',0.0319,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',0.0319,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',0.0319,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2007,'IND_CH_SB',0.0319,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',0.0355,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',0.0355,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_OLF',0.0355,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',0.0355,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_MTH','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',0.0355,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_OLF_MTO_N',2030,'IND_CH_SB',0.0355,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',0.224,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',0.224,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM',0.224,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',0.224,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',0.224,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB',0.224,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',0.35,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',0.35,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_AMM',0.35,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NGASR_N',2030,'IND_CH_SB',0.35,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',0.226,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',0.226,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',0.226,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',0.226,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',0.226,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',0.226,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_CH_AMM_NGASR_CCS_N_LINKED',2025,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',0.195,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',0.195,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM',0.195,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',0.195,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',0.195,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB',0.195,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',0.261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',0.261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_AMM',0.261,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',0.261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',0.261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_NAPPOX_N',2030,'IND_CH_SB',0.261,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',0.0546,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',0.0546,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM',0.0546,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',0.0546,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',0.0546,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB',0.0546,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',0.0694,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',0.0694,'','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_AMM',0.0694,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',0.0694,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',0.0694,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_COAGSF_N',2030,'IND_CH_SB',0.0694,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',0.0463,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',0.0463,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM',0.0463,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',0.0463,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',0.0463,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB',0.0463,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_H2E','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',0.0248,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM',0.0248,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH',0.1,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',0.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',0.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB',0.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_N',2020,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',0.111,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',0.111,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_CH_MTH_NGASR_CCS_N_LINKED',2025,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',0.124,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',0.124,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH',0.124,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',0.124,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',0.124,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB',0.124,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',0.138,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',0.138,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_MTH',0.138,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COG','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',0.138,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_NGA','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',0.138,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COGSR_N',2030,'IND_CH_SB',0.138,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',0.103,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',0.103,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB',0.103,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',0.115,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',0.115,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_MTH',0.115,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',0.115,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',0.115,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_LPGSR_N',2030,'IND_CH_SB',0.115,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',0.144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',0.144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_MTH',0.144,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',0.144,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',0.144,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_COAGSF_N',2030,'IND_CH_SB',0.144,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_H2E','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',0.0418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH',0.0418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',0.0905,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',0.0905,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL',0.0905,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2007,'IND_H2',0.0905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2007,'IND_H2',0.0905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2007,'IND_H2',0.0905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_CH_CHL',0.13,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MERC_N',2030,'IND_H2',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MERC_N',2030,'IND_H2',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MERC_N',2030,'IND_H2',0.13,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL',0.112,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2007,'IND_H2',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2007,'IND_H2',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2007,'IND_H2',0.112,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',0.162,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',0.162,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_CH_CHL',0.162,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_DIAP_N',2030,'IND_H2',0.162,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_DIAP_N',2030,'IND_H2',0.162,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_DIAP_N',2030,'IND_H2',0.162,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',0.119,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',0.119,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL',0.119,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2007,'IND_H2',0.119,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2007,'IND_H2',0.119,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2007,'IND_H2',0.119,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',0.172,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',0.172,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_CH_CHL',0.172,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_EC','IND_CH_CHL_MEMB_N',2030,'IND_H2',0.172,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_SB','IND_CH_CHL_MEMB_N',2030,'IND_H2',0.172,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_CH_MD','IND_CH_CHL_MEMB_N',2030,'IND_H2',0.172,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_EC_N',2007,'IND_CH_EC',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_EC_N',2020,'IND_CH_EC',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_EC_N',2050,'IND_CH_EC',1.1,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_CH_FS_BIO_N',2007,'IND_CH_FS_BIO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','COA_HCO','IND_CH_FS_COA_N',2007,'IND_CH_FS_HCO',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_DST','IND_CH_FS_DST_N',2007,'IND_CH_FS_DST',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_ETH','IND_CH_FS_ETH_N',2007,'IND_CH_FS_ETH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','SYN_MET','IND_CH_FS_MTH_N',2007,'IND_CH_FS_MTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','GAS_NGA','IND_CH_FS_NGA_N',2007,'IND_CH_FS_NGA',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_LPG','IND_CH_FS_LPG_N',2007,'IND_CH_FS_LPG',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','OIL_NAP','IND_CH_FS_NAP_N',2007,'IND_CH_FS_NAP',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COK','IND_CH_OTH_COK_N',2007,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_CH_OTH_DST_N',2007,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_CH_OTH_ELC_N',2007,'IND_CH_OTH',1.02,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ETH','IND_CH_OTH_ETH_N',2007,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_CH_OTH_HFO_N',2007,'IND_CH_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OTH_NGA_N',2007,'IND_CH_OTH',1.02,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_CH_OTH_NGA_N',2040,'IND_CH_OTH',1.03,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',0.269,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',0.269,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',0.269,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG',0.269,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',0.269,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',0.269,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',0.269,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF',0.269,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',0.305,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',0.305,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',0.305,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_N',2050,'GAS_BFG',0.305,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',0.305,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',0.305,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',0.305,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_N',2050,'IND_IS_BOF',0.305,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',0.268,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',0.268,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',0.268,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',0.268,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',0.268,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',0.268,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',0.268,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',0.268,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',0.268,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',0.268,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',0.303,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',0.303,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',0.303,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',0.303,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',0.303,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',0.303,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',0.303,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',0.303,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',0.303,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',0.303,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_IS_BOF_BFBOF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',0.291,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',0.291,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_IS_BOF_BFTGRBOF_CCS_N_LINKED',2040,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',0.179,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',0.179,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF',0.179,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',0.179,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',0.179,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB',0.179,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',0.199,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',0.199,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_EAF',0.199,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',0.199,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',0.199,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_N',2030,'IND_IS_SB',0.199,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',0.17,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',0.17,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',0.17,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',0.17,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',0.17,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',0.17,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',0.17,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',0.17,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_IS_DRI_DRIEAF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',0.118,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',0.118,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',0.118,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF',0.118,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',0.118,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_H2','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',0.118,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',0.118,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB',0.118,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',0.0732,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',0.0732,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF',0.0732,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',0.0814,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',0.0814,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_HISBOF_N',2030,'IND_IS_BOF',0.0814,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',0.0713,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',0.0713,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',0.0713,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',0.0713,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_IS_BOF_HISBOF_CCS_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',0.064,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',0.064,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF',0.064,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',0.0635,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF',0.0635,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',0.169,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',0.169,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',0.169,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',0.169,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',0.169,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',0.169,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',0.169,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',0.169,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_IS_BOF_ULCORED_CCS_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',0.068,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',0.068,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',0.068,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_AMN_BAY_N',2007,'IND_NF_AMN',0.068,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',0.0962,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',0.0962,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',0.0962,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_AMN_BAY_N',2030,'IND_NF_AMN',0.0962,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_AMN','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',0.0187,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',0.0187,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU',0.0187,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_AMN','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',0.0208,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',0.0208,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_HLH_N',2030,'IND_NF_ALU',0.0208,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',0.232,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',0.232,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU',0.232,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',0.258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',0.258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_SEC_N',2030,'IND_NF_ALU',0.258,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_AMN','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',0.0236,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',0.0236,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU',0.0236,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_AMN','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',0.0263,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',0.0263,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU',0.0263,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ALU_KAO_N',2050,'IND_NF_ALU',0.0198,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_COP_N',2007,'IND_NF_COP',0.0613,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_COP_N',2007,'IND_NF_COP',0.0613,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NF_COP_N',2007,'IND_NF_COP',0.0613,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NF_COP_N',2007,'IND_NF_COP',0.0613,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_COP_N',2007,'IND_NF_COP',0.0613,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NF_COP_N',2030,'IND_NF_COP',0.0681,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_COP_N',2030,'IND_NF_COP',0.0681,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NF_COP_N',2030,'IND_NF_COP',0.0681,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NF_COP_N',2030,'IND_NF_COP',0.0681,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_COP_N',2030,'IND_NF_COP',0.0681,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_N',2007,'IND_NF_ZNC',0.0566,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_N',2007,'IND_NF_ZNC',0.0566,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_N',2007,'IND_NF_ZNC',0.0566,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_N',2010,'IND_NF_ZNC',0.0581,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_N',2010,'IND_NF_ZNC',0.0581,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_N',2010,'IND_NF_ZNC',0.0581,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_N',2030,'IND_NF_ZNC',0.0616,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_N',2030,'IND_NF_ZNC',0.0616,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_N',2030,'IND_NF_ZNC',0.0616,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_N',2040,'IND_NF_ZNC',0.0652,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_N',2040,'IND_NF_ZNC',0.0652,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_N',2040,'IND_NF_ZNC',0.0652,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_EC','IND_NF_ZNC_N',2050,'IND_NF_ZNC',0.0734,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_SB','IND_NF_ZNC_N',2050,'IND_NF_ZNC',0.0734,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NF_MD','IND_NF_ZNC_N',2050,'IND_NF_ZNC',0.0734,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_EC_N',2007,'IND_NF_EC',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_EC_N',2020,'IND_NF_EC',1.04,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_EC_N',2050,'IND_NF_EC',1.06,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_OTH_ELC_N',2007,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NF_OTH_ELC_N',2040,'IND_NF_OTH',1.03,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NF_OTH_DST_N',2007,'IND_NF_OTH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NF_OTH_NGA_N',2007,'IND_NF_OTH',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',0.418,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',0.154,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',0.154,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',0.154,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',0.154,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',0.154,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',0.171,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',0.171,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',0.171,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',0.171,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',0.171,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_NM_CLK_DRYCL_PCCS_N_LINKED',2020,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',0.391,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED',2020,'SNK_IND_CO2',0.391,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_NM_CLK_DRYCL_OCCS_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',0.376,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED',2030,'SNK_IND_CO2',1.0,'kt/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_CLK','IND_NM_CEM_BLN_N',2007,'IND_NM_CMT',1.0,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',0.833,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',0.833,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',0.833,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',0.833,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT',0.833,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',0.254,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',0.254,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',0.254,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',0.254,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT',0.254,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',0.206,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',0.206,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',0.206,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',0.206,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM',0.206,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_COA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',0.229,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',0.229,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',0.229,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_BIO','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',0.229,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_LIM_LRK_N',2030,'IND_NM_LIM',0.229,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',0.0625,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',0.0625,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS',0.0625,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',0.0694,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',0.0694,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_GLS_FOSS_N',2030,'IND_NM_GLS',0.0694,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_GLS_ELEC_N',2007,'IND_NM_GLS',0.0926,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_GLS_ELEC_N',2007,'IND_NM_GLS',0.0926,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_NM_GLS_ELEC_N',2030,'IND_NM_GLS',0.103,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CRM_N',2007,'IND_NM_CRM',0.381,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CRM_N',2007,'IND_NM_CRM',0.381,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_NM_CRM_N',2030,'IND_NM_CRM',0.424,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NM_EC','IND_NM_CRM_N',2030,'IND_NM_CRM',0.424,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_NM_EC_N',2007,'IND_NM_EC',1.04,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2007,'BIO_BIN',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC',1.08,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2030,'BIO_BIN',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2030,'IND_ELC_BP',1.19,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_KRF_N',2030,'IND_PP_PUC',1.19,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'BIO_BIN',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'BIO_BIN',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'BIO_BIN',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2007,'BIO_BIN',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'BIO_BIN',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'BIO_BIN',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'BIO_BIN',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2030,'BIO_BIN',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2030,'IND_ELC_BP',0.94,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PH','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',0.94,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',0.94,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',0.94,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SUL_N',2030,'IND_PP_PUC',0.94,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2007,'IND_PP_PUM',0.399,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_MEC_N',2007,'IND_PP_PUM',0.399,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2007,'IND_PP_SB',0.399,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_MEC_N',2007,'IND_PP_SB',0.399,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_MEC_N',2030,'IND_PP_PUM',0.86,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_MEC_N',2030,'IND_PP_SB',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',0.196,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',0.196,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM',0.196,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','BIO_SLB','IND_PP_PUL_SCH_N',2030,'IND_PP_PUM',0.212,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_REC_N',2007,'IND_PP_PUR',0.769,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_REC_N',2007,'IND_PP_PUR',0.769,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',0.855,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PUL_REC_N',2030,'IND_PP_PUR',0.855,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUL','IND_PP_PAP_N',2007,'IND_PP_PAP',0.139,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PAP_N',2007,'IND_PP_PAP',0.139,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PAP_N',2007,'IND_PP_PAP',0.139,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_PUL','IND_PP_PAP_N',2030,'IND_PP_PAP',0.155,'Mt/(Mt)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_MD','IND_PP_PAP_N',2030,'IND_PP_PAP',0.155,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_PP_SB','IND_PP_PAP_N',2030,'IND_PP_PAP',0.155,'Mt/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_PP_PH_HFO_N',2007,'IND_PP_PH',0.91,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_PP_PH_HFO_N',2030,'IND_PP_PH',0.98,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_PP_PH_NGA_N',2007,'IND_PP_PH',0.89,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_PP_PH_NGA_N',2050,'IND_PP_PH',0.95,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_OTH_OTH_ELC_N',2007,'IND_OTH_OTH',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_OTH_OTH_ELC_N',2016,'IND_OTH_OTH',1.03,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_OTH_OTH_ELC_N',2025,'IND_OTH_OTH',1.05,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_ELC','IND_OTH_OTH_ELC_N',2050,'IND_OTH_OTH',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_OIL','IND_OTH_PH_DST_N',2007,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_OTH_PH_HFO_N',2007,'IND_OTH_PH',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_OTH_PH_HFO_N',2040,'IND_OTH_PH',1.01,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_HFO','IND_OTH_PH_HFO_N',2050,'IND_OTH_PH',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_OTH_PH_LPG_N',2007,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_LPG','IND_OTH_PH_LPG_N',2050,'IND_OTH_PH',1.02,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_OTH_PH_NGA_N',2007,'IND_OTH_PH',1.0,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_OTH_PH_NGA_N',2025,'IND_OTH_PH',1.08,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_OTH_PH_NGA_N',2030,'IND_OTH_PH',1.15,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','IND_NGA','IND_OTH_PH_NGA_N',2050,'IND_OTH_PH',1.2,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'ELC_DST',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'ELC_DST',0.825,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'ELC_DST',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'ELC_DST',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'ELC_DST',0.907,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'ELC_DST',0.74,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'ELC_DST',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'ELC_DST',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'ELC_DST',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'ELC_DST',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'ELC_DST',0.76,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'ELC_DST',0.774,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'ELC_DST',0.79,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'ELC_DST',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'ELC_DST',0.905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'ELC_DST',0.923,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'ELC_DST',0.931,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'IND_HET',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'IND_HET',0.825,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'IND_HET',0.86,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'IND_HET',0.88,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'IND_HET',0.907,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'IND_HET',0.74,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'IND_HET',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'IND_HET',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'IND_HET',0.8,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'IND_HET',0.75,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'IND_HET',0.76,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'IND_HET',0.774,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'IND_HET',0.79,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'IND_HET',0.87,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'IND_HET',0.905,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'IND_HET',0.923,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'IND_HET',0.931,'PJ/(PJ)','');
INSERT INTO "efficiency" VALUES('IT','ethos','DMY_OUT_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','SNK_IND_CO2','DMY_OUT_TECH',2007,'DMY_OUT',1.0,'DMY_OUT/(kt)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_COP',2007,'COP',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.0,'t/(ethos)','');
INSERT INTO "efficiency" VALUES('IT','ethos','MAT_SUP_TIT',2007,'TIT',1.0,'t/(ethos)','');

CREATE TABLE efficiency_variable (
    region      TEXT,
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    notes       TEXT,
    PRIMARY KEY(region, season, tod, input_comm, tech, vintage, output_comm),
    CHECK(efficiency > 0)
);

CREATE TABLE elasticity (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    demand_comm TEXT REFERENCES commodity(name),
    elasticity  REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, period, demand_comm)
);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_CH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_CH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_CH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_CH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_CH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_CH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_CH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_CH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_CH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_CH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_CH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_CH',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_CH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_CH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_CH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_IS',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_IS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_IS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_IS',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_IS',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_IS',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_IS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_IS',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_IS',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_IS',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_IS',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_IS',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_IS',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_IS',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_IS',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_PP',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_PP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_PP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_PP',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_PP',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_PP',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_PP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_PP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_PP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_PP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_PP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_PP',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_PP',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_PP',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_PP',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_NF',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_NM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_NM',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_NM',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_NM',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_NM',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_NM',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_NM',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_NM',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_NM',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_NM',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_NM',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_NM',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_NM',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_NM',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_NM',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_OTH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_OTH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_OTH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_OTH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_OTH',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_OTH',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_OTH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_OTH',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_OTH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_OTH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_OTH',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_OTH',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_OTH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_OTH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_OTH',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_OTH_NEU',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_OTH_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_OTH_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_OTH_NEU',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_OTH_NEU',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_OTH_NEU',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_OTH_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_OTH_NEU',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_OTH_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_OTH_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_OTH_NEU',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_OTH_NEU',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_OTH_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_OTH_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_OTH_NEU',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2007,'IND_OTH_NSP',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2008,'IND_OTH_NSP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2010,'IND_OTH_NSP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2012,'IND_OTH_NSP',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2014,'IND_OTH_NSP',0.8,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2016,'IND_OTH_NSP',1.5,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2018,'IND_OTH_NSP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2020,'IND_OTH_NSP',1.0,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2022,'IND_OTH_NSP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2025,'IND_OTH_NSP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2030,'IND_OTH_NSP',0.375,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2035,'IND_OTH_NSP',0.313,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2040,'IND_OTH_NSP',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2045,'IND_OTH_NSP',0.25,NULL,NULL);
INSERT INTO "elasticity" VALUES('IT',2050,'IND_OTH_NSP',0.25,NULL,NULL);

CREATE TABLE emission_activity (
    region      TEXT,
    emis_comm   TEXT REFERENCES commodity(name),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    activity    REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, emis_comm, input_comm, tech, vintage, output_comm)
);
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','BIO_METH','IND_FT_NGA',2007,'IND_NGA',-56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','H2_BL','IND_FT_NGA',2020,'IND_NGA',-56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.1,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','GAS_NGA','IND_CH_FS_NGA_E',2006,'IND_CH_FS',1.0,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',63.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',5.0,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_LPG','IND_CH_FS_LPG_E',2006,'IND_CH_FS',0.1,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',98.27,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',0.54,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_KER','IND_CH_FS_KER_E',2006,'IND_CH_FS',1.81,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',77.37,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',0.72,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_HFO','IND_CH_FS_HFO_E',2006,'IND_CH_FS',3.11,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',74.07,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',1.32,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_DST','IND_CH_FS_DST_E',2006,'IND_CH_FS',3.36,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',61.6,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.1,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_NSP','IND_CH_FS_NSP_E',2006,'IND_CH_FS',1.0,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',69.3,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',6.92,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_GSL','IND_CH_FS_GSL_E',2006,'IND_CH_FS',6.6,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',73.33,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',0.72,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_NAP','IND_CH_FS_NAP_E',2006,'IND_CH_FS',0.6,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',56.1,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.1,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','GAS_RFG','IND_CH_FS_RFG_E',2006,'IND_CH_FS',1.0,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-94.6,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-0.54,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-1.81,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_SOX','IND_COK','IND_IS_FS_COK_E',2006,'IND_IS_FS',-1.2,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-100.8,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-5.0,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-1.4,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_SOX','IND_PTC','IND_IS_FS_PTC_E',2006,'IND_IS_FS',-0.57,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_PTC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_ELC','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_LPG','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_DRY_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_PTC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_ELC','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_OIL','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_LPG','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_CLK_WET_E',2006,'IND_NM_CMT',484.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_ELC','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_LPG','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_SB','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_MD','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_OTH','IND_NM_LIM_E',2006,'IND_NM_LIM',392.5,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',14.89,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',14.89,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',0.96,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CH4','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',0.96,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','COA_HCO','IND_NEU_TECH',2006,'IND_OTH_NEU',0.13,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_N2O','OIL_NSP','IND_NEU_TECH',2006,'IND_OTH_NEU',0.13,'t/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',-248.23,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',-248.23,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM',248.23,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB',248.23,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',-505.41,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',-505.41,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH',505.41,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB',505.41,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',-292.24,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',-292.24,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',-258.48,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',-258.48,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG',292.24,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF',292.24,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'GAS_BFG',258.48,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFBOF_CCS_N',2050,'IND_IS_BOF',258.48,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',-269.14,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',-153.64,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',-269.14,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',-153.64,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',269.14,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG',153.64,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',269.14,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF',153.64,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',-263.01,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',-263.01,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF',263.01,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB',263.01,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',-1098.44,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF',1098.44,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',-289.46,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',-289.46,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF',289.46,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB',289.46,'kt/(PJ)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_DRY_BIO_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_WET_N',2007,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_COA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_HFO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NGA','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_BIO','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2_PRC','IND_NM_EC','IND_NM_CLK_WET_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-251.33,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-197.88,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',-143.48,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',756.53,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',703.08,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',648.68,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N',2020,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-286.45,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-197.87,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',-143.48,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',791.65,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',703.07,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',648.68,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-261.35,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-205.76,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',-149.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_COA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',766.59,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',711.0,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',654.43,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-297.87,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-205.76,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','IND_CO2','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',-149.2,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',803.07,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',710.96,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',654.4,'kt/(Mt)','');
INSERT INTO "emission_activity" VALUES('IT','SNK_CO2_EM','IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK',505.2,'kt/(Mt)','');

CREATE TABLE emission_aggregation (
    emis_agg        TEXT REFERENCES commodity(name),
    emis_comm       TEXT REFERENCES commodity(name),
    emis_agg_weight REAL,
    notes           TEXT,
    PRIMARY KEY(emis_agg, emis_comm)
);

CREATE TABLE emission_embodied (
    region    TEXT,
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, emis_comm, tech, vintage)
);

CREATE TABLE emission_end_of_life (
    region    TEXT,
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, emis_comm, tech, vintage)
);

CREATE TABLE end_of_life_output (
    region      TEXT,
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    value       REAL,
    units       TEXT,
    notes       TEXT,
    PRIMARY KEY(region, tech, vintage, output_comm)
);

CREATE TABLE existing_capacity (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_NGA',2006,676.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_LPG',2006,19.3,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_COA',2006,40.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_COK',2006,72.7,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_BFG',2006,0.185,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_HFO',2006,139.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_OIL',2006,75.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_ETH',2006,26.4,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_NAP',2006,128.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_PTC',2006,110.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_BIO',2006,11.9,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_HET',2006,121.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_FT_ELC',2006,820.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_MD_TECH',2006,287.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_MD_ELC_E',2006,414.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_MD_DST_E',2006,0.264,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_TECH',2006,239.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_NGA_E',2006,143.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_LPG_E',2006,1.31,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_COA_E',2006,0.102,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_HFO_E',2006,36.6,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_BIO_E',2006,0.707,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_DST_E',2006,6.38,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_STM_HET_E',2006,131.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OLF_E',2006,2.96,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_BTX_E',2006,0.806,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_AMM_E',2006,0.645,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_MTH_E',2006,0.0497,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_CHL_E',2006,0.215,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_E',2006,16.2,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_NGA_E',2006,40.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_LPG_E',2006,0.65,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_KER_E',2006,8.77,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_HFO_E',2006,17.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_DST_E',2006,27.5,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_NSP_E',2006,1.17,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_GSL_E',2006,6.31,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_NAP_E',2006,126.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_FS_RFG_E',2006,19.6,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_EC_E',2006,17.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_HFO_E',2006,3.39,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_DST_E',2006,5.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_NGA_E',2006,20.7,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_COK_E',2006,0.176,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_ETH_E',2006,1.89,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_ELC_E',2006,10.3,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_CH_OTH_PTC_E',2006,0.323,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_IS_BOF_E',2006,11.8,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_IS_EAF_E',2006,19.8,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_IS_OTH_ELC_E',2006,10.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_IS_FS_PTC_E',2006,0.13,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_IS_FS_COK_E',2006,69.3,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_ALU_E',2006,2.119,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_COP_E',2006,0.399,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_ZNC_E',2006,0.3808,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_OTH_E',2006,1.423,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_EC_E',2006,10.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_OTH_ELC_E',2006,8.798,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_OTH_DST_E',2006,0.2585,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_OTH_NGA_E',2006,3.011,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NF_OTH_LPG_E',2006,0.8827,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_CLK_WET_E',2006,13.78,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_CLK_DRY_E',2006,34.58,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_LIM_E',2006,5.24,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_GLS_E',2006,3.68,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_CRM_E',2006,61.4,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_OTH_DST_E',2006,0.217,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_OTH_NGA_E',2006,7.35,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_OTH_COK_E',2006,0.174,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_OTH_ELC_E',2006,5.38,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NM_OTH_LPG_E',2006,0.662,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PUL_CHEM_E',2006,0.172,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PUL_MEC_E',2006,1.25,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PUL_REC_E',2006,6.2,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PAP_E',2006,11.12,'Mt','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PH_HFO_E',2006,0.404,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PH_DST_E',2006,0.0469,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PH_NGA_E',2006,2.57,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_PH_ELC_E',2006,1.13,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_OTH_DST_E',2006,0.0469,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_OTH_ELC_E',2006,1.13,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_PP_OTH_LPG_E',2006,0.0621,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_OTH_PH_HFO_E',2006,38.8,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_OTH_PH_DST_E',2006,9.54,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_OTH_PH_NGA_E',2006,177.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_OTH_PH_LPG_E',2006,6.09,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_OTH_OTH_ELC_E',2006,31.1,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_ONS_TECH',2006,138.0,'PJ','');
INSERT INTO "existing_capacity" VALUES('IT','IND_NEU_TECH',2006,166.0,'PJ','');

CREATE TABLE lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2007,20.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2014,22.0,'year','');
INSERT INTO "lifetime_process" VALUES('IT','IND_CHP_NGA_TG_N',2030,25.0,'year','');

CREATE TABLE lifetime_survival_curve (
    region  TEXT NOT NULL,
    period  INTEGER NOT NULL,
    tech    TEXT NOT NULL REFERENCES technology(tech),
    vintage INTEGER NOT NULL REFERENCES time_period(period),
    fraction REAL,
    notes   TEXT,
    PRIMARY KEY(region, period, tech, vintage)
);

CREATE TABLE lifetime_tech (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech)
);
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_ELC_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_DST_E',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_BIO_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_COA_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_DST_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_HET_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_HFO_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_LPG_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_NGA_E',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OLF_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_BTX_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_CHL_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_LPG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_KER_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_HFO_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_NSP_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_GSL_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_NAP_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_RFG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_EC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_COK_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_ETH_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_HFO_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_PTC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_EAF_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_FS_PTC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_FS_COK_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_COP_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ZNC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_EC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_LPG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRY_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_WET_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CRM_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_GLS_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_LIM_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_OTH_COK_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_OTH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_OTH_LPG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_OTH_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PAP_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_CHEM_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_MEC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_REC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_HFO_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_OTH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_OTH_LPG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_OTH_ELC_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_DST_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_HFO_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_LPG_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_NGA_E',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_DST_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_LPG_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_NGA_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_MD_ELC_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_BFG_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_BIO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_COA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_COG_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_DST_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_ETH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_HET_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_HFO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_LPG_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_STM_PTC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_NAPSC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_ETHSC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_GSOSC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_LPGSC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_NCC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_BDH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_HVC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OLF_PDH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OLF_MTO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_NGASR_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_NGASR_CCS_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_NGASR_CCS_N_LINKED',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_NAPPOX_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_COAGSF_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_BIOGSF_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_AMM_ELCSYS_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_NGASR_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_NGASR_CCS_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_NGASR_CCS_N_LINKED',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_COGSR_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_LPGSR_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_COAGSF_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_BIOGSF_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_MTH_ELCSYS_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_CHL_MERC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_CHL_DIAP_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_CHL_MEMB_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_EC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_BIO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_COA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_DST_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_ETH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_LPG_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_MTH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_NAP_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_FS_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_COK_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_DST_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_ELC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_ETH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_HFO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CH_OTH_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_BFBOF_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N_LINKED',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N_LINKED',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_DRI_DRIEAF_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N_LINKED',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_DRI_HDREAF_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_HISBOF_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N_LINKED',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_ULCOWIN_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_ULCOLYSIS_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N_LINKED',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_AMN_BAY_N',40.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_HLH_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_SEC_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_HLHIA_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_CBT_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ALU_KAO_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_COP_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_ZNC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_EC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_ELC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_DST_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NF_OTH_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRY_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRY_BIO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_WET_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N_LINKED',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N_LINKED',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N_LINKED',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N_LINKED',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CEM_BLN_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CEM_AAC_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CEM_BEL_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_LIM_LRK_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_GLS_FOSS_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_GLS_ELEC_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_CRM_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_NM_EC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_KRF_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_SUL_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_MEC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_SCH_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PUL_REC_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PAP_N',20.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_HFO_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_PP_PH_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_OTH_ELC_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_DST_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_HFO_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_LPG_N',25.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_OTH_PH_NGA_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_NGA_CI_N',15.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_NGA_TV_N',30.0,'year','');
INSERT INTO "lifetime_tech" VALUES('IT','IND_CHP_BLQ_CI_N',15.0,'year','');

CREATE TABLE operator (
    operator TEXT PRIMARY KEY,
    notes    TEXT
);
INSERT INTO "operator" VALUES('le','less-than-or-equal (≤)');
INSERT INTO "operator" VALUES('ge','greater-than-or-equal (≥)');
INSERT INTO "operator" VALUES('eq','equal (=)');

CREATE TABLE limit_activity (
    region       TEXT,
    period       INTEGER REFERENCES time_period(period),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    activity     REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, period, tech_or_group, operator)
);
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_ELC','ge',429.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_ELC','ge',402.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_ELC','ge',385.75,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_ELC','ge',391.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_ELC','ge',402.9,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_ELC','ge',389.01,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'IND_FT_ELC','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_NGA','ge',389.56,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_NGA','ge',392.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_NGA','ge',371.69,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_NGA','ge',380.81,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_NGA','ge',379.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_NGA','ge',359.17,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_NGA','ge',104.67,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_COK','ge',47.63,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_COK','ge',45.41,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_COK','ge',21.95,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_COK','ge',16.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_COK','ge',18.86,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_COK','ge',17.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2040,'IND_FT_COK','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_MD_ELC_E','ge',272.0,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_MD_DST_E','ge',0.173,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_MD_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_MD_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_NGA_E','ge',96.8,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_LPG_E','ge',0.881,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_COA_E','ge',0.0687,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_HFO_E','ge',12.4,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_DST_E','ge',4.31,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_BIO_E','ge',0.477,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_HET_E','ge',88.3,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_STM_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_STM_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_STM_COA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_STM_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_STM_BIO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_STM_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_STM_HET_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OLF_E','ge',2.78,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_BTX_E','ge',0.756,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_AMM_E','ge',0.605,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_MTH_E','ge',0.0467,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_CHL_E','ge',0.202,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_E','ge',15.2,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OLF_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_BTX_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_AMM_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_MTH_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_CHL_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_DST_E','ge',23.86,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_GSL_E','ge',5.47,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_HFO_E','ge',15.15,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_KER_E','ge',7.6,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_LPG_E','ge',0.56,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_NAP_E','ge',108.95,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_NGA_E','ge',34.66,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_NSP_E','ge',1.01,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_FS_RFG_E','ge',16.98,'PJ','87.50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_GSL_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_KER_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NAP_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NSP_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_RFG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_EC_E','ge',16.1,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_EC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_COK_E','ge',0.165,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_DST_E','ge',4.69,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_ELC_E','ge',9.64,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_ETH_E','ge',1.77,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_HFO_E','ge',3.18,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_NGA_E','ge',19.4,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_PTC_E','ge',0.303,'PJ','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_COK_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_ETH_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_CH_OTH_PTC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_BOF_E','ge',9.46,'Mt','80% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_IS_BOF_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_EAF_E','ge',15.84,'Mt','80% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_IS_EAF_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_OTH_ELC_E','ge',8.06,'PJ','80% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_IS_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_FS_COK_E','ge',55.47,'PJ','80% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_IS_FS_COK_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_FS_PTC_E','ge',0.1,'PJ','80% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_IS_FS_PTC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_ALU_E','ge',1.05,'Mt','50% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_COP_E','ge',0.238,'Mt','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_ZNC_E','ge',0.226,'Mt','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_E','ge',0.847,'Mt','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_ALU_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_COP_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_ZNC_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_OTH_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_EC_E','ge',5.96,'PJ','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_EC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_ELC_E','ge',5.22,'PJ','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_DST_E','ge',0.154,'PJ','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_NGA_E','ge',1.79,'PJ','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_LPG_E','ge',0.524,'PJ','60% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_OTH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_OTH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NF_OTH_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CLK_WET_E','ge',12.3,'Mt','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CLK_DRY_E','ge',30.8,'Mt','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_LIM_E','ge',4.67,'Mt','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_GLS_E','ge',3.28,'Mt','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CRM_E','ge',5.47,'Mt','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_CLK_WET_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_CLK_DRY_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_LIM_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_GLS_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_CRM_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_DST_E','ge',0.196,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_NGA_E','ge',6.61,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_COK_E','ge',0.157,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_ELC_E','ge',4.84,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_LPG_E','ge',0.596,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_OTH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_OTH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_OTH_COK_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_NM_OTH_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_CHEM_E','ge',0.146,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_MEC_E','ge',1.17,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_REC_E','ge',5.28,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PAP_E','ge',9.48,'Mt','94.74% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PUL_CHEM_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PUL_MEC_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PUL_REC_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PAP_E','ge',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_HFO_E','ge',0.364,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_DST_E','ge',0.0422,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_NGA_E','ge',2.32,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_ELC_E','ge',1.02,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PH_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_PH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_DST_E','ge',0.0422,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_ELC_E','ge',1.02,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_LPG_E','ge',0.0559,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_OTH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_PP_OTH_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_OTH_ELC_E','ge',28.0,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_OTH_OTH_ELC_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_HFO_E','ge',34.9,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_DST_E','ge',8.58,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_NGA_E','ge',159.0,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_LPG_E','ge',5.48,'PJ','90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_OTH_PH_HFO_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_OTH_PH_DST_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_OTH_PH_NGA_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_OTH_PH_LPG_E','ge',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_ELC','le',579.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_ELC','le',474.46,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_ELC','le',444.73,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_ELC','le',426.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_ELC','le',432.55,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_ELC','le',445.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_ELC','le',429.96,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_ELC','le',2160.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_NGA','le',845.08,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_NGA','le',481.2,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_NGA','le',434.1,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_NGA','le',410.8,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_NGA','le',420.9,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_NGA','le',419.8,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_NGA','le',397.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_NGA','le',3719.69,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_COK','le',52.64,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_COK','le',50.19,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_COK','le',34.65,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_COK','le',30.6,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_COK','le',23.82,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_COK','le',19.38,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_HFO','le',100.83,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_HFO','le',50.93,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_HFO','le',36.53,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_HFO','le',38.38,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_HFO','le',24.78,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_HFO','le',23.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_OIL','le',92.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_FT_OIL','le',32.06,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_FT_OIL','le',33.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_FT_OIL','le',24.62,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_FT_OIL','le',21.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_FT_OIL','le',22.73,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_FT_OIL','le',19.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_OIL','le',375.24,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_BFG','le',0.35,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_BFG','le',0.93,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_BIO','le',17.31,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_BIO','le',118.93,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_COA','le',58.98,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_COA','le',200.34,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_COG','le',2.27,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_COG','le',100.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_COK','le',89.22,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_COK','le',363.37,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_ETH','le',32.39,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_ETH','le',131.8,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_HFO','le',170.66,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_HFO','le',696.48,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_LPG','le',23.68,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_LPG','le',96.42,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_NAP','le',157.15,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_NAP','le',641.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_PTC','le',134.97,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_PTC','le',549.28,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_GEO','le',0.54,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_GEO','le',25.2,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_FT_HET','le',249.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2050,'IND_FT_HET','le',362.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_MD_ELC_E','le',278.0,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_MD_DST_E','le',0.177,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_MD_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2025,'IND_MD_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_NGA_E','le',101.0,'PJ','93.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_LPG_E','le',0.947,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_COA_E','le',0.0739,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_HFO_E','le',24.7,'PJ','90.90% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_DST_E','le',4.63,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_BIO_E','le',0.514,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_STM_HET_E','le',94.0,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_STM_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_STM_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_STM_COA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_STM_HFO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_STM_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_STM_BIO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_STM_HET_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OLF_E','le',2.84,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_BTX_E','le',0.772,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_AMM_E','le',0.618,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_MTH_E','le',0.0477,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_CHL_E','le',0.206,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OLF_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_BTX_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_AMM_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_MTH_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_CHL_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_EC_E','le',16.4,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_EC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_COK_E','le',0.168,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_DST_E','le',4.79,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_ELC_E','le',9.85,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_ETH_E','le',1.81,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_HFO_E','le',3.25,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_NGA_E','le',19.8,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_CH_OTH_PTC_E','le',0.31,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_COK_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_ETH_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_HFO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_CH_OTH_PTC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_HVC_BDH_N','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_BOF_E','le',11.33,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_IS_BOF_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_EAF_E','le',18.98,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_IS_EAF_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_IS_OTH_ELC_E','le',10.08,'PJ','100% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_IS_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_ALU_E','le',2.03,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_COP_E','le',0.382,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_ZNC_E','le',0.365,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_ALU_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_COP_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_ZNC_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_EC_E','le',9.61,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_EC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_ELC_E','le',8.43,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_DST_E','le',0.248,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_NGA_E','le',2.89,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NF_OTH_LPG_E','le',0.846,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_OTH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_OTH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NF_OTH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CLK_WET_E','le',13.2,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CLK_DRY_E','le',33.1,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_LIM_E','le',5.02,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_GLS_E','le',3.52,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_CRM_E','le',5.88,'Mt','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_CLK_WET_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_CLK_DRY_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_LIM_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_GLS_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_CRM_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_DST_E','le',0.21,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_NGA_E','le',7.11,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_COK_E','le',0.168,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_ELC_E','le',5.21,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_NM_OTH_LPG_E','le',0.641,'PJ','96.79% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_OTH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_OTH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_OTH_COK_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_NM_OTH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_CHEM_E','le',0.148,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_MEC_E','le',1.18,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PUL_REC_E','le',5.35,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PAP_E','le',9.59,'Mt','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PUL_CHEM_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PUL_MEC_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PUL_REC_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PAP_E','le',0.0,'Mt','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_HFO_E','le',0.387,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_DST_E','le',0.0449,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_NGA_E','le',2.47,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_PH_ELC_E','le',1.08,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PH_HFO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_PH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_DST_E','le',0.0449,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_ELC_E','le',1.08,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_PP_OTH_LPG_E','le',0.0595,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_OTH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_PP_OTH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_OTH_ELC_E','le',29.8,'PJ','95.83% of base year');
INSERT INTO "limit_activity" VALUES('IT',2030,'IND_OTH_OTH_ELC_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_HFO_E','le',34.9,'PJ','90.00% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_DST_E','le',8.86,'PJ','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_NGA_E','le',164.0,'PJ','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2007,'IND_OTH_PH_LPG_E','le',5.65,'PJ','92.86% of base year');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_OTH_PH_HFO_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_OTH_PH_DST_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_OTH_PH_LPG_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_OTH_PH_NGA_E','le',0.0,'PJ','');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_NGA_GRP','ge',19.36,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_NGA_GRP','ge',18.15,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NGA_GRP','ge',23.89,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_NGA_GRP','ge',28.93,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_NGA_GRP','ge',27.84,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_NGA_GRP','ge',29.83,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2040,'IND_CH_FS_NGA_GRP','ge',0.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_OIL_GRP','ge',67.07,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_OIL_GRP','ge',58.88,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_OIL_GRP','ge',44.15,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_OIL_GRP','ge',29.19,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_OIL_GRP','ge',18.28,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_OIL_GRP','ge',13.82,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2040,'IND_CH_FS_OIL_GRP','ge',0.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_NAP_GRP','ge',112.96,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_NAP_GRP','ge',78.33,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NAP_GRP','ge',91.3,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_NAP_GRP','ge',127.68,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_NAP_GRP','ge',150.96,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_NAP_GRP','ge',137.39,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2040,'IND_CH_FS_NAP_GRP','ge',0.00,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_NGA_GRP','le',36.3,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_NGA_GRP','le',38.2,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NGA_GRP','le',37.73,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_NGA_GRP','le',63.95,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_NGA_GRP','le',30.77,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_NGA_GRP','le',32.97,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_CH_FS_NGA_GRP','le',5*32.97,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_OIL_GRP','le',74.13,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_OIL_GRP','le',65.08,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_OIL_GRP','le',48.8,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_OIL_GRP','le',49.16,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_OIL_GRP','le',20.2,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_OIL_GRP','le',15.28,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_CH_FS_OIL_GRP','le',10*15.28,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2010,'IND_CH_FS_NAP_GRP','le',124.85,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2012,'IND_CH_FS_NAP_GRP','le',86.57,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2014,'IND_CH_FS_NAP_GRP','le',100.91,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2016,'IND_CH_FS_NAP_GRP','le',141.12,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2018,'IND_CH_FS_NAP_GRP','le',166.85,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2020,'IND_CH_FS_NAP_GRP','le',151.28,NULL,'PJ');
INSERT INTO "limit_activity" VALUES('IT',2022,'IND_CH_FS_NAP_GRP','le',2*151.85,NULL,'PJ');

CREATE TABLE limit_activity_share (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    sub_group   TEXT,
    super_group TEXT,
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, sub_group, super_group, operator)
);
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_MD_ELC_GRP','IND_MD_GRP','ge',0.99,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_MD_ELC_GRP','IND_MD_GRP','ge',1.00,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_CH_OTH_NGA_GRP','IND_CH_OTH_GRP','ge',0.50,'');
INSERT INTO "limit_activity_share" VALUES('IT',2010,'IND_CH_OTH_NGA_GRP','IND_CH_OTH_GRP','ge',0.43,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_CH_OTH_NGA_GRP','IND_CH_OTH_GRP','ge',0.32,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_CH_OTH_ELC_GRP','IND_CH_OTH_GRP','ge',0.10,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_CH_OTH_ELC_GRP','IND_CH_OTH_GRP','ge',0.30,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_NF_OTH_ELC_GRP','IND_NF_OTH_GRP','ge',0.62,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_NF_OTH_ELC_GRP','IND_NF_OTH_GRP','ge',0.62,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_NM_OTH_ELC_E','IND_NM_OTH_GRP','ge',0.39,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_NM_OTH_ELC_E','IND_NM_OTH_GRP','ge',0.55,'');
INSERT INTO "limit_activity_share" VALUES('IT',2007,'IND_CH_OTH_COK_GRP','IND_CH_OTH_GRP','le',0.004,'');
INSERT INTO "limit_activity_share" VALUES('IT',2050,'IND_CH_OTH_COK_GRP','IND_CH_OTH_GRP','le',0.031,'');

CREATE TABLE limit_annual_capacity_factor (
    region       TEXT,
    tech_or_group TEXT,
    vintage      INTEGER REFERENCES time_period(period),
    output_comm  TEXT REFERENCES commodity(name),
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    factor       REAL,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, vintage, output_comm, operator),
    CHECK(factor >= 0 AND factor <= 1)
);
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_BLQ_CI_N',2014,'ELC_DST','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_BLQ_CI_N',2014,'IND_HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_CI_N',2007,'ELC_DST','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_CI_N',2007,'IND_HET','le',0.57,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TG_N',2007,'ELC_DST','le',0.74,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TG_N',2007,'IND_HET','le',0.74,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TV_N',2007,'ELC_DST','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CHP_NGA_TV_N',2007,'IND_HET','le',0.63,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_BIOGSF_N',2025,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_COAGSF_N',2007,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_COAGSF_N',2007,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_ELCSYS_N',2025,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NAPPOX_N',2007,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NGASR_CCS_N',2025,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NGASR_N',2007,'IND_CH_AMM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_AMM_NGASR_N',2007,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_DIAP_N',2007,'IND_CH_CHL','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_DIAP_N',2007,'IND_H2','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_MEMB_N',2007,'IND_CH_CHL','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_MEMB_N',2007,'IND_H2','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_MERC_N',2007,'IND_CH_CHL','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_CHL_MERC_N',2007,'IND_H2','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_EC_N',2007,'IND_CH_EC','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_BDH_N',2020,'IND_CH_HVC','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_ETHSC_N',2007,'IND_CH_HVC','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_ETHSC_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_GSOSC_N',2007,'IND_CH_HVC','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_GSOSC_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_LPGSC_N',2007,'IND_CH_HVC','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_LPGSC_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_NAPSC_N',2007,'IND_CH_HVC','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_NAPSC_N',2007,'IND_CH_SB','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_NCC_N',2020,'IND_CH_HVC','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_HVC_NCC_N',2020,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_BIOGSF_N',2025,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_COAGSF_N',2007,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_COAGSF_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_COGSR_N',2007,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_COGSR_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_ELCSYS_N',2025,'IND_CH_MTH','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_LPGSR_N',2007,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_LPGSR_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_NGASR_CCS_N',2025,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_NGASR_N',2007,'IND_CH_MTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_MTH_NGASR_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OLF_MTO_N',2007,'IND_CH_OLF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OLF_MTO_N',2007,'IND_CH_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OLF_PDH_N',2010,'IND_CH_OLF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_COK_N',2007,'IND_CH_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_DST_N',2007,'IND_CH_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_ELC_N',2007,'IND_CH_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_ETH_N',2007,'IND_CH_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_HFO_N',2007,'IND_CH_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_NGA_N',2007,'IND_CH_OTH','le',0.82,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_CH_OTH_NGA_N',2020,'IND_CH_OTH','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_FT_H2',2014,'IND_H2','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_FT_H2E',2014,'IND_H2E','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',2030,'GAS_BFG','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',2030,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFBOF_N',2007,'GAS_BFG','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFBOF_N',2007,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'GAS_BFG','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N',2030,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_HISBOF_N',2025,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_ULCOLYSIS_N',2030,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_EAF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N',2030,'IND_IS_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_BOF_ULCOWIN_N',2030,'IND_IS_BOF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_EAF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,'IND_IS_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_EAF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_DRIEAF_N',2007,'IND_IS_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_HDREAF_N',2030,'IND_IS_EAF','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_IS_DRI_HDREAF_N',2030,'IND_IS_SB','le',0.85,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_DST_E',2006,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_DST_N',2007,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_ELC_E',2006,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_ELC_N',2007,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_LPG_N',2007,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_MD_NGA_N',2007,'IND_MD','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ALU_CBT_N',2050,'IND_NF_ALU','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ALU_HLHIA_N',2030,'IND_NF_ALU','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ALU_HLH_N',2007,'IND_NF_ALU','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ALU_KAO_N',2050,'IND_NF_ALU','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ALU_SEC_N',2007,'IND_NF_ALU','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_COP_N',2007,'IND_NF_COP','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_EC_N',2007,'IND_NF_EC','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_OTH_DST_N',2007,'IND_NF_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_OTH_ELC_N',2007,'IND_NF_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_OTH_NGA_N',2007,'IND_NF_OTH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NF_ZNC_N',2007,'IND_NF_ZNC','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CEM_AAC_N',2030,'IND_NM_CMT','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CEM_BEL_N',2030,'IND_NM_CMT','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CEM_BLN_N',2007,'IND_NM_CMT','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2025,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N',2025,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRY_BIO_N',2007,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_DRY_N',2007,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CLK_WET_N',2007,'IND_NM_CLK','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_CRM_N',2007,'IND_NM_CRM','le',0.9,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_EC_N',2007,'IND_NM_EC','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_GLS_ELEC_N',2007,'IND_NM_GLS','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_GLS_FOSS_N',2007,'IND_NM_GLS','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_NM_LIM_LRK_N',2007,'IND_NM_LIM','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_OTH_OTH_ELC_N',2007,'IND_OTH_OTH','le',0.35,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_OTH_PH_DST_N',2007,'IND_OTH_PH','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_OTH_PH_HFO_N',2007,'IND_OTH_PH','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_OTH_PH_LPG_N',2007,'IND_OTH_PH','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_OTH_PH_NGA_N',2007,'IND_OTH_PH','le',0.7,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PAP_N',2007,'IND_PP_PAP','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PH_HFO_N',2007,'IND_PP_PH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PH_NGA_N',2007,'IND_PP_PH','le',0.8,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_KRF_N',2007,'BIO_BIN','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_KRF_N',2007,'IND_ELC_BP','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_KRF_N',2007,'IND_PP_PUC','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_MEC_N',2007,'IND_PP_PUM','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_MEC_N',2007,'IND_PP_SB','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_REC_N',2007,'IND_PP_PUR','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_SCH_N',2007,'IND_PP_PUM','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_SUL_N',2007,'BIO_BIN','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_SUL_N',2007,'IND_ELC_BP','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_PP_PUL_SUL_N',2007,'IND_PP_PUC','le',0.95,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_BFG_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_BIO_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_BIO_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_COA_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_COA_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_COG_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_DST_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_DST_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_ETH_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_HET_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_HET_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_HFO_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_HFO_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_LPG_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_LPG_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_NGA_E',2006,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_NGA_N',2007,'IND_SB','le',0.75,'');
INSERT INTO "limit_annual_capacity_factor" VALUES('IT','IND_STM_PTC_N',2007,'IND_SB','le',0.75,'');

CREATE TABLE limit_capacity (
    region       TEXT,
    period       INTEGER REFERENCES time_period(period),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    capacity     REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, period, tech_or_group, operator)
);

CREATE TABLE limit_capacity_share (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    sub_group   TEXT,
    super_group TEXT,
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, sub_group, super_group, operator)
);

CREATE TABLE limit_degrowth_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_degrowth_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_degrowth_new_capacity_delta (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_emission (
    region    TEXT,
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT REFERENCES commodity(name),
    operator  TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    value     REAL,
    units     TEXT,
    notes     TEXT,
    PRIMARY KEY(region, period, emis_comm, operator)
);

CREATE TABLE limit_growth_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_growth_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_growth_new_capacity_delta (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    rate         REAL NOT NULL DEFAULT 0,
    seed         REAL NOT NULL DEFAULT 0,
    seed_units   TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE limit_new_capacity (
    region       TEXT,
    tech_or_group TEXT,
    vintage      INTEGER REFERENCES time_period(period),
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    new_cap      REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, vintage, operator)
);

CREATE TABLE limit_new_capacity_share (
    region      TEXT,
    sub_group   TEXT,
    super_group TEXT,
    vintage     INTEGER REFERENCES time_period(period),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    share       REAL,
    notes       TEXT,
    PRIMARY KEY(region, sub_group, super_group, vintage, operator)
);

CREATE TABLE limit_resource (
    region       TEXT,
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    cum_act      REAL,
    units        TEXT,
    notes        TEXT,
    PRIMARY KEY(region, tech_or_group, operator)
);

CREATE TABLE region (
    region TEXT PRIMARY KEY,
    notes  TEXT
);
INSERT INTO "region" VALUES('IT','Italy');

CREATE TABLE limit_seasonal_capacity_factor (
    region       TEXT REFERENCES region(region),
    season       TEXT REFERENCES time_season(season),
    tech_or_group TEXT,
    operator     TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    factor       REAL,
    notes        TEXT,
    PRIMARY KEY(region, season, tech_or_group, operator)
);

CREATE TABLE limit_storage_level_fraction (
    region   TEXT,
    season   TEXT,
    tod      TEXT REFERENCES time_of_day(tod),
    tech     TEXT REFERENCES technology(tech),
    operator TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    fraction REAL,
    notes    TEXT,
    PRIMARY KEY(region, season, tod, tech, operator),
    CHECK(fraction >= 0 AND fraction <= 1)
);

CREATE TABLE limit_tech_input_split (
    region     TEXT,
    period     INTEGER REFERENCES time_period(period),
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    operator   TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion REAL,
    notes      TEXT,
    PRIMARY KEY(region, period, input_comm, tech, operator)
);

CREATE TABLE limit_tech_input_split_annual (
    region     TEXT,
    period     INTEGER REFERENCES time_period(period),
    input_comm TEXT REFERENCES commodity(name),
    tech       TEXT REFERENCES technology(tech),
    operator   TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion REAL,
    notes      TEXT,
    PRIMARY KEY(region, period, input_comm, tech, operator)
);
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','IND_FT_BIO','ge',0.6,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'GAS_RFG','IND_FT_ETH','ge',0.9,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_HFO','IND_FT_HFO','ge',0.9,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_OLF','IND_CH_TECH','ge',0.1419,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_BTX','IND_CH_TECH','ge',0.0386,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_AMM','IND_CH_TECH','ge',0.0308,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MTH','IND_CH_TECH','ge',0.0024,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_CHL','IND_CH_TECH','ge',0.0103,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_OTH_PROD','IND_CH_TECH','ge',0.776,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_OLF_E','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_OLF_E','ge',0.074,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_CH_OLF_E','ge',0.005,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_CH_OLF_E','ge',0.029,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_CH_OLF_E','ge',0.023,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ETH','IND_CH_OLF_E','ge',0.014,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS','IND_CH_OLF_E','ge',0.7,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_OLF_E','ge',0.144,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_OLF_E','ge',0.001,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_BTX_E','ge',0.008,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_BTX_E','ge',0.044,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_CH_BTX_E','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_CH_BTX_E','ge',0.023,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_CH_BTX_E','ge',0.019,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ETH','IND_CH_BTX_E','ge',0.022,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS','IND_CH_BTX_E','ge',0.722,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_BTX_E','ge',0.156,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_BTX_E','ge',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_AMM_E','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_AMM_E','ge',0.47,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS','IND_CH_AMM_E','ge',0.21,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_AMM_E','ge',0.29,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_AMM_E','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_MTH_E','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_MTH_E','ge',0.34,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS','IND_CH_MTH_E','ge',0.31,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_MTH_E','ge',0.31,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_MTH_E','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_CHL_E','ge',0.83,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_CHL_E','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_CHL_E','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_OTH_E','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS','IND_CH_OTH_E','ge',0.24,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_OTH_E','ge',0.2,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_OTH_E','ge',0.23,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_OTH','IND_CH_OTH_E','ge',0.26,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_BOF','IND_IS_TECH','ge',0.3738,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_BOF','IND_IS_TECH','ge',0.34,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_IS_BOF','IND_IS_TECH','ge',0.18,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_EAF','IND_IS_TECH','ge',0.6262,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_EAF','IND_IS_TECH','ge',0.66,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_IS_EAF','IND_IS_TECH','ge',0.82,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_SB','IND_IS_BOF_E','ge',0.0339,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_MD','IND_IS_BOF_E','ge',0.0621,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_OTH','IND_IS_BOF_E','ge',0.0247,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_FS','IND_IS_BOF_E','ge',0.4111,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_IS_BOF_E','ge',0.3964,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_IS_BOF_E','ge',0.0451,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BFG','IND_IS_BOF_E','ge',0.0012,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_IS_BOF_E','ge',0.0194,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_IS_BOF_E','ge',0.0061,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_SB','IND_IS_BOF_E','ge',0.0329,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_MD','IND_IS_BOF_E','ge',0.0604,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_OTH','IND_IS_BOF_E','ge',0.024,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_FS','IND_IS_BOF_E','ge',0.3798,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_NGA','IND_IS_BOF_E','ge',0.4163,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_COA','IND_IS_BOF_E','ge',0.0659,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_BFG','IND_IS_BOF_E','ge',0.0011,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_HFO','IND_IS_BOF_E','ge',0.0132,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_LPG','IND_IS_BOF_E','ge',0.0054,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_SB','IND_IS_EAF_E','ge',0.0717,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_MD','IND_IS_EAF_E','ge',0.2539,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_OTH','IND_IS_EAF_E','ge',0.0731,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_FS','IND_IS_EAF_E','ge',0.0769,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_IS_EAF_E','ge',0.076,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_IS_EAF_E','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_IS_EAF_E','ge',0.3646,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_IS_EAF_E','ge',0.0038,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_SB','IND_IS_EAF_E','ge',0.0705,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_MD','IND_IS_EAF_E','ge',0.2498,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_OTH','IND_IS_EAF_E','ge',0.0719,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_IS_FS','IND_IS_EAF_E','ge',0.068,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_NGA','IND_IS_EAF_E','ge',0.0785,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_COA','IND_IS_EAF_E','ge',0.0983,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_ELC','IND_IS_EAF_E','ge',0.3586,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_OIL','IND_IS_EAF_E','ge',0.0033,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_ALU','IND_NF_TECH','ge',0.4903,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_COP','IND_NF_TECH','ge',0.0923,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_ZNC','IND_NF_TECH','ge',0.0881,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_OTH_PROD','IND_NF_TECH','ge',0.3293,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_ALU_E','ge',0.0311,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_ALU_E','ge',0.8618,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_ALU_E','ge',0.1071,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_COP_E','ge',0.4726,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_COP_E','ge',0.2602,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NF_COP_E','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COK','IND_NF_COP_E','ge',0.0467,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_COP_E','ge',0.0709,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_SB','IND_NF_COP_E','ge',0.1456,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_ZNC_E','ge',0.6288,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_ZNC_E','ge',0.1346,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_ZNC_E','ge',0.0734,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_SB','IND_NF_ZNC_E','ge',0.0864,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_MD','IND_NF_ZNC_E','ge',0.0768,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_MD','IND_NF_OTH_E','ge',0.0902,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_OTH','IND_NF_OTH_E','ge',0.9098,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_CMT','IND_NM_TECH','ge',0.7625,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_LIM','IND_NM_TECH','ge',0.0827,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_GLS','IND_NM_TECH','ge',0.058,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_CRM','IND_NM_TECH','ge',0.0968,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CLK_DRY_E','ge',0.0023,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_CLK_DRY_E','ge',0.017,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CLK_DRY_E','ge',0.0034,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PTC','IND_NM_CLK_DRY_E','ge',0.7162,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_NM_CLK_DRY_E','ge',0.0942,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_NM_CLK_DRY_E','ge',0.0342,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_NM_CLK_DRY_E','ge',0.0011,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_SB','IND_NM_CLK_DRY_E','ge',0.0015,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_MD','IND_NM_CLK_DRY_E','ge',0.1214,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_OTH','IND_NM_CLK_DRY_E','ge',0.0087,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CLK_WET_E','ge',0.0127,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_CLK_WET_E','ge',0.1056,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CLK_WET_E','ge',0.0554,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PTC','IND_NM_CLK_WET_E','ge',0.6824,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_NM_CLK_WET_E','ge',0.0247,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_NM_CLK_WET_E','ge',0.012,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_NM_CLK_WET_E','ge',0.0078,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_SB','IND_NM_CLK_WET_E','ge',0.0054,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_MD','IND_NM_CLK_WET_E','ge',0.0877,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_OTH','IND_NM_CLK_WET_E','ge',0.0063,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_LIM_E','ge',0.1872,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_LIM_E','ge',0.299,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_LIM_E','ge',0.0586,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_NM_LIM_E','ge',0.0111,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_NM_LIM_E','ge',0.1499,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_SB','IND_NM_LIM_E','ge',0.1136,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_MD','IND_NM_LIM_E','ge',0.0485,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_OTH','IND_NM_LIM_E','ge',0.1321,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_GLS_E','ge',0.675,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_GLS_E','ge',0.0425,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_NM_GLS_E','ge',0.0181,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_SB','IND_NM_GLS_E','ge',0.0862,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_MD','IND_NM_GLS_E','ge',0.0706,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_OTH','IND_NM_GLS_E','ge',0.1076,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CRM_E','ge',0.6734,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_CRM_E','ge',0.0473,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CRM_E','ge',0.0459,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_NM_CRM_E','ge',0.002,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_NM_CRM_E','ge',0.0227,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_SB','IND_NM_CRM_E','ge',0.0969,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_MD','IND_NM_CRM_E','ge',0.0881,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_OTH','IND_NM_CRM_E','ge',0.0237,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PUC','IND_PP_PUL_TECH','ge',0.025,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PUM','IND_PP_PUL_TECH','ge',0.057,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_PP_PUC','IND_PP_PUL_TECH','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_PP_PUM','IND_PP_PUL_TECH','ge',0.045,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_CHEM_E','ge',0.7406,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PH','IND_PP_PUL_CHEM_E','ge',0.1144,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_CHEM_E','ge',0.145,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_REC_E','ge',0.1395,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_DH','IND_PP_PUL_REC_E','ge',0.0337,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_REC_E','ge',0.7905,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_OTH','IND_PP_PUL_REC_E','ge',0.0363,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PAP_E','ge',0.6566,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_DH','IND_PP_PAP_E','ge',0.0375,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PAP_E','ge',0.2335,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_OTH','IND_PP_PAP_E','ge',0.0097,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PUL','IND_PP_PAP_E','ge',0.0627,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OTH_SB','IND_OTH_TECH','ge',0.1145,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OTH_PH','IND_OTH_TECH','ge',0.4948,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OTH_MD','IND_OTH_TECH','ge',0.3241,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OTH_OTH','IND_OTH_TECH','ge',0.0666,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_OTH_SB','IND_OTH_TECH','ge',0.1493,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_OTH_PH','IND_OTH_TECH','ge',0.4693,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_OTH_MD','IND_OTH_TECH','ge',0.3088,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_OTH_OTH','IND_OTH_TECH','ge',0.0715,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_ONS_TECH','ge',0.459,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_ONS_TECH','ge',0.232,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_ONS_TECH','ge',0.008,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_ONS_TECH','ge',0.107,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_ONS_TECH','ge',0.011,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_ONS_TECH','ge',0.019,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_GEO','IND_ONS_TECH','ge',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HET','IND_ONS_TECH','ge',0.164,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'COA_HCO','IND_NEU_TECH','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_NSP','IND_NEU_TECH','ge',0.96,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'COA_HCO','IND_NEU_TECH','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2012,'OIL_NSP','IND_NEU_TECH','ge',0.96,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'COA_HCO','IND_NEU_TECH','ge',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2016,'OIL_NSP','IND_NEU_TECH','ge',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NAP','IND_CH_HVC_NAPSC_N','ge',0.139,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_HVC_NAPSC_N','ge',0.003,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_NAP','IND_CH_HVC_NAPSC_N','ge',0.858,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ETH','IND_CH_HVC_ETHSC_N','ge',0.193,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_HVC_ETHSC_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_ETH','IND_CH_HVC_ETHSC_N','ge',0.803,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_CH_HVC_GSOSC_N','ge',0.117,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_HVC_GSOSC_N','ge',0.003,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_DST','IND_CH_HVC_GSOSC_N','ge',0.88,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_CH_HVC_LPGSC_N','ge',0.145,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_HVC_LPGSC_N','ge',0.003,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_LPG','IND_CH_HVC_LPGSC_N','ge',0.852,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NAP','IND_CH_HVC_NCC_N','ge',0.147,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_MD','IND_CH_HVC_NCC_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_FS_NAP','IND_CH_HVC_NCC_N','ge',0.849,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_BIO','IND_CH_HVC_BDH_N','ge',0.017,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_MD','IND_CH_HVC_BDH_N','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_SB','IND_CH_HVC_BDH_N','ge',0.479,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_FS_BIO','IND_CH_HVC_BDH_N','ge',0.484,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_LPG','IND_CH_OLF_PDH_N','ge',0.154,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_CH_SB','IND_CH_OLF_PDH_N','ge',0.039,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_CH_MD','IND_CH_OLF_PDH_N','ge',0.001,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N','ge',0.805,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_LPG','IND_CH_OLF_PDH_N','ge',0.145,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_SB','IND_CH_OLF_PDH_N','ge',0.036,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_MD','IND_CH_OLF_PDH_N','ge',0.001,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_FS_LPG','IND_CH_OLF_PDH_N','ge',0.818,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_OLF_MTO_N','ge',0.089,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_MTH','IND_CH_OLF_MTO_N','ge',0.907,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_OLF_MTO_N','ge',0.003,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_AMM_NGASR_N','ge',0.57,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N','ge',0.42,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_AMM_NGASR_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_CH_AMM_NGASR_N','ge',0.44,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_N','ge',0.55,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_EC','IND_CH_AMM_NGASR_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_NGA','IND_CH_AMM_NGASR_CCS_N','ge',0.58,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_FS_NGA','IND_CH_AMM_NGASR_CCS_N','ge',0.41,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_MD','IND_CH_AMM_NGASR_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NAP','IND_CH_AMM_NAPPOX_N','ge',0.58,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_AMM_NAPPOX_N','ge',0.04,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NAP','IND_CH_AMM_NAPPOX_N','ge',0.5,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_FS_NAP','IND_CH_AMM_NAPPOX_N','ge',0.45,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_EC','IND_CH_AMM_NAPPOX_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_CH_AMM_COAGSF_N','ge',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N','ge',0.4,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_AMM_COAGSF_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_CH_AMM_COAGSF_N','ge',0.47,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_FS_HCO','IND_CH_AMM_COAGSF_N','ge',0.44,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_CH_EC','IND_CH_AMM_COAGSF_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_BIO','IND_CH_AMM_BIOGSF_N','ge',0.45,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_FS_BIO','IND_CH_AMM_BIOGSF_N','ge',0.46,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_EC','IND_CH_AMM_BIOGSF_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_H2E','IND_CH_AMM_ELCSYS_N','ge',0.89,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_MD','IND_CH_AMM_ELCSYS_N','ge',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_CH_MTH_NGASR_N','ge',0.41,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N','ge',0.58,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_MTH_NGASR_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NGA','IND_CH_MTH_NGASR_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_N','ge',0.61,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_CH_MD','IND_CH_MTH_NGASR_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_NGA','IND_CH_MTH_NGASR_CCS_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_FS_NGA','IND_CH_MTH_NGASR_CCS_N','ge',0.61,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_MD','IND_CH_MTH_NGASR_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COG','IND_CH_MTH_COGSR_N','ge',0.51,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_NGA','IND_CH_MTH_COGSR_N','ge',0.42,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_MTH_COGSR_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_LPG','IND_CH_MTH_LPGSR_N','ge',0.39,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_LPG','IND_CH_MTH_LPGSR_N','ge',0.56,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_MTH_LPGSR_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_CH_MTH_COAGSF_N','ge',0.54,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_FS_HCO','IND_CH_MTH_COAGSF_N','ge',0.39,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_MTH_COAGSF_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_BIO','IND_CH_MTH_BIOGSF_N','ge',0.46,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_FS_BIO','IND_CH_MTH_BIOGSF_N','ge',0.46,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_MD','IND_CH_MTH_BIOGSF_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_H2E','IND_CH_MTH_ELCSYS_N','ge',0.94,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_CH_MD','IND_CH_MTH_ELCSYS_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_CHL_MERC_N','ge',0.85,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_CHL_MERC_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_CHL_MERC_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_CHL_DIAP_N','ge',0.81,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_CHL_DIAP_N','ge',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_CHL_DIAP_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_EC','IND_CH_CHL_MEMB_N','ge',0.8,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_SB','IND_CH_CHL_MEMB_N','ge',0.12,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_CH_MD','IND_CH_CHL_MEMB_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BFG','IND_IS_BOF_BFBOF_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_FS','IND_IS_BOF_BFBOF_N','ge',0.58,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_MD','IND_IS_BOF_BFBOF_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_IS_BOF_BFBOF_N','ge',0.36,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_BFG','IND_IS_BOF_BFBOF_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N','ge',0.57,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_BOF_BFBOF_CCS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_IS_BOF_BFBOF_CCS_N','ge',0.35,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_BFG','IND_IS_BOF_BFBOF_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_IS_FS','IND_IS_BOF_BFBOF_CCS_N','ge',0.57,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_ELC','IND_IS_BOF_BFBOF_CCS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_COA','IND_IS_BOF_BFBOF_CCS_N','ge',0.36,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_IS_MD','IND_IS_BOF_BFBOF_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_BFG','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_IS_FS','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_ELC','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.04,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_COA','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.32,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_NGA','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_IS_MD','IND_IS_BOF_BFTGRBOF_CCS_N','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_ELC','IND_IS_DRI_DRIEAF_N','ge',0.7,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_IS_FS','IND_IS_DRI_DRIEAF_N','ge',0.22,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_IS_DRI_DRIEAF_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_DRI_DRIEAF_CCS_N','ge',0.66,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_FS','IND_IS_DRI_DRIEAF_CCS_N','ge',0.21,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_MD','IND_IS_DRI_DRIEAF_CCS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_DRI_DRIEAF_CCS_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_DRI_HDREAF_N','ge',0.22,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_H2','IND_IS_DRI_HDREAF_N','ge',0.6,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_DRI_HDREAF_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_MD','IND_IS_DRI_HDREAF_N','ge',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_NGA','IND_IS_BOF_HISBOF_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_ELC','IND_IS_BOF_HISBOF_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'IND_COA','IND_IS_BOF_HISBOF_N','ge',0.94,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_BOF_HISBOF_CCS_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_BOF_HISBOF_CCS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_IS_BOF_HISBOF_CCS_N','ge',0.92,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_MD','IND_IS_BOF_HISBOF_CCS_N','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_IS_BOF_ULCOWIN_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_BOF_ULCOWIN_N','ge',0.14,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_BOF_ULCOWIN_N','ge',0.8,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_BOF_ULCOLYSIS_N','ge',0.92,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_BOF_ULCOLYSIS_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_ELC','IND_IS_BOF_ULCORED_CCS_N','ge',0.66,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_FS','IND_IS_BOF_ULCORED_CCS_N','ge',0.21,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_IS_MD','IND_IS_BOF_ULCORED_CCS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_IS_BOF_ULCORED_CCS_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NF_AMN_BAY_N','ge',0.58,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_AMN_BAY_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_AMN_BAY_N','ge',0.27,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_AMN_BAY_N','ge',0.07,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_AMN','IND_NF_ALU_HLH_N','ge',0.04,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_ALU_HLH_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_ALU_HLH_N','ge',0.91,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_ALU_SEC_N','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_ALU_SEC_N','ge',0.86,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_ALU_SEC_N','ge',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NF_AMN','IND_NF_ALU_HLHIA_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_NF_ALU_HLHIA_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NF_EC','IND_NF_ALU_HLHIA_N','ge',0.9,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NF_AMN','IND_NF_ALU_CBT_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NGA','IND_NF_ALU_CBT_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NF_EC','IND_NF_ALU_CBT_N','ge',0.9,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NF_COP_N','ge',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NF_COP_N','ge',0.2,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NF_COP_N','ge',0.02,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_NF_COP_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_COP_N','ge',0.67,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_EC','IND_NF_ZNC_N','ge',0.76,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_SB','IND_NF_ZNC_N','ge',0.19,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NF_MD','IND_NF_ZNC_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_NF_EC','IND_NF_ZNC_N','ge',0.76,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_NF_SB','IND_NF_ZNC_N','ge',0.19,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2010,'IND_NF_MD','IND_NF_ZNC_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NF_EC','IND_NF_ZNC_N','ge',0.77,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NF_SB','IND_NF_ZNC_N','ge',0.18,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NF_MD','IND_NF_ZNC_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_NF_EC','IND_NF_ZNC_N','ge',0.77,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_NF_SB','IND_NF_ZNC_N','ge',0.17,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2040,'IND_NF_MD','IND_NF_ZNC_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NF_EC','IND_NF_ZNC_N','ge',0.79,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NF_SB','IND_NF_ZNC_N','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'IND_NF_MD','IND_NF_ZNC_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_CLK_DRY_N','ge',0.707,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CLK_DRY_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CLK_DRY_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_NM_CLK_DRY_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_CLK_DRY_N','ge',0.195,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_NM_CLK_DRY_BIO_N','ge',0.797,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CLK_DRY_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CLK_DRY_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_CLK_DRY_BIO_N','ge',0.195,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_CLK_WET_N','ge',0.64,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_CLK_WET_N','ge',0.16,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CLK_WET_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_NM_CLK_WET_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_CLK_WET_N','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_COA','IND_NM_CLK_DRYCL_PCCS_N','ge',0.734,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_HFO','IND_NM_CLK_DRYCL_PCCS_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NGA','IND_NM_CLK_DRYCL_PCCS_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_BIO','IND_NM_CLK_DRYCL_PCCS_N','ge',0.094,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_N','ge',0.043,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_N','ge',0.121,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_BIO','IND_NM_CLK_DRYCL_PCCS_BIO_N','ge',0.828,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_HFO','IND_NM_CLK_DRYCL_PCCS_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NGA','IND_NM_CLK_DRYCL_PCCS_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NM_EC','IND_NM_CLK_DRYCL_PCCS_BIO_N','ge',0.043,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'IND_NM_MD','IND_NM_CLK_DRYCL_PCCS_BIO_N','ge',0.121,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_NM_CLK_DRYCL_OCCS_N','ge',0.707,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_HFO','IND_NM_CLK_DRYCL_OCCS_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_NM_CLK_DRYCL_OCCS_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_BIO','IND_NM_CLK_DRYCL_OCCS_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_N','ge',0.195,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_BIO','IND_NM_CLK_DRYCL_OCCS_BIO_N','ge',0.797,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_HFO','IND_NM_CLK_DRYCL_OCCS_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_NM_CLK_DRYCL_OCCS_BIO_N','ge',0.004,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NM_EC','IND_NM_CLK_DRYCL_OCCS_BIO_N','ge',0.195,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_NM_CEM_AAC_N','ge',0.62,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_HFO','IND_NM_CEM_AAC_N','ge',0.16,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_NM_CEM_AAC_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_BIO','IND_NM_CEM_AAC_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NM_EC','IND_NM_CEM_AAC_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_COA','IND_NM_CEM_BEL_N','ge',0.61,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_HFO','IND_NM_CEM_BEL_N','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NGA','IND_NM_CEM_BEL_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_BIO','IND_NM_CEM_BEL_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_NM_EC','IND_NM_CEM_BEL_N','ge',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_COA','IND_NM_LIM_LRK_N','ge',0.42,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_HFO','IND_NM_LIM_LRK_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_LIM_LRK_N','ge',0.27,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_BIO','IND_NM_LIM_LRK_N','ge',0.21,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_LIM_LRK_N','ge',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_GLS_FOSS_N','ge',0.32,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_NM_GLS_FOSS_N','ge',0.63,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_GLS_FOSS_N','ge',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_GLS_ELEC_N','ge',0.31,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_OIL','IND_NM_GLS_ELEC_N','ge',0.69,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NGA','IND_NM_CRM_N','ge',0.88,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_NM_EC','IND_NM_CRM_N','ge',0.12,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PH','IND_PP_PUL_KRF_N','ge',0.41,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_KRF_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_KRF_N','ge',0.42,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','IND_PP_PUL_KRF_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_PH','IND_PP_PUL_KRF_N','ge',0.41,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_MD','IND_PP_PUL_KRF_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_SB','IND_PP_PUL_KRF_N','ge',0.41,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_SLB','IND_PP_PUL_KRF_N','ge',0.09,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PH','IND_PP_PUL_SUL_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_SUL_N','ge',0.17,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_SUL_N','ge',0.35,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','IND_PP_PUL_SUL_N','ge',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_PH','IND_PP_PUL_SUL_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_MD','IND_PP_PUL_SUL_N','ge',0.17,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_SB','IND_PP_PUL_SUL_N','ge',0.34,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_SLB','IND_PP_PUL_SUL_N','ge',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_MEC_N','ge',0.86,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','IND_PP_PUL_MEC_N','ge',0.14,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_MD','IND_PP_PUL_MEC_N','ge',0.85,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_SLB','IND_PP_PUL_MEC_N','ge',0.15,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_SCH_N','ge',0.31,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_SCH_N','ge',0.45,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_SLB','IND_PP_PUL_SCH_N','ge',0.24,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_MD','IND_PP_PUL_SCH_N','ge',0.3,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'IND_PP_SB','IND_PP_PUL_SCH_N','ge',0.44,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_SLB','IND_PP_PUL_SCH_N','ge',0.26,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PUL_REC_N','ge',0.38,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PUL_REC_N','ge',0.62,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_PUL','IND_PP_PAP_N','ge',0.08,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_MD','IND_PP_PAP_N','ge',0.35,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'IND_PP_SB','IND_PP_PAP_N','ge',0.57,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'ELC_CEN','IND_FT_H2','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'ELC_CEN','IND_FT_H2','ge',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_GAS','IND_FT_BIO','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_GAS','IND_FT_BIO','le',0.1,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_MET','IND_FT_NAP','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_MET','IND_FT_NAP','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_MET','IND_FT_NAP','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_MET','IND_FT_NAP','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_NGA','IND_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'SYN_NGA','IND_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_NGA','IND_FT_NGA','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_NGA','IND_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_NGA','IND_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'BIO_METH','IND_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'BIO_METH','IND_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'BIO_METH','IND_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'BIO_METH','IND_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'BIO_METH','IND_FT_NGA','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'BIO_METH','IND_FT_NGA','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2020,'H2_BL','IND_FT_NGA','le',0.01,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'H2_BL','IND_FT_NGA','le',0.03,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'H2_BL','IND_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'H2_BL','IND_FT_NGA','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_DST','IND_FT_OIL','le',0.64,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_KER','IND_FT_OIL','le',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_GSL','IND_FT_OIL','le',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'OIL_JTK','IND_FT_OIL','le',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_DST','IND_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2007,'SYN_KER','IND_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'OIL_DST','IND_FT_OIL','le',0.64,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'OIL_KER','IND_FT_OIL','le',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'OIL_GSL','IND_FT_OIL','le',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'OIL_JTK','IND_FT_OIL','le',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_DST','IND_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2025,'SYN_KER','IND_FT_OIL','le',0.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'OIL_DST','IND_FT_OIL','le',0.64,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'OIL_KER','IND_FT_OIL','le',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'OIL_GSL','IND_FT_OIL','le',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'OIL_JTK','IND_FT_OIL','le',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_DST','IND_FT_OIL','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2030,'SYN_KER','IND_FT_OIL','le',0.05,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_DST','IND_FT_OIL','le',0.64,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_KER','IND_FT_OIL','le',0.11,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_GSL','IND_FT_OIL','le',0.52,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'OIL_JTK','IND_FT_OIL','le',0.13,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_DST','IND_FT_OIL','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'SYN_KER','IND_FT_OIL','le',1.0,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2014,'ELC_CEN','IND_FT_H2','le',0.06,'');
INSERT INTO "limit_tech_input_split_annual" VALUES('IT',2050,'ELC_CEN','IND_FT_H2','le',0.06,'');

CREATE TABLE limit_tech_output_split (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    tech        TEXT REFERENCES technology(tech),
    output_comm TEXT REFERENCES commodity(name),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion  REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, tech, output_comm, operator)
);
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.438,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.455,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.477,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.511,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_NGA_CI_N','ELC_DST','ge',0.518,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.392,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.4,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.414,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TG_N','ELC_DST','ge',0.438,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.2,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.211,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.225,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TV_N','ELC_DST','ge',0.241,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.431,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.453,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.466,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_BLQ_CI_N','ELC_DST','ge',0.483,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_CI_N','IND_HET','ge',0.562,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_CI_N','IND_HET','ge',0.545,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_CI_N','IND_HET','ge',0.523,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_CI_N','IND_HET','ge',0.489,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_NGA_CI_N','IND_HET','ge',0.482,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TG_N','IND_HET','ge',0.608,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TG_N','IND_HET','ge',0.6,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TG_N','IND_HET','ge',0.586,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TG_N','IND_HET','ge',0.562,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2007,'IND_CHP_NGA_TV_N','IND_HET','ge',0.8,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_NGA_TV_N','IND_HET','ge',0.789,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_NGA_TV_N','IND_HET','ge',0.775,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_NGA_TV_N','IND_HET','ge',0.759,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2014,'IND_CHP_BLQ_CI_N','IND_HET','ge',0.569,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2022,'IND_CHP_BLQ_CI_N','IND_HET','ge',0.547,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2030,'IND_CHP_BLQ_CI_N','IND_HET','ge',0.534,'');
INSERT INTO "limit_tech_output_split" VALUES('IT',2050,'IND_CHP_BLQ_CI_N','IND_HET','ge',0.517,'');

CREATE TABLE limit_tech_output_split_annual (
    region      TEXT,
    period      INTEGER REFERENCES time_period(period),
    tech        TEXT REFERENCES technology(tech),
    output_comm TEXT REFERENCES commodity(name),
    operator    TEXT NOT NULL DEFAULT 'le' REFERENCES operator(operator),
    proportion  REAL,
    notes       TEXT,
    PRIMARY KEY(region, period, tech, output_comm, operator)
);
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_MEC_E','IND_PP_SB','ge',0.69,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_MEC_E','IND_PP_PUM','ge',0.31,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_NAPSC_N','IND_CH_SB','ge',0.58,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_NAPSC_N','IND_CH_HVC','ge',0.42,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_NAPSC_N','IND_CH_SB','ge',0.68,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_NAPSC_N','IND_CH_HVC','ge',0.32,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_ETHSC_N','IND_CH_SB','ge',0.58,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_ETHSC_N','IND_CH_HVC','ge',0.42,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_ETHSC_N','IND_CH_SB','ge',0.75,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_ETHSC_N','IND_CH_HVC','ge',0.25,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_GSOSC_N','IND_CH_SB','ge',0.58,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_GSOSC_N','IND_CH_HVC','ge',0.42,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_LPGSC_N','IND_CH_SB','ge',0.58,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_HVC_LPGSC_N','IND_CH_HVC','ge',0.42,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_LPGSC_N','IND_CH_SB','ge',0.74,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_HVC_LPGSC_N','IND_CH_HVC','ge',0.26,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2020,'IND_CH_HVC_NCC_N','IND_CH_SB','ge',0.545,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2020,'IND_CH_HVC_NCC_N','IND_CH_HVC','ge',0.455,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_OLF_MTO_N','IND_CH_OLF','ge',0.48,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_OLF_MTO_N','IND_CH_SB','ge',0.52,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_NGASR_N','IND_CH_AMM','ge',0.1,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_NGASR_N','IND_CH_SB','ge',0.9,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_NGASR_N','IND_CH_AMM','ge',0.08,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_NGASR_N','IND_CH_SB','ge',0.92,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_AMM_NGASR_CCS_N','IND_CH_AMM','ge',0.1,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_AMM_NGASR_CCS_N','IND_CH_SB','ge',0.9,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM','ge',0.11,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_NAPPOX_N','IND_CH_SB','ge',0.89,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_AMM','ge',0.09,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_NAPPOX_N','IND_CH_SB','ge',0.91,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_COAGSF_N','IND_CH_AMM','ge',0.4,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_AMM_COAGSF_N','IND_CH_SB','ge',0.6,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_COAGSF_N','IND_CH_AMM','ge',0.345,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_AMM_COAGSF_N','IND_CH_SB','ge',0.655,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_AMM','ge',0.37,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_AMM_BIOGSF_N','IND_CH_SB','ge',0.63,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_NGASR_N','IND_CH_MTH','ge',0.26,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_NGASR_N','IND_CH_SB','ge',0.74,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2020,'IND_CH_MTH_NGASR_N','IND_CH_MTH','ge',0.25,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2020,'IND_CH_MTH_NGASR_N','IND_CH_SB','ge',0.75,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_MTH_NGASR_CCS_N','IND_CH_MTH','ge',0.25,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_MTH_NGASR_CCS_N','IND_CH_SB','ge',0.75,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_COGSR_N','IND_CH_MTH','ge',0.15,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_COGSR_N','IND_CH_SB','ge',0.85,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_LPGSR_N','IND_CH_MTH','ge',0.26,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_LPGSR_N','IND_CH_SB','ge',0.74,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_COAGSF_N','IND_CH_MTH','ge',0.15,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_MTH_COAGSF_N','IND_CH_SB','ge',0.85,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_MTH','ge',0.145,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2025,'IND_CH_MTH_BIOGSF_N','IND_CH_SB','ge',0.855,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_CHL_MERC_N','IND_CH_CHL','ge',0.7,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_CHL_MERC_N','IND_CH_CHL','ge',0.54,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_CHL_DIAP_N','IND_CH_CHL','ge',0.7,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_CHL_DIAP_N','IND_CH_CHL','ge',0.54,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_CH_CHL_MEMB_N','IND_CH_CHL','ge',0.7,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_CH_CHL_MEMB_N','IND_CH_CHL','ge',0.54,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_IS_BOF_BFBOF_N','IND_IS_BOF','ge',0.22,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_BOF_BFBOF_CCS_N','IND_IS_BOF','ge',0.22,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2040,'IND_IS_BOF_BFTGRBOF_CCS_N','IND_IS_BOF','ge',0.22,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_IS_DRI_DRIEAF_N','IND_IS_EAF','ge',0.83,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_IS_DRI_DRIEAF_N','IND_IS_SB','ge',0.17,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N','IND_IS_EAF','ge',0.83,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_DRI_DRIEAF_CCS_N','IND_IS_SB','ge',0.17,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_DRI_HDREAF_N','IND_IS_EAF','ge',0.83,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_DRI_HDREAF_N','IND_IS_SB','ge',0.17,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_BOF_ULCORED_CCS_N','IND_IS_EAF','ge',0.83,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_IS_BOF_ULCORED_CCS_N','IND_IS_SB','ge',0.17,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_KRF_N','BIO_BIN','ge',0.77,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_KRF_N','IND_ELC_BP','ge',0.2,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_KRF_N','IND_PP_PUC','ge',0.03,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_SUL_N','BIO_BIN','ge',0.76,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_SUL_N','IND_ELC_BP','ge',0.18,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_SUL_N','IND_PP_PUC','ge',0.06,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_MEC_N','IND_PP_PUM','ge',0.27,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2007,'IND_PP_PUL_MEC_N','IND_PP_SB','ge',0.73,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_PP_PUL_MEC_N','IND_PP_PUM','ge',0.15,'');
INSERT INTO "limit_tech_output_split_annual" VALUES('IT',2030,'IND_PP_PUL_MEC_N','IND_PP_SB','ge',0.85,'');

CREATE TABLE linked_tech (
    primary_region TEXT,
    primary_tech   TEXT REFERENCES technology(tech),
    emis_comm      TEXT REFERENCES commodity(name),
    driven_tech    TEXT REFERENCES technology(tech),
    notes          TEXT,
    PRIMARY KEY(primary_region, primary_tech, emis_comm)
);

CREATE TABLE loan_lifetime_process (
    region   TEXT,
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    lifetime REAL,
    units    TEXT,
    notes    TEXT,
    PRIMARY KEY(region, tech, vintage)
);

CREATE TABLE loan_rate (
    region  TEXT,
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER REFERENCES time_period(period),
    rate    REAL,
    notes   TEXT,
    PRIMARY KEY(region, tech, vintage)
);
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_NAPSC_N',2007,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_ETHSC_N',2007,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_GSOSC_N',2007,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_LPGSC_N',2007,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_NCC_N',2020,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_HVC_BDH_N',2020,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_OLF_PDH_N',2010,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_OLF_MTO_N',2007,0.079,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_NGASR_N',2007,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_NGASR_CCS_N',2025,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_NAPPOX_N',2007,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_COAGSF_N',2007,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_BIOGSF_N',2025,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_AMM_ELCSYS_N',2025,0.1,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_NGASR_N',2007,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_NGASR_CCS_N',2025,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_COGSR_N',2007,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_LPGSR_N',2007,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_COAGSF_N',2007,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_BIOGSF_N',2025,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_MTH_ELCSYS_N',2025,0.092,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_CHL_MERC_N',2007,0.084,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_CHL_DIAP_N',2007,0.084,'');
INSERT INTO "loan_rate" VALUES('IT','IND_CH_CHL_MEMB_N',2007,0.084,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_BFBOF_N',2007,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_BFBOF_CCS_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_BFTGRBOF_CCS_N',2040,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_DRI_DRIEAF_N',2007,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_DRI_DRIEAF_CCS_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_DRI_HDREAF_N',2030,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_HISBOF_N',2025,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_HISBOF_CCS_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_ULCOWIN_N',2030,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_ULCOLYSIS_N',2030,0.095,'');
INSERT INTO "loan_rate" VALUES('IT','IND_IS_BOF_ULCORED_CCS_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_AMN_BAY_N',2007,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ALU_HLH_N',2007,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ALU_SEC_N',2007,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ALU_HLHIA_N',2030,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ALU_CBT_N',2050,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ALU_KAO_N',2050,0.074,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_COP_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NF_ZNC_N',2007,0.098,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRY_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRY_BIO_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_WET_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_N',2020,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRYCL_PCCS_BIO_N',2020,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CLK_DRYCL_OCCS_BIO_N',2030,0.15,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CEM_BLN_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CEM_AAC_N',2030,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CEM_BEL_N',2030,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_LIM_LRK_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_GLS_FOSS_N',2007,0.065,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_GLS_ELEC_N',2007,0.065,'');
INSERT INTO "loan_rate" VALUES('IT','IND_NM_CRM_N',2007,0.094,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PUL_KRF_N',2007,0.099,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PUL_SUL_N',2007,0.099,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PUL_MEC_N',2007,0.099,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PUL_SCH_N',2007,0.099,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PUL_REC_N',2007,0.099,'');
INSERT INTO "loan_rate" VALUES('IT','IND_PP_PAP_N',2007,0.099,'');

CREATE TABLE metadata (
    element TEXT PRIMARY KEY,
    value   INT,
    notes   TEXT
);
INSERT INTO "metadata" VALUES('DB_MAJOR',4,NULL);
INSERT INTO "metadata" VALUES('DB_MINOR',0,NULL);

CREATE TABLE metadata_real (
    element TEXT PRIMARY KEY,
    value   REAL,
    notes   TEXT
);
INSERT INTO "metadata_real" VALUES('global_discount_rate',0.05,NULL);
INSERT INTO "metadata_real" VALUES('default_loan_rate',0.05,NULL);

CREATE TABLE myopic_efficiency (
    base_year   INTEGER,
    region      TEXT,
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    efficiency  REAL,
    lifetime    INTEGER,
    PRIMARY KEY(region, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_built_capacity (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    PRIMARY KEY(region, scenario, tech, vintage)
);

CREATE TABLE output_cost (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    d_invest REAL,
    d_fixed  REAL,
    d_var    REAL,
    d_emiss  REAL,
    invest   REAL,
    fixed    REAL,
    var      REAL,
    emiss    REAL,
    units    TEXT,
    PRIMARY KEY(scenario, region, period, tech, vintage)
);

CREATE TABLE output_curtailment (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT,
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    curtailment REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_dual_variable (
    scenario        TEXT,
    constraint_name TEXT,
    dual            REAL,
    PRIMARY KEY(constraint_name, scenario)
);

CREATE TABLE output_emission (
    scenario  TEXT,
    region    TEXT,
    sector    TEXT REFERENCES sector_label(sector),
    period    INTEGER REFERENCES time_period(period),
    emis_comm TEXT REFERENCES commodity(name),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    emission  REAL,
    units     TEXT,
    PRIMARY KEY(region, scenario, period, emis_comm, tech, vintage)
);

CREATE TABLE output_flow_in (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT REFERENCES sector_label(sector),
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    flow        REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_flow_out (
    scenario    TEXT,
    region      TEXT,
    sector      TEXT REFERENCES sector_label(sector),
    period      INTEGER REFERENCES time_period(period),
    season      TEXT REFERENCES time_season(season),
    tod         TEXT REFERENCES time_of_day(tod),
    input_comm  TEXT REFERENCES commodity(name),
    tech        TEXT REFERENCES technology(tech),
    vintage     INTEGER REFERENCES time_period(period),
    output_comm TEXT REFERENCES commodity(name),
    flow        REAL,
    units       TEXT,
    PRIMARY KEY(region, scenario, period, season, tod, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_flow_out_summary (
    scenario    TEXT NOT NULL,
    region      TEXT NOT NULL,
    sector      TEXT,
    period      INTEGER,
    input_comm  TEXT NOT NULL,
    tech        TEXT NOT NULL,
    vintage     INTEGER,
    output_comm TEXT NOT NULL,
    flow        REAL NOT NULL,
    PRIMARY KEY(scenario, region, period, input_comm, tech, vintage, output_comm)
);

CREATE TABLE output_net_capacity (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    capacity REAL,
    units    TEXT,
    PRIMARY KEY(region, scenario, period, tech, vintage)
);

CREATE TABLE output_objective (
    scenario          TEXT,
    objective_name    TEXT,
    total_system_cost REAL
);

CREATE TABLE output_retired_capacity (
    scenario  TEXT,
    region    TEXT,
    sector    TEXT REFERENCES sector_label(sector),
    period    INTEGER REFERENCES time_period(period),
    tech      TEXT REFERENCES technology(tech),
    vintage   INTEGER REFERENCES time_period(period),
    cap_eol   REAL,
    cap_early REAL,
    units     TEXT,
    PRIMARY KEY(region, scenario, period, tech, vintage)
);

CREATE TABLE output_storage_level (
    scenario TEXT,
    region   TEXT,
    sector   TEXT REFERENCES sector_label(sector),
    period   INTEGER REFERENCES time_period(period),
    season   TEXT,
    tod      TEXT REFERENCES time_of_day(tod),
    tech     TEXT REFERENCES technology(tech),
    vintage  INTEGER REFERENCES time_period(period),
    level    REAL,
    units    TEXT,
    PRIMARY KEY(scenario, region, period, season, tod, tech, vintage)
);

CREATE TABLE planning_reserve_margin (
    region TEXT PRIMARY KEY REFERENCES region(region),
    margin REAL,
    notes  TEXT
);

CREATE TABLE ramp_down_hourly (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    rate   REAL,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE ramp_up_hourly (
    region TEXT,
    tech   TEXT REFERENCES technology(tech),
    rate   REAL,
    notes  TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE reserve_capacity_derate (
    region  TEXT,
    season  TEXT REFERENCES time_season(season),
    tech    TEXT REFERENCES technology(tech),
    vintage INTEGER,
    factor  REAL,
    notes   TEXT,
    PRIMARY KEY(region, season, tech, vintage),
    CHECK(factor >= 0 AND factor <= 1)
);

CREATE TABLE tech_group (
    group_name TEXT PRIMARY KEY,
    notes      TEXT
);
INSERT INTO "tech_group" VALUES('IND_MD_GRP','');
INSERT INTO "tech_group" VALUES('IND_MD_ELC_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_FS_NGA_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_FS_OIL_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_FS_NAP_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_OTH_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_OTH_NGA_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_OTH_ELC_GRP','');
INSERT INTO "tech_group" VALUES('IND_CH_OTH_COK_GRP','');
INSERT INTO "tech_group" VALUES('IND_NF_OTH_GRP','');
INSERT INTO "tech_group" VALUES('IND_NF_OTH_ELC_GRP','');
INSERT INTO "tech_group" VALUES('IND_NM_OTH_GRP','');

CREATE TABLE rps_requirement (
    region      TEXT NOT NULL REFERENCES region(region),
    period      INTEGER NOT NULL REFERENCES time_period(period),
    tech_group  TEXT NOT NULL REFERENCES tech_group(group_name),
    requirement REAL NOT NULL,
    notes       TEXT
);

CREATE TABLE storage_duration (
    region   TEXT,
    tech     TEXT,
    duration REAL,
    notes    TEXT,
    PRIMARY KEY(region, tech)
);

CREATE TABLE tech_group_member (
    group_name TEXT REFERENCES tech_group(group_name),
    tech       TEXT REFERENCES technology(tech),
    PRIMARY KEY(group_name, tech)
);
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_DST_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_DST_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_GSL_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_HFO_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_KER_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_LPG_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_LPG_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_NAP_GRP','IND_CH_FS_NAP_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_NAP_GRP','IND_CH_FS_NAP_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_NGA_GRP','IND_CH_FS_NGA_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_NGA_GRP','IND_CH_FS_NGA_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_FS_OIL_GRP','IND_CH_FS_NSP_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_COK_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_COK_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_DST_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_DST_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_ETH_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_ETH_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_HFO_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_HFO_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_NGA_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_NGA_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_GRP','IND_CH_OTH_PTC_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_NGA_GRP','IND_CH_OTH_NGA_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_NGA_GRP','IND_CH_OTH_NGA_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_ELC_GRP','IND_CH_OTH_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_ELC_GRP','IND_CH_OTH_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_COK_GRP','IND_CH_OTH_COK_E');
INSERT INTO "tech_group_member" VALUES('IND_CH_OTH_COK_GRP','IND_CH_OTH_COK_N');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_DST_E');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_DST_N');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_LPG_N');
INSERT INTO "tech_group_member" VALUES('IND_MD_GRP','IND_MD_NGA_N');
INSERT INTO "tech_group_member" VALUES('IND_MD_ELC_GRP','IND_MD_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_MD_ELC_GRP','IND_MD_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_DST_E');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_DST_N');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_LPG_E');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_NGA_E');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_GRP','IND_NF_OTH_NGA_N');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_ELC_GRP','IND_NF_OTH_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_NF_OTH_ELC_GRP','IND_NF_OTH_ELC_N');
INSERT INTO "tech_group_member" VALUES('IND_NM_OTH_GRP','IND_NM_OTH_COK_E');
INSERT INTO "tech_group_member" VALUES('IND_NM_OTH_GRP','IND_NM_OTH_DST_E');
INSERT INTO "tech_group_member" VALUES('IND_NM_OTH_GRP','IND_NM_OTH_ELC_E');
INSERT INTO "tech_group_member" VALUES('IND_NM_OTH_GRP','IND_NM_OTH_LPG_E');
INSERT INTO "tech_group_member" VALUES('IND_NM_OTH_GRP','IND_NM_OTH_NGA_E');

CREATE TABLE time_season_sequential (
    sequence         INTEGER UNIQUE,
    seas_seq         TEXT PRIMARY KEY,
    season           TEXT REFERENCES time_season(season),
    segment_fraction REAL NOT NULL,
    notes            TEXT,
    CHECK(segment_fraction >= 0 AND segment_fraction <= 1)
);
COMMIT;
