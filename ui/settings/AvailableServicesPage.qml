import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import Imhub 1.0
import ".." as UI

Item {
    GridLayout {
        anchors.fill: parent
        columns: 1
        rows: 2

        UI.ExtLabel {
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
            delegate: ServiceItemDelegate {
                iconUrl: model.modelData.iconUrl
                title: model.modelData.title
            }
        }
    }
}
