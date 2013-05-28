namespace :db do
  desc 'Run database migrations'
  task migrate: :environment do
    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(Beatnode::Database, 'db/migrate')
  end

  desc 'Rollback the database'
  task rollback: :environment do
    require 'sequel/extensions/migration'
    version = Beatnode::Database[:schema_info].first[:version]
    Sequel::Migrator.apply(Beatnode::Database, 'db/migrate', version - 1)
  end

  desc 'Nuke the database (drop all tables)'
  task drop: :environment do
    Beatnode::Database.tables.each do |table|
      Beatnode::Database.run("DROP TABLE #{table} CASCADE")
    end
  end

  desc 'Reset the database'
  task reset: [:drop, :migrate]
end
