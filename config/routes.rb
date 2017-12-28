Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations"}

# scope "schools/:school_id" do
#   resources :accounts, only: 'create'
#   end

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
