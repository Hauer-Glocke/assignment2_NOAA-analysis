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

#Frequency Analysis of dates
f <- table(df1$`bgn_date`)
f <- as.data.frame(table(df1$`bgn_date`))
plot(f)


#Crop Damage
crop_exp <- as.vector(df1$cropdmgexp)

sub <- as.data.frame(cbind(c("h", "H", "k", "K", "m", "M", "b", "B", "+", "-", "?"),
                           c(2, 2, 3, 3, 6, 6, 9, 9,NA,NA,NA)))
sub$V1 <- as.character(sub$V1)
sub$V2 <- as.character(sub$V2)
        
for(i in 1:length(sub$V1)){
        crop_exp[crop_exp==sub$V1[i]] <- sub$V2[i]
}        

#Rewrite tstm to thunderstorm
names(df1_test) <- tolower(names(df1_test))
df1_test$evtype <- tolower(df1_test$evtype)
gsub("tstm", "thunderstorm", df1_test$evtype)
unique(df1_test$evtype)
