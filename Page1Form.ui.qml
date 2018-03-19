import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 400
    height: 600

    header: Label {
        text: qsTr("2048 Game")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Rectangle {
        id: rect0
        x: 20
        y: 180
        width: 360
        height: 360
        color: "#786e6e"
        radius: 8
    }

    Text {
        id: title
        x: 20
        y: 20
        width: 150
        height: 80
        color: "#514e49"
        text: qsTr("2048")
        styleColor: "#000040"
        font.capitalization: Font.MixedCase
        font.weight: Font.Bold
        style: Text.Normal
        font.family: "Tahoma"
        font.pixelSize: 60
    }

    Rectangle {
        id: rect11
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.top: rect0.top
        anchors.topMargin: 8
        anchors.left: rect0.left
        anchors.leftMargin: 8
    }

    Rectangle {
        id: rect12
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.topMargin: 8
        anchors.top: rect0.top
        anchors.left: rect11.left
        anchors.leftMargin: 88
    }

    Rectangle {
        id: rect13
        y: 0
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect12.verticalCenter
        anchors.topMargin: 8
        anchors.top: rect0.top
        anchors.left: rect12.right
        anchors.leftMargin: 8
    }

    Rectangle {
        id: rect14
        y: -4
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect13.verticalCenter
        anchors.topMargin: 8
        anchors.top: rect0.top
        anchors.left: rect13.left
        anchors.leftMargin: 88
    }

    Rectangle {
        id: rect21
        x: -6
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.horizontalCenter: rect11.horizontalCenter
        anchors.topMargin: 88
        anchors.top: rect11.top
        anchors.left: rect0.left
        anchors.leftMargin: 8
    }

    Rectangle {
        id: rect22
        x: 0
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.horizontalCenterOffset: 88
        anchors.topMargin: 276
        anchors.horizontalCenter: rect11.horizontalCenter
        anchors.top: parent.top
        anchors.left: rect0.left
        anchors.leftMargin: 96
    }

    Rectangle {
        id: rect23
        x: 204
        y: 276
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.topMargin: 96
        anchors.top: rect0.top
        anchors.left: rect0.left
        anchors.leftMargin: 184
    }

    Rectangle {
        id: rect24
        x: 292
        y: 276
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.topMargin: 96
        anchors.top: rect0.top
        anchors.left: rect0.left
        anchors.leftMargin: 272
    }

    Rectangle {
        id: rect31
        x: 28
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.topMargin: 8
        anchors.top: rect21.bottom
        anchors.left: rect0.left
        anchors.leftMargin: 8
    }

    Rectangle {
        id: rect32
        x: -6
        y: -1
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.horizontalCenter: rect22.horizontalCenter
        anchors.verticalCenter: rect31.verticalCenter
    }

    Rectangle {
        id: rect33
        x: 9
        y: -6
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.horizontalCenter: rect23.horizontalCenter
        anchors.verticalCenter: rect31.verticalCenter
    }

    Rectangle {
        id: rect34
        x: 14
        y: -5
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect31.verticalCenter
        anchors.horizontalCenter: rect24.horizontalCenter
    }

    Rectangle {
        id: rect41
        x: 17
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.top: rect31.bottom
        anchors.topMargin: 8
        anchors.horizontalCenter: rect31.horizontalCenter
    }

    Rectangle {
        id: rect42
        x: 20
        y: 0
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect41.verticalCenter
        anchors.topMargin: 8
        anchors.horizontalCenter: rect32.horizontalCenter
        anchors.top: rect31.bottom
    }

    Rectangle {
        id: rect43
        x: 15
        y: -9
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect41.verticalCenter
        anchors.topMargin: 8
        anchors.horizontalCenter: rect33.horizontalCenter
        anchors.top: rect31.bottom
    }

    Rectangle {
        id: rect44
        x: 6
        y: -8
        width: 80
        height: 80
        color: "#dad3d3"
        radius: 8
        anchors.verticalCenter: rect41.verticalCenter
        anchors.topMargin: 8
        anchors.horizontalCenter: rect34.horizontalCenter
        anchors.top: rect31.bottom
    }

    Rectangle {
        id: score
        width: 90
        height: 80
        color: "#00000000"
        radius: 0
        anchors.left: title.right
        anchors.leftMargin: 10
        anchors.top: title.top
        anchors.topMargin: 0
        border.color: "#00000000"

        Text {
            id: socre
            width: 120
            color: "#000000"
            text: qsTr("Score")
            font.family: "Arial"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            anchors.fill: parent
            font.pixelSize: 22
        }
    }

    Rectangle {
        id: highscore
        y: 98
        width: 100
        height: 80
        color: "#00000000"
        radius: 0
        anchors.left: score.right
        anchors.leftMargin: 10
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: score.verticalCenter
        border.color: "#00000000"
        Text {
            id: highsocre
            width: 120
            height: 80
            color: "#000000"
            text: qsTr("Highscore")
            anchors.fill: parent
            font.pixelSize: 22
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
        }
    }

    Rectangle {
        id: newgame
        x: 40
        y: 106
        width: 100
        height: 60
        color: "#786e6e"
        radius: 5

        Text {
            id: text1
            x: 0
            width: 150
            color: "#ffffff"
            text: qsTr("Restart")
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 22
        }
    }

    Rectangle {
        id: cancel
        y: 104
        width: 100
        height: 60
        color: "#786e6e"
        radius: 5
        anchors.left: newgame.right
        anchors.leftMargin: 10
        anchors.verticalCenter: newgame.verticalCenter
        Text {
            id: text2
            width: 150
            color: "#ffffff"
            text: qsTr("Cancel")
            anchors.fill: parent
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Tahoma"
        }
    }

    Rectangle {
        id: exit
        y: 112
        width: 100
        height: 60
        color: "#786e6e"
        radius: 5
        anchors.verticalCenter: newgame.verticalCenter
        Text {
            id: text3
            width: 150
            color: "#ffffff"
            text: qsTr("Exit")
            anchors.fill: parent
            font.pixelSize: 22
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Tahoma"
        }
        anchors.left: cancel.right
        anchors.leftMargin: 10
    }
}
