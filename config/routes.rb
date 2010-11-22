Rails.application.routes.draw do |map|
  resources :blurbs, :controller => 'good_blurb/blurbs'
end