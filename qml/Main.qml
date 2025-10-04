import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "QML + CMake Example"

    Item{
        anchors.fill: parent
        focus: true

        Button { 
            text: "Нажми меня"
            anchors.centerIn: parent
            onClicked: console.log("Кнопка нажата!")
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
        }
    }
}

