# CMake Tutorial

## Generating a Project

```bash
cmake [<options>] -S <path-to-source> -B <path-to-build>
```

Assuming that a CMakeLists.txt is in the root directory, you can generate a project like the following.

```bash
mkdir build
cd build
cmake -S .. -B . # Option 1
cmake .. # Option 2
```

Assuming that you have already built the CMake project, you can update the generated project.

```bash
cd build
cmake .
```

## Run the Executable

After generating the project and building a specific target you might want to run the executable.
The executable is stored in *build/Executable*

```bash
cd build
./Executable
```
