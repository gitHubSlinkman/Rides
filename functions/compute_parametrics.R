# compute_parametrics.R

library( tidyverse )

compute_parametrics <-
  function( description,
            y, 
            total = FALSE ){
   
    rides          <- length( y )
    missing_values <- sum( is.na( y ))
    n              <- rides - missing_values
    
    if( total ){
      sumy <- sum( y, na.rm= TRUE )
    } else{ 
      sumy <- NA }
    
    ybar               <- mean( y, na.rm=TRUE )
    stdy               <- sd( y, na.rm=TRUE )
    seybar     <- stdy / sqrt( n )
    lcl95      <- ybar - 2 * seybar
    ucl95      <- ybar + 2 * seybar
    
    tibble( description,
            rides,
            missing_values, 
            n,
            sumy,
            ybar,
            stdy,
            seybar,
            lcl95,
            ucl95 )
  }