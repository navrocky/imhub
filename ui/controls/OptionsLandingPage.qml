import QtQuick 2.0

Rectangle {

    color: "yellow"
    property var items

//    default property var components

    ListView {
        model: items
        delegate: Rectangle {

        }
    }

    Component.onCompleted: {
//        console.log(components.length)


    }
}
