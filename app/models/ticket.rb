class Ticket < ActiveRecord::Base
  belongs_to :game
  belongs_to :holder, :class_name => 'TicketHolder', :foreign_key => 'ticket_holder_id'

  def available?
    holder.blank?
  end
end
