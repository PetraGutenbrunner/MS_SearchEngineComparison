# ====================================================================================
# VENN plot of 3 (Venn3PeptideLevel) or 4 (Venn4PeptideLevel) different search files,
# calculating the sequence overlap of the PSMs.
# The plot is saved as png file
# all missing function are stored in sharedFunctions
# ====================================================================================
readSequenceFromPercolator=function(filename, col, cutoff, cutoffcol) {
	if(!file.exists(filename)) {
		print ("File not exists")
		return(0)
	}
	conn=file(filename,open="r")
	linn=readLines(conn)
	values <- c()
	
	for (i in 2:length(linn)){
		splitLine <- strsplit(linn[i],"\t")
		value <- splitLine[[1]][col]
		value <- gsub( " *\\[.*?\\] *", "", value)
		
		if(count(value,"[UNIMOD:") > 1) {
			print("ERROR: unknown mod")
			print(value)
		}
		
		if (count(value,".") == 2) {
			value <- substr(value, 3, nchar(value)-2)
		} else {
			print("ERROR: format not x.xxx.x")
		}
		if(is.numeric(value))
			value <- as.numeric(value)

		if(nchar(cutoff) > 0) {
			cutoffvalue <- as.numeric(splitLine[[1]][cutoffcol])
			if(cutoffvalue <= as.numeric(cutoff)) {
				values <- c(values, value)
			}
		} else {
			values <- c(values, value)
		}
	}
	close(conn)
	return(values)
}

Venn3PeptideLevel = function (title, cutoff, searchengines, savePath) {
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
			sequence <- readSequenceFromPercolator(filename, 5, cutoff, 3)
		}
		else {
			data = read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(5))
			sequence <- data$V5
		}
		sequence <- gsub( " *\\(.*?\\) *", "", sequence)
		sequence <- gsub( " *\\[.*?\\] *", "", sequence)
		sequence <- unique(sequence)
		
		if(i == 1) {
			data1 <- sequence
		} else if (i == 2) {
			data2 <- sequence
		}
		else if (i == 3) {
			data3 <- sequence
		}		
		i <- i + 1
	}
	
	allData = union(data1, data2)
	allData = union(allData, data3)
	allData = unique(allData)
	check = data.frame( data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3)
	check <- structure(check, .Names = names(searchengines))
	vCount = vennCounts(check)	
	plotheader <- paste(title, "\nunique peptides, psm cutoff = ", cutoff, ")", sep="")
	
	png(filename = savePath, width = 1100, height = 1100, units = "px")
	vennDiagram(vCount, cex=c(3,1,1))
	title(plotheader, line = -1, cex.main = 3)
	dev.off()		
}
Venn4PeptideLevel = function (title, cutoff, searchengines, savePath) {
	library(VennDiagram)
	
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
			sequence <- readSequenceFromPercolator(filename, 5, cutoff, 3)
		}
		else {
			data = read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- subset(data[data[3] <= cutoff,], select = c(5))
			sequence <- data$V5
		}
		sequence <- gsub( " *\\(.*?\\) *", "", sequence)
		sequence <- gsub( " *\\[.*?\\] *", "", sequence)
		sequence <- unique(sequence)
		
		if(i == 1) {
			data1 <- sequence
		} else if (i == 2) {
			data2 <- sequence
		}
		else if (i == 3) {
			data3 <- sequence
		}
		else if (i == 4) {
			data4 <- sequence
		}
		i <- i + 1
	}
	
	allData <- union(data1, data2)
	allData <- union(allData, data3)
	allData <- union(allData, data4)
	allData <- unique(allData)
	check = data.frame( data1=allData %in% data1, data2=allData %in% data2, data3=allData %in% data3, data4=allData %in% data4)
	check <- structure(check, .Names = names(searchengines))
	plotheader <- paste(title, "\nunique peptides, psm cutoff = ", cutoff, ")", sep="")
	
	png(filename = savePath, width = 1000, height = 1000, units = "px")
	op <- par(cex=2)
	plot.venn(venn(check), small=1)
	title(plotheader, line = -1, cex.main = 2.0)
	par(op)
	dev.off()	
}