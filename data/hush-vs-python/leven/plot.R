f1 <- read.csv(file = "hush-leven-wo-spikes.csv")
f2 <- read.csv(file = "py-leven-wo-spikes.csv")

f1$time = f1$time / 1000000
f2$time = f2$time / 1000000

plot(f1$n, f1$time, ylim = c(0, 500), type = "l", xlab = "N", main = "Levenshtein distance", ylab = "Time (miliseconds)", col = "red")
points(f2$n, f2$time, type = "l", col = "blue")


legend(2, 500, legend=c("Python", "Hush"), pch=c(19, 19), col=c("blue", "red"))
