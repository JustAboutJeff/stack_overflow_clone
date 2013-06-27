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
  get '/answers/:id/edit', :to => "answers#edit", as: :edit_answer
  get '/answers/new', :to => "answers#new", as: :new_answer
  get '/answers', :to => "answers#index", as: :answers
  post '/answers', :to => "answers#create", as: :answers
  get '/answers/:id', :to => "answers#show", as: :answer
  delete '/answers/:id', :to => "answers#destroy", as: :answer
  put '/answers/:id', :to => "answers#update", as: :answer


  resources :tags do 
    resources :questions, :only => [:index]    
  end

  resources :comments

  resources :votes, :only => [:create]

  resources :sessions, :only => :create
  match '/logout', :to => 'sessions#destroy'
  match '/login', :to => 'sessions#new'

end
