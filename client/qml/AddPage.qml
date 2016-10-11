
import QtQuick 2.7

Image {
    id: root
    source:"ui/background.png"

    property alias message : textInput.text

    signal backClicked()
    signal saveClicked()

    Item {
        id: header
        anchors.right: parent.right
        anchors.left: parent.left
        height: 80

        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 86+12
            spacing: 14
            Image {
                source: "ui/add.png"
            }

            Text {
                text: "Add Todo"
                font.pixelSize: 18
                font.family: "Arial"
                font.bold: true
                color:"#9699a0"


            }

        }
    }

    TextInput {
        id: textInput
        anchors.centerIn: parent
        font.pixelSize: 18
        font.family: "Arial"
        font.bold: true
        color:"#9699a0"
        height: 20
        text:"Your message ... "
        focus: true
        onFocusChanged: selectAll()


    }

    Item {
        id: footer
        height: 100
        anchors.bottom: root.bottom
        anchors.left: parent.left
        anchors.leftMargin: 83
        anchors.right: parent.right

        Row {
            anchors.centerIn: parent
            spacing: 130


            Button {
                text: "Back"
                onClicked: root.backClicked()

            }

            Button
            {
                text: "Save"
                onClicked: root.saveClicked()

            }
        }

    }



}
