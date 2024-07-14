#include "start.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    qmlRegisterType<Start>("com.myinc.Start", 1, 0, "Start");
    const QUrl url(u"qrc:/Pult_demonstration_techniques/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);
    qDebug()<<"main";
    //QJniObject  decorView = window.callObjectMethod("getDecorView", "()Landroid/view/View;");
    //decorView.callMethod<void>("setSystemUiVisibility", "(I)V", 0x00002000);
    return app.exec();
}
