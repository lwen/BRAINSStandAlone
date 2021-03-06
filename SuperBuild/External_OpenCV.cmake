set(extProjName "OpenCV")
if(DEFINED OpenCV_DIR AND NOT EXISTS ${OpenCV_DIR})
  message(FATAL_ERROR "${extProjName}_DIR variable is defined but corresponds to non-existing directory (${${extProjName}_DIR})")
endif()

set(OPENCV_GIT_TAG "FixNeuralNetwork_20111111") # USE THIS FOR UPDATED VERSION

if(NOT DEFINED OpenCV_DIR)
  set(OpenCV_DEPEND OpenCV)
  set(proj OpenCV)

  ExternalProject_add(${proj}
    SOURCE_DIR ${proj}
    BINARY_DIR ${proj}-build

    GIT_REPOSITORY "${git_protocol}://github.com/hjmjohnson/OpenCV.git"
    GIT_TAG ${OPENCV_GIT_TAG}
    CMAKE_ARGS
    --no-warn-unused-cli
      ${CMAKE_OSX_EXTERNAL_PROJECT_ARGS}
      ${COMMON_EXTERNAL_PROJECT_ARGS}
      -DBUILD_EXAMPLES:BOOL=OFF
      -DBUILD_TESTING:BOOL=OFF
      -DBUILD_NEW_PYTHON_SUPPORT:BOOL=OFF
      -DBUILD_TESTS:BOOL=OFF
      -DWITH_FFMPEG:BOOL=OFF
      -DWITH_JASPER:BOOL=OFF
      -DWITH_OPENEXR:BOOL=OFF
      -DWITH_PVAPI:BOOL=OFF
      -DWITH_JPEG:BOOL=OFF
      -DWITH_TIFF:BOOL=OFF
      -DWITH_PNG:BOOL=OFF
## The following might cause build issues, here for testing
      -DENABLE_SSE:BOOL=ON
      -DENABLE_SSE2:BOOL=ON
      -DENABLE_SSE3:BOOL=ON
      -DENABLE_SSE41:BOOL=ON
      -DENABLE_SSE42:BOOL=ON
      -DENABLE_SSSE3:BOOL=ON
      -DBUILD_SHARED_LIBS:BOOL=OFF
      -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_BINARY_DIR}/${proj}-install
    UPDATE_COMMAND ""
    )
  set(OpenCV_DIR ${CMAKE_BINARY_DIR}/${proj}-install/share/OpenCV/)
endif(NOT DEFINED OpenCV_DIR)
