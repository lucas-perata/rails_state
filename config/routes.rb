# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  get '/dashboard' => 'dashboard#index', as: :dashboard
  get '/profile/:id' => 'dashboard#profile', as: :profile
  get 'dashboard/properties'
  get 'properties/for-sale'
  get 'properties/for-rent'
  get 'properties/all'
  post 'agent/contact' => 'properties#email_agent' , as: :email_agent
  get "/accounts" => "admin#accounts", as: :accounts

  resources :properties
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'public#main'
end
