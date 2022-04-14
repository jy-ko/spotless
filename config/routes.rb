Rails.application.routes.draw do
  root to: 'home#landing'
  devise_for :users
  get '/dashboard' => "home#index", :as => :user_root
  resources :rooms do 
    resources :tasks do
      member do
      patch :complete
      end
    end
  end

end
