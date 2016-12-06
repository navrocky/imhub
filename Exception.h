#pragma once

#include <stdexcept>
#include <QString>

class Exception : public std::runtime_error
{
public:
    Exception(const std::string& msg);
    Exception(const QString& msg);
};
