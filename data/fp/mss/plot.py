import matplotlib.pyplot as plt
import numpy as np

import matplotlib as mpl

f1 = np.genfromtxt("csv/original.csv", delimiter=",", names=True)
f2 = np.genfromtxt("csv/ownership-pointers.csv", delimiter=",", names=True)
f3 = np.genfromtxt("csv/ownership-pointers10k.csv", delimiter=",", names=True)

plt.figure()
fig, ax = plt.subplots()
plt.title("Max-subarray-sum 1K")
plt.xlabel("Array Size")
plt.ylabel("Time (miliseconds)")
ax.plot(f1["n"], f1["time"] * 1000, label = "Original") 
ax.plot(f2["n"], f2["time"] * 1000, label = "SOP Memoization") 
plt.legend()
plt.tight_layout()
plt.savefig("mss-time.png", dpi=300)

plt.figure()
fig, ax = plt.subplots()
plt.title("Max-subarray-sum 10K")
plt.xlabel("Array Size")
plt.ylabel("Time (miliseconds)")
ax.plot(f1["n"], f1["time"] * 1000, label = "Original") 
ax.plot(f3["n"], f3["time"] * 1000, label = "SOP Memoization") 
plt.legend()
plt.tight_layout()
plt.savefig("mss-time10k.png", dpi=300)
