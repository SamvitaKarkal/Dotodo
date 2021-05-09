Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks, only: [:index], param: :slug
  resources :tasks, only: [:index, :create]
  resources :tasks, except: %i[new edit], param: :slug
  resources :tasks, except: %i[new edit]
  #except used because except new and edit all other actions need to be run
  resources :users, only: %i[create index]
  resource :sessions, only: %i[create destroy]
  resources :comments, only: :create
  root "home#index"
  get '*path', to: 'home#index', via: :all
end