import QtQuick 2.7

Item  {
    width: 110
    height: 40
    property alias text: textField.text

    Rectangle {
        anchors.fill: parent
        radius: 5
        opacity: area.containsMouse ? 1 : 0
        color: "#F0F0F1"

        Behavior on opacity {
            OpacityAnimator {
                duration : 500
            }
        }
    }




    Text {
        id : textField
        anchors.centerIn: parent
        font.pixelSize: 18
        font.family: "Arial"
        font.bold: true
        color:"#9699a0"



    }

    MouseArea {
        id:area
        hoverEnabled: true
        anchors.fill: parent
    }


}
