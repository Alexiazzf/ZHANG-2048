import QtQuick 2.3

Rectangle {
    property alias eNum: innerNum.text
    property alias eNumColor: innerNum.color

    width: 100; height: width // changed later
    color: "#cabeb2" // default
    radius: 4

    Text {
        id: innerNum
        anchors.centerIn: parent
        color: "white" // default
        font.pixelSize: 38
        font.family: "Tahoma"
    }
}
