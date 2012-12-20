Cybernetic::Application.routes.draw do
  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users

  root :to => 'welcome#index'

  resources :pages, only: [:index, :show]
  resources :categories, only: [:show]
  resources :products, only: [:index, :show]

  namespace :admin do
    resources :pages, only: [:index, :show, :edit, :update]
    resources :sliders
    resources :categories
    resources :products
  end
  #end

end
