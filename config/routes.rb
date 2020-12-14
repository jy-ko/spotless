Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :rooms do 
    resources :tasks do
      member do
      patch :complete
      end
    end
  end

end
