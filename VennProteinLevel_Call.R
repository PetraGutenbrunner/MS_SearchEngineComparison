#ANALYSIS

#HELA CID

searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/090-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","black")
	, MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_Hela_2011Nov17-120cid.unknown","orange")
	, MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_Hela_2011Nov17-120cid.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/Venn3_HeLACID_ProteinLevel.png", 0)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/075-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/073-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/079-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/077-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","blue")
)
Venn4ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/Venn4_HeLACID_ProteinLevel.png", 0)

#without transcripts & isoforms
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/090-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","black")
	, MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_Hela_2011Nov17-120cid.unknown","orange")
	, MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_Hela_2011Nov17-120cid.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/Venn3_HeLACID_ProteinLevel_without_iso.png", 1)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/075-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/073-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/079-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngine_v5_HeLA_CID/TOPPAS_out/077-TextExporter-out/OT_Hela_2011Nov17-120cid.csv","blue")
)
Venn4ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/Venn4_HeLACID_ProteinLevel_without_iso.png", 1)
-------------------------------------------------------------------------------------------------------------------------------
#HELA HCD

searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/090-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","black")
	, MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_HeLA_FTdig_2010July29-05hcd.unknown","orange")
	, MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_HeLA_FTdig_2010July29-05hcd.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/HCD/Venn3_HeLAHCD_ProteinLevel.png", 0)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/075-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/073-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/079-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/077-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","blue")
)
Venn4ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/HCD/Venn4_HeLAHCD_ProteinLevel.png", 0)

#without transcripts & isoforms
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/090-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","black")
	, MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_HeLA_FTdig_2010July29-05hcd.unknown","orange")
	, MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_HeLA_FTdig_2010July29-05hcd.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/HCD/Venn3_HeLAHCD_ProteinLevel_without_iso.png", 1)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/075-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/073-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/079-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_HeLA_HCD/TOPPAS_out/077-TextExporter-out/OT_HeLA_FTdig_2010July29-05hcd.csv","blue")
)
Venn4ProteinLevel("Protein level (DB: GenCode,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/HELA/HCD/Venn4_HeLAHCD_ProteinLevel_without_iso.png", 1)
-------------------------------------------------------------------------------------------------------------------------------
#UPS1 CID BiDB
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/091-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/043-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-CID_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-CID_1.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: Human Bipartite,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn3_UPS1BiDBCID_ProteinLevel.png", 0)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/075-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/073-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/079-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID_UPS1_BiDB/TOPPAS_out/077-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","blue")	
	)
Venn4ProteinLevel("Protein level (DB: Human Bipartite,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/CID_BiDB/Venn4_UPS1BiDBCID_ProteinLevel.png", 0)

#UPS1 ETD BiDB
searchengines = list(ConsensusID = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/076-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","black")
	,MSGFPlusPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/039-GenericWrapper-EToolout_psms/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","orange")
	,MascotPercolator = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/006-GenericWrapper-EToolout_tab/OT_UPS1_10fm_2009Oct21-ETD_1.unknown","purple")
)
Venn3ProteinLevel("Protein level (DB: Human Bipartite,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn3_UPS1BiDBETD_ProteinLevel.png", 0)

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/061-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","red")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/059-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","pink")
	, OMSSA = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/065-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","green")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_ETD_UPS1_BiDB/TOPPAS_out/063-TextExporter-out/OT_UPS1_10fm_2009Oct21-ETD_1.csv","blue")
	)
Venn4ProteinLevel("Protein level (DB: Human Bipartite,", 0.01, searchengines, "P:/Petra/TOPPAS/Results/UPS1/ETD_BiDB/Venn4_UPS1BiDBETD_ProteinLevel.png", 0)