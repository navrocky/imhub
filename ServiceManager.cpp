#include "ServiceManager.h"

#include <QDir>
#include <QMap>


ServiceManager::ServiceManager(QObject* parent)
    : QObject(parent)
{
}

void ServiceManager::initialize()
{

}

QMap<QString, QString> ServiceManager::collectServices()
{
    QDir d(":/services/");
    for (auto dirName : d.entryList(QDir::Dirs))
    {

    }

}

