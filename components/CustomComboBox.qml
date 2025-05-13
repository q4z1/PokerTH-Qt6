import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config

ComboBox {
    id: comboBox
    model: Config.Settings.languages
    textRole: "langName"

    Layout.leftMargin: 6
    Layout.preferredHeight: 24
    Layout.preferredWidth: 256

    Component.onCompleted: {
        var currentLangCode = Config.Settings.currentLanguage;
        if (model) {
            for (var i = 0; i < model.length; ++i) {
                if (model[i].code === currentLangCode) {
                    comboBox.currentIndex = i;
                    return
                }
            }
            if (comboBox.currentIndex === -1 && model.length > 0) {
                comboBox.currentIndex = 0;
                console.warn("Language index is out of range, set to 0")
            }
        } else {
            console.warn("Language model is not valid.");
        }
    }

    onActivated: function(index){
        var selectedData = model[index];
        Config.Settings.currentLanguage = model[index].code;
        console.log("Language setting updated to code:", Config.Settings.currentLanguage);
        // TODO: Trigger language change
    }

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
        width: comboBox.width
        height: 24
        background: Rectangle {
            anchors.fill: parent
            color: boxItemMouse.hovered ? Config.Settings.palette.secondary.col400 : Config.Settings.palette.secondary.col600
        }
        contentItem: Text {
            anchors.fill: parent
            text: modelData.langName
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
