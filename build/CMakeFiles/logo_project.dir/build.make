# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build

# Include any dependencies generated for this target.
include CMakeFiles/logo_project.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/logo_project.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/logo_project.dir/flags.make

CMakeFiles/logo_project.dir/src/logo_project.cpp.o: CMakeFiles/logo_project.dir/flags.make
CMakeFiles/logo_project.dir/src/logo_project.cpp.o: ../src/logo_project.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/logo_project.dir/src/logo_project.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/logo_project.dir/src/logo_project.cpp.o -c /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/src/logo_project.cpp

CMakeFiles/logo_project.dir/src/logo_project.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/logo_project.dir/src/logo_project.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/src/logo_project.cpp > CMakeFiles/logo_project.dir/src/logo_project.cpp.i

CMakeFiles/logo_project.dir/src/logo_project.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/logo_project.dir/src/logo_project.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/src/logo_project.cpp -o CMakeFiles/logo_project.dir/src/logo_project.cpp.s

CMakeFiles/logo_project.dir/src/logo_project.cpp.o.requires:

.PHONY : CMakeFiles/logo_project.dir/src/logo_project.cpp.o.requires

CMakeFiles/logo_project.dir/src/logo_project.cpp.o.provides: CMakeFiles/logo_project.dir/src/logo_project.cpp.o.requires
	$(MAKE) -f CMakeFiles/logo_project.dir/build.make CMakeFiles/logo_project.dir/src/logo_project.cpp.o.provides.build
.PHONY : CMakeFiles/logo_project.dir/src/logo_project.cpp.o.provides

CMakeFiles/logo_project.dir/src/logo_project.cpp.o.provides.build: CMakeFiles/logo_project.dir/src/logo_project.cpp.o


# Object files for target logo_project
logo_project_OBJECTS = \
"CMakeFiles/logo_project.dir/src/logo_project.cpp.o"

# External object files for target logo_project
logo_project_EXTERNAL_OBJECTS =

logo_project: CMakeFiles/logo_project.dir/src/logo_project.cpp.o
logo_project: CMakeFiles/logo_project.dir/build.make
logo_project: /usr/local/lib/libopencv_stitching.so.4.1.0
logo_project: /usr/local/lib/libopencv_dnn.so.4.1.0
logo_project: /usr/local/lib/libopencv_photo.so.4.1.0
logo_project: /usr/local/lib/libopencv_gapi.so.4.1.0
logo_project: /usr/local/lib/libopencv_video.so.4.1.0
logo_project: /usr/local/lib/libopencv_objdetect.so.4.1.0
logo_project: /usr/local/lib/libopencv_ml.so.4.1.0
logo_project: /usr/local/lib/libopencv_calib3d.so.4.1.0
logo_project: /usr/local/lib/libopencv_features2d.so.4.1.0
logo_project: /usr/local/lib/libopencv_flann.so.4.1.0
logo_project: /usr/local/lib/libopencv_highgui.so.4.1.0
logo_project: /usr/local/lib/libopencv_videoio.so.4.1.0
logo_project: /usr/local/lib/libopencv_imgcodecs.so.4.1.0
logo_project: /usr/local/lib/libopencv_imgproc.so.4.1.0
logo_project: /usr/local/lib/libopencv_core.so.4.1.0
logo_project: CMakeFiles/logo_project.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable logo_project"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/logo_project.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/logo_project.dir/build: logo_project

.PHONY : CMakeFiles/logo_project.dir/build

CMakeFiles/logo_project.dir/requires: CMakeFiles/logo_project.dir/src/logo_project.cpp.o.requires

.PHONY : CMakeFiles/logo_project.dir/requires

CMakeFiles/logo_project.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/logo_project.dir/cmake_clean.cmake
.PHONY : CMakeFiles/logo_project.dir/clean

CMakeFiles/logo_project.dir/depend:
	cd /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/build/CMakeFiles/logo_project.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/logo_project.dir/depend
