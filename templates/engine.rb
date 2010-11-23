#lib/#{@underscored_module}/engine.rb
require '#{@underscored_module}'
require "rails"


module #{@camelized_module}
 class Engine < Rails::Engine
    
  end
end