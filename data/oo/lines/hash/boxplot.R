f1 <- read.csv(file = "csv/primitive.csv")
f2 <- read.csv(file = "csv/compound.csv")

data <- data.frame(times = c(f1$time, f2$time), group = c("Primitive", "Compound"))

boxplot(times ~ group, data,
	xlab = "Sample size: 5000",
	ylab = "Time (seconds)",
	main = "Lines benchmark",
	col = c("lightblue", "pink"),
	notch = TRUE
)
