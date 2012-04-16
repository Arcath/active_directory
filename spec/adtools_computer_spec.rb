require 'spec_helper'

describe Adtools::Computer do
    it "should find all" do
        standard_connection

        Adtools::Computer.find(:all).should be_a Array
    end
    
    it "should find a specific computer" do
        standard_connection
        
        #Adtools::Computer.find(:first, :name => test_value("computer", "name")).should be_a Adtools::Computer
    end
end