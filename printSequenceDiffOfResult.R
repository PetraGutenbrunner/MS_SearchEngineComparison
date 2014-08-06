# ====================================================================================
# getSequenceDiffs:
# print sequences of search result file1 which are not included in search result file2
# percolator resultfiles ending with .unknown and have a different file structure,
# therefore a separated function readSequenceFromPercolator for parsing the file is 
# necessary
# ====================================================================================
getSequenceDiffs = function(file1, file2) {
	
	#cData = read.csv(file = file2, sep = ";")
	
	if(count(file1, "unknown") > 0) {
		sequence1 <- readSequenceFromPercolator(file1, 5, "", 0)
		sequence1 <- data.frame("V5"=sequence1)
	} else {
		data1 <- read.csv(file = file1, sep = ";", header=FALSE, skip=1)
		sequence1 <- subset(data1, select = c(5))		
	}
	
	if(count(file2, "unknown") > 0) {
		sequence2 <- readSequenceFromPercolator(file2, 5, "", 0)
		sequence2 <- data.frame("V5"=sequence2)
	} else {
		data2 <- read.csv(file = file2, sep = ";", header=FALSE, skip=1)
		sequence2 <- subset(data2, select = c(5))		
	}
	
	sequence1 <- unique(sequence1)
	sequence2 <- unique(sequence2)
		
	print(sequence1$V5[!sequence1$V5 %in% sequence2$V5])
}

getSequenceDiffs("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v3/TOPPAS_out/011-GenericWrapper-EToolout_psms/ecoli_cid_input.unknown"
	,"P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v3/TOPPAS_out/060-TextExporter-out/ecoli_cid_input.csv")
	
getSequenceDiffs("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v3/TOPPAS_out/060-TextExporter-out/ecoli_cid_input.csv"
	,"P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v3/TOPPAS_out/011-GenericWrapper-EToolout_psms/ecoli_cid_input.unknown")