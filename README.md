## Test of C++

This code was a structure to learn the C++, with a homemade Makefile and some class.

## Build
### Standard build
In Ubuntu, install g++ and make.

Then build with:
```
make
```

### Build in a container
With this option, the build is not made by your environment, but in a container with all of the dependencies already installed. At the end of the build, you can see the binary in the **bin/** folder, like after a standard build.

Install docker (if needed). Then, build with:
```
make docker
```

## Run the code

```
make run
```

## Informations

Take a look at the Makefile to see the other possibilities, like installing the binary, building and pushing a docker image with the binary.
