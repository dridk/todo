import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width : 500
    height : 500
    minimumWidth: 500
    maximumWidth: 500
    flags: Qt.FramelessWindowHint | Qt.Window
    minimumHeight: 500
    maximumHeight:  500
    opacity: active ? 1 : 0.2
    Behavior on opacity {
        NumberAnimation {
        duration : 100
        }
    }


    Item {
        anchors.fill: parent

        Row {
            id: content
            x: -500

            Behavior on x {
                NumberAnimation {
                    easing.type: Easing.OutBack
                    duration : 700

                }
            }

            SettingsPage {
                width: root.width
                height: root.height
                onBackClicked: content.state = "listState"

            }

            ListPage {
                width: root.width
                height: root.height
                onSettingsClicked: content.state="settingsState"
                onAddClicked: content.state="addState"

            }

            AddPage {
                width: root.width
                height: root.height
                onBackClicked: content.state = "listState"
                onSaveClicked: {
                    todoModel.add(message)
                    content.state = "listState"
                }

            }


            states: [

                State {
                    name:"settingsState"
                    PropertyChanges{target:content; x: 0}
                },

                State {
                    name:"listState"
                    PropertyChanges{target:content; x: -500}
                },

                State {
                    name:"addState"
                    PropertyChanges{target:content; x: -500 * 2}
                }


            ]


        }




    }






}
