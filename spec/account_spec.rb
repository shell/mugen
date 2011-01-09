require 'spec_helper'

describe Mugen::Account do
  before(:each) do 
    Mugen.api_key = '6NO~NtyavKh@x-Uz@)0LG_PQ1KJI[(kd_2{oqv}H{ubO5Yu3is~IF^udRwM6QC6n'
    Mugen.private_key = 'w0F((zYj3=09(AD|2B7)jNT@5F[wajwk[6u^stF59wCfuCtwMEMB^c7y=5V~WM^K'
    @account = Mugen::Account.new   
  end                             
  
  it "should retrieve stats" do         
    stats = @account.stats   
    stats.should be_a(Hash)
    stats.should have_key('credits_spent')
    stats.should have_key('user_since')
  end
  
  it "should retrieve balance" do         
    balance = @account.balance
    balance.should be_a(Hash)
    balance.should have_key('credits')
  end
end