Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :grades
  resources :subjects
  resources :exams
  resources :teachers

  get '/search', to: 'search#results', as: :search
end
