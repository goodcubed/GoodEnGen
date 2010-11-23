# EnDeGen Rails App to Engine DeGenerator template
# By Michelle Lupei

require ''

# Delete unnecessary files
   run "rm README"
   run "touch README"
   run "rm app/controllers/application_controller.rb"
   run "rm app/views/layouts/application.html.erb"
   run "rm -rf config/*"
   run "rm config.ru"
   run "rm -rf doc"
   run "rm Gemfile"
   run "rm -rf lib/tasks"
   run "rm -rf log"
   run "rm -rf public"
   run "rm Rakefile"
   run "rm -rf script"
   run "rm -rf test"
   run "rm -rf tmp"



# Set up git repository
  git :init
  git :add => '.'
  
  git :commit => "-a -m 'Initial commit'"

# Success!
  puts "SUCCESS!"