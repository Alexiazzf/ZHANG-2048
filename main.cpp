#include "ZHANG2048.h"
#include <QGuiApplication>
#include <QQuickView>
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<ZHANG2048>("zhang", 1, 0, "ZHANG2048");

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:///main.qml")));
    view.show();

    return app.exec();
}
