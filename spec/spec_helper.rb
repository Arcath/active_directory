require 'lib/active_directory'  # Load the Gem
require 'yaml'                  # Load YAML (for test_values.yml)

def test_value(obj, val)
    @yaml ||= YAML::load(File.open("spec/test_values.yml"))
    @yaml[obj][val]
end