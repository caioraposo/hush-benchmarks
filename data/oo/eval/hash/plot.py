import matplotlib.pyplot as plt
import numpy as np

import matplotlib as mpl

f1 = np.genfromtxt("csv/primitive.csv", delimiter=",", names=True)
f2 = np.genfromtxt("csv/compound.csv", delimiter=",", names=True)

plt.figure()
fig, ax = plt.subplots()
plt.title("Eval Benchmark (300K Objects)")
plt.ylabel("Time (seconds)")
ax.boxplot((f1["time"], f2["time"])) 
plt.xticks([1, 2], ["Primitive", "Compound"])

plt.savefig("eval-hash-boxplot.png", dpi=300)

f3 = np.genfromtxt("csv/original.csv", delimiter=",", names=True)
f4 = np.genfromtxt("csv/ownership-pointers.csv", delimiter=",", names=True)
f5 = np.genfromtxt("csv/ownership-pointers-hash.csv", delimiter=",", names=True)

plt.figure()
fig, ax = plt.subplots()
plt.title("Eval Benchmark")
plt.xlabel("Tree Depth")
plt.ylabel("Time (seconds)")
ax.plot(f3["n"], f3["time"], label = "Original")
ax.plot(f5["n"], f5["time"], label = "SOP Memoization")
ax.plot(f5["n"], f5["table_get"] / 1000000000 + f5["table_insert"] / 1000000000, label = "Memo table (get + insert)")
plt.legend()

plt.savefig("eval-hash-linegraph.png", dpi=300)

#plt.figure()
#fig, ax = plt.subplots()
#plt.title("Eval Benchmark (Memory Comsumption)")
#plt.xlabel("Tree Depth")
#plt.ylabel("Memory (Mbytes)")
#ax.plot(f3["n"], f3["memory"] / 1000, label = "original")
#ax.plot(f4["n"], f4["memory"] / 1000, label = "ownership pointers")
#plt.legend()
#
#plt.savefig("eval-hash-linegraph-memory.png", dpi=300)
