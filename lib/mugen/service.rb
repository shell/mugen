module Mugen
  class Service < Client
    class << self
      
    #
    # translate/service/language_pairs (GET)
    #
    # Returns supported translation language pairs, tiers, and credit
    # prices.
    #
    def language_pairs(options={})
      res = self.get "/translate/service/language_pairs", :query => options
      check_for_errors(res)
      res['response']
    end

    #
    # translate/service/languages (GET)
    #
    # Returns a list of supported languages and their language codes.
    #
    def languages(options={})
      res = self.get "/translate/service/languages", :query => options
      check_for_errors(res)
      res['response']
    end
    
    end 
  end
end