#  summarise_all.R

source("D:/R-Projects/Rides/functions/find_column_position_v01.R")
source("D:/R-Projects/Rides/functions/compute_parametrics.R")
source("D:/R-Projects/Rides/functions/build_tibble.R")
source("D:/R-Projects/Rides/functions/capitalize_first.R")

summarise_all <-
  function( dt ){
    
    results <-
      build_tibble( "distance",
                 dt,
                 results,
                 total= TRUE )
    
    
    
      
    
    
    results
  }
  