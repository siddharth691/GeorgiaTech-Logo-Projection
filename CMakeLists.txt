#minimum version for cmake
cmake_minimum_required (VERSION 3.0)

#project name and languages
project (logo_project C CXX)

#Add path of findPackage.cmake for find_package command to see
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

#including package
find_package (Eigen3 3.3 REQUIRED NO_MODULE)
find_package (OpenCV REQUIRED)

#setting c++11
set(CMAKE_CXX_STANDARD 11)

#including the directories
include_directories(include)


#adding executable logo_project
add_executable(logo_project ${PROJECT_SOURCE_DIR}/src/logo_project.cpp)


#link libraries to the the target
target_link_libraries(logo_project Eigen3::Eigen ${OpenCV_LIBS})