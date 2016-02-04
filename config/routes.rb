Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :update] do
    resources :suggestions
    resources :appointments
    resources :invitations

    get "/find_user"  => "invitations#find_user"
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'

end
