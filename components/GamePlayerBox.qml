import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.VectorImage

import "../config" as Config

GridLayout {
    id: root
    columns: 1
    rows: 2
    Layout.maximumHeight: 102
    
    property bool up: false
    property string yellow: "#E3C800"

    RowLayout{
        id: playerActions
        Layout.alignment: root.up ? Qt.AlignBottom : Qt.AlignTop
        Layout.row: root.up ? 1 : 2
        Layout.preferredHeight: 18 * gamePage.vScaleFactor
        Layout.maximumHeight: 26

        RowLayout {
            Layout.alignment: root.up ? Qt.AlignBottom : Qt.AlignTop
            
            VectorImage {
                Layout.maximumWidth: 26
                Layout.preferredWidth: 18 * gamePage.vScaleFactor
                Layout.preferredHeight: 18 * gamePage.vScaleFactor
                Layout.maximumHeight: 26
                source: "../resources/chipStack.svg"
            }

            Text {
                id: playerBet
                horizontalAlignment: Text.AlignLeft
                leftPadding: 4
                bottomPadding: 3
                Layout.preferredHeight: 22
                color: Config.Settings.palette.secondary.col100
                font.bold: true
                Component.onCompleted: {
                    text = "$333"
                }
            }
        }

    }

    Rectangle {
        id: playerBox
        Layout.row: root.up ? 2 : 1

        color: "transparent"
        Layout.minimumWidth: 112
        Layout.maximumWidth: 168
        Layout.minimumHeight: 76
        Layout.maximumHeight: 104
        Layout.preferredHeight: 76

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
            y: parent.height - 22

            Text {
                id: playerName
                width: parent.width / 2
                horizontalAlignment: Text.AlignLeft
                color: Config.Settings.palette.secondary.col100
                font.bold: true
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
}

