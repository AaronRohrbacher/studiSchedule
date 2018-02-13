Rails.application.routes.draw do


scope "schools/:school_id" do
  root :to => 'schools#show'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :accounts, only: 'create'
  end

  resources :schools do
    resources :accounts
    resources :events do
      resources :teacher_events
      resources :schedules
      resources :account_events
      resources :boards do
        resources :posts
      end
    end
  end
end
