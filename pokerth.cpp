// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QIcon>
#include <QTranslator>
#include <QDebug>
#include "retranslate.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("PokerTH");
    QGuiApplication::setOrganizationName("inquies");

    QGuiApplication app(argc, argv);

    const QLocale locale;
    const QString baseName = "pokerth";

    QTranslator translator;
    if (translator.load(locale, baseName, "_", ":/i18n")) {
        app.installTranslator(&translator);
    } else {
        qDebug() << "Locale not found in translations";
    }


    QIcon::setThemeName("pokerth");

    QSettings settings;
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE"))
        QQuickStyle::setStyle(settings.value("style").toString());

    // If this is the first time we're running the application,
    // we need to set a style in the settings so that the QML
    // can find it in the list of built-in styles.
    const QString styleInSettings = settings.value("style").toString();
    if (styleInSettings.isEmpty())
        settings.setValue(QLatin1String("style"), QQuickStyle::name());

    QQmlApplicationEngine engine;

    LanguageManager langMgr(&engine);
    engine.rootContext()->setContextProperty("LanguageManager", &langMgr);

    engine.load(QUrl("qrc:/pokerth.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
