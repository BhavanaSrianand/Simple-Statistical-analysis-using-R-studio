# Simple-Statistical-analysis-using-R-studio
This project assesses Covid related deaths on the basis of gender and age using simple statistical techniques in R studio. 

Techniques: Tech Tribe

# Dataset: Kaggle (Covid 19 line data John Hopkins)

Data has been collected from 30 + countries.



Parameters: id,	case_in_country,	reporting date,	summary	location,	country,	gender,	age,	symptom_onset,	If_onset_approximated,	hosp_visit_date,	exposure_start,	exposure_end,	visiting Wuhan,	from Wuhan,	death	recovered	symptom,	source,	link		



Parameters of interest: death, age, gender


# Objectives

To access the following claims

1. Older people die because of the virus and the younger ones survive
2. Gender doesnt impact Covid related deaths


# Coding

Import the data


data <- read.csv("COVID19_line_list_data.csv") <pre> ```r



