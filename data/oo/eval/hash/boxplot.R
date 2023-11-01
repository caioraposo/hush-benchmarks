#f1 <- read.csv(file = "csv/primitive/original.csv")
#f2 <- read.csv(file = "csv/primitive/unsafe-memo.csv")
#f3 <- read.csv(file = "csv/primitive/guarded.csv")
#f4 <- read.csv(file = "csv/primitive/alias-set.csv")
#f5 <- read.csv(file = "csv/primitive/ownership-pointers.csv")
#f6 <- read.csv(file = "csv/primitive/collisions.csv")
#f7 <- read.csv(file = "csv/compound/original.csv")
#f8 <- read.csv(file = "csv/compound/unsafe-memo.csv")
#f9 <- read.csv(file = "csv/compound/guarded.csv")
#f10 <- read.csv(file = "csv/compound/alias-set.csv")
#f11 <- read.csv(file = "csv/compound/ownership-pointers.csv")
#
#data <- data.frame(
#	times = c(f1$time, f2$time, f3$time, f4$time, f5$time,
#              f7$time, f8$time, f9$time, f10$time, f11$time),
#    group = LETTERS[1:10]
#	#group = c("Original", "Unsafe", "Guarded", "Alias Set",
#	#          "Gc Pointers", "zOriginal", "zUnsafe", "zGuarded",
#    #          "zAlias Set", "zGc Pointers")
#)

f1 <- read.csv(file = "csv/primitive.csv")
f2 <- read.csv(file = "csv/compound.csv")

data <- data.frame(times = c(f1$time, f2$time), group = c("Primitive", "Compound"))

boxplot(times ~ group, data,
	xlab = "Sample size: 1000",
	ylab = "Time (seconds)",
	main = "Eval benchmark (300K Objects)",
	col = c("lightblue", "pink"),
	notch = TRUE
)
