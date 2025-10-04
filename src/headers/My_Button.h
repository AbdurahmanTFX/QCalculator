#pragma once
#include <QObject>

class My_Button : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool visible READ bVisible WRITE bSetVisible NOTIFY visible_Changed)
    public:

        explicit My_Button(QObject* parent = nullptr) : QObject(parent) {}

        bool bVisible();
        void bSetVisible(bool newVisible);

        Q_INVOKABLE void visibility();

    signals:
        void visible_Changed(bool visible);

    protected:
        bool visible = true;
};

