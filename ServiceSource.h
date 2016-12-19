#pragma once

#include <QMap>
#include <QObject>

class WebServiceDescriptor;

class ServiceSource : public QObject
{
    Q_OBJECT
public:
    ServiceSource(QObject* parent = 0);

    virtual void collectNames(QMap<QString, ServiceSource*>& names) = 0;
    virtual WebServiceDescriptor* loadDescriptor(const QString& name, QObject* parent) = 0;
};
