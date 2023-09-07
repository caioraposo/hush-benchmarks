f1 <- read.csv(file = "mss-memo.csv")
f2 <- read.csv(file = "mss-hand-memo.csv")

f1$time = f1$time 
f2$time = f2$time 

plot(f1$n, f1$time, xlab = "n", ylab = "Time (miliseconds)", pch = 19, frame = FALSE, col = "blue")
points(f2$n, f2$time, pch = 19, col = "red")


legend(2, 26, legend=c("Builtin memoization", "Handcrafted memoization"), pch=c(19, 19), col=c("blue", "red"))
