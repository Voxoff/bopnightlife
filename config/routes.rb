Rails.application.routes.draw do
  # get 'nightclub/index'
  devise_for :users
  root to: 'nightclubs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
