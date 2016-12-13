import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {

    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 2

        ToolBar {
            Layout.row: 0
            Layout.columnSpan: 2
//            Layout.preferredHeight: implicitHeight
            Layout.fillWidth: true
//            color: "#0DC143"
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

            }

            ScrollIndicator.vertical: ScrollIndicator {}
        }
    }

}
