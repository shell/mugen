map.namespace(:mygengo) do |admin| 
  admin.resources :jobs, :member => {       
      :review_form => :get,
      :reject_form => :get,
      :revise_form => :get,
      :purchase    => :get,
      :reject      => :post, 
      :revise      => :post,
      :approve     => :post,  
      :callback    => :post,
  }  
  admin.resources :comments, :only => [:create]
  admin.resources :account, :only => [:index]
end

map.revision_mygengo_job '/mygengo/jobs/:job_id/revision/:id', :controller => 'mygengo/jobs', :action => 'revision'
