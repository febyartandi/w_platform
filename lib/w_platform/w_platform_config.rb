class WPlatformConfig

  def self.load(rails_app_root, rails_app_env)
    config_file = File.join(rails_app_root, "config", "w_platform.yml")

    if File.exists?(config_file)
      config = YAML.load(File.read(config_file))[rails_app_env]
      if !config.nil?
        config.keys.each do |key|
          cattr_accessor key
          send("#{key}=", config[key])
        end
      end
    end
  end

  def self.[](key)
    self.send key
  end
  
  def self.[]=(key, value)
    self.send("#{key}=", value)
  end

end
