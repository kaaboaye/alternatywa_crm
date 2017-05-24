Rails.application.routes.draw do
  get 'members/disabled'
  get 'members/restore'


  get 'schools/disabled'
  get 'schools/:id/restore', to: 'schools#restore'
  #resources :home
  resources :members
  resources :schools
  resources :group
  resources :event
  resources :lesson
  resources :lesson_subject

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
