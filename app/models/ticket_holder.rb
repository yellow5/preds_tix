class TicketHolder < ActiveRecord::Base
  belongs_to :season
  has_many :tickets
  has_many :games, -> { order(:puck_drop).uniq }, :through => :tickets

  def max_tickets_claimed?
    tickets.count >= season.tickets.count / season.ticket_holders.count
  end
end
