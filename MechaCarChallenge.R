library(dplyr)
library(jsonlite)
library(ggplot)
library(tidyverse)


#DELIVERABLE 1
mpg <- read_csv("MechaCar_mpg.csv")#setup dataframe

linreg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg) #generate multiple linear regression model
summary(linreg)



#DELIVERABLE 2  
scoil <- read_csv("Suspension_Coil.csv")#setup dataframe
total_summary <- scoil  %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns
lot_summary <- scoil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns

#DELIVERABLE 3
t.test((scoil$PSI),mu=1500) #all lots

scoil_lot1 <- subset(scoil, Manufacturing_Lot == 'Lot1')
scoil_lot2 <- subset(scoil, Manufacturing_Lot == 'Lot2')
scoil_lot3 <- subset(scoil, Manufacturing_Lot == 'Lot3')

t.test((scoil_lot1$PSI),mu=1500) #lot 1
t.test((scoil_lot2$PSI),mu=1500) #lot 2
t.test((scoil_lot3$PSI),mu=1500) #lot 3