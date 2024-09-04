import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: logsPage
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: Config.Settings.palette.secondary.col700

    ColumnLayout {
        id: logsPageRows
        anchors.fill: parent

        Rectangle {
            id: logsPageContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 16
            color: Config.Settings.palette.secondary.col700

            Label {
                id: logsPageLabel
                color: Config.Settings.palette.secondary.col200
                text: qsTr("Logs")
                font.family: Config.Settings.loadedFont.font.family
                font.pointSize: 14
                font.bold: true
            }
        }
    }
}