class Game < ActiveRecord::Base
  belongs_to :season
  has_many :tickets

  after_create :create_game_tickets!

  def puck_drop
    self[:puck_drop] || Time.parse("#{Date.today} 19:00:00")
  end

  def available_tickets
    tickets.collect { |ticket| ticket if ticket.available? }.compact
  end

  private

  def create_game_tickets!
    4.times { tickets.create! }
  end
end
