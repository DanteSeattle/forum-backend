Rails.application.routes.draw do
  root 'posts#index'

  namespace :api do
    namespace :v1 do
      resources :posts
      resources :comments
      resources :users
    end
  end

end
