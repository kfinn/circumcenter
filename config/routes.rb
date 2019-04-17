Rails.application.routes.draw do
  namespace :api do
    resources :events, only: [:create, :show]
  end
end
