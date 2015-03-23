Rails.application.routes.draw do

  devise_for :users
  get '/users/contributionship/:user_id' => 'users#contributionship'

  resources :pages
  root 'pages#index'
end
