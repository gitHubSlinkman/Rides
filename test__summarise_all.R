# test_summarize_all.R

library( tidyverse )
library( vroom )

source("D:/R-Projects/Rides/functions/wrangle_rides.R")
source("D:/R-Projects/Rides/functions/summarise_all.R")

activities <-
  vroom( "data/2025-09-13.csv" )
spec( activities )

rides <- 
  wrangle_rides( activities )

summarise_all( rides )
