Rails.application.routes.draw do


scope "schools/:school_id" do
  root :to => 'home#index'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :accounts, only: 'create'
  end

  resources :schools do
    resources :accounts
    resources :events
  end
end
