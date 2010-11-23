# lib/generators/#{@underscored_module}/#{@underscored_model}_generator.rb
require 'rails/generators'
require 'rails/generators/migration'     


class #{@camelized_module}::#{@camelized_model}Generator < Rails::Generators::Base
   include Rails::Generators::Migration

   desc "This generator creates the migration required to support the #{@camelized_module} engine in GoodContent Manager"

   def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
   end

   def self.next_migration_number(dirname)
     if ActiveRecord::Base.timestamped_migrations
       Time.now.utc.strftime("%Y%m%d%H%M%S")
     else
       "%.3d" % (current_migration_number(dirname) + 1)
     end
   end

   def create_migration_file
     migration_template 'migration.rb', 'db/migrate/create_#{@underscored_model}s_table.rb'
   end

end