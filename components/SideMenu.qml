import QtQuick
import QtQuick.VectorImage
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import "../config" as Config

Drawer {
    id: sideMenu
    width: mainWindow.portraitMode ? mainWindow.width : mainWindow.width / 3
    height: mainWindow.height - 38
    y: 38

    background: Rectangle {
        anchors.fill: parent
        color: Config.Settings.palette.secondary.col700
        opacity: 0.8
        border.width: 0
    }

    ColumnLayout {
        anchors.fill: parent

        VectorImage{
            source: "../resources/pokerth.svg"
            Layout.preferredWidth: 96
            Layout.preferredHeight: 96
            Layout.topMargin: 24
            Layout.alignment: Qt.AlignCenter
        }

        Label {
            id: sideMenuLabel
            color: Config.Settings.palette.secondary.col200
            text: qsTr("PokerTH - v2.0 alpha")
            font.family: Config.Settings.loadedFont.font.family
            Layout.alignment: Qt.AlignCenter
            Layout.bottomMargin: 24
            font.pointSize: 16
            font.bold: true
        }

        ListView {
            id: sideMenuList
            model: sideMenuListItems
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.verticalStretchFactor: -1



            delegate: Rectangle {
                id: sideMenuListItem

                property alias labelText: label.text
                property alias iconSource: iconImage.source
                property alias iconWidth: iconImage.width
                property alias iconHeight: iconImage.height
                signal clicked

                labelText: name
                iconSource: "../resources/" + icon + ".svg"

                color: Config.Settings.palette.secondary.col500
                width: parent.width
                height: 36

                RowLayout {
                    anchors.fill: parent
                    spacing: 6

                    VectorImage{
                        id: iconImage
                        Layout.leftMargin: 16
                        Layout.topMargin: 4
                        Layout.bottomMargin: 4
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredHeight: 24
                        Layout.preferredWidth: 24

                        MultiEffect {
                          id: iconImageCol
                          source: iconImage
                          anchors.fill: iconImage
                          colorization: 1.0 // opacity equivalent
                          colorizationColor: Config.Settings.palette.secondary.col200
                        }
                    }

                    Text {
                        id: label
                        Layout.alignment: Qt.AlignLeft
                        Layout.fillWidth: true
                        Layout.topMargin: 4
                        Layout.bottomMargin: 4
                        color: Config.Settings.palette.secondary.col200
                        font.family: Config.Settings.loadedFont.font.family
                        font.pointSize: 12
                        text: "StartSideMenuItem"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        sideMenu.visible = false
                        if(source === "quit") Qt.quit()
                        else mainStackView.push("../pages/" + source + "Page.qml")
                    }

                    onEntered: {
                        iconImageCol.colorizationColor = Config.Settings.palette.secondary.col100
                        label.color = Config.Settings.palette.secondary.col100
                        sideMenuListItem.color = Config.Settings.palette.secondary.col400
                    }

                    onExited: {
                        label.color = Config.Settings.palette.secondary.col200
                        iconImageCol.colorizationColor = label.color = Config.Settings.palette.secondary.col200
                        sideMenuListItem.color = Config.Settings.palette.secondary.col500
                    }
                }
            }
        }
    }

    ListModel {
        id: sideMenuListItems
        ListElement {
            name: qsTr("Internetspiel")
            icon: "globe"
            source: "InternetGame"
        }
        ListElement {
            name: qsTr("Lokales Spiel starten")
            icon: "spade"
            source: "LocalGame"
        }
        ListElement {
            name: qsTr("Netzwerkspiel erstellen")
            icon: "network"
            source: "NetworkGameCreate"
        }
        ListElement {
            name: qsTr("Netzwerkspiel beitreten")
            icon: "plugsConnected"
            source: "NetworkGameEnter"
        }
        ListElement {
            name: qsTr("Einstellungen")
            icon: "settings"
            source: "Settings"
        }
        ListElement {
            name: qsTr("Über PokerTH")
            icon: "user"
            source: "About"
        }
        ListElement {
            name: qsTr("Schließen")
            icon: "power"
            source: "quit"
        }
    }
}
