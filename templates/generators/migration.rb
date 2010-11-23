class Create#{@camelized_model}sTable < ActiveRecord::Migration
  def self.up
    create_table :#{@underscored_model}s do |t|
      t.string :headline
      t.text :story
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :#{@underscored_model}s
  end
end
