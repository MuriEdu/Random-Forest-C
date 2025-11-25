cmake_minimum_required(VERSION 3.9)
project(random_forest_c C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address -O1")

add_executable(random-forest main.c
        utils/utils.c
        utils/data.c
        utils/log.c
        utils/argparse.c
        model/tree.c
        model/forest.c
        eval/eval.c)

if(OpenMP_FOUND)
        target_link_libraries(random-forest PUBLIC OpenMP::OpenMP_C)
endif()