Rails.application.routes.draw do
  root to: 'rooms#index'
  devise_for :users
  resources :rooms do 
    resources :tasks do
      member do
      patch :complete
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
