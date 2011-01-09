require "spec_helper"

describe Mugen do
  it "should raise error if API URL is not specified" do
    Mugen.api_url.should == 'http://api.sandbox.mygengo.com/v1/'
  end

  it "should set API URL" do
    Mugen.api_url = "http://foobar.com"
    Mugen.api_url.should == "http://foobar.com"
  end

  it "should set API username" do
    Mugen.api_key = "12345"
    Mugen.api_key.should == "12345"
  end

  it "should raise error if API username is not specified" do
    Mugen.api_key = nil
    lambda { Mugen.api_key }.should raise_error
  end
  
  it "should set API password" do
    Mugen.private_key = "12345"
    Mugen.private_key.should == "12345"
  end

  it "should raise error if API password is not specified" do
    Mugen.private_key = nil
    lambda { Mugen.private_key }.should raise_error
  end
  
end