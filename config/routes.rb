Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :grades
  resources :subjects
  resources :exams do
    resources :comments, only: [:create, :destroy]
  end

  resources :teachers do
    resources :ratings, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/search', to: 'search#results', as: :search
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/manual', to: 'pages#manual', as: :manual
end
