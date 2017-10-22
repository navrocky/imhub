#include "ServiceManager.h"

#include <QDir>
#include <QMap>

#include "ServiceSource.h"

ServiceManager::ServiceManager(QObject* parent)
    : QObject(parent)
{
}

ServiceManager::~ServiceManager()
{
    qDeleteAll(serviceDescriptors_);
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

QVariantList ServiceManager::serviceDescriptors() const
{
    QVariantList res;
    for (auto o : serviceDescriptors_)
    {
        res.append(QVariant::fromValue(o));
    }
    return res;
}

ObjectListModel* ServiceManager::serviceDescriptorsModel()
{
    ObjectListModel* res = new ObjectListModel(this);
    res->setList(serviceDescriptors_);
    return res;
}


