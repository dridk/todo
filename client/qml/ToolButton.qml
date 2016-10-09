import QtQuick 2.7

Image {

    opacity: area.containsMouse ? 1 : 0.5
    scale : area.pressed ? 0.8 : 1

    Behavior on opacity {
        NumberAnimation {
            duration : 500
        }
    }

    MouseArea {
        id : area
        anchors.fill: parent
        hoverEnabled: true

    }
	

}
