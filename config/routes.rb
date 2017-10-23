Rails.application.routes.draw do
  root 'courses#show'
  resources :courses, only: :show

  namespace :admin do
    resources :courses, path: '/'
  end
end
