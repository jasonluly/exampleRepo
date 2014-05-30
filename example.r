# ----------------------------------------------------------------------------- 
# Let's create some data and plot it in R 
# -----------------------------------------------------------------------------
library(plyr)
library(ggplot2)

# create data
d <- data.frame(`id`    = as.character(seq(1, 1000)),
                `site`  = sample(c('AAA', 'BBB', 'CCC', 'DDD'), size=1000, 
                                 replace=TRUE),
                `age`   = rnorm(n=1000, mean=50,  sd=5),
                `sex`   = sample(c('Male', 'Female'), size=1000,
                                 replace=TRUE),
                `height`= rnorm(n=1000, mean=72,  sd=10))

# tabulate the data
tempFunction <- function(x) { 
  paste(round(mean(x),0), ' (', round(sd(x,0)), ')', sep='') 
  }
table1 <- ddply(d, .(site), summarise, 
                  age   =tempFunction(age),
                  height=tempFunction(height),
                  weight=tempFunction(weight))

# plot data - age
p <- ggplot(data=d)
p <- p + geom_histogram(aes(x=age), binwidth=1)
p <- p + facet_grid(site ~ .)
print(p)

# plot data - sex
p <- ggplot(data=d)
p <- p + geom_bar(aes(x=sex))
p <- p + facet_grid(site ~ .)
print(p)




