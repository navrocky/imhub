#pragma once

#include <QObject>

class ServiceDescriptor;

class Service : public QObject
{
    Q_OBJECT
public:
    Service(QObject* parent = 0);

    ServiceDescriptor* descriptor() const;

private:
    ServiceDescriptor* descriptor_;
};
