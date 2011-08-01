class Ticket < ActiveRecord::Base
  belongs_to :game
  belongs_to :holder, :class_name => 'TicketHolder', :foreign_key => 'ticket_holder_id'

  validate :holder_eligibility

  def available?
    holder.blank?
  end

  private

  def holder_eligibility
    errors.add(
      :ticket_holder_id,
      'must be ticket holder who does not have the maximum tickets'
    ) if holder && holder.max_tickets_claimed?
  end
end
