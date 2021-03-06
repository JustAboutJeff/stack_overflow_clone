StackOverflowClone::Application.routes.draw do

  root :to => 'questions#index'

  resources :users  do
    resources :questions, :only => [:index]
    resources :answers, :only => [:index]
    resources :comments, :only => [:index]
  end

  resources :questions do
    resources :answers
    resources :comments, :only => [:create]
  end

  resources :answers do
    resources :comments, :only => [:create]
  end

  resources :tags do
    resources :questions, :only => [:index]
  end

  resources :comments

  resources :votes, :only => [:create]

  resources :sessions, :only => :create
  match '/logout', :to => 'sessions#destroy'
  match '/login', :to => 'sessions#new'

end
