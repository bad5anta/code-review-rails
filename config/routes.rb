Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users
      resources :stacks, only: %i[index]
      resources :sessions, only: %i[create]
    end
  end
end
