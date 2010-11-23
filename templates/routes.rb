Rails.application.routes.draw do
   
  puts "loading routes from #{@underscored_model} engine"
  scope :module => "#{@underscored_module}" do
     resources :#{@underscored_model}s
  end
end