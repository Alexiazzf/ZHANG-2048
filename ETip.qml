import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
    property alias eEnBack: back.enabled

    signal eStart()
    signal eBack()

    width: 360; height: 100

    Button {
        width: 180; height: 100
        text: qsTr("NewGame")
        onClicked: parent.eStart()
    }

    Button {
        id: back
        enabled: false
        x: 180
        width: 180; height: 100
        text: qsTr("Back")
        onClicked: parent.eBack()
    }

}
