#include "Service.h"

Service::Service(QObject* parent)
    : QObject(parent)
{

}

ServiceDescriptor* Service::descriptor() const
{
    return descriptor_;
}
