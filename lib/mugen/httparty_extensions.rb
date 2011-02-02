module HTTParty
  module ClassMethods
    alias :original_get :get
    alias :original_post :post
    
    # Inject pre GET hook
    def get(path, options={})
      path, options = before_get(path, options) if respond_to?(:before_get)
      original_get(path, options)      
    end                                        

    # Inject pre POST hook
    def post(path, options={})
      path, options = before_post(path, options) if respond_to?(:before_post)
      original_post(path, options)
    end
    
  end
end