import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "../controls" as UI

ItemDelegate {

    property string iconUrl
    property string title

    property color textColor: "white"

    id: root

    width: 200
    height: 200

    contentItem: Item {

        anchors.fill: parent

        Image {
            id: serviceIcon
            source: "qrc" + root.iconUrl
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
            color: root.textColor
        }

        UI.ExtLabel {
            id: serviceLabel
            text: root.title
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: serviceIcon.bottom
        }
    }
}
