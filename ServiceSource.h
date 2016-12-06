#pragma once

#include <QMap>

class QObject;
class ServiceDescriptor;

class ServiceSource
{
public:
    virtual ~ServiceSource();

    virtual void collectNames(QMap<QString, ServiceSource*>& names) = 0;
    virtual ServiceDescriptor* loadDescriptor(const QString& name, QObject* parent) = 0;

};
