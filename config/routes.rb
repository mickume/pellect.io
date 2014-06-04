Webapp::Application.routes.draw do
  root :to => "home#index"
  
  devise_for :users, :controllers => {:registrations => "registrations", :passwords => "passwords"  }
  
  resources :users
  resources :bookmarks
  
  get '/n', :to => 'bookmarks#index_new'
  get '/f', :to => 'bookmarks#index_favorites'
  get '/a', :to => 'bookmarks#index_archive'
  get '/o', :to => 'bookmarks#index_oldest'
  get '/s/:site_id', :to => 'bookmarks#by_site'
  
  post '/a/:bookmark', :to => 'bookmarks#archive'
  
  # redirect shortened urls
  get '/r/:short_url', :to => 'shortened_links#translate'
  
  # admin stuff
  post '/users/lock/:id' => 'users#lock'
  post '/users/unlock/:id' => 'users#unlock'
  
  # internal background stuff
  get 'internal/age' => 'background_tasks#age_bookmarks'
  get 'internal/expire' => 'background_tasks#expire_bookmarks'
end