Rails.application.routes.draw do

  devise_for :users
  root to: 'transactions#index'

  resources :categories
  resources :transactions
  resources :reports, only: %i[new create]
  match "*path" => redirect("/"), via: %i[get]
end
