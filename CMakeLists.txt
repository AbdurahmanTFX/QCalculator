cmake_minimum_required(VERSION 3.16)
project(MyQt6App VERSION 1.0 LANGUAGES CXX)

# Use C++17 or later
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(QT6_DISABLE_VULKAN ON CACHE BOOL "" FORCE)

# Find Qt6 components
find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Qml QuickControls2)

# Add your executable
# file(GLOB SOURCES "src/*.cpp")
add_executable(${PROJECT_NAME} 
    main.cpp 
)

# Enable Qt features
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

qt6_add_resources(QT_RESOURCES qml.qrc)
target_sources(${PROJECT_NAME} PRIVATE ${QT_RESOURCES})

target_link_libraries(${PROJECT_NAME}
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
)


