# wrangle_rides.R

library( stringr )

source("D:/Rides/functions/standardize_column_names.R")
source("D:/Rides/functions/to_hours.R")

wrangle_rides <-
  function( df ){

    ############################################################################
    # Standardize variable names.
    ############################################################################
    
   tt <-
      standardize_column_names( df )
   
    ############################################################################
    # We keep only cycling activities.  We keep the first two columns of the
    # input table because there are errors in them.
    ############################################################################
    
  tt <-
      tt %>%
        filter( activity_type == "Cycling" )
  
  rides <-
    tt %>% 
      select( activity_type,
              date_time )
        
    
    ############################################################################
    # We extract the date sub-fields that we will use in our analysis.
    ############################################################################
    
    dt <- 
      tt %>%
        pull( date_time )
    year  <- year( dt )
    month <- month( dt )
    day   <-   day( dt )
    week  <- week( dt )
   
    rides <-
      rides %>% 
        add_column( year )  %>% 
        add_column( month ) %>%
        add_column( day )   %>% 
        add_column( week )
    
    ############################################################################
    # We copy favorite and title to the rides tibble.  Note that rides is my
    # favorite activity.  The data is wrong.
    ############################################################################
    
    favorite <-
     tt %>% 
        pull( favorite )
    favorite <- 
      rep( TRUE, length(favorite))
    
    title <-
      tt %>% 
        pull( title )
    
    rides <-
      rides %>% 
        add_column( favorite ) %>% 
        add_column( title )
    
    ################################################################################
    # Because there are no missing values for distance we can simply copy it.
    ################################################################################
    
    distance <-
     tt %>% 
      pull( distance ) 
    
     rides <-
       rides %>% 
        add_column( distance )
     
     
     
     ###########################################################################
     # The column calories is read as a character vector because commas are
     # displayed and "--" are used to indicate missing values. We must fix these
     # issues before we cast the column as numeric.
     ###########################################################################
     
     calories <-
       tt %>% 
        pull( calories )
     
     calories <- str_remove( calories, "," )
     calories <- ifelse( calories == "--", NA, calories ) 
     calories <- as.numeric( calories )
     
     rides <-
       rides %>% 
          add_column( calories )
     
     ###########################################################################
     # Get thr time from the temp tibble, convert it to hours, and add it to
     # the rides tibble.
     ###########################################################################
     
     time <-
       tt %>% 
        pull( time )
     time <- to_hours( time )
     rides <-
       rides %>% 
        add_column( time )
     
     
     ###########################################################################
     # Obtain the mean heart rate and maximum hear rate from the tt tibble and
     # add them to the rides tibble.
     ###########################################################################
     
     mean_hr <-
       tt %>% 
        pull( avg_hr )
     max_hr <-
       tt %>% 
        pull( max_hr )
     
     rides <-
       rides %>% 
        add_column(  mean_hr,
                     max_hr )
     
     ###########################################################################
     # Pull the mean speed from the tt tibble and add them to rides tibble.  
     # We need to recode the missing values and then cast the
     # variables to numeric before adding them to the rides tibble.
     ###########################################################################
     
     mean_speed <-
       tt %>% 
        pull( avg_speed )
     mean_speed <-
       ifelse( mean_speed == "--", NA, mean_speed )
     mean_speed <- as.numeric( mean_speed )
     
     max_speed <-
       tt %>% 
        pull( max_speed )
     max_speed <-
       ifelse( max_speed == "--",
               NA,
               max_speed )
     max_speed <-
       suppressWarnings( as.numeric( max_speed ))
     
     rides <- 
       rides %>%
        add_column( mean_speed ) %>% 
        add_column( max_speed )
     
     
     ###########################################################################
     # We pull the best_lap_time from the tt tibble, replace the Garmin missing
     # values with NA's, cst the time time to hours, and add it to the rides
     # tibble.
     ###########################################################################
     
     best_lap_time <-
      tt %>% 
       pull( best_lap_time )
     best_lap_time <- to_hours( best_lap_time )
     
     number_of_laps <-
       tt %>% 
          pull( number_of_laps )
     
     rides <-
       rides %>% 
        add_column( best_lap_time ) %>% 
        add_column( number_of_laps )
  
     moving_time <-
       tt %>% 
        pull( moving_time )
     moving_time <- 
       ifelse( moving_time == "--:--:--",
               NA, moving_time )
     moving_time <-
       to_hours( moving_time )
     
     rides <- 
       rides %>% 
        add_column( moving_time )
     
     max_elevation <-
       tt %>% 
        pull( max_elevation )
     
     max_elevation <-
       ifelse( max_elevation == "--",
               NA,
               max_elevation )
     
      max_elevation <-as.numeric( max_elevation )
     
     min_elevation <- 
       tt %>% 
        pull( min_elevation )
        min_elevation <-as.numeric( min_elevation )
     
     rides <- 
       rides %>% 
          add_column( max_elevation ) %>% 
          add_column( min_elevation )
     
     rides
  }