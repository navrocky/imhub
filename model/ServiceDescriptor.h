#pragma once

#include <QObject>

class ServiceDescriptor : public QObject
{
    Q_OBJECT
public:
    ServiceDescriptor(QObject* parent = 0);

    virtual QString name() const = 0;
    virtual QString title() const = 0;
    virtual QString iconUrl() const = 0;
    virtual QString viewName() const = 0;
};
