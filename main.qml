import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: qsTr("Imhub")

    Loader {
        id: splashLoader
        asynchronous: true
        source: "Splash.qml"
        anchors.fill: parent
    }

//    Loader {
//        id: mainPageLoader
//        asynchronous: true
//        source: "Splash.qml"
//        anchors.fill: parent
//    }


//    Splash {
//        anchors.fill: parent
//    }

////    SwipeView {
////        id: swipeView
////        anchors.fill: parent
////        currentIndex: tabBar.currentIndex

////        Page1 {
////        }

////        Page {
////            Label {
////                text: qsTr("Second page")
////                anchors.centerIn: parent
////            }
////        }
////    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex
//        TabButton {
//            text: qsTr("First")
//        }
//        TabButton {
//            text: qsTr("Second")
//        }
//    }
}
