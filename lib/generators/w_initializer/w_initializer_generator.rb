class WInitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "w_features.yml", "config/w_features.yml"
    copy_file "w_platform.yml", "config/w_platform.yml"
  end
  
end
