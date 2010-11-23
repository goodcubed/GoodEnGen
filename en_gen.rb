require 'rails/generators'

class EnGen < Rails::Generators::Base
   include FileUtils
   desc "
   Description:
   run this generator to create a rails3 engine, ready for customization
   
   Usage:
     rake en_gen ~/path/to/target/destination
     
   This generates the skeleton of a Rails engine ready to use with the GoodContent CMS... 
   and hopefully for some other purposes as well.
   "
   def initialize
      @original_wd = Dir.pwd
      super
      puts 'yup.  my generator class is loaded.'
      puts "#{@original_wd}"
   end
   
   def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'good_blurb')
   end
   
   def create_root
      self.destination_root = File.expand_path(app_path, destination_root)
      valid_const?

      empty_directory '.'
      set_default_accessors!
      FileUtils.cd(destination_root) unless options[:pretend]
    end
   
end