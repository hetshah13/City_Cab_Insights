## **City Cab Insights: NYC Yellow Taxi Dataset**
This project City Cab Insight explores the NYC Yellow Taxi dataset to uncover patterns in ride behavior, fare distribution, high-demand areas, and optimization opportunities for cab services across the city. Through data pre-processing, exploratory data analysis (EDA), and visualization, actionable insights are drawn for improving cab operations, customer satisfaction, and profitability. The original dataset consisted of 38.3 million records, which after pre-processing was reduced to 36 million records.


## Project Overview
The City Cab Insight project provides a comprehensive exploration of the NYC Yellow Taxi trips, identifying key trends and providing recommendations for optimizing taxi services across the city.

### **Key Objectives:**

1. Understand cab demand patterns across various locations.
2. Identify peak hours and trends in ride durations and fare amounts.
3. Recommend strategies to optimize taxi availability and pricing.
4. Explore geographic distribution and identify high-demand and high-fare zones.

### **Dataset**
**Source:** NYC Yellow Taxi Trip Records (2023)

**Original Size:** 38.3 million records

**Final Dataset:** After cleaning and pre-processing, 36 million records


## 1. **Data Pre-processing**

To prepare the dataset for analysis, we performed several data cleaning steps:

**Removing Duplicates:** Duplicate records were removed to ensure the integrity of the analysis.

**Filtering by Relevant Date:** Only trips from 2023 were included in the dataset.

**Handling Null Values:** Missing values in key fields such as fare amount and trip distance were imputed or removed But here we removed it.

**Combining Geographical Data:** Merged data with location zone information to map pickup/dropoff locations to specific areas of NYC.

**Outlier Removal:** Applied the Isolation Forest technique to remove anomalous trips (e.g., unusually long or short durations, or zero-fare trips).

After pre-processing, the dataset was reduced to **36 million records** for further analysis.


## 2. **Exploratory Data Analysis (EDA)**

#### Key Insights:
1. High-Demand Areas: Popular pickup/dropoff locations were concentrated in Manhattan, near Times Square, Central Park, and major transit hubs like Penn Station and Grand Central.
2. Peak Hours: Highest demand observed during Mid-night and evening rush hours.
3. Trip Duration: Average trip duration was found to be around 12-15 minutes, with a wide range during peak traffic hours.
4. Fare Distribution: The average fare was around $15-$20, with higher fares typically observed for trips to/from airports (JFK, LaGuardia).
5. Geographic Insights: Central Business District had the highest number of trips. Trips from outer boroughs (Brooklyn, Queens) tend to be longer in duration but fewer in number.

