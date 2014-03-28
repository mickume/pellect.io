Webapp::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :controllers => {:registrations => "registrations", :passwords => "passwords"  }
  
  resources :users
  resources :bookmarks
  
  get '/n', :to => 'bookmarks#index_new'
  get '/f', :to => 'bookmarks#index_favorites'
  get '/a', :to => 'bookmarks#index_archive'
  get '/s/:site_id', :to => 'bookmarks#by_site'
  
  # redirect shortened urls
  get '/r/:short_url', :to => 'shortened_links#translate'
  # receive emails
  post '/api/1/email_processor' => 'emails#create'
  
end