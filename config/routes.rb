Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :moods, only: [:index, :show]
    resources :suggestions do
      resources :availables, only: [:show] do
        resources :appointments, only: [:create]
      end
    end
    resources :availables, except: [:show]
    resources :appointments, except: [:new, :create]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
