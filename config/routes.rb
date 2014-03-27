Webapp::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :controllers => {:registrations => "registrations", :passwords => "passwords"  }
  
  resources :users
end