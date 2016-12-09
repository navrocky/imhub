#pragma once

#include <QDir>

#include "ServiceSource.h"

class FolderServiceSource : public ServiceSource
{
public:
    FolderServiceSource(const QDir& dir);
    void collectNames(QMap<QString, ServiceSource*>& names) override;
    WebServiceDescriptor* loadDescriptor(const QString& name, QObject* parent) override;

private:
    QDir dir_;
};
