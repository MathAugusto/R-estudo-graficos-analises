install.packages("plotly")
library(plotly)
set.seed(1234)

set_a <- rnorm(200, mean=1,sd=2)
set_b <- rnorm(200, mean=0,sd=1)

#create the data frame
df <- data.frame(label = factor(rep(c("A","B"), each=200)), value = c(set_a, set_b))
#output both the first and last rows
head(df)
tail(df)

ggplot(df, aes(x=label, y=value)) + geom_boxplot()
ggplotly()