class CreateCamelizedModelsTable < ActiveRecord::Migration
  def self.up
    create_table :UnderscoredModels do |t|
      t.string :headline
      t.text :story
      t.integer :creator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :UnderscoredModels
  end
end
