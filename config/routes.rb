FitnessApp::Application.routes.draw do
  resources :users do
    resources :friend_requests, only: [:index]
    resources :goals, only: [:create]
    resources :reports, only: [:new]
    get "reports", on: :member
    get "diary", on: :member
    get "goals", on: :member
    get "friends", on: :member
    resources :weigh_ins, only: [:new]
  end

  resources :daily_entries, only: [:edit, :update, :show] do
    resources :meal_entries, only: [:create, :destroy]
    resources :foods, only: [:show, :index] do
      get "search", on: :collection
    end
    get "search", on: :collection
    post "complete", on: :member
  end

  resources :foods, only: [:new, :show, :create, :index] do
    get "search", on: :collection
  end

  resources :messages, only: [:create, :destroy, :show, :index] do
    put "mark_unread", on: :member
  end

  resources :meal_entries, only: [:create, :edit, :update]
  resources :diaries, only: [:edit, :update]
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  resources :goals, only: [:new, :edit, :destroy, :show]
  resources :feed_items, only: [:create, :destroy]
  resources :weigh_ins, only: [:create, :index]
  resources :reports, only: [:create, :show, :index]
  resource :session, only: [:new, :create, :destroy]

  root to: 'users#home'
end
