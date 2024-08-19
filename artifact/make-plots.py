import matplotlib.pyplot as plt
import numpy as np
import sys, os

import matplotlib as mpl

DATA = sys.argv[1]
OUTPUT = sys.argv[2]
os.makedirs(OUTPUT)

programs = [
	"composite-figures",
	"eval",
	"lines",
	"nbody",
	"polygons",
	"sub",
	"treesort"
]

for program in programs:
    f1 = np.genfromtxt(f"{DATA}/{program}/original.csv", delimiter=",", names=True)
    f2 = np.genfromtxt(f"{DATA}/{program}/unsafe-memo.csv", delimiter=",", names=True)
    if program != "nbody":
        f3 = np.genfromtxt(f"{DATA}/{program}/guarded.csv", delimiter=",", names=True)
    f4 = np.genfromtxt(f"{DATA}/{program}/alias-set.csv", delimiter=",", names=True)
    f5 = np.genfromtxt(f"{DATA}/{program}/sop-memo.csv", delimiter=",", names=True)

    plt.figure(1)
    fig, ax = plt.subplots()
    plt.xlabel("Number of Objects")
    plt.ylabel("Time (seconds)")
    ax.plot(f1["n"], f1["time"], label = "Original") 
    ax.plot(f2["n"], f2["time"], label = "Unsafe Memoization") 
    if program != "nbody":
        ax.plot(f3["n"], f3["time"], label = "Guarded Memoization") 
    ax.plot(f4["n"], f4["time"], label = "Alias Set Memoization") 
    ax.plot(f5["n"], f5["time"], label = "SOP Memoization") 
    plt.legend()
    plt.tight_layout()
    plt.savefig(f"{OUTPUT}/{program}-time.png", dpi=300)
