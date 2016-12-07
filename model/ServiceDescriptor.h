#pragma once

#include <QIcon>
#include <QJsonDocument>
#include <QObject>
#include <QUrl>

class ServiceDescriptor : public QObject
{
    Q_OBJECT
public:
    ServiceDescriptor(QObject* parent = 0);

    QString title() const;
    void setTitle(const QString& title);

    QUrl url() const;
    void setUrl(const QUrl& url);

    QString iconPath() const;
    void setIconPath(const QString& iconPath);

    QString scriptPath() const;
    void setScriptPath(const QString& scriptPath);

    void loadFromJson(const QJsonDocument& m);

private:
    QString title_;
    QUrl url_;
    QString iconPath_;
    QString scriptPath_;
};
