require 'spec_helper'

describe Adtools do
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
        
        Adtools::Base.setup(settings)

        Adtools::User.find(:all).should be_a Array
    end
    
    it "should work with block config" do
        Adtools.configure do |c|
            c.domain = test_value("domain","domain")
            c.base = test_value("domain", "base")
            c.port = test_value("domain", "port")
            c.server = test_value("domain", "host")
            c.query_user = test_value("domain", "query_user")
            c.query_password = test_value("domain", "query_password")
        end
        
        Adtools::User.find(:all).should be_a Array
    end
    
    it "should assume values correctly" do
        Adtools.configure do |c|
            c.domain = "example.com"
        end
        
        Adtools.config.port.should eq 389
        Adtools.config.base.should eq "dc=example, dc=com"
        Adtools.config.server.should eq "example.com"
    end
end