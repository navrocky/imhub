#include "ServiceDescriptor.h"

#include <QJsonObject>

ServiceDescriptor::ServiceDescriptor(QObject* parent)
    : QObject(parent)
{

}

QString ServiceDescriptor::title() const
{
    return title_;
}

void ServiceDescriptor::setTitle(const QString& title)
{
    title_ = title;
}

QUrl ServiceDescriptor::url() const
{
    return url_;
}

void ServiceDescriptor::setUrl(const QUrl& url)
{
    url_ = url;
}

QString ServiceDescriptor::iconPath() const
{
    return iconPath_;
}

void ServiceDescriptor::setIconPath(const QString& icon)
{
    iconPath_ = icon;
}

QString ServiceDescriptor::scriptPath() const
{
    return scriptPath_;
}

void ServiceDescriptor::setScriptPath(const QString& script)
{
    scriptPath_ = script;
}

void ServiceDescriptor::loadFromJson(const QJsonDocument& m)
{
    auto o = m.object();
    title_ = o.value("title").toString();
    url_ = QUrl(o.value("url").toString());
    iconPath_ = o.value("icon").toString();
    scriptPath_ = o.value("script").toString();

}
