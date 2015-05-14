# How to use with CMAKE

add this line to CMakeLists.txt:

    `set(CMAKE_EXPORT_COMPILE_COMMANDS 1)`

to your CMakeListst.txt.

It will generate a file called "compile\_commands.json" in the build directory.

modify the variable

    compilation_database_folder = ''

to point to the absolute path of your build directory

# How to create .ycm\_extra\_config.py

see [this link](https://github.com/rdnetto/YCM-Generator)
