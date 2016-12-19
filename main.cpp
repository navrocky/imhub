#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngine>
#include "ServiceManager.h"
#include "FolderServiceSource.h"

static QObject *serviceManagerSingletonProvider(QQmlEngine*, QJSEngine*)
{
    ServiceManager* serviceManager = new ServiceManager(qApp);
    FolderServiceSource* source = new FolderServiceSource(QDir(":/services/"), serviceManager);
    serviceManager->addSource(source);
    serviceManager->initialize();
    return serviceManager;
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    app.setApplicationName("IMHub");
    app.setApplicationVersion("0.0.1");
    app.setOrganizationDomain("http://www.imhub.org/");
    app.setOrganizationName("imhub.org");

    QtWebEngine::initialize();

    QQmlApplicationEngine engine;

    qmlRegisterSingletonType<ServiceManager>("Imhub", 1, 0, "ServiceManager", serviceManagerSingletonProvider);

    engine.load(QUrl(QLatin1String("qrc:/ui/main.qml")));

    return app.exec();
}
