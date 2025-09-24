#  summarise_all.R

source("D:/R-Projects/Rides/functions/find_column_position_v01.R")
source("D:/R-Projects/Rides/functions/compute_parametrics.R")

summarise_all <-
  function( dt ){
    
    variable_names <- names( dt )
    
    
    vname <- "distance"
    position <- 
      find_column_position( dt, 
                            "distance" )
    data_values <-
      dt %>% 
        pull( position )
    
    results <-
      compute_parametrics( vname,
                           data_values )
    
    results
  }
  