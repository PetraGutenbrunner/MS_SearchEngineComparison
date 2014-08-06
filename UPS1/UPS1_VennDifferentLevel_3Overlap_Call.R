## UPS1 CID
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/091-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-CID_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-CID_1.unknown","purple")
)
database<-"DB: Human"

# Match against additional protein list
# unexpected
compareFoundProteins_3Overlap(database, 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn3_UPS1CID_PeptideLevel_Unexp_Tbl.png"
, 3)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## UPS1 ETD
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/076-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/039-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","purple")
)
database<-"DB: Human"

# Match against additional protein list
# unexpected
compareFoundProteins_3Overlap(database, 0.01, searchengines, 
"P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines, 
"P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines, 
"P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn3_UPS1ETD_PeptideLevel_Unexp_Tbl.png"
, 3)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## UPS1 CID BiDB
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/091-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-CID_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-CID_1.unknown","purple")
)
database<-"DB: Human Bipartite"

# Match against additional protein list
# Overlaptype: 1 Proteins, 2: Contaniments, 3: Unexpected

# unexpected
compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PeptideLevel_Unexp_Tbl.png"
, 3)

# proteins
compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_ProteinLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_ProteinLevel_Expected_Tbl.png"
, 1)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PSMLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PSMLevel_Expected_Tbl.png"
, 1)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PeptideLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1CID_BiDB_PeptideLevel_Expected_Tbl.png"
, 1)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## UPS1 ETD BiDB
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/076-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/039-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","purple")
)
database<-"DB: Human Bipartite"

# Match against additional protein list
# Overlaptype: 1 Proteins, 2: Contaniments, 3: Unexpected

# unexpected
compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PeptideLevel_Unexp_Tbl.png"
, 3)

# proteins
compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_ProteinLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_ProteinLevel_Expected_Tbl.png"
, 1)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PSMLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PSMLevel_Expected_Tbl.png"
, 1)

compareFoundProteins_3Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PeptideLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1ETD_BiDB_PeptideLevel_Expected_Tbl.png"
, 1)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#########
resultL1 <- resultOverlapTbl(unexpectedCIDL1, unexpectedETDL1)
resultL3 <- resultOverlapTbl(unexpectedCIDL3, unexpectedETDL3)

## CID
# 3
overlappep <- unexpectedCIDL3$val[unexpectedCIDL3$cnt == 3]

# 2 (Mascot Percolator, MSGF Percolator
overlappep <- unexpectedCIDL3[unexpectedCIDL3$cnt == 2 & unexpectedCIDL3$data2 == TRUE & unexpectedCIDL3$data3 == TRUE,]
overlappep <- as.character(overlappep$val)

## ETD
# 3
overlappep <- unexpectedETDL3$val[unexpectedETDL3$cnt == 3]

# 2 (ConsensusID, Mascot Percolator
overlappep <- unexpectedETDL3[unexpectedETDL3$cnt == 2 & unexpectedETDL3$data1 == TRUE & unexpectedETDL3$data3 == TRUE,]
overlappep <- as.character(overlappep$val)

df[df$V5 %in% overlappep,]