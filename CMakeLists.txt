cmake_minimum_required(VERSION 3.9)
project(random_forest_c C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address -O1 -Xpreprocessor -fopenmp -I/opt/homebrew/opt/libomp/include")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L/opt/homebrew/opt/libomp/lib -lomp")

add_executable(random-forest main.c
        utils/utils.c
        utils/data.c
        utils/log.c
        utils/argparse.c
        model/tree.c
        model/forest.c
        eval/eval.c)
