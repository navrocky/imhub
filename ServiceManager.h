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
    ~ServiceManager();

    void addSource(ServiceSource*);

    void initialize();

    Q_INVOKABLE QVariantList serviceDescriptors() const;

    Q_INVOKABLE ObjectListModel* serviceDescriptorsModel();

private:
    void loadFromResources();

    typedef QList<WebServiceDescriptor*> ServiceDescriptors;
    ServiceDescriptors serviceDescriptors_;
    QList<ServiceSource*> sources_;
};
