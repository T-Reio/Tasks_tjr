#Term-paper Analysis_code 23A18014 R.TANJI

setwd("C:/User/T-Reio/Tasks/dm_paper") #set current directory
library(stargazer)
library(dplyr)
library(data.table) 
library(magrittr)
Data <- read.csv("input/medical_aid.csv", header=T, sep="," , encoding = "Shift-JIS")

Data$intyr = Data$医療扶助 * Data$年度
Data$inthsp = Data$医療扶助 * Data$入院

Data$Pavg = Data$点数/Data$実施件数
Data$Davg = Data$回数/Data$実施件数
Data$PpD = Data$点数/Data$回数

Data$年度 = factor(Data$年度)
Data$intyr = factor(Data$intyr)
Data$inthsp = factor(Data$inthsp)

stargazer(Data,out="output/Data_sum_stat.tex")

Model1A <- lm(Pavg ~ 傷病 + 医療扶助 + 年度 , data = Data, na.rm=T)
Model1B <- lm(Pavg ~ 傷病 + 医療扶助 + 入院 + 年度 , data = Data, na.rm=T)
Model1C <- lm(Pavg ~ 傷病 + 医療扶助 + 入院 + 年度 + intyr + inthsp, data = Data, na.rm=T)

Model2A <- lm(Davg ~ 傷病 + 医療扶助 + 年度 , data = Data, na.rm=T)
Model2B <- lm(Davg ~ 傷病 + 医療扶助 + 入院 + 年度 , data = Data, na.rm=T)
Model2C <- lm(Davg ~ 傷病 + 医療扶助 + 入院 + 年度 + intyr + inthsp, data = Data, na.rm=T)

Model3A <- lm(PpD ~ 傷病 + 医療扶助 + 年度 , data = Data, na.rm=T)
Model3B <- lm(PpD ~ 傷病 + 医療扶助 + 入院 + 年度 , data = Data, na.rm=T)
Model3C <- lm(PpD ~ 傷病 + 医療扶助 + 入院 + 年度 + intyr + inthsp, data = Data, na.rm=T)

stargazer(Model1A, Model1B, Model1C, out = "output/Model1_Reg_sum.tex")
stargazer(Model2A, Model2B, Model2C, out = "output/Model2_Reg_sum.tex")
stargazer(Model3A, Model3B, Model3C, out = "output/Model3_Reg_sum.tex")

summary(Model1C)
summary(Model2C)
summary(Model3C)
summary(Data)