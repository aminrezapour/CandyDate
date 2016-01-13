Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :moods, only: [:index, :show]
    resources :suggestions
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
