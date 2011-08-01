class TicketHolder < ActiveRecord::Base
  belongs_to :season
  has_many :tickets

  def max_tickets_claimed?
    tickets.count >= 15
  end
end
