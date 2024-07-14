#include "start.h"
#include <QNetworkInterface>

Start::Start() {
    udpSocket = new QUdpSocket(this);
}

QString Start::addrValue(){
    qDebug()<<"START";
    QNetworkInterface networkInterface;
    QString m_strHWAddress1;
    QList<QString> list;
    QList<QNetworkInterface> list1=QNetworkInterface::allInterfaces();
    QList<QHostAddress> addr;//QNetworkInterface::allAddresses()
    // for(QNetworkInterface interface : QNetworkInterface::allInterfaces())
    //     qDebug() << "interface name: " << interface.name();
    QString addresses;
    foreach(networkInterface, list1){
        if(networkInterface.flags().testFlag(QNetworkInterface::IsUp) && !networkInterface.flags().testFlag(QNetworkInterface::IsLoopBack)){
            //m_strHWAddress1 = networkInterface.hardwareAddress();
            //list.append(m_strHWAddress1.toStdString().c_str());
            //addr.append(networkInterface.allAddresses().toString().c_str());
            qDebug() << "interface name: " << networkInterface.name();
            qDebug() << "hardwareAddress: " << networkInterface.hardwareAddress();
            addr = networkInterface.allAddresses();
            foreach (QHostAddress a, addr) {
                qDebug()<<"a = " << a.toString();
                addresses.append(" ");
                addresses.append(a.toString());
            }
        }

    }
    qDebug()<<"addresses = " << addresses.append(networkInterface.hardwareAddress());
    return addresses;
}

void Start::sendBroad()
{
    udpSocket->writeDatagram("hello", 6, QHostAddress("192.168.1.255"), 1000);
}
