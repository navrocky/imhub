#include "Tools.h"

#include "Exception.h"

QFilePtr Tools::openFile(const QString& filePath)
{
    auto file = std::make_shared<QFile>(filePath);
    if (!file->open(QFile::ReadOnly))
        throw Exception(QObject::tr("<da58e1d> Cannot open file \"%1\"").arg(filePath));
    return file;
}

QJsonDocument Tools::loadJsonFromFile(const QString& filePath)
{
    QByteArray fileData = openFile(filePath)->readAll();
    QJsonParseError err;
    auto doc = QJsonDocument::fromJson(fileData, &err);
    if (err.error != QJsonParseError::NoError)
        throw Exception(QObject::tr("<5197b578> JSON parse error: %1").arg(err.errorString()));
    return doc;
}
