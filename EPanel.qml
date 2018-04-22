import QtQuick 2.3

Rectangle {
    id: root

    property var eNums: repeater

    width: 360 - radius *5
    height: width
    color: "#b9ad9f"
    radius: 4

    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 4
        spacing: 10

        Repeater {
            id: repeater
            model: 16

            EItem {
                width: (root.width - grid.spacing * 5) / 4
                height: width
            }
        }
    }
}
