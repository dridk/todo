import QtQuick 2.7

Image{
    width: 32
    height: 32
    property bool checked: false
    source: checked ? "ui/checked.png" : "ui/unchecked.png"

    Image {
        source: "ui/valid.png"
        anchors.centerIn: parent
        scale: checked ? 1 : 0
        visible : scale > 0
        Behavior on scale {
            NumberAnimation {
                easing.type: Easing.OutElastic
                duration : 1000

            }
        }
    }

    MouseArea {
        id: area
        anchors.fill: parent
        onClicked: checked = !checked
    }


}
