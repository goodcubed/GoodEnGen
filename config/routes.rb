Rails.application.routes.draw do
   
  puts "loading routes from blurb engine"
  scope :module => "good_blurb" do
     resources :blurbs
  end
end