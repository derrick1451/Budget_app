Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "groups#index"
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated do
    root "welcomes#index"
  end

  resources :groups, only:[:index,:new,:create] do
    resources :payments, only:[:index,:new,:create]
  end
end
