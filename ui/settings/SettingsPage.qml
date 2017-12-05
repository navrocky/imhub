import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import "../controls" as UI

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
            z: 1
            RowLayout {
                ToolButton {
                    text: "Back"
                }
                UI.ExtLabel {
                    text: "Settings"
                }
            }
        }

        Pane {
            Material.elevation: 6
            Layout.column: 0
            Layout.row: 1
            width: 200
            Layout.fillHeight: true
            implicitWidth: 200
            padding: 0
            z: 100

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
                        qsTr("Available services  sd asd as das das da sd asd asd as")
                    ]
                    width: implicitWidth
                    Layout.fillHeight: true
                    delegate: ItemDelegate {
                        text: modelData
                        width: implicitWidth
                        highlighted: ListView.isCurrentItem
                        onClicked: {
                            console.log(index)
        //                    swipeView.currentIndex = index
                            listView.currentIndex = index
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator {}
                }
            }
        }

        StackLayout {
            id: swipeView
            Layout.column: 1
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: false
            clip: true
            currentIndex: listView.currentIndex
            z: -1
            AvailableServicesPage {

            }
            Rectangle {
                color: "green"
            }
        }
    }
}
