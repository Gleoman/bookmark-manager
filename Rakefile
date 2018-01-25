require 'data_mapper'

task default: %w[auto_upgrade, auto_migrate]

desc "Upgrades a database"
task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "database upgraded"
end

desc "Migrates a database"
task :auto_migrate do
  DataMapper.auto_migrate!
  puts "migration completed"
end
