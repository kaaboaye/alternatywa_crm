Rails.application.routes.draw do
    root to: 'home#index'

    #resources :home
    resources :member
    resources :school
    resources :group
    resources :event
    resources :lesson
    resources :lesson_subject

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
