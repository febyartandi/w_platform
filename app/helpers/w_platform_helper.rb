module WPlatformHelper
  include WPlatformAuthentication

  def current_user_platform
    user = {}
    unless session[:user].blank?
      user = session[:user]
    end
    user
  end

  def current_company
    company = {}
    unless session[:company].blank?
      company= session[:company].blank?
    end
    company
  end

  def current_features
    features = {}
    unless session[:features].blank?
      features = session[:features].collect{|x| x["key"]}
    end
    features
  end

  def check_user_access(skipped_controllers_actions=[])
    controller_name, action_name = assign_controller_and_action_name
    unless access_skipped_controllers?(skipped_controllers_actions, controller_name, action_name)
      if has_active_sessions?
        unless user_has_access_to?(controller_name, action_name)
          if controller_name == WPlatformConfig.root_controller and action_name ==  WPlatformConfig.root_action
            back_url = request.referer.blank? ? WPlatformConfig.appschef_url : request.referer
            redirect_to back_url
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
