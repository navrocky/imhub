#pragma once

#include <memory>
#include <type_traits>
#include <QAbstractListModel>
#include <QMetaProperty>

class ListAdaptorBase
{
public:
    virtual ~ListAdaptorBase();

    virtual int size() = 0;
    virtual QObject* object(int i) = 0;
    virtual QHash<int, QByteArray> roleNames() = 0;
};

template <template <class> class List, typename Value>
class ListAdaptor: public ListAdaptorBase
{
public:
    typedef List<Value> ListType;
    typedef typename std::remove_pointer<Value>::type ValueType;

    ListAdaptor(const ListType& list)
        : list_(list)
    {}

    int size() override
    {
        return list_.size();
    }

    QObject* object(int i) override
    {
        return qobject_cast<QObject*>(list_[i]);
    }

    QHash<int, QByteArray> roleNames() override
    {
        QMetaObject metaObject = ValueType::staticMetaObject;
        QHash<int, QByteArray> res;

        for (int i = 0; i < metaObject.propertyCount(); i++)
        {
            QMetaProperty prop = metaObject.property(i);
        }

        return res;
    }

private:
    ListType list_;
};

class ObjectListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    ObjectListModel(QObject* parent = 0);

    template <template <class> class List, typename Value>
    void setList(const List<Value>& list)
    {
        listAdaptor_ = std::make_shared<ListAdaptor<List, Value>>(list);
    }

    int rowCount(const QModelIndex& parent) const override;
    QVariant data(const QModelIndex&, int) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    std::shared_ptr<ListAdaptorBase> listAdaptor_;
};


