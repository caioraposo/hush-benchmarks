import matplotlib.pyplot as plt
import numpy as np

import matplotlib as mpl

f1 = np.genfromtxt("csv/original.csv", delimiter=",", names=True)
f2 = np.genfromtxt("csv/unsafe-memo.csv", delimiter=",", names=True)
f3 = np.genfromtxt("csv/guarded.csv", delimiter=",", names=True)
f4 = np.genfromtxt("csv/alias-set.csv", delimiter=",", names=True)
f5 = np.genfromtxt("csv/ownership-pointers.csv", delimiter=",", names=True)
f6 = np.genfromtxt("csv/collisions.csv", delimiter=",", names=True)

plt.figure(1)
fig, ax = plt.subplots()
plt.title("Eval Benchmark")
plt.xlabel("Number of Objects")
plt.ylabel("Time (seconds)")
ax.plot(f1["n"], f1["time"], label = "Original") 
ax.plot(f2["n"], f2["time"], label = "Unsafe memoization") 
ax.plot(f3["n"], f3["time"], label = "Guarded memoization") 
ax.plot(f4["n"], f4["time"], label = "Alias Set") 
ax.plot(f5["n"], f5["time"], label = "Shared-ownership Pointers") 
plt.legend()

plt.savefig("eval-time.png", dpi=300)

plt.figure(2)
fig, ax = plt.subplots()
plt.title("Memory Usage")
plt.xlabel("Number of Objects")
plt.ylabel("Memory (Kbytes)")
ax.plot(f1["n"], f1["memory"], label = "Original") 
ax.plot(f2["n"], f2["memory"], label = "Unsafe memoization") 
ax.plot(f3["n"], f3["memory"], label = "Guarded memoization") 
ax.plot(f4["n"], f4["memory"], label = "Alias Set") 
ax.plot(f5["n"], f5["memory"], label = "Shared-ownership Pointers") 
plt.legend()

plt.savefig("eval-memory.png", dpi=300)

plt.figure(3)
fig, ax = plt.subplots()
plt.title("Collision Rate")
plt.xlabel("Number of Objects")
plt.ylabel("Collision / Number of Objects")
ax.plot(f6["n"], f6["collisions"] / f6["n"]) 

plt.savefig("eval-collisions.png", dpi=300)
