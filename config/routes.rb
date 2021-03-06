# -*- encoding : utf-8 -*-
Cybernetic::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root :to => 'welcome#index'
    get '/search', to: 'search#index'

    resources :pages, only: [:index, :show]
    resources :categories, only: [:show]
    resources :products, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :contacts, only: [:new, :create]
    resources :faqs, only: [:index]
    resources :marketings, only: [:create]
    resources :downloads, only: [:index]
    resources :stores, only: [:show]

    namespace :admin do
      resources :pages, only: [:index, :show, :edit, :update]
      resources :sliders do
        collection { post :sort }
      end
      resources :categories do
        collection { post :sort }
      end
      resources :products
      resources :posts
      resources :contacts
      resources :faqs
      resources :films
      resources :downloads
      resources :stores
      resources :marketings
      resources :contacts
      resources :users do
        put '/approve', to: 'users#approve'
        put '/unapprove', to: 'users#unapprove'
      end
    end
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

end
