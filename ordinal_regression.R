# Load necessary libraries
library(MASS)
library(readr)

# Load the dataset
data <- read_csv("English_Data_Clean.csv")

# Convert ENG_Place to an ordered factor, inverting the levels
data$ENG_Place <- factor(data$ENG_Place, levels = c(3, 2, 1), ordered = TRUE)

# Fit the ordinal regression model
model <- polr(ENG_Place ~ AWPE * GPA * accurate * interval, data = data, method = "logistic")

# Summary of the model
summary(model)


# Extracting coefficients
coefficients <- summary(model)$coefficients
zeta <- summary(model)$zeta

# Display coefficients and zeta
print(coefficients)
print(zeta)