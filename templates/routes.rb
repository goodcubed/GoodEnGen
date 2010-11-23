Rails.application.routes.draw do
   
  puts "loading routes from UnderscoredModel engine"
  scope :module => "UnderscoredModule" do
     resources :UnderscoredModels
  end
end