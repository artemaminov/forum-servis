ForumServis::Application.routes.draw do

  root to: 'home#index'
  resources :home, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
