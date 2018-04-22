import QtQuick 2.3

Rectangle {
    property alias eScore: score.text
    property alias eBestScore: bestScore.text
    property alias eStep: step.text
    property alias eTotalStep: totalStep.text

    width: 360; height: 100
    color: "#fbf7ee"

    Grid {
        columns: 4

        Text {
            width: 90; height: 50
            text: "Score:"
            color: "darkred"
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: score
            width: 90; height: 50
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            width: 135; height: 50
            text: "Best Score:"
            color: "darkred"
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: bestScore
            width: 90; height: 50
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            width: 90; height: 50
            text: "Step:"
            color: "darkred"
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: step
            width: 90; height: 50
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            width: 135; height: 50
            text: "Total Step:"
            color: "darkred"
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: totalStep
            width: 90; height: 50
            font.pixelSize: 20
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }
}
