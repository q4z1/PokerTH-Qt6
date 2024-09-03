import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: networkGameEnterPagePage
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: Config.Settings.palette.secondary.col700

    ColumnLayout {
        id: networkGameEnterPagePageRows
        anchors.fill: parent

        Rectangle {
            id: networkGameEnterPagePageContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 16
            color: Config.Settings.palette.secondary.col700

            Label {
                id: networkGameEnterPagePageLabel
                color: Config.Settings.palette.secondary.col200
                text: qsTr("Netzwerkspiel beitreten")
                font.pointSize: 14
                font.bold: true
            }
        }
    }
}