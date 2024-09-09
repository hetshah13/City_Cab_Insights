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

## Data wrangling
#(1) data wrangling removing redundant recordes sequentially (first data is in negative and same record is in positive value.if i remove negative records it will automatically duplicate records will be removed.)

flt_data = filtered_data <- dfs[[1]][dfs[[1]]$total_amount >= 0.01, ]
View(flt_data)


#(2) Remove rows where trip distance is 0 and PULocationID is equal to DOLocationID
filtered_data <- dfs[[1]][!(dfs[[1]]$trip_distance == 0 & dfs[[1]]$PULocationID == dfs[[1]]$DOLocationID), ]
View(filtered_data)