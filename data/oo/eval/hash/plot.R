f1 <- read.csv(file = "csv/compound/original.csv")
f6 <- read.csv(file = "csv/compound/ownership-pointers.csv")
f5 <- read.csv(file = "csv/compound/collisions.csv")

par(family = "serif")
plot(f1$n, f1$time, main = "Eval benchmark", xlab = "Number of Objects", ylab = "Time (seconds)", type = "l", frame = FALSE, col = "blue")
lines(f2$n, f2$time, col = "red", type = "l")
lines(f3$n, f3$time, col = "green", type = "l")
lines(f4$n, f4$time, col = "black", type = "l")
lines(f6$n, f6$time, col = "orange", type = "l")


legend(0, 0.6, legend=c("Original", "Unsafe memoization", "Guarded memoization", "Alias set", "Optimized alias set"), pch=c(19, 19, 19, 19, 19), col=c("blue", "red", "green", "black", "orange"))

plot(f1$n, f1$memory / 1000, main = "Memory usage", xlab = "Number of Objects", ylab = "Memory (Mbytes)", type = "l", frame = FALSE, col = "blue", ylim = c(0, 100))
lines(f2$n, f2$memory / 1000 , col = "red", type = "l")
lines(f3$n, f3$memory / 1000 , col = "green", type = "l")
lines(f4$n, f4$memory / 1000 , col = "black", type = "l")
lines(f6$n, f6$memory / 1000 , col = "orange", type = "l")

legend(50, 100, legend=c("Original", "Unsafe memoization", "Guarded memoization", "Alias set", "Optimized alias set"), pch=c(19, 19, 19, 19, 19), col=c("blue", "red", "green", "black", "orange"))


plot(f1$n, f5$collisions / (f1$n * 3), main = "Collision ratio x Input size", xlab = "Number of Objects", ylab = "Collision ratio", type = "l", frame = FALSE, col = "blue")
