import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import Imhub 1.0

Item {
    GridLayout {
        anchors.fill: parent
        columns: 1
        rows: 2

        Label {
            id: label
            text: qsTr("Available services")
            font.pointSize: 20
            Layout.margins: 20
            Layout.column: 0
            Layout.row: 0
            Layout.fillWidth: true
        }

        GridView {
            model: ServiceManager.serviceDescriptors()
            Layout.column: 0
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            delegate: ItemDelegate {
                width: 100
                height: 100
                contentItem: Item {
                    Image {
                        id: serviceIcon
                        source: "qrc" + model.modelData.iconUrl
                        height: parent.height - label.implicitHeight
                        width: height
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        sourceSize.width: width
                        sourceSize.height: height
                        visible: false
                    }
                    ColorOverlay {
                        anchors.fill: serviceIcon
                        source: serviceIcon
                        color: "white"
                    }

                    Text {
                        id: serviceLabel
                        text: model.modelData.title
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: serviceIcon.bottom
                    }
                }
            }
        }
    }
}
