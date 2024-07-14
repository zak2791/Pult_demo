import QtQuick 6.5

Rectangle {
    //width: 2000
    //height: 1000
    property alias text: txt.text
    property color colorText: "black"
    property int fontSize: 10
    radius: width / 8

    color: "white"

    Text{
        id: txt
        color: colorText
        anchors.fill: parent
        font.pixelSize: fontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: text
    }
}