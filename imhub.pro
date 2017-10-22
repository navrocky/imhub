QT += qml quick webengine svg quickcontrols2

CONFIG += c++11

HEADERS += \
    model/Service.h \
    ServiceManager.h \
    ServiceSource.h \
    FolderServiceSource.h \
    Exception.h \
    Tools.h \
    model/WebServiceDescriptor.h \
    model/ServiceDescriptor.h \
    ObjectListModel.h

SOURCES += main.cpp \
    model/Service.cpp \
    ServiceManager.cpp \
    ServiceSource.cpp \
    FolderServiceSource.cpp \
    Exception.cpp \
    Tools.cpp \
    model/WebServiceDescriptor.cpp \
    model/ServiceDescriptor.cpp \
    ObjectListModel.cpp

RESOURCES += qml.qrc \
    services/services.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


