import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: localGamePagePage
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: Config.StaticData.palette.secondary.col700

    ColumnLayout {
        id: localGamePagePageRows
        anchors.fill: parent

        Rectangle {
            id: localGamePagePageContent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 16
            color: Config.StaticData.palette.secondary.col700

            Label {
                id: localGamePagePageLabel
                color: Config.StaticData.palette.secondary.col200
                text: qsTr("Lokales Spiel")
                font.family: Config.StaticData.loadedFont.font.family
                font.pointSize: 14
                font.bold: true
            }
        }
    }
}