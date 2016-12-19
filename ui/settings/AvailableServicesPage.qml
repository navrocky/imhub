import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import Imhub 1.0

Item {
    ColumnLayout {

        QtObject {
            Component.onCompleted: console.log(this.toString())
        }


        Label {

            id: label
            text: qsTr("Available services")
            font.pointSize: 20
            Layout.margins: 20

        }

        GridView {
            model: ServiceManager.serviceDescriptors()

        }
    }

}
