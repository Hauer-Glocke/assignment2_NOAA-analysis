#Read Data
library(readr)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",temp)
con <- bzfile(temp)
df <- read_csv(con)
unlink(temp)
rm(con, temp)

#Exploratory Analysis
names(df)


