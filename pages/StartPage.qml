import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: startPage
    width: mainWindow.width
    height: mainWindow.height
    color: "transparent"

    Image {
        id: preLoaderBackground
        anchors.fill: parent
        source: "../resources/startWindowBackground.png"
        fillMode: Image.PreserveAspectCrop
    }

    ColumnLayout {
        id: startPageRows
        anchors.fill: parent

        ColumnLayout {
            id: startPageContentLayout
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id: startPageMainButtonsBox
                Layout.preferredWidth: 287
                Layout.preferredHeight: 300
                color: "transparent"

                Rectangle {
                    anchors.fill: parent
                    color: Config.Settings.palette.secondary.col700
                    opacity: 0.8
                    radius: 5
                }

                ColumnLayout {
                    id: startPageMainButtons
                    anchors.centerIn: parent
                    spacing: 18

                    StartPageButton {
                        text: qsTr("Internetspiel")
                        onClicked: {
                            mainStackView.push("InternetGamePage.qml")
                        }
                    }

                    StartPageButton {
                        text: qsTr("Lokales Spiel starten")
                        onClicked: {
                            mainStackView.push("LocalGamePage.qml")
                        }
                    }

                    StartPageButton {
                        text: qsTr("Netzwerkspiel erstellen")
                        onClicked: {
                            mainStackView.push("NetworkGameCreatePage.qml")
                        }
                    }

                    StartPageButton {
                        text: qsTr("Netzwerkspiel beitreten")
                        onClicked: {
                            mainStackView.push("NetworkGameEnterPage.qml")
                        }
                    }

                    StartPageButton {
                        text: qsTr("Logs")
                        onClicked: {
                            mainStackView.push("LogsPage.qml")
                        }
                    }
                }
            }
        }
    }
}
