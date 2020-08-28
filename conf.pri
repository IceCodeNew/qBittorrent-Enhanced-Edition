# Adapt these paths
# Point these to the include folders
INCLUDEPATH += $$quote(C:/GitHub/boost_1_73_0)
INCLUDEPATH += $$quote(C:/GitHub/install_msvc64/base/include)
INCLUDEPATH += $$quote(C:/GitHub/install_msvc64/qt5/include)
# Point these to the lib folders
LIBS += $$quote(-LC:/GitHub/boost_1_73_0/stage/lib)
LIBS += $$quote(-LC:/GitHub/install_msvc64/base/lib)
LIBS += $$quote(-LC:/GitHub/install_msvc64/qt5/lib)

# Adapt the lib names/versions accordingly
# If you want to use Boost auto-linking then disable
# BOOST_ALL_NO_LIB below and omit Boost libraries here
CONFIG(debug, debug|release) {
    LIBS += libtorrentd.lib \
            libboost_system-vc142-mt-s-x64-1_73.lib
}
else {
    LIBS += libtorrent.lib \
            libboost_system-vc142-mt-s-x64-1_73.lib
}
LIBS += libcrypto.lib libssl.lib
LIBS += zlib.lib
# ...or if you use MinGW
#CONFIG(debug, debug|release) {
#    LIBS += libtorrent-rasterbar \
#            libboost_system-mt
#}
#else {
#    LIBS += libtorrent-rasterbar \
#            libboost_system-mt
#}
#LIBS += libcrypto libssl
#LIBS += libz

# Disable to use Boost auto-linking
DEFINES += BOOST_ALL_NO_LIB
# Use one of the following options
DEFINES += BOOST_SYSTEM_STATIC_LINK
#DEFINES += BOOST_SYSTEM_DYN_LINK
# Enable if encountered build error with boost version <= 1.59
#DEFINES += BOOST_NO_CXX11_RVALUE_REFERENCES

# Enable if libtorrent was built with this flag defined
#DEFINES += TORRENT_NO_DEPRECATE
# Enable if linking dynamically against libtorrent
#DEFINES += TORRENT_LINKING_SHARED

# Enable stack trace support
CONFIG += stacktrace

win32-msvc* {
    QMAKE_CXXFLAGS += "/guard:cf"
    QMAKE_LFLAGS += "/guard:cf"
    QMAKE_LFLAGS_RELEASE += "/OPT:REF /OPT:ICF"
}
