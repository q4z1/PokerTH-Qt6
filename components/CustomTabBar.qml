import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config

TabBar {
    id: customTabBar

    property alias model: tabButtons.model

    Layout.fillWidth: true
    padding: 0
    currentIndex: 0

    background: Rectangle {
        color: Config.Settings.palette.secondary.col600
    }

    Repeater{
        id: tabButtons

        TabButton {
            id: tabButton

            property bool isHovered: false

            height: 24
            padding: 0
            contentItem: Text {
                text: modelData
                color: customTabBar.currentIndex === index || tabButton.isHovered ? Config.Settings.palette.secondary.col100 : Config.Settings.palette.secondary.col200
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: customTabBar.currentIndex === index || tabButton.isHovered ? Config.Settings.palette.secondary.col500 : Config.Settings.palette.secondary.col600
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: customTabBar.currentIndex === index && tabButton.isHovered ? Qt.ArrowCursor : Qt.PointingHandCursor

                onClicked: {
                    customTabBar.currentIndex = index
                }

                onEntered: {
                    tabButton.isHovered = true
                }

                onExited: {
                    tabButton.isHovered = false
                }
            }
        }
    }


}