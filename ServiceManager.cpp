#include "ServiceManager.h"

#include <QDir>
#include <QMap>

#include "ServiceSource.h"

ServiceManager::ServiceManager(QObject* parent)
    : QObject(parent)
{
}

void ServiceManager::addSource(ServiceSource* s)
{
    sources_.append(s);
}

void ServiceManager::initialize()
{
    QMap<QString, ServiceSource*> names;
    qDeleteAll(serviceDescriptors_);
    serviceDescriptors_.clear();
    for (auto s : sources_)
    {
        s->collectNames(names);
    }

    for (auto it = names.begin(); it != names.end(); ++it)
    {
        serviceDescriptors_.append(it.value()->loadDescriptor(it.key(), this));
    }
}


