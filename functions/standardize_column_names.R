# Standardize_column_names.

standardize_column_names <-
  function( this_tibble )
  {
    column_names <- colnames(  this_tibble )
    
    column_names      <-  tolower( str_replace_all( 
      column_names,  " ", "_") )
    column_names[2]          <- "date_time" 
    colnames( this_tibble )  <- column_names
    
    this_tibble
  }