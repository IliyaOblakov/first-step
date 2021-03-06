Rails.application.routes.draw do
  root to: "pages#home"
  # devise_for :users

  devise_for :users, controllers: { registrations: "registrations" }
    resources :bookings, only: [:new, :create, :show, :destroy, :update, :edit] do
      resources :chatrooms, only: [:show, :create] do
      resources :messages, only: :create
    end
  end
  get "my_bookings", to: "bookings#my_bookings"
end
