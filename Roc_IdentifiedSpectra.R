# ====================================================================================
# searchresultplot: plot of PSM scores of different search engines
# all missing function are stored in sharedFunctions
# ====================================================================================

readColumnFromFile=function(filename, col, cutoff, cutoffcol) {
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

searchresultplot = function(title, cutoff, searchengines, specCnt, savePath) {
	sData = list()
	y_size = 0
	legendcutoff <- 0.01
	
	df <- NULL
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])
		
		filename <- searchengines[[searchengine]][1]
		if(count(filename, "unknown") > 0) {
			score <- readColumnFromFile(filename, 3, cutoff, 3)
		}
		else {
			data = read.csv(file = filename, sep = ";", header=FALSE, skip=1)
			data <- data[data[3] <= cutoff,]
			score = sort(data[,3])
			
		}
		score = sort(as.numeric(score))
		sData[[searchengine]] = score
		
		if (length(score) > y_size) {
			y_size = length(score)
		}
		
		score0_01 <- score[score <= legendcutoff]
		rowvalues <- c(searchengine, searchengines[[searchengine]][2], length(score0_01))
		rowvalues <- structure(rowvalues, .Names = c("searchengine", "colour", "cnt"))
		rowvalues <- t(data.frame(rowvalues))
		df <- rbind(df, rowvalues)
	}
	if(savePath != "") {
		png(filename = savePath, width = 1000, height = 1000, units = "px")
	}	
	par(mar=c(5,6,3,1))
	fontSize <- 1.3
	df <- data.frame(df)
	df <- df[with(df,order(-as.numeric(as.character(df$cnt)))),]
	
	i = 1
	for (searchengine in names(sData)) {
		print(searchengine)
		
		score <- sData[[searchengine]]
		scoreTbl <- table(sort(as.numeric(score)))
		
		if (i == 1) {
			plot(as.numeric(names(scoreTbl)), cumsum(scoreTbl), type = "l", ylim = c(0, y_size), xlim = c(0, cutoff), xlab = "q-value", ylab = paste("Identified spectra out of ",specCnt)
			,col = searchengines[[searchengine]][2], lwd=2
			,cex.axis=2 * fontSize
			,cex.lab=1.75  * fontSize)
			title(main = title, cex.main = 2.2 * fontSize,   font.main= 4)
			abline(v=0.01, lty=3)
		} else {
			lines(as.numeric(names(scoreTbl)), cumsum(scoreTbl), col = searchengines[[searchengine]][2], lwd=2)
		}
		i = i + 1		
	}
	legend("bottomright", legend=apply(data.frame(df),1, function(x){ paste(x[1],", 1% FDR #",x[3]," (", round(as.numeric(x[3])/specCnt,digits=4)*100,"%)", sep="")})
		, lty=c(1,1), lwd=c(2.5,2.5), col = sapply(as.vector(df[,2]), function(x){ x }), cex=1.5 * fontSize)
	if(savePath != "") {
		dev.off()
	}	
}