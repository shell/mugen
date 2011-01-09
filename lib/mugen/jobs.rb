module Mugen
  class Jobs < Client
    class << self
    #
    # translate/jobs (GET)
    #
    # Retrieves a list of resources for the most recent jobs filtered
    # by the given parameters.
    #
    def all(options={})
      res = self.get "/translate/jobs", :query => Mugen.set_params(options) 
      check_for_errors(res)
      res['response']
    end
    

    #
    # translate/jobs/{id} (GET)
    #
    # Retrieves the group of jobs that were previously submitted
    # together.
    #
    def by_group(id, options={})
      res = self.get "/translate/jobs/#{id}", :query => Mugen.set_params(options) 
      check_for_errors(res)
      res['response']
    end            
    
    #
    # translate/jobs (POST)
    #
    # Submits a job or group of jobs to translate.
    #
    def create(options = {})
      res = self.post "/translate/jobs", :body => Mugen.set_params(options) 
      check_for_errors(res)
      res['response']
    end
   
    end 
  end
end