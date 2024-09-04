import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components"
import "../config" as Config

Rectangle {
    id: gamePage
    anchors.fill: parent
    color: "transparent"

    property real hScaleFactor: 1
    property real vScaleFacor: 1
    property int initialWidth: 854
    property int initialHeight: 480
    property int currentWidth: mainWindow.width
    property int currentHeight: mainWindow.height

    onCurrentWidthChanged: {
        hScaleFactor = currentWidth / initialWidth
    }

    onCurrentHeightChanged: {
        vScaleFacor = currentHeight / initialHeight
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
        width: parent.width / 12 * 6
        x: parent.width / 24 * 6
        y: parent.height / 24 * 3

        GamePlayerBox {
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }
    }

    RowLayout {
        width: parent.width / 24 * 20
        x: parent.width / 24 * 2
        y: parent.height / 24 * 7

        GamePlayerBox {
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }
    }

    RowLayout {
        width: parent.width / 24 * 20
        x: parent.width / 24 * 2
        y: parent.height / 24 * 17 - 64

        GamePlayerBox {
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }
    }

    RowLayout {
        width: parent.width / 12 * 6
        x: parent.width / 24 * 6
        y: parent.height / 24 * 21 - 64

        GamePlayerBox {
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }

        GamePlayerBox {
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 112 * gamePage.hScaleFactor
            Layout.preferredHeight: 78 * gamePage.hScaleFactor
        }
    }

}
