# ====================================================================================
# VENN plot of 3 (Venn3ProteinLevel) or 4 (Venn4ProteinLevel) different search files,
# calculating the overlap of all protein accessions.
# The plot is saved as png file
# all missing function are stored in sharedFunctions
# ====================================================================================

getHelaAccession = function(accession) {
	accessions <- unlist(strsplit(accession,"|", fixed=TRUE))
	return(as.character(accessions[3]))
}
formatSequence<-function(value) {
	value <- gsub("[UNIMOD:4]","(Carbamidomethyl)",value, fixed=TRUE)
	value <- gsub("[UNIMOD:7]","(Deamidated)",value, fixed=TRUE)
	value <- gsub("[UNIMOD:35]","(Oxidation)",value, fixed=TRUE)
	value <- gsub(".[unknown]",".(Acetyl)",value, fixed=TRUE)

	if(count(value,"[UNIMOD:") > 1) {
		print("ERROR: unknown mod")
		print(value)
	}

	if (count(value,".") == 2) {
		value <- substr(value, 3, nchar(value)-2)
	} else {
		print("ERROR: format not x.xxx.x")
	}
	return(value)
}

Venn3ProteinLevel = function (title, cutoff, searchengines, savePath, isHela) {
	library(limma)
	
	data1 <- c()
	data2 <- c()
	data3 <- c()
	
	if(length(searchengines) > 3) {
		print("error: max 3 searchengines possible")
		return(0)
	}
	
	i <- 1
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		filename <- searchengines[[searchengine]][1]
		if(count(filename, "unknown") > 0) {
			data <- data.frame(readColumnsFromPercolator(filename, c(1,2,5,11), cutoff, 3, 6))
			accessionValues <- data[,4]
		}
		else {
			data <- read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(1,2,5,11))
			accessionValues <- data[,4]
		}
		
		accessionValues <- gsub("XXX_","XXX:", accessionValues, fixed=TRUE)
		accessionValues <- gsub("Random_", "Random:", accessionValues, fixed=TRUE)
		accessionValues <- unique(unlist(strsplit(accessionValues,"_",fixed=TRUE)))
		accessionValues <- unique(sapply(accessionValues,formatAccession))
		if(isHela == 1) {
			accessionValues <- unique(sapply(accessionValues,getHelaAccession))
		}
		
		if(i == 1) {
			data1 <- accessionValues
		} else if (i == 2) {
			data2 <- accessionValues
		}
		else if (i == 3) {
			data3 <- accessionValues
		}
		
		i <- i + 1
	}
	
	allData = union(data1, data2)
	allData = union(allData, data3)
	allData = unique(allData)
	print(head(sort(allData)))
	check = data.frame( data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3)
	check <- structure(check, .Names = names(searchengines))
	vCount = vennCounts(check)
	
	png(filename = savePath, width = 1100, height = 1100, units = "px")
	vennDiagram(vCount, cex=c(3,1,0.7))
	
	if(isHela == 1) {
		plotheader <- paste(title, "\nall proteins without transcripts/isoforms,\npsm cutoff = ", cutoff, ")", sep="")
		title(plotheader, line = -4, cex.main = 3)
	} else {
		plotheader <- paste(title, "\nall proteins, psm cutoff = ", cutoff, ")", sep="")
		title(plotheader, line = -1, cex.main = 3)
	}
	dev.off()
}
Venn4ProteinLevel = function (title, cutoff, searchengines, savePath, isHela) {
	library(limma)
	
	data1 <- c()
	data2 <- c()
	data3 <- c()
	data4 <- c()
	
	if(length(searchengines) != 4) {
		print("error: 4 searchengines possible")
		return(0)
	}
	
	i <- 1
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		filename <- searchengines[[searchengine]][1]
		if(count(filename, "unknown") > 0) {
			data <- data.frame(readColumnsFromPercolator(filename, c(1,2,5,11), cutoff, 3, 6))
			accessionValues <- data[,4]
		}
		else {
			data <- read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(1,2,5,11))
			accessionValues <- data[,4]
		}
		
		accessionValues <- gsub("XXX_","XXX:", accessionValues, fixed=TRUE)
		accessionValues <- gsub("Random_", "Random:", accessionValues, fixed=TRUE)
		accessionValues <- unique(unlist(strsplit(accessionValues,"_",fixed=TRUE)))
		accessionValues <- unique(sapply(accessionValues,formatAccession))
		if(isHela == 1) {
			accessionValues <- unique(sapply(accessionValues,getHelaAccession))
		}
		
		if(i == 1) {
			data1 <- accessionValues
		} else if (i == 2) {
			data2 <- accessionValues
		}
		else if (i == 3) {
			data3 <- accessionValues
		}
		else if (i == 4) {
			data4 <- accessionValues
		}		
		i <- i + 1
	}
	
	allData <- union(data1, data2)
	allData <- union(allData, data3)
	allData <- union(allData, data4)
	allData <- unique(allData)
	check = data.frame( data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3, data4=allData %in% data4)
	check <- structure(check, .Names = names(searchengines))
	
	png(filename = savePath, width = 1000, height = 1000, units = "px")
	op <- par(cex=2)
	plot.venn(venn(check), small=1)
	if(isHela == 1) {
		plotheader <- paste(title, "\nall proteins without transcripts/isoforms,\npsm cutoff = ", cutoff, ")", sep="")
		title(plotheader, line = -2, cex.main = 1.50)
	} else {
		plotheader <- paste(title, "\nall proteins, psm cutoff = ", cutoff, ")", sep="")
		title(plotheader, line = -1, cex.main = 1.50)
	}
	par(op)
	dev.off()
}