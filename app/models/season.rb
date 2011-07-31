class Season < ActiveRecord::Base
  has_many :games
  has_many :ticket_holders
end
