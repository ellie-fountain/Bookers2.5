Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books
  root :to => 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home/about' => 'home#about'
end
