import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: settingsPage
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: Config.Settings.palette.secondary.col700

    ColumnLayout {
        id: settingsPageRows
        anchors.fill: parent

        Rectangle {
            id: settingsPageContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 16
            color: Config.Settings.palette.secondary.col700

            Label {
                id: settingsPageLabel
                color: Config.Settings.palette.secondary.col200
                text: qsTr("Einstellungen")
                font.pointSize: 14
                font.bold: true
            }
        }
    }
}