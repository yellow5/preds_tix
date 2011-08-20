class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :assign_ticket_holders!

  protected

  def assign_ticket_holders!
    @ticket_holders = TicketHolder.all(:order => 'name')
  end
end
