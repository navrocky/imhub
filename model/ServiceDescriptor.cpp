#include "ServiceDescriptor.h"

#include <QVariantMap>

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

void ServiceDescriptor::loadFromMap(const QVariantMap& m)
{
    title_ = m["title"].toString();
    url_ = QUrl(m["url"].toString());
    iconPath_ = m["icon"].toString();
    scriptPath_ = m["script"].toString();

}
