count = function(haystack, needle){
	v = attr(gregexpr(needle, haystack, fixed = T)[[1]], "match.length")
	if (identical(v, -1L)) 0 else length(v)
}

formatAccession = function(accession) {
	if(count(accession, "-") > 0) {
		accession <- gsub("-[0-9]+$", "", accession)
	}
	return(as.character(accession))
}

readColumnsFromPercolator=function(filename, col, cutoff, cutoffcol, protcol) {
	if(!file.exists(filename)) {
		print ("File not exists")
		return(0)
	}
	conn=file(filename,open="r")
	linn=readLines(conn)
	values <- c()
	
	df <- NULL
	for (i in 2:length(linn)){
		splitLine <- strsplit(linn[i],"\t")
		rowvalues <- c()
		
		cutoffvalue <- as.numeric(splitLine[[1]][cutoffcol])
		if((cutoffvalue > as.numeric(cutoff)) && (as.numeric(cutoff) != 0)) {
			next
		}
		
		if(length(col) > 1) {
			for(j in col) {
				value <- splitLine[[1]][j]
				if(is.numeric(value))
					value <- as.numeric(value)
								
				if(j == 5) {
					value<-formatSequence(value)
					rowvalues <- c(rowvalues, value)
				} else if(j < protcol) {
					if(is.numeric(value))
						value <- as.numeric(value)
					
					rowvalues <- c(rowvalues, value)
				} else {
					accessions <- ""
					for(k in protcol:length(splitLine[[1]])) {
						if(k == protcol) {
							accessions <- splitLine[[1]][k]
						} else {
							accessions <- paste(accessions,splitLine[[1]][k], sep="_")
						}
					}
					rowvalues <- c(rowvalues, accessions)
					rowvalues <- structure(rowvalues, .Names = c("V1", "V2", "V5", "V11"))
				}
			}
		} else {
			rowvalues <- splitLine[[1]][col]
			if(is.numeric(rowvalues))
				rowvalues <- as.numeric(rowvalues)		
		}
		
		rowvalues <- t(data.frame(rowvalues))
		rownames(rowvalues) <- i - 1
		df <- rbind(df, rowvalues)
	}
	close(conn)
	return(df)
}