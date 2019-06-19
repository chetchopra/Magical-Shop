Rails.application.routes.draw do
  #Removing resource route for Travelers
  #resources :travelers, except: [:new, :create]
  resources :travelerinventories
  resources :transactions
  #resources :shopkeepers
  resources :shopinventories
  resources :items
  resources :categories

  #Routes for login and logout
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  #Routes for traveler
  get '/traveler', to: 'travelers#index'
  get '/traveler/edit', to: 'travelers#edit'
  patch '/traveler', to: 'travelers#update'

  get '/shopkeeper', to: 'shopkeepers#index'
  get '/shopkeeper/editstore', to: 'shopkeepers#edit'
  patch 'shopkeeper', to: 'shopkeepers#update'

  get '/signup', to: 'travelers#new'
  post '/signup', to: 'travelers#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
