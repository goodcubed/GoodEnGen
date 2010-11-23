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
   
   namespace :EnGen do

      namespace :engine do
         task :new, :engine_name, :library_name, :model_name, :target_path do |t, args|
            @args = args.with_defaults(  :engine_name => 'good_blurb', 
                                          :library_name => 'good_blurb', 
                                          :model_name => 'blurb', 
                                          :target_path => "#{Dir.pwd}/tests/test_1")
            
            generate_names(args)
            puts "okay, I'm getting ready to create an engine named '#{@underscored_engine}'"
            puts "that contains a library named '#{@underscored_module}'"
            puts "in #{@target}.  Let's go!"
            
            puts '... generating directory structure'
            create_directory_structure

            puts '... customizing framework'
            build_framework
            puts '... generating model'
            build_model
            add_views
            
            puts "w00t!  wasn't that easy?"
         end
      end
      namespace :model do
         task :new, :engine_name, :library_name, :model_name, :target_path do |t, args|
            @args = args.with_defaults(  :engine_name => 'good_blurb', 
                                          :library_name => 'good_blurb', 
                                          :model_name => 'blurb', 
                                          :target_path => "#{Dir.pwd}/tests/test_1")
            
            generate_names(args)
            puts "okay, I'm getting ready to a model named #{@underscored_model} in the '#{@camelized_engine}' engine named "
            puts "module named '#{@underscored_module}'"
            puts "in #{@target}.  Be forewarned, I'm not as useful as the engine generator..."
            puts "you'll have to customize your migration, add the new route, and tweak the views manually. "
            puts "otherwise, let's go!"

            puts '... generating model'
            build_model
            add_views
            puts "w00t!  wasn't that easy?"
         end
         
      end
   end

rescue
   'nope.'
end

def generate_names(args)
   engine = args[:engine_name]
   library = args[:library_name]
   model = args[:model_name]
   @camelized_engine = engine.camelize
   @camelized_module = library.camelize
   @camelized_model = model.camelize
   @underscored_engine = engine.underscore
   @underscored_module = library.underscore
   @underscored_model = model.underscore

   @target = "#{args[:target_path]}/#{@underscored_engine}"
   @app = "#{@target}/app"
end

def update_variables(template, destination)
   f=  File.open(template)
   s=f.read
   f.close
   trans = s.gsub("UnderscoredModule", @underscored_module).gsub("UnderscoredModel", @underscored_model).gsub("CamelizedModel",@camelized_model).gsub("CamelizedModule",@camelized_module).gsub("CamelizedEngine",@camelized_engine)
   File.open(destination, 'w') {|f| f.write(trans) }
end

def create_directory_structure
   ["#{@args[:target_path]}",
      @target, 
      @app,
        "#{@app}/controllers","#{@app}/controllers/#{@underscored_module}", 
        "#{@app}/models","#{@app}/models/#{@underscored_module}", 
        "#{@app}/helpers","#{@app}/helpers/#{@underscored_module}", 
        "#{@app}/views","#{@app}/views/#{@underscored_module}", "#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}",
      "#{@target}/config",
      "#{@target}/lib",
         "#{@target}/lib/generators",
            "#{@target}/lib/generators/#{@underscored_module}",
               "#{@target}/lib/generators/#{@underscored_module}/templates",
            "#{@target}/lib/#{@underscored_module}"
    ].each do | dir |
       p dir
       FileUtils.mkdir dir
   end
end

def build_framework
   update_variables("templates/routes.rb","#{@target}/config/routes.rb")
   update_variables("templates/generators/generator.rb","#{@target}/lib/generators/#{@underscored_module}/#{@underscored_model.singularize}_generator.rb")
   update_variables("templates/generators/migration.rb","#{@target}/lib/generators/#{@underscored_module}/templates/migration.rb")
   update_variables("templates/engine.rb","#{@target}/lib/#{@underscored_module}/engine.rb")
   update_variables("templates/lib.rb","#{@target}/lib/#{@underscored_module}.rb")
   
end

def build_model
   update_variables("templates/controller.rb","#{@app}/controllers/#{@underscored_module}/#{@underscored_model.pluralize}_controller.rb")
   update_variables("templates/model.rb","#{@app}/models/#{@underscored_module}/#{@underscored_model.singularize}.rb")
   update_variables("templates/model.rb","#{@app}/models/#{@underscored_module}/#{@underscored_model.singularize}.rb")
end

def add_views
   FileUtils.mkdir "#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}"
   update_variables("templates/views/_form.html.erb","#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}/_form.html.erb")
   update_variables("templates/views/edit.html.erb","#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}/edit.html.erb")
   update_variables("templates/views/index.html.erb","#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}/index.html.erb")
   update_variables("templates/views/new.html.erb","#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}/new.html.erb")
   update_variables("templates/views/show.html.erb","#{@app}/views/#{@underscored_module}/#{@underscored_model.pluralize}/show.html.erb")
end
   