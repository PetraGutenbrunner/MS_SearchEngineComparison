# ====================================================================================
# IDPepScorePlot: ROC plot of PSM scores separated by target, decoy, target+decoy hits
# all missing function are stored in sharedFunctions
# ====================================================================================

#0.. target, 1.. decoy, 2.. mixed
isTargetDecoyHit = function(accession, dcy_pattern) {
	accession <- as.character(accession)
	if(nchar(accession) == 0)
		return(-1)
		
	accession <- gsub("XXX_","XXX:", accession, fixed=TRUE)
	cntTotal <- count(accession, "_") + 1
	cntDecoy <- count(accession, "XXX:")
	
	if(cntDecoy == 0)
		return(0)
	if(cntTotal == cntDecoy)
		return(1)
	if(cntTotal > cntDecoy && cntDecoy != 0)
		return(2)
	
	return(-1)
}
# type=0: target, type=1: decoy, type=2: target=decoy
IDPepScorePlot = function(type, searchengines) {
	sData = list()
	y_size = 0
	
	title <- "target+decoy"
	if (type == 0)
		title <- "target"
	if (type == 1)
		title <- "decoy"
		
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		data <- read.csv(file = searchengines[[searchengine]][1], sep = ";", header=FALSE, skip=1)
		accession <- data[,11]
		data$target_dcy <- sapply(accession, function(x){ 1 })
		
		plot_data <- data[data$target_dcy == type,]
		score <- sort(plot_data[,3])
		sData[[searchengine]] = score		
		
		if (length(score) > y_size) {
			y_size = length(score)
		}
	}
	
	i = 1
	for (searchengine in names(sData)) {
		score = sData[[searchengine]]
		scoreTbl = table(score)
		
		if (i == 1) {
			plot(as.numeric(names(scoreTbl)), cumsum(scoreTbl), type = "l", ylim = c(0, y_size), xlim = c(0, 1), xlab = "pep score", ylab = "Identified peptides", col = searchengines[[searchengine]][2])
			title(main = title, cex.main = 2,   font.main= 4)
		} else {
			lines(as.numeric(names(scoreTbl)), cumsum(scoreTbl), col = searchengines[[searchengine]][2])
		}
		i = i + 1		
	}	
	legend("bottomright", legend=sapply(names(searchengines), as.expression), lty=c(1,1), lwd=c(2.5,2.5), col = sapply(searchengines, function(x){ x[2] }) )	
}

searchengines = list(Mascot = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID/TOPPAS_out/034-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","red")
	, XTandem = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID/TOPPAS_out/036-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","blue")
	, MSGFPlus = c("P:/Petra/TOPPAS/TOPPAS_OUT/CompareSearchEngines_v5_CID/TOPPAS_out/029-TextExporter-out/OT_UPS1_10fm_2009Oct21-CID_1.csv","pink")
)
# target hits
IDPepScorePlot(0, searchengines)
dev.new()
# decoy hits
IDPepScorePlot(1, searchengines)
dev.new()
# target+decoy hits
IDPepScorePlot(2, searchengines)