Cybernetic::Application.routes.draw do
  devise_for :users

  root :to => 'welcome#index'

  resources :pages, only: [:index, :show]

  namespace :admin do
    resources :pages, only: [:index, :show, :edit, :update]
  end

end
