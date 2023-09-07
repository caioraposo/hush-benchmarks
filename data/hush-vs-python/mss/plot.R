f1 <- read.csv(file = "python-mss.csv")
f2 <- read.csv(file = "hush-mss.csv")

f1$time = f1$time / 1000000
f2$time = f2$time / 1000000

plot(f1$n, f1$time, type = "l", xlab = "N", ylim = c(1, 50), main = "Maximum subarray problem", ylab = "Time (miliseconds)", col = "blue")
points(f2$n, f2$time, type = "l", col = "red")


legend(2, 50, legend=c("Python", "Hush"), pch=c(19, 19), col=c("blue", "red"))
