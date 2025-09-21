# test_wrangle_rides.R
#
#
################################################################################
# load required librarys
################################################################################

library( tidyverse )
library( vroom )

source("D:/Rides/functions/wrangle_rides.R") 

################################################################################
#  Read the data file and produce variable report.
################################################################################

activities <-
  vroom( "data/2025-09-13.csv" )
spec( activities )

################################################################################
# Many of the variables having missing data.  Since the data comes from
# Garmin Connect the missing values are represented by the character string
# "--".  R assumes that and data is a character string variable.  To fix this
#
# 1. Replace "--" by R's NA.
# 2. Convert the variable to the appropriate numerical data type.
# 3. We build a new tibble called rides aby adding the required tibbles to
#    to a new tibble clled rides.
#
# These operations are carried out in the function wrangle_rides.
################################################################################

rides <- 
  wrangle_rides( activities )



