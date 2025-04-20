# icc-test-batting-analysis
A data analysis project exploring ICC Test cricket batting performances. Includes data wrangling, visualization, and statistical insights into top players, country-wise contributions, and batting trends across eras.

This project presents an exploratory data analysis of ICC Test batting performances. The aim is to uncover insights into player statistics, performance trends over time, top performers by country, and key batting metrics using data visualization and statistical analysis.

---

## Table of Contents

- [Overview](#overview)
- [Dataset](#dataset)
- [Objectives](#objectives)
- [Technologies Used](#technologies-used)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Key Insights](#key-insights)
- [Conclusion](#conclusion)
- [Future Work](#future-work)

---

## Overview

Cricket, especially Test matches, provides a wealth of data about individual and team performances. In this project, I analyzed batting records of various players in Test cricket to identify top performers, consistency trends, and country-wise contributions using statistical and visual methods.

---

## Dataset

- *Source*: [Kaggle or scraped data source, if applicable]
- *Size*: ~5000+ rows (depending on source)
- *Features*: Player Name, Country, Matches, Innings, Runs, Average, Strike Rate, 100s, 50s, Ducks, etc.

---

## Objectives

- Analyze individual player performances in Test matches
- Visualize batting trends across different eras and countries
- Identify top performers using aggregate and rate-based metrics
- Compare average and consistency metrics among top players
- Explore contribution of countries in Test cricket history

---

## Technologies Used

- *Languages*: Python
- *Libraries*: Pandas, NumPy, Matplotlib, Seaborn, Plotly
- *Notebook*: Jupyter

---

## Data Cleaning & Preparation

- Removed duplicate and null values
- Standardized column formats
- Converted numeric values from string (e.g., "1,234" to 1234)
- Feature engineering: calculating runs per match, consistency score, etc.

---

## Exploratory Data Analysis

Visualizations include:

- Top 10 run-scorers in Test history
- Highest batting averages (min 20 innings)
- Country-wise total runs and centuries
- Batting average vs strike rate scatter plots
- Consistency over time using line plots
- Distribution of 100s and 50s across players

---

## Key Insights

- Players like Sachin Tendulkar, Ricky Ponting, and Jacques Kallis lead in total runs.
- Steve Smith and Marnus Labuschagne show high consistency and averages in recent years.
- Australia and India dominate total runs and number of centuries.
- Batting average and strike rate vary significantly across eras.

---

## Conclusion

This analysis showcases the evolution of Test batting and highlights legendary cricketers based on consistent performance. Visual storytelling adds clarity to the statistical findings and helps make data-driven comparisons in cricket.

---

## Future Work

- Add bowling and fielding stats for a holistic player performance analysis
- Create an interactive Streamlit dashboard
- Compare Test vs ODI vs T20 performances for top batters

---

## Acknowledgements

- Data source: [Insert link here if from Kaggle or Cricinfo]
- Inspired by my passion for cricket and analytics
