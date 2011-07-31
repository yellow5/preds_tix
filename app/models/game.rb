class Game < ActiveRecord::Base
  belongs_to :season
  has_many :tickets

  after_create :create_game_tickets!

  private

  def create_game_tickets!
    4.times do
      tickets.create!
    end
  end
end
