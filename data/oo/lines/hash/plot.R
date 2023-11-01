f1 <- read.csv(file = "csv/ownership-pointers.csv")
f2 <- read.csv(file = "csv/ownership-pointers-point.csv")

data <- data.frame(values = c(f1$time, f2$time), group = c("Primitive", "Point"))

boxplot(values ~ group, data)

plot(f1$n, f1$memory / 1000, main = "Memory usage", xlab = "Number of Objects", ylab = "Memory (Mbytes)", type = "l", frame = FALSE, col = "blue", ylim = c(0, 40))
lines(f2$n, f2$memory / 1000 , col = "red", type = "l")

legend(50, 40, legend=c("Primitive hash", "Point hash"), pch=c(19, 19), col=c("blue", "red"))
