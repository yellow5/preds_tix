class ChangeSeasonIdToForeignKeyOnTicketHolders < ActiveRecord::Migration
  def up
    add_foreign_key :ticket_holders, :seasons, :dependent => :delete
  end

  def down
    remove_foreign_key :ticket_holders, :seasons
  end
end
