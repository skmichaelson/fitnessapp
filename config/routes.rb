FitnessApp::Application.routes.draw do
  resources :users do
    resources :goals, only: [:create]
    get "diary", on: :member
    get "goals", on: :member
    get "friends", on: :member
  end

  resources :daily_entries, only: [:edit, :update] do
    resources :meal_entries, only: [:create, :destroy]
    resources :foods, only: [:show, :index] do
      get "search", on: :collection
    end
  end

  resources :meal_entries, only: [:create, :edit, :update]
  resources :diaries, only: [:edit, :update]


  resources :foods, only: [:new, :show, :create, :index] do
    get "search", on: :collection
  end

  resources :goals, only: [:new, :edit, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]
  root to: 'users#home'
end
