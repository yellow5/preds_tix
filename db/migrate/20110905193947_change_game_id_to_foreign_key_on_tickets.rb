class ChangeGameIdToForeignKeyOnTickets < ActiveRecord::Migration
  def up
    add_foreign_key :tickets, :games, :dependent => :delete
  end

  def down
    remove_foreign_key :tickets, :games
  end
end
