#include "Exception.h"

Exception::Exception(const std::string& msg)
    : std::runtime_error(msg)
{

}

Exception::Exception(const QString& msg)
    : std::runtime_error(std::string(msg.toUtf8().data()))
{
}
