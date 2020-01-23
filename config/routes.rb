Rails.application.routes.draw do
  root 'static_pages#index'
  get  '/about',   to: 'static_pages#about'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  post '/save_habit', to:'habits#save_achievement'
  resources :users
  resources :habits
  resources :hobbies
  
  
end
