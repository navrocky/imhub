#include "Service.h"

Service::Service(QObject* parent)
    : QObject(parent)
{

}

WebServiceDescriptor* Service::descriptor() const
{
    return descriptor_;
}
