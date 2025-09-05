data <- read.csv("COVID19_line_list_data.csv")
data
View(data)

#Hmisc: Data Analysis, Manipulation, and Visualisation

install.packages("Hmisc")
library(Hmisc)

describe(data) #Hmisc Command

#Cleaning up the death data
data$death_dummy <- as.integer(data$death != 0 )

#Death rate
sum(data$death_dummy) / nrow(data)

#Age
#Claim: Older people died

dead <- subset (data, death_dummy == 1)
alive <- subset (data, death_dummy == 0)

mean(dead$age, na.rm = TRUE) #69
mean(alive$age, na.rm = TRUE) #48

#Statistical Significance
t.test(alive$age, dead$age, alternative = 'two.sided',conf.level = 0.95)

#If p value is < 0.05, we normally reject the null
# Here the p  value is ~ 0, therefore the null hypothesis is statistically significant.

#Gender
#Claim: Gender has no effect
men <- subset (data, gender == "male")
women <- subset (data, gender == "female")

mean(men$death_dummy, na.rm = TRUE) #8%
mean(women$death_dummy, na.rm = TRUE) #3%

#Statistical Significance
t.test(men$death_dummy, women$death_dummy, alternative = 'two.sided',conf.level = 0.95)

#men have 0.7 % to 7.7 % higher chance of dying than women
# p value = 0.02 < 0.05, we reject the null.
#This result is statistically significant.
