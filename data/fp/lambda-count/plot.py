import matplotlib.pyplot as plt
import numpy as np

import matplotlib as mpl

f1 = np.genfromtxt("csv/original.csv", delimiter=",", names=True)
f5 = np.genfromtxt("csv/ownership-pointers.csv", delimiter=",", names=True)

fig, ax = plt.subplots()
plt.title("Lambda-count Benchmark")
plt.xlabel("Number of lambda-terms")
plt.ylabel("Time (seconds)")
ax.plot(f1["n"], f1["time"], label = "Original") 
ax.plot(f5["n"], f5["time"], label = "SOP Memoization") 
plt.legend()

plt.tight_layout()
plt.savefig("lambda-time.png", dpi=300)
