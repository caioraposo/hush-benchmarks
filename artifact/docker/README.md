# Reproducing Hush Benchmarks via Docker

This folder contains a [Dockerfile](Dockerfile) to reproduce the experiments in the Hush artifact.
First, create a docker image out of this docker file with the following command:

```sh
$ docker build -t hush-artifact -f Dockerfile .
```

The `-t` flag specifies a tag for the image being built. Here we call it `hush-artifact` but you can give another name if so desired.
The build process takes about 3 minutes on the system described [in this page](../README.md). After building the image, create a directory where you wish the results to be saved, we will use `output_dir` in this example.

```sh
$ mkdir output_dir
```

After that, you can run the container.
By default it will save data to the directory `/hush-benchmarks/artifact/results`, as defined by the entrypoint in the [Dockerfile](Dockerfile). 
Make sure you create a volume through the `-v` tag to save the results to your directory.

```sh
$ docker run -v ./output_dir:/hush-benchmarks/artifact/results hush-artifact
```

The command shown above will run the experiments and save the outputs to `output_dir` in your current directory.
You can expect its contents to be similar to [../expected-outputs](../expected-outputs).
For each program, its output should be exact.
The running time, however, may vary a little.
Finally, to generate the charts for this run, use the `make-plots.py` python script in the parent folder.
You should have matplotlib installed in your system. Check out the [installation guide](https://matplotlib.org/stable/install/index.html) on the official documentation.

```sh
$ python ../make-plots.py output_dir charts
```

The script will save the charts in PNG format in the `charts` directory.
