require 'spec_helper'

describe ActiveDirectory::Computer do
    it "should find all" do
        standard_connection
        
        ActiveDirectory::Computer.find(:all).should be_a Array
    end
    
    it "should find a specific computer" do
        standard_connection
        
        ActiveDirectory::Computer.find(:first, :name => test_value("computer", "name")).should be_a ActiveDirectory::Computer
    end
end