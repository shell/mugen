module Mugen
  class Account < Client 
    class << self
      
    #
    # /account/stats (GET)
    # Retrieves account stats, such as orders made.
    #
    def stats(options={})
      res = self.get "/account/stats", :query => options
      check_for_errors(res)
      res['response']
    end
  
    #
    # /account/balance (GET)
    # Retrieves account balance in credits
    #
    def balance(options={})
      res = self.get "/account/balance", :query => options
      check_for_errors(res)
      res['response']      
    end                              
    
    end
  end
end