Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#index'
  get  '/about',   to: 'static_pages#about'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  post '/save_habit', to:'habits#save_achievement'
  resources :habits, only: [:index]
  resources :hobbies, only: [:index, :new, :create, :destroy]
  
  get '/hobbies/csv_output', to:'hobbies#csv_output'
  
  get '/daily_habit/new' => 'habits#new_daily'
  get '/weekly_habit/new' => 'habits#new_weekly'
  post '/daily_habit' => 'habits#create_daily'
  post '/weekly_habit' => 'habits#create_weekly'
  delete "/daily_habit/:id"=> "habits#daily_destroy"
  delete "/weekly_habit/:id"=> "habits#weekly_destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
