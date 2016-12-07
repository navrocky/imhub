#include "FolderServiceSource.h"

#include <QJsonDocument>

#include "Exception.h"
#include "Tools.h"
#include "model/ServiceDescriptor.h"

static const auto SERVICE_DESCR_FILE = QStringLiteral("service.json");

FolderServiceSource::FolderServiceSource(const QDir& dir)
    : dir_(dir)
{
}

void FolderServiceSource::collectNames(QMap<QString, ServiceSource*>& names)
{
    for (auto dirInfo : dir_.entryInfoList(QDir::Dirs))
    {
        QFileInfo fileInfo(dirInfo.absoluteFilePath(), SERVICE_DESCR_FILE);
        if (fileInfo.exists())
            names[dirInfo.baseName()] = this;
    }
}

ServiceDescriptor* FolderServiceSource::loadDescriptor(const QString& name, QObject* parent)
{
    QDir serviceDir = QFileInfo(dir_, name).absoluteFilePath();
    QString descrFilePath = serviceDir.filePath(SERVICE_DESCR_FILE);
    QJsonDocument doc = Tools::loadJsonFromFile(descrFilePath);
    auto d = new ServiceDescriptor(parent);
    d->loadFromJson(doc);
    return d;
}
