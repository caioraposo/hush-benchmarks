f1 <- read.csv(file = "csv/original.csv")
f2 <- read.csv(file = "csv/unsafe-memo.csv")
f3 <- read.csv(file = "csv/guarded.csv")
f4 <- read.csv(file = "csv/alias-set.csv")
f5 <- read.csv(file = "csv/collisions.csv")

plot(f1$n, f1$time, main = "Eval benchmark", xlab = "Number of Objects", ylab = "Time (seconds)", type = "l", frame = FALSE, col = "blue")
lines(f2$n, f2$time, col = "red", type = "l")
lines(f3$n, f3$time, col = "green", type = "l")
lines(f4$n, f4$time, col = "black", type = "l")


legend(0, 0.4, legend=c("Original", "Unsafe memoization", "Guarded memoization", "Alias set"), pch=c(19, 19, 19, 19), col=c("blue", "red", "green", "black"))


plot(f1$n, f5$collisions / f1$n , main = "Collision ratio x Input size", xlab = "Number of Objects", ylab = "Collision ratio", type = "l", frame = FALSE, col = "blue")
