# to_hours.R
#
to_hours  <- function( time ){
  hours    <- as.numeric( str_sub( time, start = 1, end= 2 ) )
  minutes <- as.numeric( str_sub( time,start = 4,end= 5 ) )
  seconds <- as.numeric( str_sub( time, start = 7, end = 8 ))
  round( hours + minutes/60 + seconds / 3600, 2 )
}