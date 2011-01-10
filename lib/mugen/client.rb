module Mugen
  class Client
    include HTTParty
    base_uri Mugen.api_url || 'http://api.sandbox.mygengo.com/v1/'
    headers 'Accept' => 'application/json'    
    # debug_output $stderr                                
    
    def self.check_for_errors(res)
      # unless res['opstat'] == 'ok'
      #   Mugen.errors << res['err']['msg']
      # end
    end
  end                     
end