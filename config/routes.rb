Rails.application.routes.draw do
  root to: 'pages#index'

  ## Event categories
  scope 'events/categories', as: 'event_category' do
    get 'search', to: 'event_categories#search'
    get 'disabled', to: 'event_categories#disabled'
    get ':id/restore', to: 'event_categories#restore', as: 'restore'
  end
  resources :event_categories, path: 'events/categories'

  ## Events
  get 'events/search'
  get 'events/disabled'
  delete 'events/presence', to: 'event_presences#destroy'
  get 'events/:id/restore', to: 'events#restore'
  resources :events do
    get 'presence', to: 'event_presences#index'
    get 'presence/list', to: 'event_presences#list'
    post 'presence/create', to: 'event_presences#create'
  end

  ## Groups
  get 'groups/search'
  get 'groups/disabled'
  get 'groups/:id/restore', to: 'groups#restore'
  get 'groups/presence', to: 'group_presences#index'
  delete 'groups/presence', to: 'group_presences#destroy'
  resources :groups do
    get 'search_lists', to: 'groups#search_lists'
    get 'presence/new', to: 'group_presences#new'
    get 'presence/search', to: 'group_presences#search'
    post 'presence/create', to: 'group_presences#create'
    get 'presence/:list_id', to: 'group_presences#show'
  end

  ## Members
  get 'members/search'
  get 'members/disabled'
  resources :members do
    get 'restore', to: 'members#restore', as: 'restore'
    get 'activity', to: 'members#activity', as: 'activity'
  end

  ## Schools
  get 'schools/search'
  get 'schools/disabled'
  get 'schools/:id/restore', to: 'schools#restore'
  resources :schools

  ## Lesson subjects
  scope 'lessons/subjects', as: 'lesson_subject' do
    get 'search', to: 'lesson_subjects#search'
    get 'disabled', to: 'lesson_subjects#disabled'
    get ':id/restore', to: 'lesson_subjects#restore', as: 'restore'
  end
  resources :lesson_subjects, path: 'lessons/subjects'

  ## Lessons
  get 'lessons/search'
  resources :lessons

  # Consultations
  get 'consultations/disabled'
  get 'consultations/search'
  resources :consultations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
