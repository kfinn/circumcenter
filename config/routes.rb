Rails.application.routes.draw do
  resources :events, only: :show

  namespace :api do
    shallow do
      resources :events, only: [:create, :show] do
        resource :current_participant, only: :update
        resources :venue_suggestions, only: :create do
          resources :endorsements, only: :create
          resources :vetoes, only: :create
        end
      end
    end
  end
end
