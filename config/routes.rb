Rails.application.routes.draw do
  root to: "pages#home"
  # devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  resources :bookings, only: [:new, :create, :show, :destroy]
  resources :users, only:[:show]
end
