require 'spec_helper'

describe Adtools::Ou do
    it "should find them all" do
        standard_connection
        
        Adtools::Ou.find(:all).should be_a Array
    end
    
    it "should find a specific OU" do
        standard_connection
        
#        raise Adtools::Ou.find(:all).first.inspect
    end
end