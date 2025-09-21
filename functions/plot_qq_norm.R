# plot_qq.r
#
nsim <- function(n, m = 0, s = 1) {
  z <- rnorm(n)
  m + s * ((z - mean(z)) / sd(z))
}

nboot <- function(x, R) {
  n <- length(x)
  m <- mean(x)
  s <- sd(x)
  do.call(rbind,
          lapply(1 : R,
                 function(i) {
                   xx <- sort(nsim(n, m, s))
                   p <- seq_along(x) / n - 0.5 / n
                   data.frame(x = xx, p = p, sim = i)
                 }))
}


plot_qq_norm <- function( variable, 
                          R = 50,
                          variable_name="y",
                          plot_title = "Normal QQ plot")
{
  variable <- variable[ !is.na( variable )]
  plot_title <- paste( "Normal QQ plot: ", variable_name )
  
  gb <- nboot( variable, R )
  
  xmin <- floor( min( variable ))
  xmax <- ceiling(( max( variable ) ))
  
  tibble( variable ) %>% 
    ggplot() +
    geom_line(aes(x = qnorm(p), y = x, group = sim),
              color = "gray", data = gb) +
    geom_qq(aes(sample = variable )) +
    xlab( "Theoretical quantiles") +
    ylab( variable_name ) +
    ggtitle( plot_title ) +
    theme_cowplot()
}