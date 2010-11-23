class CreateBurritosTable < ActiveRecord::Migration
  def self.up
    create_table :burritos do |t|
      t.string :headline
      t.text :story
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :burritos
  end
end
