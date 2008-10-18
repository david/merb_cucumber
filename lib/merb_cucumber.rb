if defined?(Merb::Plugins)
  Merb::Plugins.add_rakefiles "merb_cucumber" / "merbtasks"
  
  if Merb.environment == "test"
    Merb::BootLoader.after_app_loads do
      require File.join(File.dirname(__FILE__) / "merb_cucumber" / "feature")
    end
  end
  
end
