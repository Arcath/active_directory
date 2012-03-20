require 'lib/active_directory'  # Load the Gem
require 'yaml'                  # Load YAML (for test_values.yml)

def test_value(obj, val)
    @yaml ||= YAML::load(File.open("spec/test_values.yml"))
    @yaml[obj][val]
end

def standard_connection
    ActiveDirectory.configure do |c|
        c.domain = test_value("domain","domain")
        c.base = test_value("domain", "base")
        c.port = test_value("domain", "port")
        c.server = test_value("domain", "host")
        c.query_user = test_value("domain", "query_user")
        c.query_password = test_value("domain", "query_password")
    end
end