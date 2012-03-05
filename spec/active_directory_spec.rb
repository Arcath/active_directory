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
    
    it "should work with block config" do
        ActiveDirectory.configure do |c|
            c.domain = test_value("domain","domain")
            c.base = test_value("domain", "base")
            c.port = test_value("domain", "port")
            c.server = test_value("domain", "host")
            c.query_user = test_value("domain", "query_user")
            c.query_password = test_value("domain", "query_password")
        end
        
        ActiveDirectory::User.find(:all).should be_a Array
    end
    
    it "should assume values correctly" do
        ActiveDirectory.configure do |c|
            c.domain = "example.com"
        end
        
        ActiveDirectory.config.port.should eq 389
        ActiveDirectory.config.base.should eq "dc=example, dc=com"
        ActiveDirectory.config.server.should eq "example.com"
    end
end