#include "ObjectListModel.h"

ObjectListModel::ObjectListModel(QObject* parent)
    : QAbstractListModel(parent)
{

}

int ObjectListModel::rowCount(const QModelIndex&) const
{
    return listAdaptor_->size();

}

QVariant ObjectListModel::data(const QModelIndex&, int) const
{
    return QVariant();
}

QHash<int, QByteArray> ObjectListModel::roleNames() const
{
    return listAdaptor_->roleNames();
}
