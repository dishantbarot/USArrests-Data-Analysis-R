### Investigating Urbanization's Effect on Crime Rates: A Data-Driven Approach in R

-----

## 📋 Project Overview

This project is a comprehensive data analysis of the `USArrests` dataset, a standard dataset in R containing statistics on arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. The primary objective is to perform a detailed exploratory data analysis, visualize the distribution of crime rates, and test a hypothesis regarding the relationship between urban population and crime.

-----

## 📊 Analysis and Methodology

The analysis follows a structured approach, divided into the following key steps:

1.  **Data Exploration:** Initial data inspection to understand the structure, data types, and summary statistics of the dataset. This includes calculating and displaying key metrics like mean and standard deviation for `Murder` and `Assault` rates.
2.  **Data Visualization:** A series of plots were generated to visualize the data:
      * A bar chart showing the number of murders per state.
      * A histogram illustrating the distribution of `Assault` arrests.
      * A box plot to analyze the distribution of the urban population percentage (`UrbanPop`).
      * A scatter plot to visually assess the correlation between `UrbanPop` and the combined crime rate.
3.  **Feature Engineering:** A new variable, `Crime`, was created by summing the `Murder`, `Assault`, and `Rape` rates to represent the total crime rate per state.
4.  **Hypothesis Testing:** A formal hypothesis test was conducted to determine the correlation between the urban population and the total crime rate.

-----

## 📈 Key Findings

The project's analysis culminates in a statistical test to prove or disprove the central hypothesis.

  * **Hypothesis Formulation:**

      * **H₀ (Null Hypothesis):** There is no correlation between the percentage of the urban population and the total crime rate.
      * **H₁ (Alternative Hypothesis):** There is a positive correlation between the percentage of the urban population and the total crime rate.

  * **Statistical Results:**

      * **Correlation Coefficient (r):** 0.38
      * **p-value:** 0.0058
      * **Conclusion:** With a p-value significantly less than the common alpha level of 0.05, we **reject the null hypothesis**. The analysis provides strong evidence of a **positive correlation** between the urban population percentage and the total crime rate in the US.

-----

## 💻 Technologies Used

  * **R Programming Language:** The core language used for all data manipulation, analysis, and visualization.
  * **Base R:** Utilized for fundamental data operations and statistical tests.

-----

## 🔧 Setup and Installation

This project can be run in any R environment. No special libraries are required as it uses the built-in `USArrests` dataset and base R functions.

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    ```
2.  Open the `R_Data_Analysis_Project_on_USArrests_data.R` file in your preferred R editor (e.g., RStudio).
3.  Run the code line by line or execute the entire script to replicate the analysis.
