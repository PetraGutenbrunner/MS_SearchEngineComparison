## UPS1 CID
searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/075-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/073-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/079-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1/TOPPAS_out/077-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","blue")
)
database<-"DB: Human"

# unexpected
compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID/Venn4_UPS1CID_PeptideLevel_Unexp_Tbl.png"
, 3)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## UPS1 ETD
searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/061-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/059-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/065-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1/TOPPAS_out/063-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","blue")
)
database<-"DB: Human"
	
# Match against additional protein list
# Overlaptype: 1 Proteins, 2: Contaniments, 3: Unexpected

# unexpected
compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_ProteinLevel_Unexp_Diag.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_PSMLevel_Unexp_Diag.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD/Venn4_UPS1ETD_PeptideLevel_Unexp_Diag.png"
, 3)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## UPS1 CID BiDB
searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/075-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/073-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/079-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/077-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","blue")	
	)
database<-"DB: Human Bipartite"

# Match against additional protein list
# Overlaptype: 1 Proteins, 2: Contaniments, 3: Unexpected

# unexpected
compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_ProteinLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PSMLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PeptideLevel_Unexp_Tbl.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PSMLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PSMLevel_Expected_Tbl.png"
, 1)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PeptideLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1CID_BiDB_PeptideLevel_Expected_Tbl.png"
, 1)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## UPS1 ETD BiDB
searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/061-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/059-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/065-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/063-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","blue")
	)
database<-"DB: Human Bipartite"

# Match against additional protein list
# Overlaptype: 1 Proteins, 2: Contaniments, 3: Unexpected

# unexpected
compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 1, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_ProteinLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_ProteinLevel_Unexp_Diag.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PSMLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PSMLevel_Unexp_Diag.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PeptideLevel_Unexp_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PeptideLevel_Unexp_Diag.png"
, 3)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 2, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PSMLevel_Expected_Venn.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PSMLevel_Expected_Diag.png"
, 1)

compareFoundProteins_4Overlap(database, 0.01, searchengines
, "P:/Petra/TOPPAS/Results/UPS1/UPS1ProteinList_AdditionalFiltering.tab", "CON:", 3, 6
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PeptideLevel_Expected_Diag.png"
, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1ETD_BiDB_PeptideLevel_Expected_Tbl.png"
, 1)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------