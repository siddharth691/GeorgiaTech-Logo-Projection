# Install script for directory: /home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3" TYPE FILE FILES "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/signature_of_eigen3_matrix_library")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pkgconfig" TYPE FILE FILES "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/eigen3.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake/Eigen3Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake/Eigen3Targets.cmake"
         "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/CMakeFiles/Export/share/eigen3/cmake/Eigen3Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake/Eigen3Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake/Eigen3Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake" TYPE FILE FILES "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/CMakeFiles/Export/share/eigen3/cmake/Eigen3Targets.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/eigen3/cmake" TYPE FILE FILES
    "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/UseEigen3.cmake"
    "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/Eigen3Config.cmake"
    "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/Eigen3ConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/Eigen/cmake_install.cmake")
  include("/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/unsupported/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/siddharth/Desktop/Georgia_Tech_courses/Robotics-Perception_Upenn/Logo_Projection/my_code/eigen-eigen-323c052e1731/cmake/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
