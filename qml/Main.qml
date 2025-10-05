import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    minimumWidth: 350
    minimumHeight: 450
    title: "QCalculator"

    Item{
        anchors.fill: parent
        focus: true
        
        Rectangle{
            id: equation
            height: parent.height/4
            width: parent.width - 20
            color: "#2a2e2b" 
            y: 10
            x: 10

            Rectangle{
                id: keyboard
                height: window.height - parent.height - 2*parent.y
                width: parent.width
                anchors.left: parent.left
                anchors.top: parent.bottom
                
                color: "#3a423c"

                Rectangle{
                    id: miniSquareButtons
                    width: (3*keyboard.width)/6
                    height: (4*keyboard.height)/5
                    color: parent.color

                    property var buttons: []

                    GridLayout {
                        id: grid
                        anchors.fill: parent
                        columns: 3
                        rowSpacing: 5
                        columnSpacing: 5
                        anchors.margins: 20



                        Repeater {
                            id: buttonRepeater
                            model: 12  // создаём 12 кнопок
                            Button {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Layout.preferredWidth: miniSquareButtons.width / 3 - 15
                                Layout.preferredHeight: miniSquareButtons.height / 4 - 20
                                font.pixelSize: this.width / 3

                                Component.onCompleted: miniSquareButtons.buttons.push(this)

                                

                                background: Rectangle{
                                    Behavior on color{
                                        ColorAnimation{duration: 100}
                                    }
                                    color: parent.pressed ? "#607565" : "#4a574d"
                                    radius: 4
                                }

                                onWidthChanged: font.pixelSize = this.width / 3


                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true  // обязательно для реакции на наведение
                                    onEntered: parent.font.pixelSize = parent.font.pixelSize * 1.2; 
                                    onExited: parent.font.pixelSize = parent.width / 3
                                    propagateComposedEvents: true
                                    acceptedButtons: Qt.NoButton
                                }
                                

                                Behavior on font.pixelSize{NumberAnimation{duration: 100}}
                                

                                text: {
                                    switch(index) {
                                        case 0: return "%";
                                        case 1: return "/";
                                        case 2: return "*";
                                        default: return (index - 2).toString();
                                    }
                                }
                            }
                        }
                        Button {
                            text: "0"
                            Layout.columnSpan: 2     // растягиваем на две колонки
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                        }
                    }
                }
            }
        }

        

        /*Button { 
            text: "Нажми меня"
            anchors.centerIn: parent
            onClicked: console.log("Кнопка нажата! " + parent.width + " " + parent.height)
            visible: button ? button.visible : true
        }

        Keys.onPressed: function(event) {
            if (event.key === Qt.Key_H) {
                button.visible = false
            } else if (event.key === Qt.Key_S) {
                button.visible = true
            } else if (event.key === Qt.Key_C) {
                button.visibility();
            }   
        }*/
    }
}

