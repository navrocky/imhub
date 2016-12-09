import QtQuick 2.0

Item {

    property var colors: ["#0DC143", "#36AEE2", "#EDB524", "#7B519C"]
    property int badgesNumber: 10

    id: root

    state: "initial"

    Text {
        anchors.centerIn: parent
        id: title
        color: "black"
        text: qsTr("imhub")
        font.pointSize: root.height * 0.2
        opacity: 0
        anchors.horizontalCenterOffset: 100
    }

    Component.onCompleted: root.state = "show"

    SequentialAnimation {
        running: true
        PauseAnimation { duration: 800 }
        ParallelAnimation {
            NumberAnimation {
                target: title
                property: "opacity"
                to: 1
                duration: 500
            }
            NumberAnimation {
                target: title
                property: "anchors.horizontalCenterOffset"
                duration: 500
                easing.type: Easing.OutQuad
                to: 0
            }
        }
    }

    Repeater {
        model: root.badgesNumber
        Rectangle {
            property real pos: 0
            property real horizRange: root.width * 2
            id: badge
            rotation: -45
            anchors.centerIn: parent
            width: root.height * 10
            height: (Math.cos(pos * Math.PI * 2 + Math.PI) + 1) / 2 * horizRange * 0.1
            anchors.horizontalCenterOffset: pos * horizRange - horizRange / 2
            color: root.colors[index % root.colors.length]

            SequentialAnimation {
                running: true

                PauseAnimation { duration: index * root.badgesNumber * 5 }

                NumberAnimation {
                    target: badge
                    property: "pos"
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }

        }

    }


}
