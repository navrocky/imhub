import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import "../controls" as UI
import "../controls/tools.js" as Tools
import "../controls/style.js" as Style

Item {

    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 2
        rowSpacing: 0
        columnSpacing: 0

        ToolBar {
            Layout.row: 0
            Layout.columnSpan: 2
            Layout.fillWidth: true
            z: 2
            RowLayout {
                ToolButton {
                    text: "Back"
                }
                UI.ExtLabel {
                    text: "Settings"
                    font.bold: true
                    font.pointSize: Style.HEADER_MEDIUM_POINT_SIZE
                }
            }
        }

        Pane {
            Material.elevation: 6
            Layout.column: 0
            Layout.row: 1
            Layout.fillHeight: true
            implicitWidth: listView.implicitWidth
            padding: 0
            z: 1

            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.OutQuad
                }
            }

            Rectangle {
                anchors.fill: parent
                color: Material.color(Material.Grey, Material.Shade800)
                ListView {
                    id: listView
                    clip: true
                    focus: true
                    anchors.fill: parent
                    model: [
                        qsTr("Add service"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Available services  sd asd as das das da sd asd asd as"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service"),
                        qsTr("Add service")
                    ]
                    implicitWidth: Math.max(200, Tools.getMaxItemsImplicitWidth(listView.contentItem.children))

                    Layout.fillHeight: true
                    delegate: ItemDelegate {
                        text: modelData
                        width: parent.width
                        highlighted: ListView.isCurrentItem
                        onClicked: {
                            listView.currentIndex = index
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator {}
                }
            }
        }

        UI.OptionsLandingPage {
            Rectangle {
                color: "green"
                height: 200
            }
            Rectangle {
                color: "yellow"
                height: 400
            }
            Rectangle {
                color: "red"
                height: 300
            }
        }


//        StackLayout {
//            id: swipeView
//            Layout.column: 1
//            Layout.row: 1
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            clip: true
//            currentIndex: listView.currentIndex
//            AvailableServicesPage {

//            }
//            Rectangle {
//                color: "green"
//            }
//        }
    }
}
