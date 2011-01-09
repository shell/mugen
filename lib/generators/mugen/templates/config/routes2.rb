namespace :mygengo do 
  resources :jobs do 
    member do 
      get :review_form
      get :reject_form
      get :revise_form
      get :purchase
      post :reject        
      post :revise
      post :approve        
    end
  end
  resources :comments, :only => [:create]
  resources :account, :only => [:index]
end
match '/mygengo/jobs/:job_id/revision/:id' => 'mygengo/jobs#revision', :as => :revision_mygengo_job