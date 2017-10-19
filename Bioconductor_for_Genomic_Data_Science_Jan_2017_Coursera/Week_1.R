#Genomics in Bioconductor
#Coursera January 2017
#Some help from : https://rpubs.com/oaxacamatt/Bioconductor_Quiz1

library(GenomicRanges)
library(AnnotationHub)


#Quiz

#Use the AnnotationHub package to obtain data on "CpG Islands" in the human genome.
#Question: How many islands exists on the autosomes?

#Create local database
ah <- AnnotationHub()

#Subset by species
ah.hum <- subset(ah, species == "Homo sapiens")

#Search for CpG Islands
ah.hum.Island <- query(ah.h, "CpG Islands")

#It could have been done in one step with: query(ah, c("CpG Islands", "Homo sapiens"))

#It results in four records. To see more information about those records:

display(ah.hum.Island)

#Select one of the records and download it. In this case the first one, genome version hg19

ah.hum.Island.data <- ah.hum.Island[[1]]

#Look at the names of the chromosomes
seqlevels(ah.hum.Island.data)

#Get rid of the non-standard ones and drop the sex chromosomes 
ah.hum.Island.data <- keepStandardChromosomes(ah.hum.Island.data, species = "Homo sapiens")

ah.hum.Island.data <- dropSeqlevels(ah.hum.Island.data, c("chrX", "chrY", "chrM"))

length(ah.hum.Island.data)

#Results = 26641


#Question: How many CpG Islands exists on chromosome 4.

seqlevels(ah.hum.Island.data, force = TRUE) <- "chr4"

ah.hum.Island.data

#Result = 1031

#Question:

#Obtain the data for the H3K4me3 histone modification for the H1 cell line from Epigenomics 
#Roadmap, using AnnotationHub. Subset these regions to only keep regions mapped to the autosomes
#(chromosomes 1 to 22).

#Subset data by "H3K4me3" and "E003"

ah.hum.histone <- query(ah.hum, c("H3K4me3", "E003"))

display(ah.hum.histone)

#Download two records to check
AH29884 <- ah.hum.histone[["AH29884"]]
#AH28880 <- ah.hum.histone[["AH28880"]]

#need to retrieve the "narrow peak" data for results to match.

#Remove small contigs (optional since I'm keeping the autosomes only)
#AH29884 <- keepStandardChromosomes(AH29884)

#Keep only autosomes
x <- extractSeqlevelsByGroup(species = "Homo sapiens", group = "auto", style = "UCSC") #creates a vector with the names

autosome <- keepSeqlevels(AH29884, x ) #keep only the autosomes subseting by the vector with chromosome names


seqinfo(autosome)

standard.autosome <- keepStandardChromosomes(autosome)

sum(width(standard.autosome))

#Result = 41135164

#Obtain the data for the H3K27me3 histone modification for the H1 cell line from Epigenomics Roadmap, using the AnnotationHub package. Subset these regions to only keep regions mapped to the autosomes. In the return data, each region has an associated "signalValue".

#Question: What is the mean signalValue across all regions on the standard chromosomes?

H3K27me3 <- query(ah, c("H3K27me3", "E003", "narrowPeak"))

H3K27me3.data <- H3K27me3[[1]]

#Keep only autosomes
x <- extractSeqlevelsByGroup(species = "Homo sapiens", group = "auto", style = "UCSC") #creates a vector with the names

autosome.2 <- keepSeqlevels(H3K27me3.data, x ) #keep only the autosomes subseting by the vector with chromosome names

autosome.2

standard.autosome.2 <- keepStandardChromosomes(autosome.2)
mean(standard.autosome.2$signalValue)

#Result = 4.770728


#Bivalent regions are bound by both H3K4me3 and H3K27me3.

#Question: Using the regions we have obtained above, how many bases on the standard chromosomes are bivalently marked?

#Get data flanked by both
bivalent.data <- intersect(standard.autosome, standard.autosome.2)
bivalent.data

#add it up
sum(width(bivalent.data))

#Result = 10289096


#We will examine the extent to which bivalent regions overlap CpG Islands.

#Question: how big a fraction (expressed as a number between 0 and 1) of the bivalent regions, overlap one or more CpG Islands?


overlap <- findOverlaps(bivalent.data, ah.hum.Island.data)

fraction <- length(unique(queryHits(overlap)))/length(bivalent.data)

#Result = 0.5383644

#Question: How big a fraction (expressed as a number between 0 and 1) of the bases which are part of CpG Islands, are also bivalent marked

seqnames(ah.hum.Island.data)

bivalent.island.intersect <- intersect(bivalent.data, ah.hum.Island.data)
fraction <- sum(width(bivalent.island.intersect))/sum(width(ah.hum.Island.data))

fraction

#Question: How many bases are bivalently marked within 10kb of CpG Islands?

#Tip: consider using the "resize()"" function.


CpG_10k <- resize(unlist(ah.hum.Island.data), 
                  width = 20000 + width(unlist(ah.hum.Island.data)), 
                  fix = "center")

CpG_10k_bivalent <- intersect(CpG_10k, bivalent.data)

sum(width(CpG_10k_bivalent))

#Result = 9782086


#Question: How big a fraction (expressed as a number between 0 and 1) of the human genome is contained in a CpG Island?

#Tip 1: the object returned by AnnotationHub contains "seqlengths".

#Tip 2: you may encounter an integer overflow. As described in the session on R Basic Types, you can address this by converting integers to numeric before summing them, "as.numeric()".

genome <- ah[["AH5018"]]

#Keep only autosomes
x <- extractSeqlevelsByGroup(species = "Homo sapiens", group = "auto", style = "UCSC") #creates a vector with the names

autosome <- keepSeqlevels(genome, x ) #keep only the autosomes subseting by the vector with chromosome names

genome.size <- sum(as.numeric(seqlengths(autosome))) #use as.numeric to avoid integers overflow

sum(width(ah.hum.Island.data))/genome.size

#Result = 0.007047481

#Question: Compute an odds-ratio for the overlap of bivalent marks with CpG islands.

inOut = matrix(0, ncol = 2, nrow = 2)
colnames(inOut) = c("in", "out")
rownames(inOut) = c("in", "out")

# inOut
inOut[1,1] = sum(width(intersect(bivalent.data, 
                                 unlist(ah.hum.Island.data),
                                 ignore.strand=TRUE)))
inOut[1,2] = sum(width(setdiff(bivalent.data, 
                               unlist(ah.hum.Island.data),
                               ignore.strand=TRUE)))
inOut[2,1] = sum(width(setdiff(unlist(ah.hum.Island.data), 
                               bivalent.data, 
                               ignore.strand=TRUE)))
inOut[2,2] = genome.size - sum(inOut)

inOut

odd_ratio <- inOut[1,1]*inOut[2,2]/(inOut[1,2]*inOut[2,1])

odd_ratio
