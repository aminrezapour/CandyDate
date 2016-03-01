Rails.application.routes.draw do

  get 'rainchecks/show'

  get 'rainchecks/new'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show, :update] do
    resources :suggestions
    resources :appointments
    resources :invitations do
      resources :rainchecks, except: [:index, :edit, :update]
    end

    get "/find_user"  => "invitations#find_user"
  end

  get 'about' => 'welcome#about'
  get 'slicklab' => 'welcome#slicklab'
  root 'welcome#index'

end
