if rock_toolchain = Autoproj.manifest.find_metapackage('rock.toolchain')
    rock_toolchain.add Autobuild::Package['gui/vizkit']
    rock_toolchain.add Autobuild::Package['bundles/rock']
end


# 2014-03-12:
# temporary fix for boost bug: https://svn.boost.org/trac/boost/ticket/7979
# on debian testing
only_on 'debian' do
  cmake_package 'typelib' do |pkg|
      pkg.define "RUBY_EXECUTABLE", Autoproj.find_in_path(RbConfig::CONFIG['RUBY_INSTALL_NAME'])
      pkg.define "GLIBC_HAVE_LONG_LONG"
  end  
end
