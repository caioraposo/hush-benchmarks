f1 <- read.csv(file = "mss-old-memo.csv")
f2 <- read.csv(file = "mss-new-memo.csv")

f1$time = f1$time / 1000000 # ns to ms
f2$time = f2$time / 1000000

plot(f1$n, f1$time, log = "y", main = "Maximum-subarray problem", type = "l", xlab = "N", ylab = "Time (miliseconds)", pch = 19, frame = FALSE, col = "blue")
points(f2$n, f2$time, type = "l", col = "red")


legend(2, 10000, legend=c("Old built-in memoization", "New built-in memoization"), pch=c(19, 19), col=c("blue", "red"))
