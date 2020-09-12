# Installation instructions for Sample

## Dependencies

NEW or CHANGED MINIMUM dependencies since the last major release are **bold**.

### Required dependencies -- Sample will not build at all without these

 * C++11 (also builds with C++14 and C++17)
 * Compilers: gcc 4.8.2 - 10.1, clang 3.3 - 10.0, MSVS 2015 - 2019,
   icc version 13 or higher
 * CMake >= 3.11 (tested through 3.18)

### Optional dependencies -- features may be disabled if not found

Supported platforms at present include Linux (32 and 64 bit),
Mac OS X, and Windows.

Our build system is based upon 'CMake'.  If you don't already have it
installed on your system, you can get it from http://www.cmake.org

# Installing from package managers

> If you project is available through a package manager list those here, and how
> to install the project using those here.

# Building from Source

## Dependency control and disabling components

**Hints for finding dependencies**

For each external dependency PkgName, our CMake build system will recognize
the following optional variable:

    PkgName_ROOT=...

to specify a hint about where the package is installed. It can either be
a CMake variable (set by `-DPkgName_ROOT=...` on the CMake command line),
or an environment variable of the same name.

**Disabling optional dependencies and individual components**

> If there are any dependences or components that are optional list the CMake
> flags to configure them here.

## Building Sample on Linux or OS X

> Provide detailed step by step guide on how to configure and compile the code
> on Linux or OS X. This should also include build dependencies.

## Building on Windows

> Provide detailed step by step guide on how to configure and compile the code
> on Windows. This should also include build dependencies.

## Testing

> This sections should have a guide on how to run some basic tests to check the
> compilation succeeded.
