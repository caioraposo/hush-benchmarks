f1 <- read.csv(file = "csv/chacha8.csv")
f2 <- read.csv(file = "csv/thread_rng.csv")
f3 <- read.csv(file = "csv/chacha12.csv")
f4 <- read.csv(file = "csv/chacha20.csv")
f5 <- read.csv(file = "csv/stdrng.csv")

plot(f1$n, f1$time, main = "RNG comparison", xlab = "#std.rand() calls", ylab = "Time (seconds)", type = "l", frame = FALSE, col = "blue")
lines(f2$n, f2$time, col = "red", type = "l")
lines(f3$n, f3$time, col = "green", type = "l")
lines(f4$n, f4$time, col = "yellow", type = "l")
lines(f5$n, f5$time, col = "purple", type = "l")

legend(0, 1.4, legend=c("ChaCha8", "thread_rng", "ChaCha12", "ChaCha20", "StdRng"), pch=c(19, 19, 19, 19), col=c("blue", "red", "green", "yellow", "purple"))
