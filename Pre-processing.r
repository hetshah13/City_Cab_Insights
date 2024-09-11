library(arrow)
library(dplyr)
#To read only single parquet file.
#df = read_parquet("D:/yellow_taxi/data/yellow_tripdata_2023-01.parquet")

# Read the Parquet dataset
path = c("Data\yellow_tripdata_2023-01.parquet",
        "Data\yellow_tripdata_2023-02.parquet",
        "Data\yellow_tripdata_2023-03.parquet")

dfs <- lapply(path, read_parquet)
View(dfs)

## variable understanding 
unique_vendor = unique(dfs[[1]][["VendorID"]]);unique_vendor     # 1 2
u_ploc = unique(dfs[[1]][["PULocationID"]]); u_ploc # 257 different location
u_passenger = unique(dfs[[1]][["passenger_count"]]); u_passenger    # 0 To 9 ,NA
u_ratecode = unique(dfs[[5]][["RatecodeID"]]); u_ratecode  # 1 TO 6 ,99,NA
u_pay = unique(dfs[[1]][["payment_type"]]); u_pay    # 2 1 4 3 0
summary(dfs[[1]])

## Checking data 
#(1) data wrangling removing redundant recordes sequentially from total amount (first data is in negative and same record is in positive value.if i remove negative records it will automatically duplicate records will be removed.)
flt_data = filtered_data <- dfs[[1]][dfs[[1]]$total_amount >= 0.01, ]

# removing duplicates
flt_data = dfs[[1]][!duplicated(dfs[[1]]) & !duplicated(dfs[[1]], fromLast = TRUE)]
View(flt_data)


#(2) Remove rows where trip distance is 0 and PULocationID is equal to DOLocationID
filtered_data <- dfs[[1]][!(dfs[[1]]$trip_distance == 0 & dfs[[1]]$PULocationID == dfs[[1]]$DOLocationID), ]
View(filtered_data)

#(3) Assuming your data frame is called 'df' and the timestamp column is 'tpep_pickup_datetime'
# Convert 'tpep_pickup_datetime' column to POSIXct if it's not already in that format
dfs[[1]]$tpep_pickup_datetime <- as.POSIXct(dfs[[1]]$tpep_pickup_datetime)

# Filter using subset function
filtered_data <- subset(dfs[[1]], tpep_pickup_datetime >= as.POSIXct("2023-01-01 00:00:01") & tpep_pickup_datetime <= as.POSIXct("2023-02-01 08:00:00"))
View(filtered_data)
# Or filter using boolean indexing
filtered_data <- df[df$tpep_pickup_datetime >= as.POSIXct("2023-01-01 00:00:51") & df$tpep_pickup_datetime <= as.POSIXct("2023-02-01 05:00:00"), ]

# DATA CLEANING
# Define a function to filter dataframe based on conditions
filter_dataframe <- function(df) {
  
  # Remove rows where total_amount is less than 0.01
  # Remove rows where fare_amount is less than 0.01 ,mta_tax is less than 0.00
  df <- df[df$total_amount >= 0.01 & df$fare_amount >= 0.01 & df$mta_tax >= 0.00 & df$extra >= 0.00, ]
  
  # Remove rows where trip_distance is 0 and PULocationID is equal to DOLocationID
  df <- df[!(df$trip_distance == 0 & df$PULocationID == df$DOLocationID), ]
  
  return(df)
}

# Apply the filter_dataframe function to each dataframe in the list
flt_dfs <- lapply(dfs, filter_dataframe)

# Downloading dataframe  after data cleaning
# write_parquet(dataframe[[1]],"path where they store")
write_parquet(flt_dfs[[1]],"D:/BDA/sem4/project/taxi_data/flt_1.parquet")