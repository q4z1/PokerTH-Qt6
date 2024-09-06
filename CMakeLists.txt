cmake_minimum_required(VERSION 3.16)
project(pokerth_qt6 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick QuickControls2)

qt_add_executable(pokerth WIN32 MACOSX_BUNDLE
    pokerth.cpp
)

set(qml_singletons
    config/Settings.qml
)

qt_add_qml_module(pokerth
    URI pokerth_qt6
    NO_RESOURCE_TARGET_PATH
    QML_FILES
        "pokerth.qml"
        "components/GamePlayerBox.qml"
        "components/GamePlayerSelfBox.qml"
        "components/SideMenu.qml"
        "components/StartPageButton.qml"
        "pages/AboutPage.qml"
        "pages/GamePage.qml"
        "pages/InternetGamePage.qml"
        "pages/LocalGamePage.qml"
        "pages/LogsPage.qml"
        "pages/NetworkGameCreatePage.qml"
        "pages/NetworkGameEnterPage.qml"
        "pages/PreLoader.qml"
        "pages/SettingsPage.qml"
        "pages/StartPage.qml"
        ${qml_singletons}
    RESOURCES
        "config/qmldir"
        "resources/cardBackground.svg"
        "resources/caretLeft.svg"
        "resources/checkSquare.svg"
        "resources/chip.svg"
        "resources/chipStack.svg"
        "resources/close.svg"
        "resources/dotsThree.svg"
        "resources/dotsThreeVertical.svg"
        "resources/download.svg"
        "resources/gameBackground.svg"
        "resources/gameTableHD.png"
        "resources/gameTableUHD.png"
        "resources/globe.svg"
        "resources/hourglass.svg"
        "resources/network.svg"
        "resources/plugsConnected.svg"
        "resources/pokerth.svg"
        "resources/power.svg"
        "resources/Rubik-VariableFont_wght.ttf"
        "resources/Rubik-Italic-VariableFont_wght.ttf"
        "resources/settings.svg"
        "resources/spade.svg"
        "resources/startWindowBackground.png"
        "resources/terminal.svg"
        "resources/threeLines.svg"
        "resources/toggleLeft.svg"
        "resources/toggleRight.svg"
        "resources/user.svg"
        "qmldir"
        "qtquickcontrols2.conf"
)

target_link_libraries(pokerth PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
    Qt6::QuickControls2
)

if(UNIX AND NOT APPLE AND CMAKE_CROSSCOMPILING)
    find_package(Qt6 REQUIRED COMPONENTS QuickTemplates2)

    # Work around QTBUG-86533
    target_link_libraries(galleryexample PRIVATE Qt6::QuickTemplates2)
endif()

install(TARGETS pokerth
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_qml_app_script(
    TARGET pokerth
    OUTPUT_SCRIPT deploy_script
    MACOS_BUNDLE_POST_BUILD
    NO_UNSUPPORTED_PLATFORM_ERROR
    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
