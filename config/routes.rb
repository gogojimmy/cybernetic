Cybernetic::Application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users

    root :to => 'welcome#index'

    resources :pages, only: [:index, :show]
    resources :categories, only: [:show]
    resources :products, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :contacts, only: [:new, :create]
    resources :faqs, only: [:index]
    resources :marketings, only: [:create]

    namespace :admin do
      resources :pages, only: [:index, :show, :edit, :update]
      resources :sliders
      resources :categories
      resources :products
      resources :posts
      resources :contacts
      resources :faqs
      resources :films
    end
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

end
