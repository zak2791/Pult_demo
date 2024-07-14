import QtQuick 6.5
import QtQuick.Controls 6.5
import QtWebSockets 1.7

Rectangle{
    property int h: 100
    property int w: 100
    //anchors.fill: parent
    height: h
    width: w
    color:"green"
    Button{
        id: btn
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Показать IP"
        onClicked: {
            //ip.text = "address = " + start.addrValue()
            socket.active = !socket.active
            //parent.start.sendBroad()
        }
    }
    Text {
        id: ip
        anchors.bottom: btn.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: socket.status == WebSocket.Open ? qsTr("Sending...") : qsTr("Welcome!")
    }

    Text {
        id: data
        anchors.top: btn.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "text"
    }

    Image{
        source: "https://doc.qt.io/style/qt-logo-documentation.svg"
    }

    WebSocket {
            id: socket
            url: "ws://192.168.1.100:1111"
            onTextMessageReceived: function(message) {
                data.text = data.text + "\nReceived message: " + message
            }
            onStatusChanged: if (socket.status == WebSocket.Error) {
                                 console.log("Error: " + socket.errorString)
                             } else if (socket.status == WebSocket.Open) {
                                 socket.sendTextMessage("Hello World")
                             } else if (socket.status == WebSocket.Closed) {
                                 ip.text += "\nSocket closed"
                             }
            active: false
        }
}
