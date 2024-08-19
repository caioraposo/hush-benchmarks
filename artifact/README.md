# Reproducing Hush Benchmarks Results

Our implementation of Hush is described in a [paper](../docs/RaposoSBLP24.pdf).
The preferred way to reproduce the experiments is through our [Docker](docker) setup.
This guide will show you how to setup a Linux environment to reproduce the results.
This setup has been successfully reproduced in the following system:

* **Operating System**: Void Linux
* **Kernel**: 6.10.4_1
* **Architecture**: x86_64
* **CPU**: AMD Ryzen 7 5700X 8-Core Processor
* **RAM**: 16GiB of DDR4 memory
* **Rust**: 1.80
* **libc**: musl libc 1.1.24

## Prerequisites

Ensure that your system has the `GNU time` installed. Not to be confused with bash's `time` command. On Debian and derivatives, this can be accomplished with a simple install through apt.

```sh
# apt install time
```

You will also need a recent version of  `Rust` (preferably 1.80) and `git`.
Optionally, to generate the charts, you should have matplotlib installed.
Check out the [installation guide](https://matplotlib.org/stable/install/index.html) on the official documentation.

# Step 1: Installing Hush

Clone the repository:

```sh
$ git clone https://github.com/caioraposo/hush
```

Compile and install hush:

```sh
$ cd hush
$ cargo build --release && cargo install --path .
```

# Step 2: Install the other four versions of Hush

To evaluate the programs, we used five different versions of Hush: Original (already installed), Unsafe, Guarded, Alias Sets, and Sop. They reside in different branches of the git repo. Assuming you are in the hush directory, run the following commands (you will need root privileges to copy the binaries to `/usr/local/bin`):

```sh
# git checkout ownership-pointers && cargo build --release
# cp ./target/release/hush /usr/local/bin/ohush
# git checkout unsafe-memoization && cargo build --release
# cp ./target/release/hush /usr/local/bin/uhush
# git checkout guarded-memoization && cargo build --release
# cp ./target/release/hush /usr/local/bin/ghush
# git checkout alias-set && cargo build --release
# cp ./target/release/hush /usr/local/bin/ahush
```

You can substitute `/usr/local/bin` with your prefered directory for binaries such as `~/.local/bin`. Note that this directory has to be in the `$PATH` variable.

# Step 3: Clone the Hush Benchmarks repository

Finally, clone the Hush Benchmarks repository and navigate to the source directory:
```sh
$ git clone https://github.com/caioraposo/hush-benchmarks
$ cd hush-benchmarks/artifact
```

# Step 4: Reproduce the experiments

Finally, to reproduce the experiments, first, create a directory for the output files. We name it `results` in this example. And pass it to the `run.hsh` script with the output directory as an argument. This step took 27 minutes to run on a machine with an AMD Ryzen 7 5700X processor.

```sh
$ mkdir results
$ hush run.hsh results
```

The script `run.hsh` will run all object-oriented programs in `../src/oo` of this repository, and record output and time to a CSV file. The output directory should have the following structure:

```
results
├── composite-figures
│  ├── alias-set.csv
│  ├── guarded.csv
│  ├── original.csv
│  ├── output
│  │  ├── alias-set-100.out
│  │  ├── alias-set-200.out
...
├── eval
│  ├── alias-set.csv
│  ├── guarded.csv
│  ├── original.csv
│  ├── output
│  │  ├── alias-set-1.out
│  │  ├── alias-set-2.out
...
├── lines
│  ├── alias-set.csv
│  ├── guarded.csv
│  ├── original.csv
│  ├── output
│  │  ├── alias-set-1.out
│  │  ├── alias-set-1001.out
...
```

# Step 5: Generate the charts (optional)

To generate charts from the output files, run the `make-plots.py` python script, passing the output directory as argument:

```sh
$ python make-plots.py results charts
```

The script creates PNG files and saves them in the `charts` directory.