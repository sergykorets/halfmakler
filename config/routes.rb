Rails.application.routes.draw do
  get 'room/index'

  get 'room/new'

  get 'room/create'

  get 'room/listing'

  get 'room/pricing'

  get 'room/description'

  get 'room/photo_upload'

  get 'room/amenities'

  get 'room/location'

  get 'room/update'

  root 'pages#home'

  devise_for :users,
              path: '',
              path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
              controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  resources :users, only: [:show]
  end
