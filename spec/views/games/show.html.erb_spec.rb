require 'spec_helper'

describe "games/show.html.erb" do
  let(:puck_drop) { 2.months.from_now }
  let!(:game) { Game.create!(:puck_drop => puck_drop, :opponent => 'Boston Bruins') }

  before do
    assign(:game, game)
  end

  it 'displays puck_drop and opponent in header' do
    render
    rendered.should match("#{game.puck_drop.to_s(:pretty)} - #{game.opponent}")
  end

  context 'preaseon game' do
    before do
      game.update_attributes!(:preseason => true)
    end

    it 'identifies the game as preseason' do
      render
      rendered.should match('Preseason')
    end

    it 'does not identify the game as regular season' do
      render
      rendered.should_not match('Regular Season')
    end
  end

  context 'regular season game' do
    before do
      game.update_attributes!(:preseason => false)
    end

    it 'identifies the game as regular season' do
      render
      rendered.should match('Regular Season')
    end

    it 'does not identify the game as preseason' do
      render
      rendered.should_not match('Preseason')
    end
  end
end
