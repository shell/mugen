require 'active_support'
require 'cgi'      
require 'hmac-sha1'
require 'httparty'
require 'mugen/core_extensions'
require 'mugen/httparty_extensions'

module Mugen  
  extend self
  
  autoload :Client, 'mugen/client'
  autoload :Account, 'mugen/account'
  autoload :Service, 'mugen/service'
  autoload :Jobs, 'mugen/jobs'
  autoload :Job, 'mugen/job'
  
  @@errors = []

  def api_url=(url)
    @api_url = url
  end

  def api_url
    @api_url || 'http://api.sandbox.mygengo.com/v1/'
  end
  
  def api_key=(key)
    @api_key = key
  end

  def api_key
    @api_key or raise "API_KEY is not specified"
  end
  
  def private_key=(key)
    @private_key = key
  end

  def private_key
    @private_key or raise "PRIVATE_KEY is not specified"
  end   
  
  def errors
    @@errors || []
  end

  def sign(private_key, data)
    if Hash === data
      sorted_keys = data.keys.sort
      data = sorted_keys.zip(data.values_at(*sorted_keys)).map {|k, v|
        "#{k}=#{CGI::escape(v.to_s)}"
      } * '&'          
    end
    
    HMAC::SHA1.hexdigest private_key, data
  end
  
  def set_params(options = {}, method = :get)
    params = ActiveSupport::OrderedHash.new
    params.merge! '_method' => 'post' if method == :post
    params.merge! 'api_key' => Mugen.api_key
    params.merge! 'data' => options.to_json unless options.empty? 
    params.merge! 'ts' => Time.now.gmtime.to_i.to_s
    if method == :get 
      params.merge! 'api_sig' => sign(Mugen.private_key, params)
    else
      params.merge! 'api_sig' => sign(Mugen.private_key, params.to_json.gsub('/', '\/'))
    end
      
    params
  end
    
end