class CreateTicketHolders < ActiveRecord::Migration
  def self.up
    create_table :ticket_holders do |t|
      t.integer :season_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_holders
  end
end
