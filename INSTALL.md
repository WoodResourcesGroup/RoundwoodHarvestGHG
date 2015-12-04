# Installation notes

I ran into some issues installing SciPy in a python virtual environment on Debian. Specifically, the installation was failing to find `blas` and `lapac` libraries.

`scipy` used in a virtualenv (installed using `pip`) requires the following distribution packages because it cant find libraries used byt the cersion of scipy instaled using the linux distribution (via `aptitude`). THerefore you need to install the following packages on your system before SciPy can be installed using `pip`:

1. `libblas-dev`
2. `liblapac-dev`
