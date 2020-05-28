Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'nightclubs#index'

  resources :promotions, only: :show

  post "/subscribe", to: "pages#subscribe"
end
