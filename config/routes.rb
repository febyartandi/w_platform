WPlatform::Engine.routes.draw do
  get '/a/:permalink' => 'authentication/session_receivers#index'
  ###Notes: SUPPORT BUGS Return URL from WPlatform
  get 'a//a/:permalink' => 'authentication/session_receivers#index'
  get '/a' => 'authentication/session_receivers#index'
  
  namespace :authentication do
    resources :session_cleaners
  end
end
