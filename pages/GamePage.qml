import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.VectorImage
import QtQuick.Effects

import "../components"
import "../config" as Config

Rectangle {
    id: gamePage
    anchors.fill: parent
    color: "transparent"

    property real hScaleFactor: 1
    property real vScaleFactor: 1
    property int initialWidth: 854
    property int initialHeight: 480
    property int currentWidth: mainWindow.width
    property int currentHeight: mainWindow.height

    signal topBarToggle(real opacity)
    onTopBarToggle: function(opacity) { console.log(opacity); topBar.opacity = opacity }
    Component.onCompleted: { gamePage.topBarToggle(0) }
    Component.onDestruction: { gamePage.topBarToggle(1) }
    
    onCurrentWidthChanged: {
        hScaleFactor = currentWidth / initialWidth
    }

    onCurrentHeightChanged: {
        vScaleFactor = currentHeight / initialHeight
    }

    Image {
        id: gameBackground
        source: "../resources/gameBackground.svg"
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
    }

    Image {
        id: gameTable
        anchors.centerIn: parent
        source: parent.width > 1920 ? "../resources/gameTableUHD.png" : "../resources/gameTableHD.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width / 3 * 2
    }

    RowLayout {
        width: gamePage.width / 12 * 8
        x: gamePage.width / 12 * 2
        y: gamePage.height / 12

            GamePlayerBox {
                id: player5
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 112 * gamePage.hScaleFactor
                Layout.preferredHeight: 78 * gamePage.vScaleFactor
                up: true
            }

            GamePlayerBox {
                id: player6
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 112 * gamePage.hScaleFactor
                Layout.preferredHeight: 78 * gamePage.vScaleFactor
                up: true
            }

            GamePlayerBox {
                id: player7
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: 112 * gamePage.hScaleFactor
                Layout.preferredHeight: 78 * gamePage.vScaleFactor
                up: true
            }


    }

    RowLayout {
        width: parent.width / 24 * 20
        x: parent.width / 24 * 2
        y: parent.height / 24 * 6

        GamePlayerBox {
            id: player4
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: true
        }

        GamePlayerBox {
            id: player8
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: true
        }
    }

    RowLayout {
        width: parent.width / 24 * 20
        x: parent.width / 24 * 2
        y: parent.height / 24 * 17 - 48

        GamePlayerBox {
            id: player3
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: false
        }

        GamePlayerBox {
            id: player9
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: false
        }
    }

    RowLayout {
        width: parent.width / 12 * 6
        x: parent.width / 24 * 6
        y: parent.height / 24 * 21 - 64

        GamePlayerBox {
            id: player10
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: false
        }

        GamePlayerSelfBox {
            id: player1
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 140 * gamePage.hScaleFactor
            Layout.preferredHeight: 104 * gamePage.vScaleFactor
            up: false
        }

        GamePlayerBox {
            id: player2
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.vScaleFactor
            up: false
        }
    }

    RowLayout {
        id: gameDataBox
        width: gamePage.width / 12 * 4
        x: gamePage.width / 24 * 8
        y: gamePage.height / 12 * 4 + 8
        
        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            Layout.margins: 0
            spacing: 0
            Text {
                id: gamePot
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 12 * gamePage.vScaleFactor
                text: qsTr("Pot")
            }

            Text {
                id: gamePotTotal
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 10 * gamePage.vScaleFactor
                text: qsTr("Total: $0")
            }

            Text {
                id: gamePotBets
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 10 * gamePage.vScaleFactor
                text: qsTr("Bets: $90")
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.horizontalStretchFactor: 2
            color: "transparent"
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
            spacing: 0
            Text {
                id: gamePreflop
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 12 * gamePage.vScaleFactor
                text: qsTr("Preflop")
            }


            Text {
                id: gamePreflopGame
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 10 * gamePage.vScaleFactor
                text: qsTr("Game: 1")
            }

            Text {
                id: gamePreflopHand
                Layout.preferredWidth: parent.width
                horizontalAlignment: Text.AlignHCenter
                color: Config.Settings.palette.secondary.col200
                font.bold: true
                font.pointSize: 10 * gamePage.vScaleFactor
                text: qsTr("Hand: 1")
            }
        }
    }

    RowLayout{
        id: cardHolderBox
        width: gamePage.width / 12 * 4
        x: gamePage.width / 24 * 8
        anchors.top: gameDataBox.bottom

        Rectangle {
            Layout.topMargin: 6 * gamePage.hScaleFactor
            Layout.preferredWidth: 52 * gamePage.hScaleFactor
            Layout.preferredHeight: 72 * gamePage.hScaleFactor
            color: "transparent"
            border.width: 2
            border.color: Config.Settings.palette.secondary.col200
            radius: 8

            Rectangle {
                anchors.fill: parent
                color: Config.Settings.palette.secondary.col300
                opacity: 0.4
            }

            VectorImage {
                id: tableCard1
                x: -2 * gamePage.hScaleFactor
                y: 0
                width: (52 + 4) * gamePage.hScaleFactor
                height: (72) * gamePage.hScaleFactor
                fillMode: IconImage.Stretch
                source: "../resources/cardBackground.svg"
            }
        }

        Rectangle {
            Layout.topMargin: 6 * gamePage.hScaleFactor
            Layout.preferredWidth: 52 * gamePage.hScaleFactor
            Layout.preferredHeight: 72 * gamePage.hScaleFactor
            Layout.fillHeight: true
            color: "transparent"
            border.width: 2
            border.color: Config.Settings.palette.secondary.col200
            radius: 8

            Rectangle {
                anchors.fill: parent
                color: Config.Settings.palette.secondary.col300
                opacity: 0.4
            }

            VectorImage {
                id: tableCard2
                x: -2 * gamePage.hScaleFactor
                y: 0
                width: (52 + 4) * gamePage.hScaleFactor
                height: 72 * gamePage.hScaleFactor
                fillMode: IconImage.Stretch
                source: "../resources/cardBackground.svg"
            }
        }

        Rectangle {
            Layout.topMargin: 6 * gamePage.hScaleFactor
            Layout.preferredWidth: 52 * gamePage.hScaleFactor
            Layout.preferredHeight: 72 * gamePage.hScaleFactor
            Layout.fillHeight: true
            color: "transparent"
            border.width: 2
            border.color: Config.Settings.palette.secondary.col200
            radius: 8

            Rectangle {
                anchors.fill: parent
                color: Config.Settings.palette.secondary.col300
                opacity: 0.4
            }

            VectorImage {
                id: tableCard3
                x: -2 * gamePage.hScaleFactor
                y: 0
                width: (52 + 4) * gamePage.hScaleFactor
                height: 72 * gamePage.hScaleFactor
                fillMode: IconImage.Stretch
                source: "../resources/cardBackground.svg"
            }
        }

        Rectangle {
            Layout.topMargin: 6 * gamePage.hScaleFactor
            Layout.preferredWidth: 52 * gamePage.hScaleFactor
            Layout.preferredHeight: 72 * gamePage.hScaleFactor
            Layout.fillHeight: true
            color: "transparent"
            border.width: 2
            border.color: Config.Settings.palette.secondary.col200
            radius: 8

            Rectangle {
                anchors.fill: parent
                color: Config.Settings.palette.secondary.col300
                opacity: 0.4
            }

            VectorImage {
                id: tableCard4
                visible: false
                x: -2 * gamePage.hScaleFactor
                y: 0
                width: (52 + 4) * gamePage.hScaleFactor
                height: 72 * gamePage.hScaleFactor
                fillMode: IconImage.Stretch
                source: "../resources/cardBackground.svg"
            }
        }

        Rectangle {
            Layout.topMargin: 6 * gamePage.hScaleFactor
            Layout.preferredWidth: 52 * gamePage.hScaleFactor
            Layout.preferredHeight: 72 * gamePage.hScaleFactor
            Layout.fillHeight: true
            color: "transparent"
            border.width: 2
            border.color: Config.Settings.palette.secondary.col200
            radius: 8

            Rectangle {
                anchors.fill: parent
                color: Config.Settings.palette.secondary.col300
                opacity: 0.4
            }

            VectorImage {
                id: tableCard5
                visible: false
                x: -2 * gamePage.hScaleFactor
                y: 0
                width: (52 + 4) * gamePage.hScaleFactor
                height: 72 * gamePage.hScaleFactor
                fillMode: IconImage.Stretch
                source: "../resources/cardBackground.svg"
            }
        }
    }
}
