import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    Rectangle {
        width: 200
        height: 100
        color: "red"
        Text {
            anchors.centerIn: parent
            text: "Hello, World!"
        }
    }
}