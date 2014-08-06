# ====================================================================================
# VENN plot of 3 (compareFoundProteins_3Overlap) or 4 (compareFoundProteins_4Overlap) 
# different search files, calculating the overlap of 
# 1: expected proteins, 2: contaminants, 3: unexpected proteins
# PSM/Peptide Level: if any contaminant or expected protein is present, the PSM/Peptide
# is counted as contaminant or expected protein, depending on which occured first.
#
# The plot is saved as png file
# all missing function are stored in sharedFunctions
# ====================================================================================

trim <- function (x) gsub("^\\s+|\\s+$", "", x)

occuranceInSearchengine = function(row) {
	i <- 0
	
	if(as.logical(trim(row[2]))) {
		i <- i + 1
	}
	if(as.logical(trim(row[3]))) {
		i <- i + 1
	}
	if(as.logical(trim(row[4]))) {
		i <- i + 1
	}
	return(i)
}
resultOverlapTbl = function(data1, data2) {
	result <- merge(data1, data2, by="val", all=TRUE, sort=TRUE)
	names(result)[names(result) == "cnt.x"] = "cntData1"
	names(result)[names(result) == "cnt.y"] = "cntData2"
	result <- subset(result, select = c(1,5,9))
	result[is.na(result)] <- 0
	
	return(result)
}
# 1 = protdata, 2 = contaminant, 3 = unexpected
getFactorForAccessions=function(accessions, cont_pattern, level, protdata) {
	accessions <- as.character(accessions)
	accessions <- strsplit(accessions,"_",fixed=TRUE)
	factors <- c()
	
	for(i in 1:length(accessions[[1]])) {
		accession <- formatAccession(accessions[[1]][i])
		factor <- getFactorForAccession(accession, cont_pattern, protdata)
		if((factor == 1 | factor == 2) & level > 1) {
			return(factor)
		}
		factors <- unlist(c(factors, factor))
	}
	
	if(level > 1)
		return(3)
		
	if(length(factors) > 1)
		return(99)
	
	return(factors[1])
}
getFactorForAccession=function(accession, cont_pattern, protdata) {
	accession <- gsub("ups", "", accession, fixed=TRUE)
	accession <- formatAccession(accession)	
	
	if(accession %in% protdata) { #included in protdata
		return(1)
	}
	if(count(accession,cont_pattern) > 0) { #included in contaminant
		return(2)
	}
	return(3)
}
splitColumn=function(row,sep) {
	row <- data.frame(t(row))
	accession <- as.character(row[,4])
	
	accession <- gsub("XXX_", "XXX:", accession, fixed=TRUE)
	accession <- gsub("Random_", "Random:", accession, fixed=TRUE)
	parts <- unlist(strsplit(accession,sep,fixed=TRUE))
	data.frame(row[,-4], parts)
}
formatSequence<-function(value) {
	if (count(value,".") == 2) {
		value <- substr(value, 3, nchar(value)-2)
	} else {
		print("ERROR: format not x.xxx.x")
	}
	return(value)
}
plotTable <- function(searchengines, sData, level, savePath) {
	png(filename = savePath, width = 1000, height = 1000, units = "px")
	if(level == 1) {
		rownames(sData)[1] <- "#proteins"
	} else if(level == 2) {
		rownames(sData)[1] <- "#spectra"
	} else if(level == 3) {
		rownames(sData)[1] <- "#peptides"
	}
	rownames(sData)[2] <- "#contaminants"
	rownames(sData)[3] <- "#unexpected"
	rownames(sData)[4] <- "#total"
	rownames(sData)[5] <- "Actual FDR %"
	
	textplot(sData, cex=2)	
	dev.off()
}
plotVennDiag <- function(bind, searchengines, plotheader, savePath) {
	library(VennDiagram)
	png(filename = savePath, width = 1000, height = 1000, units = "px")	
	op <- par(cex=2)
	plot.venn(venn(bind), small=1)
	title(plotheader, line = -1, cex.main = 2.0)
	par(op)
	dev.off()
}
plotVennLimmaWithTable <- function(bind, searchengines, plotheader, sData, level, savePath) {
	library(limma)	
	
	png(filename = savePath, width = 1100, height = 1100, units = "px")
	vCount = vennCounts(bind)
	vennDiagram(vCount, cex=c(3,1,0.7))
	title(plotheader, line = -1, cex.main = 3.0)
	dev.off()
}

compareFoundProteins_3Overlap = function(plotheader, cutoff, searchengines, proteinfile, cont_pattern, level, protcol, savePath, savePathTbl, overlapType) {
	library(limma)
	library(gplots)
	
	protdata <- read.csv(file=proteinfile, sep="\t", header=FALSE, skip=1)
	protdata <- sort(as.character(protdata$V1))
	sData = list()
	
	datacnt <- c()
	data1 <- c()
	data2 <- c()
	data3 <- c()
	df <- NULL
		
	results <- list()
	if(level < 1 | level > 3) {
		print("error: level must be between 1 and 3")
		return(-1)
	}
	
	isPerc <- 0
	i <- 1
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		filename <- searchengines[[searchengine]][1]
		if(count(filename, "unknown") > 0) {
			isPerc <- 1
			data <- data.frame(readColumnsFromPercolator(filename, c(1,2,5,11), cutoff, 3, protcol))
			accessionValues <- data[,4]
			data$spect <- data[,1]
		}
		else {
			data <- read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(1,2,5,11))
			accessionValues <- data[,4]
			rt <- format(round(as.numeric(data$V1),4), nsmall = 4)
			mz <- format(round(as.numeric(data$V2),5), nsmall = 5)
			data$spect <- paste(rt,mz,sep="_")
		}
		data[,3] <- gsub( " *\\(.*?\\) *", "", data[,3])
		data[,3] <- gsub( " *\\[.*?\\] *", "", data[,3])
		
		print(length(accessionValues))
		data$result <- sapply(accessionValues, getFactorForAccessions,cont_pattern, level, protdata)
		
		if(level == 1) { # ProteinLevel
			data <- do.call(rbind,apply(data,1,splitColumn,"_"))
			data$parts <- sapply(data$parts,formatAccession)
			accessionValues <- data$parts
			data$result <- sapply(accessionValues, getFactorForAccessions,cont_pattern, level, protdata)
			unexpected <- unique(data$parts[data$result == overlapType])
			
			lenUnexp <- length(unique(data$parts[data$result == 3]))
			lenAll <- length(unique(data$parts))
			datacnt <- c(length(unique(data$parts[data$result == 1])), length(unique(data$parts[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)
		} else if (level == 2) { # PSMLevel
			unexpected <- unique(data$spect[data$result == overlapType])
	
			lenUnexp <- length(unique(data$spect[data$result == 3]))
			lenAll <- length(unique(data$spect))
			datacnt <- c(length(unique(data$spect[data$result == 1])), length(unique(data$spect[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)			
		} else if (level == 3) { # PeptideLevel
			unexpected <- unique(data$V5[data$result == overlapType])
			
			lenUnexp <- length(unique(data$V5[data$result == 3]))
			lenAll <- length(unique(data$V5))
			datacnt <- c(length(unique(data$V5[data$result == 1])), length(unique(data$V5[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)
			
			#save protein for peptide
			rowvalues <- c()
			rowvalues <- subset(data[data$result == 3,], select = c(3,4))
			df <- unique(rbind(df, rowvalues))
		}
		
		if ( i == 1) {
			data1 <- unexpected
		} else if (i == 2) {
			data2 <- unexpected
		} else if (i == 3) {
			data3 <- unexpected
		}	
		i <- i + 1
		
		sData[[searchengine]] = datacnt
	}
	
	sData <- data.frame(sData)
	bind <- NULL
	
	allData <- union(data1, data2)
	allData <- union(allData, data3)
	allData <- unique(allData)
	
	if(level == 1) {
		plotheader <- paste("Protein level (all protein ids, \n", plotheader, ", ", sep="")
	} else if (level == 2) {
		plotheader <- paste("PSM level\n(", plotheader, ", ", sep="")
	} else {
		plotheader <- paste("Peptide level (unique peptides, \n", plotheader, ", ", sep="")
	}
	plotheader <- paste(plotheader, "psm cutoff = ", cutoff, ")", sep="")
	
	check <- data.frame(val=allData, data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3)	
	if(isPerc == 0 | (isPerc == 1 & level != 2)) {
		bind <- check[,-1]
		bind <- structure(bind, .Names =  names(searchengines))
		plotVennLimmaWithTable(bind, searchengines, plotheader, sData, level, savePath)
	}
	plotTable(searchengines, sData, level, savePathTbl)
	
	check <- check[order(check[,1]),]
	check$cnt <- apply(check, 1, occuranceInSearchengine)
	#return(df)
}

# Level 1 - ProteinLevel, 2 - PSMLevel
compareFoundProteins_4Overlap = function(plotheader, cutoff, searchengines, proteinfile, cont_pattern, level, protcol, savePathVenn, savePathTbl, overlapType) {
	library(gplots)
	
	protdata <- read.csv(file=proteinfile, sep="\t", header=FALSE, skip=1)
	protdata <- sort(as.character(protdata$V1))
	sData = list()	
	datacnt <- c()
	data1 <- c()
	data2 <- c()
	data3 <- c()
	data4 <- c()
	df <- NULL
		
	results <- list()
	if(level < 1 | level > 3) {
		print("error: level must be between 1 and 3")
		return(-1)
	}
	
	isPerc <- 0
	i <- 1
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		filename <- searchengines[[searchengine]][1]
		if(count(filename, "unknown") > 0) {
			isPerc <- 1
			data <- data.frame(readColumnsFromPercolator(filename, c(1,2,5,11), cutoff, 3, protcol))
			accessionValues <- data[,4]
			data$spect <- data[,1]
		}
		else {
			data <- read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(1,2,5,11))
			accessionValues <- data[,4]
			rt <- format(round(as.numeric(data$V1),4), nsmall = 4)
			mz <- format(round(as.numeric(data$V2),5), nsmall = 5)
			data$spect <- paste(rt,mz,sep="_")
		}
		data[,3] <- gsub( " *\\(.*?\\) *", "", data[,3])
		data[,3] <- gsub( " *\\[.*?\\] *", "", data[,3])
		print(length(accessionValues))
		data$result <- sapply(accessionValues, getFactorForAccessions,cont_pattern, level, protdata)
		
		if(level == 1) { # ProteinLevel
			data <- do.call(rbind,apply(data,1,splitColumn,"_"))
			data$parts <- sapply(data$parts,formatAccession)
			accessionValues <- data$parts
			data$result <- sapply(accessionValues, getFactorForAccessions,cont_pattern, level, protdata)
			unexpected <- unique(data$parts[data$result == overlapType])
			
			lenUnexp <- length(unique(data$parts[data$result == 3]))
			lenAll <- length(unique(data$parts))
			datacnt <- c(length(unique(data$parts[data$result == 1])), length(unique(data$parts[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)
		} else if (level == 2) { # PSMLevel
			unexpected <- unique(data$spect[data$result == overlapType])
			
			lenUnexp <- length(unique(data$spect[data$result == 3]))
			lenAll <- length(unique(data$spect))
			datacnt <- c(length(unique(data$spect[data$result == 1])), length(unique(data$spect[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)
			
		} else if (level == 3) { # PeptideLevel			
			unexpected <- unique(data$V5[data$result == overlapType])			
			
			lenUnexp <- length(unique(data$V5[data$result == 3]))
			lenAll <- length(unique(data$V5))
			datacnt <- c(length(unique(data$V5[data$result == 1])), length(unique(data$V5[data$result == 2])), lenUnexp, lenAll, round(lenUnexp / lenAll, digits = 4) * 100)
			
			#save protein for peptide
			rowvalues <- c()
			rowvalues <- subset(data[data$result == 3,], select = c(3,4))
			df <- unique(rbind(df, rowvalues))			
		}
		
		if ( i == 1) {
			data1 <- unexpected
		} else if (i == 2) {
			data2 <- unexpected
		} else if (i == 3) {
			data3 <- unexpected
		} else if (i == 4) {
			data4 <- unexpected
		}
		i <- i + 1
		
		sData[[searchengine]] = datacnt
	}
	
	sData <- data.frame(sData)
	bind <- NULL
	
	allData <- union(data1, data2)
	allData <- union(allData, data3)
	allData <- union(allData, data4)
	allData <- unique(allData)
	
	if(level == 1) {
		plotheader <- paste("Protein level (all protein ids, \n", plotheader, ", ", sep="")
	} else if (level == 2) {
		plotheader <- paste("PSM level\n(", plotheader, ", ", sep="")
	} else {
		plotheader <- paste("Peptide level (unique peptides, \n", plotheader, ", ", sep="")
	}
	plotheader <- paste(plotheader, "psm cutoff = ", cutoff, ")", sep="")
	
	check <- data.frame(val=allData, data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3, data4=allData %in% data4)
	
	if(isPerc == 0 | (isPerc == 1 & level != 2)) {
		bind <- check[,-1]
		print(head(bind))
		print(names(searchengines))
		bind <- structure(bind, .Names =  names(searchengines))
		plotVennDiag(bind, searchengines, plotheader, savePathVenn)
	}
	plotTable(searchengines, sData, level, savePathTbl)
	
	check <- check[order(check[,1]),]
	check$cnt <- apply(check, 1, occuranceInSearchengine)
	#return(check)
}