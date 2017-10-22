#pragma once

#include <QIcon>
#include <QJsonDocument>
#include <QObject>
#include <QUrl>

#include "ServiceDescriptor.h"

class WebServiceDescriptor : public ServiceDescriptor
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(QString title READ title WRITE setTitle)
    Q_PROPERTY(QString iconUrl READ iconUrl)
public:
    WebServiceDescriptor(QObject* parent = 0);

    QString name() const override;
    void setName(const QString& name);

    QString title() const override;
    void setTitle(const QString& title);

    QUrl url() const;
    void setUrl(const QUrl& url);

    QString iconName() const;
    void setIconName(const QString& iconName);
    QString iconUrl() const override;

    QString viewName() const override;

    QString scriptName() const;
    void setScriptName(const QString& scriptName);

    void loadFromJson(const QJsonDocument& m);

    QString descriptorDirUrl() const;
    void setDescriptorDirUrl(const QString& descriptorDirUrl);

private:
    QString descriptorDirUrl_;
    QString name_;
    QString title_;
    QUrl url_;
    QString iconName_;
    QString scriptName_;
};
