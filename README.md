# Cross Compilation Image

This defines an image that is intended to provide a simple way to cross-compile C code for several different OSs and CPU architectures.

The target platforms are as follows:
- Linux x86\_64.
- Windows x86\_64.
- MacOS aarch64.

## Building the image:
```
export DOCKER_BUILDKIT=1
docker build -t cross-compile:latest .
```

## Running the image:
```
docker run -v /path/to/my/repo:/home/repo cross-compile:latest --makefile /home/repo/path/to/makefile.mk
```

