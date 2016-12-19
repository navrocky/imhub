import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

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
                Label {
                    text: "Settings"
                }
            }
        }

        ListView {
            id: listView
            clip: true
            focus: true
            Layout.column: 0
            Layout.row: 1
            model: [
                qsTr("Add service"),
                qsTr("Available services")
            ]
            width: 200
            Layout.fillHeight: true
            delegate: ItemDelegate {
                text: modelData
                width: parent.width
                highlighted: ListView.isCurrentItem
                onClicked: {
                    console.log(index)
//                    swipeView.currentIndex = index
                    listView.currentIndex = index
                }
            }
            ScrollIndicator.vertical: ScrollIndicator {}
        }

        StackLayout {
            id: swipeView
            Layout.column: 1
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            currentIndex: listView.currentIndex
            AvailableServicesPage {

            }
            Rectangle {
                color: "green"
            }
        }
    }
}
