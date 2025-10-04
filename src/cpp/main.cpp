#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qobject.h>
#include <qtmetamacros.h>
#include <QQmlContext>
#include "My_Button.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));
    //QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
    //                 &app, [url](QObject *obj, const QUrl &objUrl) {
    //    if (!obj && url == objUrl) QCoreApplication::exit(-1);
    //}, Qt::QueuedConnection);
    
    My_Button button;
    engine.rootContext()->setContextProperty("button", &button);   

    engine.load(url);
    return app.exec();
}

