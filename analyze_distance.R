# analyze_distance.R

library( tidyverse )
library( vroom )
library( cowplot )

library( vroom )

source("D:/Rides/functions/wrangle_rides.R") 
source("D:/Rides/functions/plot_distribution.r")
source("D:/Rides/functions/plot_qq_norm.R")

################################################################################
#  Read the data file and produce variable report.
################################################################################

activities <-
  vroom( "data/2025-09-13.csv" )
spec( activities )

rides <- wrangle_rides( activities )

################################################################################
# Plot the histogram and the density diagram in one plot of the distance
# variable.
#################################################################################

distance <-
  rides %>% 
    pull( distance )

plot_distribution( distance,
                   "Distance(in miles)",
                   "Ride Distance" )
plot_qq_norm( distance,
              R = 100,
              variable_name = "distance(in miles)",
              plot_title =
               "Normal quantitle-quantitle plot of ride distances" )
