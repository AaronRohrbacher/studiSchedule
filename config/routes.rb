Rails.application.routes.draw do


  scope "schools/:school_id" do
    root :to => 'home#index'

    devise_for :users, controllers: { registrations: "registrations" }
    resources :schools do
      resources :accounts
    end
end
  # resources :schools do
  #   resources :accounts
  # end
end
