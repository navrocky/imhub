#pragma once

#include <QObject>

#include "model/WebServiceDescriptor.h"

class ServiceSource;

class ServiceManager : public QObject
{
    Q_OBJECT
public:
    ServiceManager(QObject* parent = 0);

    void addSource(ServiceSource*);

    void initialize();

    typedef QList<WebServiceDescriptor*> ServiceDescriptors;

    ServiceDescriptors serviceDescriptors() const { return serviceDescriptors_; }

private:
    void loadFromResources();

    ServiceDescriptors serviceDescriptors_;
    QList<ServiceSource*> sources_;
};
