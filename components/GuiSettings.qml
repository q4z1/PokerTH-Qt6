import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts

import "../config" as Config
import "../components"

Rectangle {
    id: guiSettings
    //Layout.preferredWidth: parent.width - 8
    //Layout.preferredHeight: parent.height - 8
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    color: "transparent"

    ColumnLayout {
        id: guiSettingsContent
        anchors.fill: parent

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 8
            Layout.bottomMargin: 0
            Layout.leftMargin: 12
            Layout.rightMargin: 12
            Layout.fillHeight: false
            horizontalAlignment: Text.AlignLeft
            text: qsTr("Benutzeroberfläche")
            font.bold: true
            font.pointSize: 12
            color: Config.StaticData.palette.secondary.col200
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            Layout.fillHeight: false
            Layout.topMargin: 0
            Layout.bottomMargin: 4
            Layout.leftMargin: 12
            Layout.rightMargin: 12
            Layout.alignment: Qt.AlignTop
            color: Config.StaticData.palette.secondary.col500
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 4
            Layout.bottomMargin: 4
            Layout.leftMargin: 12
            Layout.rightMargin: 12

            CustomTabBar {
                id: guiSettingsTabBar
                model: [qsTr("Gemeinsam"), qsTr("Netzwerk-/Internetspiel")]
            }

            StackLayout {
                width: parent.width
                currentIndex: guiSettingsTabBar.currentIndex

                ColumnLayout {
                    id: generalTab

                    RowLayout {
                        id: language
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        Layout.topMargin: 16

                        Label {
                            Layout.preferredHeight: 24
                            Layout.fillHeight: false
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr("Sprache:")
                            color: Config.StaticData.palette.secondary.col200
                            font.pointSize: 12
                        }

                        CustomComboBox {
                            id: languageSelector
                            model: Config.StaticData.languages
                        }
                    }

                    CustomCheckBox {
                        objectName: "displayRightToolboxCheckbox"
                        label: qsTr("Rechte Toolbox anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "displayLeftToolboxCheckbox"
                        label: qsTr("Linke Toolbox anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "fadeOutLosingCardsAnimationCheckbox"
                        label: qsTr("Ausblend-Abination für Verliererkarten")
                    }

                    CustomCheckBox {
                        objectName: "animatedCardsCheckbox"
                        label: qsTr("Animierte Karten")
                    }

                    CustomCheckBox {
                        objectName: "reverseFKeysOrderCheckbox"
                        label: qsTr("F-Tasten-Reihenfolge umkehren (F1 - F4)")
                        defaultValue: false
                    }

                    CustomCheckBox {
                        objectName: "showBlindButtonsCheckbox"
                        label: qsTr("Symbole für Small Blind und Big Blind anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "showHandChanceMonitorCheckbox"
                        label: qsTr("Kartenchancenmonitor anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "showOwnCardsOnMouseClickCheckbox"
                        label: qsTr("Eigene Karten nur bei Mausklick anzeigen anzeigen")
                        defaultValue: false
                    }

                    CustomCheckBox {
                        objectName: "disableSplashScreenOnStartupCheckbox"
                        label: qsTr("Startbildschirm beim Startvorgang deaktivieren")
                        defaultValue: false
                    }

                    CustomCheckBox {
                        objectName: "doNotTranslatePokerTermsCheckbox"
                        label: qsTr("Pokerausdrücke - wie Check, Call und Raise - beim Spieltisch-Stil nicht übersetzen")
                    }
                }

                ColumnLayout {
                    id: networkTab

                    CustomCheckBox {
                        objectName: "showCountryFlagOnAvatarCheckbox"
                        label: qsTr("Landesflagge in der Ecke des Avatars anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "showNetworkStatusColorOnAvatarCheckbox"
                        label: qsTr("Netzwerkstatus-Farbe in der Ecke des Avatars anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "focusBetInputOnTurnCheckbox"
                        label: qsTr("Cursor ins \"Biete\"-Eingabefeld setzen, wenn Sie an der Reihe sind")
                        defaultValue: false
                    }

                    CustomCheckBox {
                        objectName: "preventAccidentalCallAfterBigRaiseCheckbox"
                        label: qsTr("Versehentliches Call nach einem großen Raise verhindern")
                    }

                    CustomCheckBox {
                        objectName: "doNotHideIgnoredPlayerAvatarsCheckbox"
                        label: qsTr("Avatare von ignorierten Spielern nicht verbergen")
                        defaultValue: false
                    }

                    CustomCheckBox {
                        objectName: "showLobbyChatCheckbox"
                        label: qsTr("Lobby-Chat anzeigen")
                    }

                    CustomCheckBox {
                        objectName: "disableEmoticonsInChatCheckbox"
                        label: qsTr("Emoticons im Chat deaktivieren")
                        defaultValue: false
                    }
                }
            }

        }
    }
}
