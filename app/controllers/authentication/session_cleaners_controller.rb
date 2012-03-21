class Authentication::SessionCleanersController < WPlatformController

  def new
    logout_and_back_to_platform
  end

end