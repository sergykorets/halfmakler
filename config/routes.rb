Rails.application.routes.draw do
  root 'pages#search'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get '/logout' => 'users#logout'
      post '/facebook' => 'users#facebook'

      resources :rooms
    end
  end

  get 'home' => 'pages#home'

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]

  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    get 'get_address_rooms', on: :collection
    get 'address_rooms', on: :collection
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'

  get 'search' => 'pages#search'
end