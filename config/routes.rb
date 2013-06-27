StackOverflowClone::Application.routes.draw do

  root :to => 'questions#index'

  resources :users  do
    resources :questions, :only => [:index]
    resources :answers, :only => [:index]
    resources :comments, :only => [:index]
  end

  resources :questions do
    resources :answers
  end

  # resources :answers
  match '/answers', :to => "answers#index"
  match '/answers/new', :to => "answers#new"
  match '/answers/:id/edit', :to => "answers#edit"
  match '/answers/:id', :to => "answers#show"

  resources :tags do 
    resources :questions, :only => [:index]    
  end

  resources :comments

  resources :votes, :only => [:create]

  resources :sessions, :only => :create
  match '/logout', :to => 'sessions#destroy'
  match '/login', :to => 'sessions#new'

end
