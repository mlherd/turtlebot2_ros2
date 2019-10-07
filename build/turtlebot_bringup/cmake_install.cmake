# Install script for directory: /home/turtlebot2/Desktop/turtlebot2_ros2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/turtlebot2/Desktop/turtlebot2_ros2/install/turtlebot_bringup")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup" TYPE EXECUTABLE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/bin/turtlebot2")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2"
         OLD_RPATH "/home/turtlebot2/ros2_ws/install/rclcpp/lib:/home/turtlebot2/ros2_ws/install/rcl/lib:/home/turtlebot2/ros2_ws/install/rcl_interfaces/lib:/home/turtlebot2/ros2_ws/install/rmw_implementation/lib:/home/turtlebot2/ros2_ws/install/rmw/lib:/home/turtlebot2/ros2_ws/install/rcutils/lib:/home/turtlebot2/ros2_ws/install/rcl_logging_noop/lib:/home/turtlebot2/ros2_ws/install/rosgraph_msgs/lib:/home/turtlebot2/ros2_ws/install/rcl_yaml_param_parser/lib:/home/turtlebot2/ros2_ws/install/nav_msgs/lib:/home/turtlebot2/ros2_ws/install/geometry_msgs/lib:/home/turtlebot2/ros2_ws/install/builtin_interfaces/lib:/home/turtlebot2/ros2_ws/install/std_msgs/lib:/home/turtlebot2/ros2_ws/install/rosidl_typesupport_cpp/lib:/home/turtlebot2/ros2_ws/install/rosidl_typesupport_c/lib:/home/turtlebot2/ros2_ws/install/rosidl_typesupport_introspection_cpp/lib:/home/turtlebot2/ros2_ws/install/rosidl_typesupport_introspection_c/lib:/home/turtlebot2/ros2_ws/install/rosidl_generator_c/lib:/home/turtlebot2/ros2_ws/install/sensor_msgs/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot_bringup/turtlebot2")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup" TYPE DIRECTORY FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/turtlebot_bringup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/turtlebot_bringup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup/environment" TYPE FILE FILES "/home/turtlebot2/ros2_ws/install/ament_cmake_core/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup/environment" TYPE FILE FILES "/home/turtlebot2/ros2_ws/install/ament_cmake_core/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_environment_hooks/local_setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_environment_hooks/local_setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_index/share/ament_index/resource_index/packages/turtlebot_bringup")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup/cmake" TYPE FILE FILES
    "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_core/turtlebot_bringupConfig.cmake"
    "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/ament_cmake_core/turtlebot_bringupConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot_bringup" TYPE FILE FILES "/home/turtlebot2/Desktop/turtlebot2_ros2/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/turtlebot2/Desktop/turtlebot2_ros2/build/turtlebot_bringup/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
