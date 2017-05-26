Rails.application.routes.draw do
  root to: 'home#index'

  get 'events/disabled'
  get 'events/:id/restore', to: 'events#restore'
  resources :events

  get 'event_categories/disabled'
  get 'event_categories/:id/restore', to: 'event_categories#restore'
  resources :event_categories

  get 'groups/disabled'
  get 'groups/:id/restore', to: 'groups#restore'
  resources :groups

  get 'members/disabled'
  get 'members/:id/restore', to: 'members#restore'
  resources :members

  get 'schools/search'
  get 'schools/disabled'
  get 'schools/:id/restore', to: 'schools#restore'
  resources :schools

  resources :lesson
  resources :lesson_subject


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
