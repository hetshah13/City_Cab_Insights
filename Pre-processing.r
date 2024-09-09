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

summary(dfs[[1]])