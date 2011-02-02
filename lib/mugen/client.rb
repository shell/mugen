module Mugen
  class Client
    include HTTParty
    base_uri Mugen.api_url || 'http://api.sandbox.mygengo.com/v1/'
    headers 'Accept' => 'application/json'    
    # debug_output $stderr                                

    def self.before_get(path, options)
      options[:query] = Mugen.set_params(options[:query]) if options.has_key? :query
      [path, options]
    end
    
    def self.before_post(path, options)
      options[:body] = Mugen.set_params(options[:body], :post) if options.has_key? :body
      [path, options]
    end
    
    def self.check_for_errors(res)
      if res['opstat'] != 'ok' && res['err']
        Mugen.errors << res['err']['msg']
      end
    end
  end                     
end