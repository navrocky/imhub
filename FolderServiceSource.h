#pragma once

#include <QDir>

#include "ServiceSource.h"

class FolderServiceSource : public ServiceSource
{
    Q_OBJECT
public:
    FolderServiceSource(const QDir& dir, QObject* parent = 0);
    void collectNames(QMap<QString, ServiceSource*>& names) override;
    WebServiceDescriptor* loadDescriptor(const QString& name, QObject* parent) override;

private:
    QDir dir_;
};
