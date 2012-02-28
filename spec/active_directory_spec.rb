require 'spec_helper'

describe ActiveDirectory do
    it "should connect" do
        settings = {
            :host => test_value("domain", "host"),
            :base => test_value("domain", "base"),
            :port => test_value("domain", "port"),
            :auth => {
              :method => :simple,
              :username => "#{test_value("domain", "query_user")}@#{test_value("domain","domain")}",
              :password => test_value("domain", "query_password")
            }
        }
        
        ActiveDirectory::Base.setup(settings)

        ActiveDirectory::User.find(:all).should be_a Array
    end
end