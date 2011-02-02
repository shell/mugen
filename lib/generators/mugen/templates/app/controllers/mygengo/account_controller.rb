class Mygengo::AccountController < Mygengo::MygengoController
  
  def index                         
    mygengo_requests do 
      @account = Mugen::Account.balance || {}
      @stats = Mugen::Account.stats
    end             
    
    @account.merge! @stats if @stats    
  end  
      
end