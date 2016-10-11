
import QtQuick 2.7

Item {
    id: root
    width : 500
    height: 500


    Item {
        id: header
        anchors.right: parent.right
        anchors.left: parent.left
        height: 80

        CheckBox {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 24
        }

        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 83+12
            spacing: 24

            ToolButton {
                source: "ui/add.png"
            }

            ToolButton {
                source: "ui/remove.png"
            }

            ToolButton {
                source: "ui/update.png"
                onClicked: todoModel.sync()
            }
        }

        ToolButton {
            source: "ui/settings.png"
            anchors.right: parent.right
            anchors.rightMargin: 24
            anchors.verticalCenter: parent.verticalCenter

        }
    }


    ListModel {
        id: myModel
        ListElement {
            check : true
            title : "Apprendre python"
        }

        ListElement {
            check : true
            title : "Apprendre tr"
        }

        ListElement {
            check : true
            title : "sdf python"
        }

        ListElement {
            check : false
            title : "sdf python"
        }

        ListElement {
            check : true
            title : "Apprendre python"
        }
    }



    Column {
        id : view
        anchors.top:header.bottom
        width: parent.width

        Repeater {

            model :todoModel
            delegate : Item {
                height:58
                width :root.width

                CheckBox{
                    id: checkBox
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 24
                    checked: todoModel.get(index).checked
                    onClicked: 
                    {
                        todoModel.set(index,"checked", checked)
                    }
                }

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 94
                    text: todoModel.get(index).title
                    font.pixelSize: 18
                    font.family: "Arial"
                    font.bold: true
                    color:"#888A85"
                    opacity: checkBox.checked ? 0.5 : 1
                }


                Image {
                    source: "ui/line.png"
                    anchors.top: parent.top
                }
                Image {
                    source: "ui/line.png"
                    anchors.bottom: parent.bottom
                    visible: index == myModel.count-1
                }

            }

        }
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

            }

            Button
            {
                text: "r"

            }
        }

    }




}
