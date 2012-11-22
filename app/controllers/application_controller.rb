class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate
  before_filter :assign_current_season!
  before_filter :assign_ticket_holders!

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASS']
    end if Rails.env.production?
  end

  def assign_current_season!
    @current_season = Season.order('years desc').first
  end

  def assign_ticket_holders!
    @ticket_holders = TicketHolder.order('name')
  end
end
