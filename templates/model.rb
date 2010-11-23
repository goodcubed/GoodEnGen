class #{@camelized_module}::#{@camelized_model} < ActiveRecord::Base
   set_table_name :#{@underscored_model}s
end