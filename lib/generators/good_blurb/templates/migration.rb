class CreateBlurbsTable < ActiveRecord::Migration
  def self.up
    create_table :blurbs do |t|
      t.string :headline
      t.text :story
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :blurbs
  end
end
