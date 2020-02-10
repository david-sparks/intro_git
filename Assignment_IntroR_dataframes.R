# Read in the tick data
tick_data <- read.csv("./Week 2 Intro R/Assignment2/tick_taxonomy_OSBS.csv")

# Check the structure
str(tick_data)

# Use nrow() and ncol() to check the number of rows and columns.
nrow(tick_data)

ncol(tick_data)

# What does the function dim() tell us when applied to this data frame?
dim(tick_data)

# Remove the last column (‘laboratoryName’). 
tick_data <- tick_data[, -ncol(tick_data)]

# Remove rows where the sample condition is not OK (anything then OK)
unique(tick_data$sampleCondition)
# Two ways:
tick_data <- tick_data[!tick_data$sampleCondition != 'OK', ]
tick_data <- tick_data[tick_data$sampleCondition == 'OK', ]

# Using conditional subsetting to find the total number of dog ticks, 
# Amblyomma americanum, in plotID OSBS_001. 
lonestar_tick_data <- tick_data[tick_data$acceptedTaxonID == "AMBAME" & tick_data$plotID == "OSBS_001", ]
sum(lonestar_tick_data$individualCount)

# Read in the data adding the argument “stringsAsFactors ==FALSE”. Check the structure 
# of this data frame. How does it differ from the previous one.
tick_data2 <- read.csv("Week 2 Intro R/Assignment2/tick_taxonomy_OSBS.csv", 
                       stringsAsFactors = FALSE)
str(tick_data2)
# Factors vs characters

date_vector <- as.Date(tick_data2$collectDate, format = "%m/%d/%y")
str(date_vector)
# These are characters, you can't really order them over time 