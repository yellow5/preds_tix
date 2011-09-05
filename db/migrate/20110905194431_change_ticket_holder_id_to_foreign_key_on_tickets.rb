class ChangeTicketHolderIdToForeignKeyOnTickets < ActiveRecord::Migration
  def up
    add_foreign_key :tickets, :ticket_holders, :dependent => :nullify
  end

  def down
    remove_foreign_key :tickets, :ticket_holders
  end
end
