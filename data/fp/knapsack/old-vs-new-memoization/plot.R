f1 <- read.csv(file = "knap-old-memo.csv")
f2 <- read.csv(file = "knap-new-memo.csv")

f1$time = f1$time / 1000
f2$time = f2$time / 1000

plot(f1$n, f1$time, main = "Knapsack", log = "y", xlab = "n", ylab = "Time (microseconds)", pch = 19, frame = FALSE, col = "blue")
points(f2$n, f2$time, pch = 19, col = "red")


legend(2, 9000000, legend=c("Old built-in memoization", "New built-in memoization"), pch=c(19, 19), col=c("blue", "red"))
