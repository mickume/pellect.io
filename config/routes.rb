Webapp::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :controllers => {:registrations => "registrations", :passwords => "passwords"  }
  
  resources :users
  resources :bookmarks
  
  # shortened urls
  get '/s/:short_url', :to => 'shortened_links#translate'
  # receive emails
  post '/api/1/email_processor' => 'emails#create'
  
end