Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :bookings, only: [:new, :create, :show, :destroy]
end
