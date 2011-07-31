class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :game_id
      t.integer :ticket_holder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
