module WPlatformHelper
  include WPlatformAuthentication
  
  def current_user_features
    user_features = {}
    unless session[:user_features].blank?
      user_features = session[:user_features]['user']
    end
    user_features
  end

  def current_user
    user = {}
    unless current_user_features.blank?
      user = { 'first_name' => current_user_features['first_name'],
        'last_name' => current_user_features['last_name'],
        'email' => current_user_features['email'],
        'log_id' => session[:user_log_id],
        'token' => session[:w_token]
      }
    end
    user
  end

  def current_company
    company = {}
    unless current_user_features.blank?
      company= current_user_features['user_company'].delete('id')
    end
    company
  end

  def current_features
    features = {}
    unless current_user_features.blank?
      features = current_user_features['features'].collect{|x| x["key"]}
    end
  end

  def check_user_access(skipped_controllers_actions=[])
    controller_name, action_name = assign_controller_and_action_name

    unless access_skipped_controllers?(skipped_controllers_actions, controller_name, action_name)
      if has_active_sessions?
        unless user_has_access_to?(controller_name, action_name)
          if controller_name == WPlatformConfig.root_controller and action_name ==  WPlatformConfig.root_action
            redirect_to request.referer
          else
            flash[:error] = "Sorry, you dont have permission to open the page !"
            redirect_to "/"
          end
        end

      else
        logout_and_back_to_platform(false)
      end

    end

  end
  
end
