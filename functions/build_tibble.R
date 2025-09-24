# build_tibble.R

build_tibble <-
  function( vname,
            dt,
            new_tibble,
            total = FALSE ){
    
    variable_names <- names( dt )
    
    position <- 
      find_column_position( dt, 
                            vname )
    data_values <-
      dt %>% 
      pull( position )
    
    results <-
      compute_parametrics( vname,
                           data_values,
                           total=TRUE )
    new_tibble <-
      bind_rows( new_tibble, results )
    
    new_tibble
  }
            
            
            
            
            
           