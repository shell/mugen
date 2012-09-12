require 'spec_helper'

describe Mugen::Service do
  before(:each) do 
    Mugen.api_key = '6NO~NtyavKh@x-Uz@)0LG_PQ1KJI[(kd_2{oqv}H{ubO5Yu3is~IF^udRwM6QC6n'
    Mugen.private_key = 'w0F((zYj3=09(AD|2B7)jNT@5F[wajwk[6u^stF59wCfuCtwMEMB^c7y=5V~WM^K'
    @service = Mugen::Service
  end                             
  
  it "should retrieve language_pairs" do         
    stats = @service.language_pairs   
    stats.should be_a(Array)
    stats.should_not be_empty
  end
  
  it "should retrieve languages" do         
    balance = @service.languages
    balance.should be_a(Array)
    balance.should_not be_empty
  end
end