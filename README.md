# RGBDS Cradle

A minimalistic project template for Game Boy (Color) games. It uses [CMake][cmake] to automate the build process to make development more convenient. To use this template, you'll need the following tools installed:

* [CMake][cmake]
* [RGBDS][rgbds]

It is meant to make it easy to split your project into several files without having to create complicated build files.

## How To Use

This is a GitHub template you can [easily copy several times](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template). To build the example ROM, simply switch to a command line:

```
$ cmake -S . -B build 
$ cmake --build build
```

Then you should find the ROM in `build/rgbds-cradle.gb` which you should be able to run in any emulator.

## Example Code

The example code in this repository is taken from the excellent [GB ASM Tutorial][gbtut]. I modified the original `hello-world.asm` to be split into several files to show how to do it with this template. It shows how to create an arbitrary file/directory structure.

## To Do

Here are some things I'm planning to add:

* Options to better differentiate Game Boy and Game Boy Color development
* Options/function to add automated asset handling with `rgbgfx`
* Options to control `rgbfix` better (currently you need to add options in `cmake/CMakeRGBDSInformation.cmake`)
* GitHub actions to automate building and releasing games

## Contribution

Any kind of feedback, bug reports, pull requests, etc. are highly appreciated and encouraged! If you have an idea, please don't hesitate to open an issue to discuss it. 


[cmake]: https://cmake.org
[rgbds]: https://rgbds.gbdev.io
[gbtut]: https://gbdev.io/gb-asm-tutorial/part1/hello_world.html
