Rails.application.routes.draw do
  resources :travelers, except: [:new, :create]
  resources :travelerinventories
  resources :transactions
  resources :shopkeepers
  resources :shopinventories
  resources :items
  resources :categories

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'travelers#new'
  post '/signup', to: 'travelers#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
