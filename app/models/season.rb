class Season < ActiveRecord::Base
  has_many :ticket_holders
end
