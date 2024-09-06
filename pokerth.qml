pragma ComponentBehavior: Bound

import QtCore
import QtQuick 6.5
import QtQuick.Controls
import QtQuick.Layouts

import "config" as Config
import "pages"
import "components"

ApplicationWindow {

    readonly property bool portraitMode: mainWindow.width < mainWindow.height

    property StartPage startPage: StartPage { }
    property SideMenu sideMenu: SideMenu {}

    id: mainWindow
    width: 854
    height: 480
    visible: true
    title: qsTr("PokerTH - v2.0 alpha")

    Rectangle {
        anchors.fill: parent
        color: Config.Settings.palette.secondary.col700
    }

    ColumnLayout{
        id: mainLayout
        anchors.fill: parent
        Layout.alignment: Qt.AlignTop
        spacing: 0

        Rectangle {
            id: topBar
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 38
            Layout.alignment: Qt.AlignTop
            color: Config.Settings.palette.secondary.col700

            RowLayout {
                id: topBarColumns
                anchors.fill: parent
                spacing: 8

                IconImage {
                    id: topBarMenuIcon
                    Layout.preferredWidth: 26
                    Layout.preferredHeight: 26
                    Layout.margins: 6
                    source: "resources/threeLines.svg"
                    color: Config.Settings.palette.secondary.col200

                    MouseArea {
                        id: menuArea
                        anchors.fill: topBarMenuIcon
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            if(mainStackView.depth > 1) mainStackView.pop()
                            else {
                                topBarMenuIcon.source = !sideMenu.visible ? "resources/caretLeft.svg" : "resources/threeLines.svg"
                                sideMenu.visible = !sideMenu.visible
                            }
                        }

                        onEntered: {
                            topBarMenuIcon.color = Config.Settings.palette.secondary.col100
                        }

                        onExited: {
                            topBarMenuIcon.color = Config.Settings.palette.secondary.col200
                        }
                    }
                }

                Item {
                    id: topBarMenuSpace
                    Layout.fillWidth: true
                    Layout.horizontalStretchFactor: 2
                }

                IconImage {
                    id: topBarSettingsIcon
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                    Layout.margins: 6
                    source: "resources/settings.svg"
                    color: Config.Settings.palette.secondary.col200
                    visible: true


                    MouseArea {
                        id: settingsArea
                        anchors.fill: topBarSettingsIcon
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            mainStackView.push("pages/SettingsPage.qml")
                            sideMenu.visible = false
                        }

                        onEntered: {
                            topBarSettingsIcon.color = Config.Settings.palette.secondary.col100
                        }

                        onExited: {
                            topBarSettingsIcon.color = Config.Settings.palette.secondary.col200
                        }
                    }
                }
            }
        }

        StackView {
            id: mainStackView
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            initialItem: PreLoader {}

            replaceEnter: Transition {
                YAnimator {
                    from: (mainStackView.mirrored ? -1 : 1) * -mainStackView.height
                    to: 0
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }

            replaceExit: Transition {
                YAnimator {
                    from: 0
                    to: (mainStackView.mirrored ? -1 : 1) * mainStackView.height
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }

            onDepthChanged: {
                if(mainStackView.depth > 1) {
                  topBarSettingsIcon.visible = false  
                  topBarMenuIcon.source = "resources/caretLeft.svg"
                }
                else { 
                  topBarSettingsIcon.visible = true  
                  topBarMenuIcon.source = sideMenu.visible ? "resources/caretLeft.svg" : "resources/threeLines.svg"
                }
            }
        }
    }

    SideMenu {}

    Connections {
        target: mainStackView
        Component.onDestruction: topBarMenuIcon.source = mainStackView.depth === 1 ? "resources/threeLines.svg" : "resources/caretLeft.svg"
    }
}
