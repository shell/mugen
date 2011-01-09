class Mygengo::AccountController < ApplicationController
  layout 'mygengo'
  
  def index    
    @account = Mugen::Account.balance || {}
    @stats = Mugen::Account.stats
    @account.merge! @stats if @stats
  end
end