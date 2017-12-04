Rails.application.routes.draw do
  resources :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: %i[create]
    end
  end
end
