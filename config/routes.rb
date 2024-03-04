Rails.application.routes.draw do
  devise_for :users
  root "articles#homepage"
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
end
