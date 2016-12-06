#pragma once

#include <memory>
#include <QFile>
#include <QString>
#include <QJsonDocument>

typedef std::shared_ptr<QFile> QFilePtr;

class Tools
{
public:

    static QFilePtr openFile(const QString& filePath);

    static QJsonDocument loadJsonFromFile(const QString& filePath);

};
