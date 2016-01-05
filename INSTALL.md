# Installation notes

## Linux Debian

I ran into some issues installing SciPy in a python virtual environment on Debian. Specifically, the installation was failing to find `blas` and `lapac` libraries.

`scipy` used in a virtualenv (installed using `pip`) requires the following distribution packages because it cant find libraries used by the version of scipy installed using the linux distribution (via `aptitude`). Therefore you need to install the following packages on your system before SciPy can be installed using `pip`:

1. `libblas-dev`
2. `liblapac-dev`

## OSX

Same trouble with `lxml` in a virtualenv on OSX Yosemite. Had `libxml2` installed but had to link it using homebrew. Also `libxst` needed to be installed via homebrew and linked:

```
$ brew install libxml2
$ brew install libxst
$ brew link libxml2 --force
$ brew link libxst --force
```
