def has_ueye_api?
    include_file = File.join("/usr","include","ueye.h")
    lib = File.join("/usr","lib","libueye_api.so")
    File.exists?(include_file) && File.exists?(lib)
end

