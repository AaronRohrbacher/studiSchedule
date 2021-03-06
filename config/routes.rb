Rails.application.routes.draw do
root :to => "schools#show", :school_id => '1'

scope "schools/:school_id" do
  root :to => 'schools#show'

  devise_for :users, controllers: { registrations: "registrations" }
  resources :accounts, only: 'create'
  end


  resources :schools do
    resources :schedules
    resources :full_schedules
    resources :students
    resources :teachers
    resources :events do
      resources :event_teachers
      resources :event_students
      resources :schedules
      resources :boards do
        resources :posts
      end
    end
  end
end
