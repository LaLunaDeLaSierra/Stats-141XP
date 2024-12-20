english_data  <- read.csv("English_Data_Clean.csv")

english_data$interval <- factor(ifelse(english_data$interval, "In Interval", "Out of Interval"))
english_data$accurate <- factor(ifelse(english_data$accurate, "Accurate", "Inaccurate"))

#ERIC Please made this table pretty
english_tab <- table(english_data$accurate, english_data$interval)
english_tab
english_prop <- prop.table(english_tab, 2)
english_prop

prop.test(t(english_tab), alternative = "greater")

#Katie make graph