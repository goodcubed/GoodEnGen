puts 'loading dependencies.....'

require 'rake'
require 'en_gen.rb'
require 'rubygems'
require 'active_support'
require 'active_support/inflector'

include FileUtils

   
begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "good_blurb"
    gem.summary = "Blurb engine for GoodContent management system"
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    # other fields that would normally go in your gemspec
    # like authors, email and has_rdoc can also be included here

  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end

begin
   puts 'do I work from here?'
   task :test, :load do |t, args|
      puts 'yup.  now will I load my generator class?'
      EnGen.new
   end
   
   namespace :EnGen do
      task :test, :load do |t, args|
         puts "yup.  plus, someone passed me the option '#{args[:load]}'"
         puts 'now will I load my generator class?'
         EnGen.new
      end

      
      namespace :engine do
         task :new, :engine_name, :library_name, :model_name, :target_path do |t, args|
            args.with_defaults(:engine_name => 'good_engine', :library_name => 'engine', :model_name => 'thing', :target_path => Dir.pwd)
            
            
            engine = args[:engine_name]
            library = args[:library_name]
            model = args[:model_name]
            @camelized_engine = engine.camelize
            @camelized_module = library.camelize
            @camelized_model = model.camelize
            @underscored_engine = engine.underscore
            @underscored_module = library.underscore
            @underscored_model = model.underscore

            target = "#{args[:target_path]}/#{@underscored_engine}"
            app = "#{target}/app"


            puts "okay, I'm getting ready to create an engine named '#{@underscored_engine}'"
            puts "that contains a library named '#{@underscored_module}'"
            puts "in #{target}.  Let's go!"


            [target, 
               app,
                 "#{app}/controllers","#{app}/controllers/#{@underscored_module}", 
                 "#{app}/models","#{app}/models/#{@underscored_module}", 
                 "#{app}/helpers","#{app}/helpers/#{@underscored_module}", 
                 "#{app}/views","#{app}/views/#{@underscored_module}", 
               "#{target}/config",
               "#{target}/lib",
                  "#{target}/lib/generators",
                     "#{target}/lib/generators/#{@underscored_module}",
                        "#{target}/lib/generators/#{@underscored_module}/templates",
                     "#{target}/lib/#{@underscored_module}"
             ].each do | dir |
                FileUtils.mkdir dir
            end
            
            
            File.open("#{app}/controllers/#{@underscored_module}/#{@underscored_model.pluralize}_controller.rb", 'w') {|f| f.puts(File.open("templates/controller.rb").read) }
            
            
            # FileUtils.cp("templates/controller.rb","#{app}/controllers/#{@underscored_module}/#{@underscored_model.pluralize}_controller.rb")
            #       FileUtils.cp("templates/model.rb","#{app}/models/#{@underscored_module}/#{@underscored_model.singularize}.rb")
            #       FileUtils.cp("templates/controller.rb","#{app}/models/#{@underscored_module}/#{@underscored_model.singularize}.rb")
            #       
                  
            # FileUtils.mkdir
            
         end


      end

   end

rescue
   'nope.'
end