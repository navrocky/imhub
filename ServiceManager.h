#pragma once

#include <QObject>

#include "model/ServiceDescriptor.h"

class ServiceManager : public QObject
{
    Q_OBJECT
public:
    ServiceManager(QObject* parent = 0);

    void initialize();

    typedef QList<ServiceDescriptor*> ServiceDescriptors;

    ServiceDescriptors serviceDescriptors() const { return serviceDescriptors_; }

private:
    QMap<QString, QString> collectServices();
    void loadFromResources();

    ServiceDescriptors serviceDescriptors_;
};
