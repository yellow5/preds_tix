class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :season_id
      t.datetime :puck_drop
      t.string :opponent
      t.boolean :preseason, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
