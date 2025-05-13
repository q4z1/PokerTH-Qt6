cmake_minimum_required(VERSION 3.16)
project(pokerth_qt6 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Gui
    Quick
    QuickControls2
    LinguistTools
)

set(SRC_FILES
    pokerth.cpp
)

set(QML_FILES
    pokerth.qml
    components/CustomCheckBox.qml
    components/CustomComboBox.qml
    components/CustomTabBar.qml
    components/CustomToggle.qml
    components/GamePlayerBox.qml
    components/GamePlayerSelfBox.qml
    components/GuiSettings.qml
    components/InternetGameSettings.qml
    components/LocalGameSettings.qml
    components/LogsSettings.qml
    components/NetworkGameSettings.qml
    components/NicknameAvatarSettings.qml
    components/ResetSettings.qml
    components/SideMenu.qml
    components/SoundSettings.qml
    components/CustomButton.qml
    components/StyleSettings.qml
    pages/AboutPage.qml
    pages/GamePage.qml
    pages/InternetGamePage.qml
    pages/LocalGamePage.qml
    pages/LogsPage.qml
    pages/NetworkGameCreatePage.qml
    pages/NetworkGameEnterPage.qml
    pages/PreLoader.qml
    pages/SettingsPage.qml
    pages/StartPage.qml
    config/Settings.qml
)

set(TS_FILES
    ${CMAKE_SOURCE_DIR}/i18n/pokerth_de_DE.ts
    ${CMAKE_SOURCE_DIR}/i18n/pokerth_fr_FR.ts
    ${CMAKE_SOURCE_DIR}/i18n/pokerth_en_US.ts
)

qt_add_translations(pokerth
    TS_FILES        ${TS_FILES}
    SOURCES         ${SRC_FILES} ${QML_FILES}
    RESOURCE_PREFIX "/i18n"
)

qt_add_executable(pokerth
    WIN32
    MACOSX_BUNDLE
    ${SRC_FILES}
)

qt_add_qml_module(pokerth
    URI pokerth_qt6
    VERSION 1.0
    NO_RESOURCE_TARGET_PATH

    QML_FILES
        ${QML_FILES}
    RESOURCES
        "config/qmldir"
        "resources/arrowUpLeft.svg"
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
        "resources/monitor.svg"
        "resources/network.svg"
        "resources/palette.svg"
        "resources/plugsConnected.svg"
        "resources/pokerth.svg"
        "resources/power.svg"
        "resources/Rubik-VariableFont_wght.ttf"
        "resources/Rubik-Italic-VariableFont_wght.ttf"
        "resources/settings.svg"
        "resources/spade.svg"
        "resources/speaker.svg"
        "resources/square.svg"
        "resources/startWindowBackground.png"
        "resources/terminal.svg"
        "resources/terminalWindow.svg"
        "resources/threeLines.svg"
        "resources/toggleLeft.svg"
        "resources/toggleRight.svg"
        "resources/user.svg"
        "resources/userSquare.svg"
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
    target_link_libraries(pokerth PRIVATE Qt6::QuickTemplates2)
endif()

install(TARGETS pokerth
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

#qt_generate_deploy_qml_app_script(
#    TARGET pokerth
#    OUTPUT_SCRIPT deploy_script
#    MACOS_BUNDLE_POST_BUILD
#    NO_UNSUPPORTED_PLATFORM_ERROR
#    DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
#)
#install(SCRIPT ${deploy_script})
