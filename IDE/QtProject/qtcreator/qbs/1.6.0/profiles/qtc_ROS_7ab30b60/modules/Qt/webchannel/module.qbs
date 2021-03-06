import qbs 1.0
import '../QtModule.qbs' as QtModule

QtModule {
    qtModuleName: "WebChannel"
    Depends { name: "Qt"; submodules: ["core", "qml"]}

    hasLibrary: true
    staticLibsDebug: []
    staticLibsRelease: []
    dynamicLibsDebug: []
    dynamicLibsRelease: ["/opt/qt57/lib/libQt5Qml.so.5.7.0", "/opt/qt57/lib/libQt5Network.so.5.7.0", "/opt/qt57/lib/libQt5Core.so.5.7.0", "pthread"]
    linkerFlagsDebug: []
    linkerFlagsRelease: []
    frameworksDebug: []
    frameworksRelease: []
    frameworkPathsDebug: []
    frameworkPathsRelease: []
    libNameForLinkerDebug: "Qt5WebChannel"
    libNameForLinkerRelease: "Qt5WebChannel"
    libFilePathDebug: ""
    libFilePathRelease: "/opt/qt57/lib/libQt5WebChannel.so.5.7.0"
    cpp.defines: ["QT_WEBCHANNEL_LIB"]
    cpp.includePaths: ["/opt/qt57/include", "/opt/qt57/include/QtWebChannel"]
    cpp.libraryPaths: ["/opt/qt57/lib"]
    
}
