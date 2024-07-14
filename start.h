#ifndef START_H
#define START_H

#include <QObject>
#include <QUdpSocket>

class Start : public QObject{
    Q_OBJECT

private:
    // Q_PROPERTY(qulonglong input     WRITE setInputValue
    //                                 READ inputValue
    //                                 NOTIFY inputValueChanged
    //            )
    Q_PROPERTY(QString addr READ addrValue)
    QList<QString> addrVal;
    QString addr;
    QUdpSocket* udpSocket;

public:
    Start();

    Q_INVOKABLE QString addrValue(void);
    Q_INVOKABLE void sendBroad(void);

    // signals:
    //     void inputValueChanged (qulonglong);
    //     void resultValueChanged(qulonglong);

};

#endif // START_H
