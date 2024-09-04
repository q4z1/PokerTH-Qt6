import QtQuick

import "../config" as Config

Rectangle {
    id: root

    property alias text: label.text
    signal clicked

    width: 196
    height: 32
    color: Config.Settings.palette.secondary.col700
    border.color: Config.Settings.palette.secondary.col200
    
    Text {
        id: label
        anchors.centerIn: parent
        color: Config.Settings.palette.secondary.col200
        font.family: Config.Settings.loadedFont.font.family
        text: "Button Text"

    }

    MouseArea {
        id: area
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            root.clicked()
        }

        onEntered: {
            parent.color = Config.Settings.palette.secondary.col600
            parent.border.color = Config.Settings.palette.secondary.col100
            label.color = Config.Settings.palette.secondary.col100
        }

        onExited: {
            parent.color = Config.Settings.palette.secondary.col700
            parent.border.color = Config.Settings.palette.secondary.col200
            label.color = Config.Settings.palette.secondary.col200
        }
    }
}