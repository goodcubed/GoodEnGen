Rails.application.routes.draw do
   
  puts "loading routes from burrito engine"
  scope :module => "mexican_food" do
     resources :burritos
  end
end