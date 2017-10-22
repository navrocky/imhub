import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: qsTr("Imhub")

    Material.theme: Material.Dark
    Material.accent: Material.Orange
    Material.primary: Material.Red

    id: root

    property bool splashShown: false

    Loader {
        id: splashLoader
        asynchronous: true
        source: "/ui/Splash.qml"
        anchors.fill: parent
        z: 1000
        Connections {
            target: splashLoader.item
            onShownChanged: root.tryCloseSplash()
        }
    }

    Loader {
        id: mainPageLoader
        visible: false
        active: true
        asynchronous: true
        source: "/ui/MainPage.qml"
        anchors.fill: parent
        onLoaded: root.tryCloseSplash()
    }

    function tryCloseSplash() {
        if (splashLoader.item.shown && mainPageLoader.status == Loader.Ready) {
            mainPageLoader.visible = true
            splashLoader.item.close()
        }
    }
}
