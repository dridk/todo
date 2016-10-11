import QtQuick 2.7

Image {
    id: root
    opacity: area.containsMouse ? 1 : 0.5
    scale : area.pressed ? 0.8 : 1
    signal clicked()

    Behavior on opacity {
        NumberAnimation {
            duration : 500
        }
    }

    MouseArea {
        id : area
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()

    }
	

}
