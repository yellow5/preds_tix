class TicketHolder < ActiveRecord::Base
  belongs_to :season
  has_many :tickets
end
