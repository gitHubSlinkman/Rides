#  summarise_all.R

source("D:/R-Projects/Rides/functions/find_column_position_v01.R")

summarise_all <-
  function( dt )
    
    variable_names <- names( dt )
    
desired_variable -
    position <- 
      find_column_position( dt, 
                            variable_name )
    values <- 
      dt %>% 
        pull( position )
    
    values <- na.omit( values )
    
    observations   <- length( values )
    total_distance <- round(sum( values, na.rm = TRUE ), 2 )
    mean_distance  <- round( mean( values, na.rm = TRUE ), 2)
    std_distance   <- round( sd( values, na.rm = TRUE ), 2 )
    se_distance    <- round( std_distance / sqrt( observations ), 2 )
    
    distance_tibble <- tibble( variable = "Distance",
                               observations,
                               total_distance,
                               mean_distance,
                               std_distance,
                               se_distance ) 
    
    position <-
      find_column_position( dt)
    
    
    
  }
  