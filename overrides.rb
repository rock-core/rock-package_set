if `g++ --version` =~ /4.7/
   Autoproj.manifest.add_exclusion 'slam/pcl', "the PCL version included in Rock does not compile on gcc >= 4.7"
end
