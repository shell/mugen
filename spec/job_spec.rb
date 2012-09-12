require 'spec_helper'

describe Mugen::Job do
  before(:each) do 
    Mugen.api_key = '6NO~NtyavKh@x-Uz@)0LG_PQ1KJI[(kd_2{oqv}H{ubO5Yu3is~IF^udRwM6QC6n'
    Mugen.private_key = 'w0F((zYj3=09(AD|2B7)jNT@5F[wajwk[6u^stF59wCfuCtwMEMB^c7y=5V~WM^K'
    @job = Mugen::Job
    @jobs = Mugen::Jobs.all
  end                             
  
  it "should retrieve job" do
    job = @job.find(@jobs.first['job_id'])
    job.should be_a(Hash)
    job['job_id'].should == @jobs.first['job_id']
   end
   
  it "should retrieve job" do
    job = @job.preview(@jobs.first['job_id'])
    # TODO: raw jpeg stream
 end
   
  
  
  # it "should retrieve jobs by group_id" do         
  #   balance = @jobs.by_group(1)
  #   # balance.should be_a(Array)
  #   # balance.should_not be_empty
  # end
  # 
  # it "should create jobs" do     
  #   job = {
  #       'slug' => 'API Job lazy loading test',
  #       'body_src' => 'Where in the world is Carmen San Diego?',
  #       'lc_src' => 'en',
  #       'lc_tgt' => 'ja',
  #       'tier' => 'standard'
  #   }
  #   balance = @jobs.create(job)
  # end            
end