Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :subjects do
      # member  subjects/:id/method
      # collection subjects/method

      post 'vote', on: :member
      post 'unvote', on: :member
    end


  root to: 'subjects#index'


  

  #facebook_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_fail'
  get '/sign_out', to: 'sessions#destroy', as: :sign_out

  #vote
  #resources :votes, only: [:create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
