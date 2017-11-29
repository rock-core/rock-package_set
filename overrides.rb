if rock_toolchain = Autoproj.manifest.find_metapackage('rock.toolchain')
    rock_toolchain.add Autobuild::Package['gui/vizkit']
    rock_toolchain.add Autobuild::Package['bundles/rock']
end

Autoproj.osdeps.definitions['graphviz'] = Hash.new
Autoproj.osdeps.definitions['graphviz']['debian,ubuntu'] = ['graphviz', 'graphviz-dev']
Autoproj.osdeps.definitions['graphviz']['gentoo'] = ['graphviz']
Autoproj.osdeps.definitions['graphviz']['fedora'] = ['graphviz', 'graphviz-devel']
Autoproj.osdeps.definitions['graphviz']['arch,manjarolinux'] = ['graphviz']
Autoproj.osdeps.definitions['graphviz']['opensuse'] = ['graphviz-devel']

Autoproj.osdeps.definitions['boost'] = Hash.new
Autoproj.osdeps.definitions['boost']['debian,ubuntu'] = ['libboost-dev', 'libboost-graph-dev',
                                                         'libboost-program-options-dev',
                                                         'libboost-regex-dev',
                                                         'libboost-thread-dev',
                                                         'libboost-filesystem-dev',
                                                         'libboost-iostreams-dev',
                                                         'libboost-system-dev']
Autoproj.osdeps.definitions['boost']['gentoo'] = ['dev-libs/boost']
Autoproj.osdeps.definitions['boost']['fedora,opensuse'] = ['boost-devel']
Autoproj.osdeps.definitions['boost']['darwin'] = ['boost']
Autoproj.osdeps.definitions['boost']['arch,manjarolinux'] = ['boost', 'boost-libs']
