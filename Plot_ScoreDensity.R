# plot the scores of the search engines as density
plotDensities = function(searchengines) {
	sData = list()
	y_size = 0
	for (searchengine in names(searchengines)) {
		print(searchengine)
		print(searchengines[[searchengine]][1])
		print(searchengines[[searchengine]][2])

		data = read.csv(file = searchengines[[searchengine]][1], sep = ";")
		score = sort(data$score)
		d <- density(score)
		dev.new()
		plot(d, main=searchengine)
	}
}

#CALL
searchengines = list(Mascot = c("P:/Petra/TOPPAS/Results/HELA/Files/PEP/mascot.csv","red")
	, XTandem = c("P:/Petra/TOPPAS/Results/HELA/Files/PEP/xtandem.csv","blue")
	, OMSSA = c("P:/Petra/TOPPAS/Results/HELA/Files/PEP/omssa.csv","pink")
	, MSGFPlus = c("P:/Petra/TOPPAS/Results/HELA/Files/PEP/msgf.csv","pink")
	, Consensus = c("P:/Petra/TOPPAS/Results/HELA/Files/PEP/consensus.csv","pink")
)
plotDensities(searchengines)