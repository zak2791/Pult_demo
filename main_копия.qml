import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts

import "."

ApplicationWindow {
    id: root
    //visibility: Window.Maximized
    visible: true

        background: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0; color: "#6e5858" }
                GradientStop { position: 1; color: "#000000" }
            }
        }
        flags: Qt.Window | Qt.WindowFullScreen
    header: ToolBar {
        Rectangle {
            id: rec1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: width / 15
            width: parent.width / 6
            height: parent.width / 8
            radius: width / 6
            border.width: width / 20
            color: "tranparent"
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
            height: parent.width / 8
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
            icon.source: "images/Connect.png"
            //color: "red"
            width: parent.width / 8
            height: parent.width / 8
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
        }
    }
    RowLayout {
        id: recHor
        x: 0
        y: rec.height
        width: root.width
        height: rec.height / 2
        //layer.wrapMode: ShaderEffectSource.ClampToEdge
        spacing: 10

        Rectangle {
            color: "transparent"
            Layout.fillWidth: true
            height: parent.height
            Text {
                color: "white"
                anchors.fill: parent
                text: "-0.5"
                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
        }
        Rectangle {
            Layout.fillWidth: true
            height: parent.height
            color: "transparent"
            Text {
                color: "white"
                anchors.fill: parent
                text: "-1"
                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
        }
        Rectangle {
            Layout.fillWidth: true
            color: "transparent"
            height: parent.height
            Text {
                color: "white"
                anchors.fill: parent
                text: "-2"
                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }
        }
    }

    GridLayout {
        id: grid
        x: 0
        y: rec.height + recHor.height
        width: parent.width
        height: root.height - root.height / 5 - recHor.height
        columnSpacing: 0
        rowSpacing: 0
        columns: 3
        ErrorButton {
            text: "НЕ ПОДАНА\nКОМАНДА ПРИ\nВЫПОЛНЕНИИ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "НЕТ УХОДА С\nЛИНИИ АТАКИ.\nНЕТ БЛОКА"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ПРОПУЩЕН\nУДАР В\nТУЛОВИЩЕ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "НЕФФЕКТИВ-\nНЫЙ\nЗАХВАТ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ОСТАНОВКИ\nНАРУШЕНИЯ\nСЛИТНОСТИ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ОРУЖИЕ\nОСТАЛОСЬ НА\nКОВРЕ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "НЕЭФФЕКТИВНОЕ\nКОНВОИРОВАНИЕ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "НЕТ\nОТВЛЕКАЮЩИХ\nДЕЙСТВИЙ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "НЕ\nВЫПОЛНЕНО\nКОНВОИРО-\nВАНИЕ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ВЫПОЛНЕНИЕ\nМЕДЛЕННОЕ,\nБЕЗ УСИЛИЙ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ОШИБКА\nАССИСТЕНТА"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ПРЕВЫШЕНИЕ\nПРЕДЕЛОВ\nСАМООБОРОНЫ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ЧАСТИЧНАЯ\nПОТЕРЯ\nРАВНОВЕСИЯ"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ПАДЕНИЕ ПРИ\nВЫПОЛНЕНИИ\nПРИЁМА"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        ErrorButton {
            text: "ПОЛОЖЕНИЕ\nЛЁЖА ПОСЛЕ\nВЫПОЛНЕНИЯ\nПРИЁМА"
            fontSize: height / 7
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: marg
        }
        Rectangle {
            height: 30

            //width: 100
            color: "green"
            //Layout.fillHeight: true
            Layout.preferredHeight: 10
            Layout.fillWidth: true
            Layout.columnSpan: 3
            Layout.margins: marg
        }
    }
    RowLayout {
        id: recBottom
        y: 1728
        width: 1080
        height: 192
        spacing: 10
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
            height: parent.height * 0.9
            width: parent.width / 4

            color: "tranparent"
            border.width: rec1.border.width

            border.color: "lightgreen"
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
