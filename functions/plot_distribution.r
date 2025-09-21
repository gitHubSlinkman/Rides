# plot_distribution.R

library( tidyverse )
library( cowplot )

plot_distribution <- 
  function( variable,
            variable_name,
            plot_title )
  {
    variable <- variable[ !is.na( variable )]
    n_bins <- floor( log2( length( variable) ))
    bin_breaks <- pretty( variable,
                          n = n_bins,
                          n.min = 2,
                          high.u.bias = 2 )
    
    bin_width = bin_breaks[2] - bin_breaks[1]
    
    xmin <- floor( min( variable ))
    xmax <- ceiling(( max( variable ) ))
    
    tibble( variable ) %>% 
      ggplot( aes( x = variable, y = ..density.. )) +
      geom_histogram( breaks = bin_breaks,
                      color = "black",
                      fill="yellow") + 
      geom_density( color = "blue") +
      scale_x_continuous( name=variable_name,
                          breaks = bin_breaks,
                          labels = bin_breaks ) +
      ylab( "Density") +
      ggtitle( plot_title ) +
      theme_cowplot()
  }