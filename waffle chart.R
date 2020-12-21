install.packages("waffle")
library(waffle)

expenses <- c('Health ($43,212)'=43212,
              'Education ($113,412)'=113412,
              "Tranportation ($20,231)"=20231,
              "Entertainment ($28,145)"=28145)

waffle(expenses/1235, rows = 5, size = 0.3,
       colors =  c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf"),
       title = "Imaginary",
       xlab="1 square = $934")