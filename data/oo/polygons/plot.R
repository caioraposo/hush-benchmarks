f1 <- read.csv(file = "csv/original.csv")
f2 <- read.csv(file = "csv/unsafe-memo.csv")
f3 <- read.csv(file = "csv/guarded.csv")
f4 <- read.csv(file = "csv/alias-set.csv")
f5 <- read.csv(file = "csv/collisions.csv")
f6 <- read.csv(file = "csv/alias-set-opt.csv")

plot(f1$n, f1$time, main = "Polygons benchmark", xlab = "Number of Objects", ylab = "Time (seconds)", type = "l", frame = FALSE, col = "blue")
lines(f2$n, f2$time, col = "red", type = "l")
lines(f3$n, f3$time, col = "green", type = "l")
lines(f4$n, f4$time, col = "black", type = "l")
lines(f6$n, f6$time, col = "orange", type = "l")

legend(0, 1.5, legend=c("Original", "Unsafe memoization", "Guarded memoization", "Alias set", "SO Pointers"), pch=c(19, 19, 19, 19, 19), col=c("blue", "red", "green", "black", "orange"))

plot(f1$n, f1$memory / 1000, main = "Memory usage", xlab = "Number of Objects", ylab = "Memory (Mbytes)", type = "l", frame = FALSE, col = "blue", ylim = c(0, 100))
lines(f2$n, f2$memory / 1000 , col = "red", type = "l")
lines(f3$n, f3$memory / 1000 , col = "green", type = "l")
lines(f4$n, f4$memory / 1000 , col = "black", type = "l")
lines(f6$n, f6$memory / 1000 , col = "orange", type = "l")

legend(50, 100, legend=c("Original", "Unsafe memoization", "Guarded memoization", "Alias set", "Optimized alias set"), pch=c(19, 19, 19, 19, 19), col=c("blue", "red", "green", "black", "orange"))

plot(f1$n, f5$collisions / (f1$n * 3), main = "Collision ratio x Input size", xlab = "Number of Objects", ylab = "Collision ratio", type = "l", frame = FALSE, col = "blue")
