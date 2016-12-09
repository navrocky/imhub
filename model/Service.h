#pragma once

#include <QObject>

class WebServiceDescriptor;

class Service : public QObject
{
    Q_OBJECT
public:
    Service(QObject* parent = 0);

    WebServiceDescriptor* descriptor() const;

private:
    WebServiceDescriptor* descriptor_;
};
