require 'sequel'
require 'pg'

config = YAML.load(File.read(Rails.root.join 'config', 'database.yml'))
Beatnode::Database = Sequel.connect(config.fetch(Rails.env))
