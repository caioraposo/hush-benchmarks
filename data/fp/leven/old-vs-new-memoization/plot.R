f1 <- read.csv(file = "lev-hand-memo.csv")
f2 <- read.csv(file = "lev-new-memo.csv")
#f3 <- read.csv(file = "lev-hand-matrix-memo1.csv")

f1$time = f1$time / 1000
f2$time = f2$time / 1000
#f3$time = f3$time / 1000

plot(f1$n, f1$time, xlab = "String size", ylab = "Time (seconds)", type = "l", frame = FALSE, col = "blue", log = "y", main = "Levenshtein distance", xlim = c(0, 250))
points(f2$n, f2$time, type = "l", col = "red")
#points(f3$n, f3$time, pch = 19, col = "green")


legend(1, 1800, legend=c("Old built-in memoization", "New built-in memoization"), pch=c(19, 19), col=c("blue", "red"))
