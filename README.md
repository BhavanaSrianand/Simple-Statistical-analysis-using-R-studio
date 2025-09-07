# Simple-Statistical-analysis-using-R-studio
This project assesses Covid related deaths on the basis of gender and age using simple statistical techniques in R studio. 

Techniques: Tech Tribe

# Dataset: Kaggle (Covid 19 line data John Hopkins)

<img width="501" height="359" alt="image" src="https://github.com/user-attachments/assets/19ab0bd7-098a-4ea8-96d1-f5a34ad227a9" />

<img width="290" height="174" alt="image" src="https://github.com/user-attachments/assets/e414d4d3-8bd4-4237-a880-882e3a688ad0" />


Data has been collected from 30 + countries.


Parameters: id,	case_in_country,	reporting date,	summary	location,	country,	gender,	age,	symptom_onset,	If_onset_approximated,	hosp_visit_date,	exposure_start,	exposure_end,	visiting Wuhan,	from Wuhan,	death	recovered	symptom,	source,	link		



Parameters of interest: death, age, gender

Level: Beginner

Author: Bhavana Srianand


# Objectives

To access the following claims

1. Older people die because of the virus and the younger ones survive
2. Gender doesnt impact Covid related deaths


# Coding

Import the data


 <pre> ```r 
data <- read.csv("COVID19_line_list_data.csv")
data
View(data)  
``` </pre>


For Data Analytics, Manipulation, and Visualisation, Insall Hmisc Package

 <pre> ```r 
  install.packages("Hmisc")
library(Hmisc)

describe(data) #Hmisc Command
  
  ``` </pre>


Getting the variable "Death" ready for analysis

 <pre> ```r 
#Cleaning up the death data
data$death_dummy <- as.integer(data$death != 0 )

#Death rate
sum(data$death_dummy) / nrow(data)
     
  ``` </pre>



# Have more older people died due to Covid in comparison to the younger people?

<img width="275" height="183" alt="image" src="https://github.com/user-attachments/assets/16777823-90b1-4573-bd76-53581a9d5451" />

<img width="300" height="168" alt="image" src="https://github.com/user-attachments/assets/ad95e433-510d-4e82-a271-394c7135fe56" />

 <pre> ```r 
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

   ``` </pre>



# Does Gender have no impact on Covid related deaths?

<img width="242" height="208" alt="image" src="https://github.com/user-attachments/assets/9c1724dc-2b55-4c1c-8f56-53dde2e79bce" />

<img width="266" height="190" alt="image" src="https://github.com/user-attachments/assets/f4d300c3-1172-428b-ba65-f9137d75e7cb" />


 <pre> ```r 
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

 ``` </pre>



 # Conclusion

Both the claims are statistically significant. This helps us to conclude that

1. More older people have died due to Covid 19.
2. Gender has no impact on Covid related deaths.


 # Authors: Bhavana Srianand

Thank you very much for visitng my page. Looking forward to publishing more projects!
 

