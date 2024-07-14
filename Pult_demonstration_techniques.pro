QT += quick network websockets

SOURCES += \
        main.cpp \
        start.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    _android/Android Manifest.xml \
    _android/Android Manifest.xml \
    _android/AndroidManifest.xml \
    _android/build.gradle \
    _android/gradle.properties \
    _android/gradle/wrapper/gradle-wrapper.jar \
    _android/gradle/wrapper/gradle-wrapper.properties \
    _android/gradlew \
    _android/gradlew.bat \
    _android/res/values/libs.xml \
    _android/res/xml/qtprovider_paths.xml


OTHER_FILES += _android/AndroidМanifest.xml

HEADERS += \
    start.h

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/_android
}
android: include($$ANDROID_SDK_ROOT/android_openssl/openssl.pri)
# LIBS += $$ANDROID_SDK_ROOT/android_openssl/ssl_1.1/armeabi-v7a/libssl_1_1.so
# LIBS += $$ANDROID_SDK_ROOT/android_openssl/ssl_1.1/armeabi-v7a/libcrypto_1_1.so
