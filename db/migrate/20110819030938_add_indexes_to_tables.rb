class AddIndexesToTables < ActiveRecord::Migration
  def self.up
    add_index :games, :season_id
    add_index :ticket_holders, :season_id
    change_table :tickets do |t|
      t.index :game_id
      t.index :ticket_holder_id
    end
  end

  def self.down
    change_table :tickets do |t|
      t.remove_index :ticket_holder_id
      t.remove_index :game_id
    end
    remove_index :ticket_holders, :column => :season_id
    remove_index :games, :column => :season_id
  end
end
