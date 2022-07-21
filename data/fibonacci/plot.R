no_memo <- read.csv(file = "fib-memo.csv")
memo <- read.csv(file = "fib-hand-memo.csv")

plot(no_memo$n, no_memo$time, xlab = "n", ylab = "Time (miliseconds)", pch = 19, frame = FALSE, col = "blue")

points(memo$n, memo$time, pch = 19, col = "red")


legend(2, 25, legend=c("Builtin memoization", "Handcrafted memoization"), pch=c(19, 19), col=c("blue", "red"))
