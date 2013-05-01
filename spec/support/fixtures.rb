require 'yaml'

def Fixture(name)
  file_path = File.expand_path("../../fixtures/#{name}.yml", __FILE__)

  if File.exists?(file_path)
    YAML::load File.read(file_path)
  else
    raise ArgumentError, "No fixture for #{name.inspect}"
  end
end
