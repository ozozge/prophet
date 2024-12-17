#install.packages('prophet', dependencies=TRUE, repos='http://cran.rstudio.com/')

df<-read.csv("prophet.csv",header = TRUE)

df$ULSTARTDATE <- as.Date(df$ULSTARTDATE, format = "%m/%d/%Y")
colnames(df) <- c("ds", "y")

m <- prophet(df)

future <- make_future_dataframe(m, periods = 30)

forecast <- predict(m, future)

plot(m, forecast)

prophet_plot_components(m, forecast)

dyplot.prophet(m, forecast)




