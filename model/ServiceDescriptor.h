#pragma once

#include <QObject>

class ServiceDescriptor : public QObject
{
    Q_OBJECT
public:
    ServiceDescriptor(QObject* parent = 0);

    virtual QString title() const = 0;
    virtual QUrl url() const = 0;
    virtual QIcon icon() const = 0;
    virtual QString script() const = 0;

};
