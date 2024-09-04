import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

import "../config" as Config

Rectangle {
    id: root

    property string yellow: "#E3C800"

    color: "transparent"
    Layout.minimumWidth: 112
    Layout.maximumWidth: 168
    Layout.minimumHeight: 76
    Layout.maximumHeight: 104

    Rectangle {
        anchors.fill: parent
        color: Config.Settings.palette.secondary.col600
        opacity: 0.8
        radius: 5
    }

    // RowLayout {
    //     width: parent.width
    //     height: parent.height / 2

    //     Image {
    //         id: avatar
    //         Layout.preferredWidth: parent.width / 2 - 8
    //         Layout.preferredHeight: parent.width / 2 - 8
    //         Layout.margins: 4
    //         Layout.alignment: Qt.AlignTop
    //         fillMode: Image.PreserveAspectFit
    //         source: "../resources/pokerth.svg"
    //     }

    //     Rectangle {
    //         id: hand
    //         Layout.preferredWidth: parent.width / 2
    //         Layout.preferredHeight: parent.width / 2
    //         Layout.alignment: Qt.AlignLeft
    //         Layout.margins: 8
    //         color: "transparent"

    //         Image {
    //             id: leftHand
    //             x: -16
    //             y: 8
    //             width: parent.width / 3 * 2
    //             // height: parent.height - 16
    //             fillMode: Image.PreserveAspectFit
    //             source: "../resources/cardBackground.svg"
    //             transform: Rotation { origin.x: leftHand.width / 2; origin.y: leftHand.height; angle: -11 }
    //         }
    //         Image {
    //             id: rightHand
    //             x: parent.width / 4 - 16
    //             y: 8
    //             width: parent.width / 3 * 2
    //             // height: parent.height - 16
    //             fillMode: Image.PreserveAspectFit
    //             source: "../resources/cardBackground.svg"
    //             transform: Rotation { origin.x: rightHand.width; origin.y: rightHand.height; angle: 11 }
    //         }
    //     }
    // }

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

            IconImage {
                id: avatar
                width: parent.width
                fillMode: IconImage.PreserveAspectFit
                source: "../resources/pokerth.svg"
            }
        }


        Row {
            id: cardsRow
            width: parent.width / 12 * 5.5
            Rectangle {
                id: card1Item
                x: avatarRow.width + 3
                rotation: -6
                width: parent.width
                y: 0
                IconImage {
                    id: card1
                    width: parent.width - 6
                    fillMode: IconImage.PreserveAspectFit
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
                x: avatarRow.width + card1.width / 2
                width: parent.width - 6
                rotation: 6
                color: "transparent"
                y: 0
                IconImage {
                    id: card2
                    fillMode: IconImage.PreserveAspectFit
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
                text = "sp0ck"
            }
        }
        Text {
            id: playerStack
            width: parent.width / 2
            horizontalAlignment: Text.AlignHCenter
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