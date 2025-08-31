#### Data Analysis Project On USArrests datasets

data <- USArrests

### STEP 1 : Summary of the data
head(data)       # Shows first 5 rows
str(data)        # Shows structure and data types
summary_stats<-summary(data)    # Shows descriptive statistics for numeric data mean,median,mode,quantiles

# Average number of Murder cases reported in US
summary_stats_murder<-summary(data$Murder)
mean_murder <- mean(data$Murder)
sd_murder <- sd(data$Murder)
cat("Summary Statistics for Murder :\n",summary_stats_murder,"\n")
cat("Average Murder cases reported in US :",mean_murder,"\nStandard Deviation Murder:",sd_murder,"\n")

# Average number of Assault cases reported in US
summary_stats_assault<-summary(data$Assault)
mean_assault <- mean(data$Assault)
sd_assault <- sd(data$Assault)
cat("Summary Statistics for Assault :\n",summary_stats_assault,"\n")
cat("Average Assault cases reported in US :",mean_assault,"\nStandard Deviation Assault:",sd_assault,"\n")


# Percentge of  Urban Population in US
summary_stats_urbanpop<-summary(data$UrbanPop)
mean_urbanpop <- mean(data$UrbanPop)
sd_urbanpop <- sd(data$UrbanPop)
cat("Summary Statistics for Urban Population :\n",summary_stats_urbanpop,"\n")
cat("Average Urban Population in US :",mean_urbanpop,"\nStandard Deviation Urban Population:",sd_assault,"\n")


# Average number of Rape cases reported in US
summary_stats_Rape<-summary(data$Rape)
mean_rape <- mean(data$Rape)
sd_rape <- sd(data$Rape)
cat("Summary Statistics for Rape :\n",summary_stats_Rape,"\n")
cat("Average Murder cases reported in US :",mean_rape,"\nStandard Deviation Rape :",sd_rape,"\n") 


## STEP 2 . finding out the correlation between features
library(ggplot2)
library(reshape2)
cor_matrix <- cor(data)
print(round(cor_matrix, 2))

# Convert correlation matrix to long format
cor_df <- melt(cor_matrix)

# Plotting the  heatmap with annotations
ggplot(cor_df, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), color = "black", size = 4) +
  scale_fill_gradient2(low = "red", high = "blue", mid = "white",
                       midpoint = 0, limit = c(-1, 1), space = "Lab",
                       name = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  coord_fixed() +
  ggtitle("Correlation Heatmap - USArrests")



## STEP 3:Create at least 5 insights from the given data sets (Visualisations), 1 histogram

# 1. Histogram - Distribution of Murder Rates
ggplot(data, aes(x = Murder)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Murder Rates in US States (1973)",
       x = "Murder Arrests per 100,000", y = "Count of States") +
  theme_minimal()

cat("Insight: Shows how murder rates are distributed across states, helps identify outliers.")


# 2. Boxplot - Assault Rates by Distribution
ggplot(data, aes(y = Assault)) +
  geom_boxplot(fill = "tomato", alpha = 0.7) +
  labs(title = "Boxplot of Assault Arrest Rates",
       y = "Assault Arrests per 100,000") +
  theme_minimal()

cat("Insight: Highlights the spread of assault rates and states with exceptionally high assault levels.")


# 3. Scatter Plot - Murder vs Assault
ggplot(data, aes(x = Murder, y = Assault)) +
  geom_point(color = "darkgreen", size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Murder vs Assault Arrest Rates",
       x = "Murder Arrests per 100,000", y = "Assault Arrests per 100,000") +
  theme_minimal()

cat("Insight: Strong positive correlation — states with higher murder rates also tend to have higher assault rates.")


# 4. Bar Plot - Top 10 States by Urban Population
data$State <- rownames(data)
top10_urban <- data[order(-data$UrbanPop), ][1:10, ]

ggplot(top10_urban, aes(x = reorder(State, UrbanPop), y = UrbanPop)) +
  geom_bar(stat = "identity", fill = "purple", alpha = 0.8) +
  coord_flip() +
  labs(title = "Top 10 States by Urban Population (%)",
       x = "State", y = "Urban Population (%)") +
  theme_minimal()

cat("Insight: Shows which states had the highest % of urban population in 1973.")


# 5. Correlation Heatmap
cor_matrix <- cor(data[, 1:4])
cor_df <- melt(cor_matrix)

ggplot(cor_df, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), color = "black", size = 4) +
  scale_fill_gradient2(low = "red", high = "blue", mid = "white",
                       midpoint = 0, limit = c(-1, 1), space = "Lab",
                       name = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  coord_fixed() +
  ggtitle("Correlation Heatmap - USArrests")

cat("Insight: Murder and Assault show the strongest correlation (0.80), followed by Assault and Rape (0.67).")

### STEP 4 : Create scatterplot for each variable

# Select only numeric columns
numeric_data <- data[, sapply(data, is.numeric)]

# Scatterplot matrix
pairs(
  numeric_data,
  main = "Scatterplot Matrix - USArrests",
  pch = 21,
  bg = "lightblue"
)



### STEP 5 :  Conclusion Report and atleast one hypothesis p value, etc

# Create new column "Crime" = Murder + Assault + Rape
data$Crime <- data$Murder + data$Assault + data$Rape
data$UrbanPop_Count <- as.integer((data$UrbanPop / 100) * 100)

# View first few rows
head(data)

# Hypothesis
hypothesis <- "H₀: There is no correlation between Urban Population % and Crime.
H₁: There is a positive correlation between Urban Population % and Crime."

# Ensure numeric type
data$Urbanpop_Count <- as.numeric(as.character(data$UrbanPop_Count))
data$Crime <- as.numeric(as.character(data$Crime))

test_result <- cor.test(data$Urbanpop_Count, data$Crime)
test_result

# Print Test Report
cat("----- Hypothesis Testing Report -----\n")
cat("Hypothesis:\n", hypothesis, "\n\n")

cat("Correlation Test:\n")
cat("Correlation Coefficient (r):", round(test_result$estimate, 3), "\n")
cat("t-value:", round(test_result$statistic, 4), "\n")
cat("Degrees of Freedom:", test_result$parameter, "\n")
cat("p-value:", round(test_result$p.value, 5), "\n")
cat("95% Confidence Interval:", paste(round(test_result$conf.int, 3), collapse = " to "), "\n\n")

# Conclusion
if(test_result$p.value < 0.05){
  conclusion <- "We reject the null hypothesis — there is a statistically significant correlation."
} else {
  conclusion <- "We fail to reject the null hypothesis — no statistically significant correlation."
}
cat("Conclusion:", conclusion, "\n")

