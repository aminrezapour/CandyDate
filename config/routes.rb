Rails.application.routes.draw do

  get 'availables/index'

  get 'availables/show'

  get 'availables/new'

  get 'availables/edit'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :moods, only: [:index, :show]
    resources :suggestions do
      resources :availables, only: [:show]
    end
    resources :availables, except: [:show]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
