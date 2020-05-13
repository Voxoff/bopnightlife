Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'nightclubs#index'

  resources :promotions, only: :show

  get "/subscribe", to: "pages#subscribe"
end
