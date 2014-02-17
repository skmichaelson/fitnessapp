FitnessApp::Application.routes.draw do
  resources :users
  root to: 'users#home'
end
