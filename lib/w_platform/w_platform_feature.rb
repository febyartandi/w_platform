class WPlatformFeature

  def self.load(rails_app_root)
    config_file = File.join(rails_app_root, "config", "w_features.yml")

    if File.exists?(config_file)
      config = YAML.load(File.read(config_file))
      if !config.nil?
        config.keys.each do |key|
          value = config[key]
          key = key.gsub("/", "_") if key.include?("/")
          cattr_accessor key
          send("#{key}=", value)
        end
      end
    end
  end

  def self.has_method?(method_name)
    self.public_methods.include? method_name.to_sym
  end

  def self.[](key)
    self.send key
  end

  def self.[]=(key, value)
    self.send("#{key}=", value)
  end

end
