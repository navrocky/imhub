#include "WebServiceDescriptor.h"

#include <QJsonObject>

WebServiceDescriptor::WebServiceDescriptor(QObject* parent)
    : ServiceDescriptor(parent)
{

}

QString WebServiceDescriptor::title() const
{
    return title_;
}

void WebServiceDescriptor::setTitle(const QString& title)
{
    title_ = title;
}

QUrl WebServiceDescriptor::url() const
{
    return url_;
}

void WebServiceDescriptor::setUrl(const QUrl& url)
{
    url_ = url;
}

QString WebServiceDescriptor::iconName() const
{
    return iconName_;
}

void WebServiceDescriptor::setIconName(const QString& icon)
{
    iconName_ = icon;
}

QString WebServiceDescriptor::iconUrl() const
{
    return descriptorDirUrl_ + "/" + iconName_;
}

QString WebServiceDescriptor::viewName() const
{
    return "webView";
}

QString WebServiceDescriptor::scriptName() const
{
    return scriptName_;
}

void WebServiceDescriptor::setScriptName(const QString& script)
{
    scriptName_ = script;
}

void WebServiceDescriptor::loadFromJson(const QJsonDocument& m)
{
    auto o = m.object();
    title_ = o.value("title").toString();
    url_ = QUrl(o.value("url").toString());
    iconName_ = o.value("icon").toString();
    scriptName_ = o.value("script").toString();
}

QString WebServiceDescriptor::descriptorDirUrl() const
{
    return descriptorDirUrl_;
}

void WebServiceDescriptor::setDescriptorDirUrl(const QString& descriptorDirUrl)
{
    descriptorDirUrl_ = descriptorDirUrl;
}

QString WebServiceDescriptor::name() const
{
    return name_;
}

void WebServiceDescriptor::setName(const QString& name)
{
    name_ = name;
}
