class TicketHolder < ActiveRecord::Base
  belongs_to :season
  has_many :tickets
  has_many :games, :through => :tickets, :uniq => true, :order => :puck_drop

  def max_tickets_claimed?
    tickets.count >= 15
  end
end
