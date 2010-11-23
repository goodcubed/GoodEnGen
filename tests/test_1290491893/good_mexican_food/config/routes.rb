Rails.application.routes.draw do
   
  puts "loading routes from burrito engine"
  scope :module => "mexican" do
     resources :burritos
  end
end