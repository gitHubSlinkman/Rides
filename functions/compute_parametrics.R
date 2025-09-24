# compute_parametrics.R

library( tidyverse )

compute_parametrics <-
  function( description,
            y, 
            total = FALSE ){
   
    rides          <- length( y )
    missing_values <- sum( is.na( y ))
    sample_size    <- rides - missing_values
    
    if( total ){
      total <- sum( y, na.rm = TRUE )
    } else{ 
      total <- NA }
    
    tibble( description,
            rides,
            missing_values, 
            sample_size,
            total )
  }