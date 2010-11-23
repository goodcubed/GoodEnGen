# lib/generators/UnderscoredModule/UnderscoredModel_generator.rb
require 'rails/generators'
require 'rails/generators/migration'     


class CamelizedModule::CamelizedModelGenerator < Rails::Generators::Base
   include Rails::Generators::Migration

   desc "This generator creates the migration required to support the CamelizedEngine engine in GoodContent Manager"

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
     migration_template 'create_UnderscoredModels_table.rb', 'db/migrate/create_UnderscoredModels_table.rb'
   end

end