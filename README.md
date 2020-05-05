Development repository for SDSL Version 3

Instructions:
1. clone this repository: `git clone https://github.com/xxsds/sdsl-lite.git`
2. create a build directory and visit it: `mkdir build && cd build`
3. run cmake: `cmake ../sdsl-lite`
4. run `make` and generate:
    * A short reference for the use of the library (in the [cheatsheet](./extras/cheatsheet) directory).
5. optional: run the tests: `make test` (see [test](./test) directory)
6. optional: run benchmark test: Go to the [benchmark](./benchmark) directory and run `make timing` in the various
    subfolders. (You need to run `cmake` beforehand to get the `Make.helper` files.)
