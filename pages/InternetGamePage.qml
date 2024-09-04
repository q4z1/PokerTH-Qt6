import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: internetGamePage
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: Config.Settings.palette.secondary.col700

    ColumnLayout {
        id: internetGamePageRows
        anchors.fill: parent

        Rectangle {
            id: internetGamePageContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 16
            color: Config.Settings.palette.secondary.col700

            Label {
                id: internetGamePageLabel
                color: Config.Settings.palette.secondary.col200
                text: qsTr("Internetspiel")
                font.family: Config.Settings.loadedFont.font.family
                font.pointSize: 14
                font.bold: true
            }
        }
    }
}