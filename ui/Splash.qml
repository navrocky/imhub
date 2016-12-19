import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {

    property var colors: ["#0DC143", "#36AEE2", "#EDB524", "#7B519C"]
    property int badgesNumber: 6
    property bool shown: false
    property bool closed: false

    function close() {
        closeAnimation.running = true
    }

    id: root
    color: "white"

    Text {
        anchors.centerIn: parent
        id: title
        color: "black"
        text: qsTr("imhub")
        font.pointSize: root.height * 0.2
        opacity: 0
        anchors.horizontalCenterOffset: 100
    }

    PauseAnimation {
        running: true
        duration: 1500
        onStopped: root.shown = true
    }

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
            height: (Math.cos(pos * Math.PI * 2 + Math.PI) + 1) / 2 * horizRange * 0.1 * 10 / root.badgesNumber
            anchors.horizontalCenterOffset: pos * horizRange - horizRange / 2
            color: root.colors[index % root.colors.length]

            SequentialAnimation {
                running: true
                PauseAnimation { duration: index * 500 / root.badgesNumber }
                NumberAnimation {
                    target: badge
                    property: "pos"
                    from: 0
                    to: 1
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    ParallelAnimation {
        id: closeAnimation

        property real duration: 500

        NumberAnimation {
            target: title
            property: "scale"
            from: 1
            to: 10
            duration: closeAnimation.duration
            easing.type: Easing.InQuad
        }

        NumberAnimation {
            target: root
            property: "opacity"
            to: 0
            duration: closeAnimation.duration
        }

        onStopped: {
            root.closed = true
            root.visible = false
        }
    }
}
