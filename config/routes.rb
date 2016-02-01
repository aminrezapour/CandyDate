Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :update] do
    resources :suggestions
    resources :appointments

    get "/available_index"  => "appointments#available_index"
    get "/suggestion_index"  => "appointments#suggestion_index"
    get "/find_user"  => "appointments#find_user"
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
