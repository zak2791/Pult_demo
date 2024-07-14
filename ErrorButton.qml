import QtQuick 6.5
//import QtQuick.Controls 2.15

Rectangle {
    //width: 2000
    //height: 1000
    property alias text: txt.text
    property int fontSize: 10
    radius: width / 8

    Text{
        id: txt
        color: "#6e5858"
        anchors.fill: parent
        font.pixelSize: fontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: text
    }
}
