#pragma once

#include <QObject>

#include "model/WebServiceDescriptor.h"
#include "ObjectListModel.h"

class ServiceSource;

class ServiceManager : public QObject
{
    Q_OBJECT
public:
    ServiceManager(QObject* parent = 0);

    void addSource(ServiceSource*);

    void initialize();

    typedef QList<WebServiceDescriptor*> ServiceDescriptors;

    Q_INVOKABLE QList<WebServiceDescriptor*> serviceDescriptors() const { return serviceDescriptors_; }

    Q_INVOKABLE ObjectListModel* serviceDescriptorsModel();

private:
    void loadFromResources();

    ServiceDescriptors serviceDescriptors_;
    QList<ServiceSource*> sources_;
};
