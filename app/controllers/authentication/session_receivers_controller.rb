class Authentication::SessionReceiversController < WPlatformController

  def index
    if has_complete_params? or (have_session=has_complete_sessions?)
      initialize_user_sessions unless have_session
      redirect_to root_path
    else
      get_active_session_or_back_to_platform
    end
  end
  
end
