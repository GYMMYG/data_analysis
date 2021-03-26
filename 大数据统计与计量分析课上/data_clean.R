## author:y
## RStudio-1.3.1093 R-4.0.3
## -*- coding: utf-8 -*-

rm(list=ls())

library(dplyr)
library(ggplot2)
library(editrules)
library(deducorrect)
library(VIM)
setwd("D:/桌面/")

#exercise1-reading and manually checking

# Import data
dirty_data = read.csv('dirty_iris.csv', header = TRUE, sep = ',')

View(dirty_data)
com_num <- sum(complete.cases(dirty_data))
#loss <- sum(!complete.cases(dirty_data))
#loss = sum(is.na(dirty_data))
percentage <- mean(complete.cases(dirty_data))
com_num
percentage

names(dirty_data)

#通过箱线图查找Sepal.Length异常值
ggplot(dirty_data) +
  aes(x = "", y = Sepal.Length) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()
#去除Sepal.Length异常值 
slen_spe1 <- which(dirty_data[,1]>20)
slen_spe2 <- which(dirty_data[,1]==0)
dirty_data[slen_spe1,1] <- NA
dirty_data[slen_spe2,1] <- NA

#通过箱线图查找Sepal.Width异常值
ggplot(dirty_data) +
  aes(x = "", y = Sepal.Width) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()
#去除Sepal.Width异常值
swid_spe1 <- which(dirty_data[,2]>10)
swid_spe2 <- which(dirty_data[,2]<=0)
dirty_data[swid_spe1,2] <- NA
dirty_data[swid_spe2,2] <- NA

#通过箱线图查找Petal.Length异常值
ggplot(dirty_data) +
  aes(x = "", y = Petal.Length) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()
#去除Sepal.Length异常值 
plen_spe1 <- which(dirty_data[,3]>10)
plen_spe2 <- which(dirty_data[,3]==0)
dirty_data[plen_spe1,3] <- NA
dirty_data[plen_spe2,3] <- NA

#通过箱线图查找Petal.Width异常值
ggplot(dirty_data) +
  aes(x = "", y = Petal.Width) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()
#去除Sepal.Length异常值 
pwid_spe1 <- which(dirty_data[,4]=='Inf')
dirty_data[pwid_spe1,4] <- NA

#exercise2-rules

#help(package = "editrules")
rules <- editfile('R_test.txt', type = 'all')
rules

#exercise3-correcting
names(dirty_data)
#help(package = "deducorrect")
u <- correctionRules(expression(
  if ( is.na(Petal.Width) ) Petal.Width <- Inf,
  if ( Petal.Width == 'Inf' ) Petal.Width <- NA
))
correctWithRules(u,dirty_data)

# err <- localizeErrors(rules, dirty_data, verbose = TRUE)
# summary(err)

#exercise4-Imputing

#help(package = "VIM")
# n <- nrow(dirty_data)
# for (i in 1:ncol(dirty_data)){
#   dirty_data[sample(1:n, 10, replace = FALSE), i] <- NA
# }
cleaned_data <- kNN(dirty_data)
View(cleaned_data)
