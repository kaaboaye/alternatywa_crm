Rails.application.routes.draw do

  get 'groups/disabled'
  get 'groups/restore'
  
  get 'members/disabled'
  get 'members/restore'

  get 'schools/disabled'
  get 'schools/:id/restore', to: 'schools#restore'
  #resources :home
  resources :members
  resources :schools
  resources :groups
  resources :event
  resources :lesson
  resources :lesson_subject

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
