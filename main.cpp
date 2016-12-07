#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ServiceManager.h"
#include "FolderServiceSource.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    FolderServiceSource resourcesSource(QDir(":/services/"));
    ServiceManager serviceManager;
    serviceManager.addSource(&resourcesSource);
    serviceManager.initialize();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
