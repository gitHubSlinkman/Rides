# find_column_position.R

#' find_column_position
#' 
#' This function find the column position of a variable in a data.frame or
#' tibble.
#'
#' @param data      - a data frame ot tibble.
#' @param variable  - a quoted string that is the name of a variable.
#'
#' @return an integer column position
#' @export
#'
#' @examples
#' 

library( tidyverse )                    # I live in the tidyverse environment.

find_column_position <- 
  function( data, string_variable )
  {
    #######################################################################
    # Get the variable names of the data object.
    #######################################################################
    
    vnames <- names( data )
    
    #######################################################################
    # Find column position.  If it does not match throw an error.
    #######################################################################
    
    position <-
      match(  vnames,
              string_variable )
    
    position <-
      str_locate( vnames,
                  string_variable )
    
    if( position  == 0)
      stop(  paste( "Column position for variable",
                    str_predixtor, 
                    "not found in data source:",
                    "deparse(substitute(data))" ))
    position
  }
