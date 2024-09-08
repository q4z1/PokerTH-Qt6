import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config

Rectangle {
    id: checkBox

    property bool isChecked: true
    property alias label: checkBoxLabel.text

    Layout.fillWidth: true
    Layout.fillHeight: false
    Layout.preferredHeight: 24
    Layout.topMargin: 8
    color: "transparent"

    RowLayout {
        spacing: 8
        IconImage {
            color: Config.Settings.palette.secondary.col200
            source: checkBox.isChecked ? "../resources/checkSquare.svg" : "../resources/square.svg"
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
        }

        Label {
            id: checkBoxLabel
            color: Config.Settings.palette.secondary.col200
            text: qsTr("CheckBox LabelText")
            font.pointSize: 12
        }
    }


    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            checkBox.isChecked = !checkBox.isChecked
        }
    }
}