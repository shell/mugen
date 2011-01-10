map.namespace(:mygengo) do |admin| 
  admin.resources :jobs, :member => {       
      :review_form => :get,
      :reject_form => :get,
      :revise_form => :get,
      :purchase    => :get,
      :reject      => :post, 
      :revise      => :post,
      :approve     => :post,  
  }  
  admin.resources :comments, :only => [:create]
  admin.resources :account, :only => [:index]
end

map.connect '/mygengo/jobs/:job_id/revision/:id', :controller => 'mygengo/jobs', :action => 'revision', :as => :revision_mygengo_job
