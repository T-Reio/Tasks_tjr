#Term-paper 23A18014 R.TANJI

setwd("C:/User/T-Reio/Tasks/dm_paper") #set current directory
library(stargazer)
Data <- read.csv("input/medical_aid.csv", header=T, sep="," , encoding = "Shift-JIS")

Data$intyr = Data$医療扶助 * Data$年度
Data$inthsp = Data$医療扶助 * Data$入院
Data$Pavg = Data$点数/Data$実施件数
Data$Davg = Data$回数/Data$実施件数
Data$PpD = Data$点数/Data$回数

Data$年度 = factor(Data$年度)
Data$intyr = factor(Data$intyr)
Data$inthsp = factor(Data$inthsp)

stargazer(Data,out="text")
stargazer(Data,out="output/Data_sum_stat.tex")
summary(Data)
is.factor(Data$年度)
