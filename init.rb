def has_ueye_api?
    include_file = File.join("/usr","include","ueye.h")
    lib = File.join("/usr","lib","libueye_api.so")
    File.exist?(include_file) && File.exist?(lib)
end

def create_metapackages
    Autoproj.current_package_set().each_package do |pkg|
        meta_name = pkg.name.split("/").first
        if(meta_name)
            metapackage("rock.#{meta_name}", pkg.name)
        end
    end
end

if Autoproj::Metapackage.method_defined?(:weak_dependencies?)
    metapackage('rock').weak_dependencies = true
end
if Autoproj::Metapackage.method_defined?(:weak_dependencies?)
    metapackage('rock.drivers').weak_dependencies = true
end
if Autoproj::Metapackage.method_defined?(:weak_dependencies?)
    metapackage('rock.all').weak_dependencies = true
end
