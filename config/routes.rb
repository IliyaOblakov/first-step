Rails.application.routes.draw do
  root to: "pages#home"
  # devise_for :users
   devise_for :users, controllers: { registrations: "registrations" }
    resources :bookings, only: [:new, :create, :show, :destroy] do
      resources :chatrooms, only: [:show, :create] do
      resources :messages, only: :create
      end
    end
end
