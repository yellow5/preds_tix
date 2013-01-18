class Season < ActiveRecord::Base
  has_many :games
  has_many :tickets, :through => :games
  has_many :ticket_holders
end
