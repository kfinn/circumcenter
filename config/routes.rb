Rails.application.routes.draw do
  resources :events, only: :show

  namespace :api do
    resources :events, only: [:create, :show] do
      resources :event_venue_recommendations, only: :create
    end

    resources :recommendations, only: :show
  end
end
