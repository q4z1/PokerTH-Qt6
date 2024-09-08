import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config

ComboBox {
    id: comboBox

    Layout.leftMargin: 6
    Layout.preferredHeight: 24
    Layout.preferredWidth: 256

    background: Rectangle {
        border.width: 1
        border.color: hoverArea.hovered ? Config.Settings.palette.secondary.col100 : Config.Settings.palette.secondary.col200
        color: hoverArea.hovered ? Config.Settings.palette.secondary.col500 : Config.Settings.palette.secondary.col700
    }

    HoverHandler {
        id: hoverArea
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }

    delegate: ItemDelegate {
        id: comboBoxItem
        width: 256
        height: 24
        background: Rectangle {
            anchors.fill: parent
            color: boxItemMouse.hovered ? Config.Settings.palette.secondary.col400 : Config.Settings.palette.secondary.col600
        }
        contentItem: Text {
            anchors.fill: parent
            text: languageText
            leftPadding: 12
            rightPadding: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color:  boxItemMouse.hovered ? Config.Settings.palette.secondary.col100 : Config.Settings.palette.secondary.col200
        }

        HoverHandler {
            id: boxItemMouse
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }
}