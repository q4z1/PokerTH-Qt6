import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.VectorImage

import "../config" as Config

Rectangle {
    id: root

    property string yellow: "#E3C800"
    property bool up: false

    color: "transparent"
    Layout.minimumWidth: 140
    Layout.maximumWidth: 196
    Layout.minimumHeight: 104
    Layout.maximumHeight: 132

    Rectangle {
        anchors.fill: parent
        color: Config.Settings.palette.secondary.col600
        opacity: 0.8
        radius: 5
    }

    Row {
        id: topRow
        width: parent.width - 6
        height: parent.height / 2 - 6
        x: 6
        y: 6
        Rectangle {
            id: avatarRow
            width: parent.width / 12 * 5.1
            height: parent.width / 12 * 5.1

            Rectangle {
                anchors.fill: parent
                border.width: 1
                border.color: Config.Settings.palette.secondary.col200
                color: Config.Settings.palette.secondary.col600
                opacity: 0.5
            }

            VectorImage {
                id: avatar
                width: parent.width
                fillMode: VectorImage.PreserveAspectFit
                source: "../resources/pokerth.svg"
            }
        }


        Row {
            id: cardsRow
            width: parent.width / 12 * 4
            Rectangle {
                id: card1Item
                x: avatarRow.width + 12
                rotation: -6
                width: parent.width - 2
                y: 0
                VectorImage {
                    id: card1
                    width: parent.width
                    fillMode: VectorImage.PreserveAspectFit
                    source: "../resources/cardBackground.svg"
                }

                MultiEffect {
                    source: card1
                    anchors.fill: card1
                    shadowEnabled: true
                    shadowOpacity: 1
                    shadowVerticalOffset: 1
                    shadowHorizontalOffset: -1
                    shadowBlur: 1
                    autoPaddingEnabled: true
                }
            }

            Rectangle {
                id: card2Item
                x: avatarRow.width + card1.width / 3 * 2
                width: parent.width - 2
                rotation: 6
                color: "transparent"
                y: 1
                VectorImage {
                    id: card2
                    fillMode: VectorImage.PreserveAspectFit
                    width: parent.width
                    source: "../resources/cardBackground.svg"
                }

                MultiEffect {
                    source: card2
                    anchors.fill: card2
                    shadowEnabled: true
                    shadowOpacity: 0.5
                    shadowVerticalOffset: 1
                    shadowHorizontalOffset: -1
                    shadowBlur: 1
                    autoPaddingEnabled: true
                }
            }
        }
    }

    Row {
        id: playerNameRow
        width: parent.width - 8
        height: parent.height / 2 -8
        x: 6
        y: parent.height - 26
        Text {
            id: playerName
            width: parent.width / 2
            horizontalAlignment: Text.AlignLeft
            color: Config.Settings.palette.secondary.col100
            font.bold: true
            font.pointSize: 13
            Component.onCompleted: {
                text = "Player"
            }
        }
        Text {
            id: playerStack
            width: parent.width / 2
            horizontalAlignment: Text.AlignRight
            rightPadding: 6
            color: root.yellow
            font.bold: true
            font.pointSize: 13
            Component.onCompleted: {
                text = "$10000"
            }
        }
    }

    RowLayout {
        width: parent.width
        height: parent.height / 2
    }
}
