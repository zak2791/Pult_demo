import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 2.1
import com.myinc.Start 1.0

import "qrc:/"

ApplicationWindow {
    id: root

    Start {
        id: start

        // Text{
        //     text: {function f() {
        //         let a = addrValue()
        //         console.log(a)
        //     };}
        // }

        // //console.log(addrValue())
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: start.sendBroad()
    }

    Component.onCompleted: {
        console.log("log completed"+root.header.height+contentItem.y);
        contentItem.Keys.released.connect(function(event){
            if(event.key === Qt.Key_Back && !isMain){
                event.accepted = true
                isMain = true
                stack.pop()
            }
            else
                event.accepted = false
        }
        )

        // idSocket.active = true

        // if (idSocket.status === WebSocket.Error) {
        //     console.log("idSocket error = " + idSocket.status)
        // } else if (idSocket.status === WebSocket.Open) {
        //     console.log("idSocket open = " + idSocket.status)
        // } else if (idSocket.status === WebSocket.Closed) {
        //     console.log("idSocket closed = " + idSocket.status)
        // }
        // console.log("idSocket status = " + idSocket.status)

        // idSocket.sendTextMessage("hello")
        console.log("addr = " + start.addrValue())
    }

    //visibility: Window.Maximized
    visible: true
    property int marg: 10
    property bool isMain: true

    background: Rectangle {
        gradient: Gradient {
            GradientStop { position: 0; color: "#6e5858" }
            GradientStop { position: 1; color: "#000000" }
        }
    }
    flags: Qt.Window | Qt.WindowFullScreen
    header: ToolBar {
        id: tool
        //height: root.height / 15
        Rectangle {
            id: rec1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: width / 15
            width: parent.width / 6
            height: tool.height * 0.9//parent.width / 8
            radius: width / 6
            border.width: width / 20
            color: "black"
            border.color: "red"
            //verticalCenter: parent.Center
            Text {
                anchors.fill: parent
                color: "white"
                text: "1"
                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            id: rec2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.baseline: parent.baseline
            width: parent.width / 6
            height: tool.height * 0.9
            radius: width / 6
            border.width: width / 20
            border.color: "yellow"
            color: "black"

            Text {
                anchors.fill: parent
                color: "white"
                text: "A2"
                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        RoundButton {
            id: roundButton
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: width / 10
            icon.height: roundButton.height
            icon.width: roundButton.width
            icon.color: "#00000000"
            icon.source: "qrc:/images/Connect.png"
            //color: "red"
            width: tool.height * 0.9
            height: tool.height * 0.9
            background: Rectangle {
                width: parent.width
                height: parent.height
                //implicitWidth: 90
                //implicitHeight: 30
                opacity: enabled ? 1 : 0.3
                //border.color: control.down ? "blue" : "chartreuse"
                //border.width: 5
                radius: width / 2
                //border.color: "#00000000"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color: "red"
            }
            onClicked: {
                if(isMain){
                    stack.push("qrc:/Settings.qml", {"h": stack.parent.height, "w": stack.parent.width})
                    isMain = false
                }
                else{
                    stack.pop()
                    isMain = true
                }
                console.log("clicked()");
            }
        }
    }
    StackView {
        id: stack
        //focus: true
        initialItem: Item{
            height: stack.parent.height
            width: stack.parent.width
            RowLayout {
                id: recHor
                x: 0
                y: 0
                width: root.width
                height: root.height / 20
                //layer.wrapMode: ShaderEffectSource.ClampToEdge
                //spacing: 10

                Rectangle {
                    color: "transparent"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    height: parent.height
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: "-0.5"
                        font.pixelSize: height / 1.5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: "-1"
                        font.pixelSize: height / 1.5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
                }
                Rectangle {
                    Layout.fillWidth: true
                    color: "transparent"
                    Layout.fillHeight: true
                    Text {
                        color: "white"
                        anchors.fill: parent
                        text: "-2"
                        font.pixelSize: height / 1.5
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
                }
            }

            GridLayout {
                id: gridDown
                x: 0
                y: 0//recHor.height
                width: root.width
                height: contentItem.height - root.height / 10 //- recHor.height
                columnSpacing: 0
                rowSpacing: 0
                columns: 3
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    gradient: Gradient {
                        GradientStop {position: 0.0; color: "#0a008300"}
                        GradientStop {
                            position: 1.0
                            color: "green"
                        }
                    }
                    //Layout.rowSpan: 5
                    Layout.leftMargin: marg
                    Layout.rightMargin: marg
                    Layout.bottomMargin: marg
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    gradient: Gradient {
                        GradientStop {
                            position: 0.0
                            color: "#0affff00"
                        }
                        GradientStop {
                            position: 1.0
                            color: "yellow"
                        }
                    }
                    //Layout.rowSpan: 5
                    Layout.leftMargin: marg
                    Layout.rightMargin: marg
                    Layout.bottomMargin: marg
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    gradient: Gradient {
                        GradientStop {
                            position: 0.0
                            color: "#0aff0000"
                        }
                        GradientStop {
                            position: 1.0
                            color: "red"
                        }
                    }
                    //Layout.rowSpan: 5
                    //Layout.margins: marg
                    Layout.leftMargin: marg
                    Layout.rightMargin: marg
                    Layout.bottomMargin: marg
                }
            }

            GridLayout {
                id: grid
                x: 0
                y: recHor.height
                width: parent.width
                height: contentItem.height - root.height / 10 - recHor.height
                columnSpacing: 0
                rowSpacing: 0
                columns: 3
                ErrorButton {
                    text: "НЕ ПОДАНА\nКОМАНДА ПРИ\nВЫПОЛНЕНИИ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "НЕТ УХОДА С\nЛИНИИ АТАКИ.\nНЕТ БЛОКА"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ПРОПУЩЕН\nУДАР В\nТУЛОВИЩЕ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "НЕФФЕКТИВ-\nНЫЙ\nЗАХВАТ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ОСТАНОВКИ\nНАРУШЕНИЯ\nСЛИТНОСТИ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ОРУЖИЕ\nОСТАЛОСЬ НА\nКОВРЕ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "НЕЭФФЕКТИВНОЕ\nКОНВОИРОВАНИЕ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "НЕТ\nОТВЛЕКАЮЩИХ\nДЕЙСТВИЙ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "НЕ\nВЫПОЛНЕНО\nКОНВОИРО-\nВАНИЕ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ВЫПОЛНЕНИЕ\nМЕДЛЕННОЕ,\nБЕЗ УСИЛИЙ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ОШИБКА\nАССИСТЕНТА"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ПРЕВЫШЕНИЕ\nПРЕДЕЛОВ\nСАМООБОРОНЫ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ЧАСТИЧНАЯ\nПОТЕРЯ\nРАВНОВЕСИЯ"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ПАДЕНИЕ ПРИ\nВЫПОЛНЕНИИ\nПРИЁМА"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                ErrorButton {
                    text: "ПОЛОЖЕНИЕ\nЛЁЖА ПОСЛЕ\nВЫПОЛНЕНИЯ\nПРИЁМА"
                    fontSize: height / 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                Rectangle {
                    height: 30

                    //width: 100
                    //color: "green"
                    //Layout.fillHeight: true
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 1.0; color: "red" }
                        GradientStop { position: 0.55; color: "yellow" }
                        GradientStop { position: 0.45; color: "yellow" }
                        GradientStop { position: 0.0; color: "green" }
                    }
                    Layout.preferredHeight: 10
                    Layout.fillWidth: true
                    Layout.columnSpan: 3
                    Layout.margins: marg
                }
            }
            RowLayout {
                id: recBottom
                y: gridDown.y + gridDown.height
                width: parent.width
                height: root.height / 10
                spacing: 5
                layoutDirection: Qt.LeftToRight

                // x: 0
                // y: row.height
                EnterButton {
                    //color: "black"
                    text: "+1"
                    fontSize: height / 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                EnterButton {
                    text: "0"
                    fontSize: height / 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "transparent"
                    border.width: rec1.border.width

                    border.color: "green"
                    radius: rec1.radius
                    Layout.margins: marg

                    Text {
                        anchors.fill: parent
                        font.pixelSize: parent.height / 2
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "white"
                        text: "10.0"
                    }
                }

                EnterButton {
                    text: "ВВОД"
                    fontSize: height / 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: marg
                }
            }
        }
    }
}
