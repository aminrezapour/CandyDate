Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
