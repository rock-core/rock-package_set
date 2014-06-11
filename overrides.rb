if rock_toolchain = Autoproj.manifest.find_metapackage('rock.toolchain')
    rock_toolchain.add Autobuild::Package['gui/vizkit']
    rock_toolchain.add Autobuild::Package['bundles/rock']
end
