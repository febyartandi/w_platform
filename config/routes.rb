WPlatform::Engine.routes.draw do
  get '/a/:company_permalink' => 'authentication/session_receivers#index'
  ###Notes: SUPPORT BUGS Return URL from WPlatform
  get 'a//a/:company_permalink' => 'authentication/session_receivers#index'
  
  namespace :authentication do
    resources :session_cleaners
  end
end
