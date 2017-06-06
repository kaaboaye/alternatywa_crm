Rails.application.routes.draw do
  root to: 'home#index'

  get 'events/search'
  get 'events/disabled'
  delete 'events/presence', to: 'event_presences#destroy'
  get 'events/:id/restore', to: 'events#restore'
  resources :events do
    get 'presence', to: 'event_presences#index'
    get 'presence/list', to: 'event_presences#list'
    post 'presence/create', to: 'event_presences#create'
  end

  get 'event_categories/search'
  get 'event_categories/disabled'
  get 'event_categories/:id/restore', to: 'event_categories#restore'
  resources :event_categories

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

  get 'members/search'
  get 'members/disabled'
  get 'members/:id/restore', to: 'members#restore'
  resources :members

  get 'schools/search'
  get 'schools/disabled'
  get 'schools/:id/restore', to: 'schools#restore'
  resources :schools

  resources :lesson_subject


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
