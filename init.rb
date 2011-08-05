# In recent enough autoproj versions, declare that we want to use opencv from
# source and not from OS
if Autoproj.respond_to?(:add_osdeps_overrides)
    Autoproj.add_osdeps_overrides 'opencv', :package => 'external/opencv', :force => true
end
