Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'react', to: 'portfolios#react'
  get 'ruby_on_rails', to: 'portfolios#ruby_on_rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  root 'pages#home'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get 'toggle_status'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
