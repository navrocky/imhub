#pragma once

#include <QMap>

class QObject;
class WebServiceDescriptor;

class ServiceSource
{
public:
    virtual ~ServiceSource();

    virtual void collectNames(QMap<QString, ServiceSource*>& names) = 0;
    virtual WebServiceDescriptor* loadDescriptor(const QString& name, QObject* parent) = 0;

};
