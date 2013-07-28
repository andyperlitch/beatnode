require 'fog'
require 'erb'
require 'yaml'
require 'beatnode'

text   = File.read(Rails.root.join('config', 'storage.yml'))
yaml   = ERB.new(text).result(binding)
config = YAML.load(yaml)[Rails.env].symbolize_keys

connection = Fog::Storage.new(config)
storage    = Beatnode::Storage.new(connection)

Beatnode.storage = storage
