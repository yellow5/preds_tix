require 'spec_helper'

describe Season do
  describe '#years' do
    it 'is available' do
      subject.should respond_to(:years)
    end

    it 'can be assigned' do
      subject.years.should be_nil
      subject.years = '2011-2012'
      subject.years.should == '2011-2012'
    end
  end

  describe 'associations' do
    context 'games' do
      let!(:season) { Season.create! }
      let!(:game1) { Game.create!(:season_id => season.id) }
      let!(:game2) { Game.create!(:season_id => season.id) }
      let(:expected_games) { [ game2, game1 ] }

      subject { season }

      it 'is established' do
        subject.should respond_to(:games)
      end

      it 'returns related records' do
        subject.games.should eq(expected_games)
      end
    end

    context 'ticket_holders' do
      let!(:season) { Season.create! }
      let!(:ticket_holder1) { TicketHolder.create!(:season_id => season.id) }
      let!(:ticket_holder2) { TicketHolder.create!(:season_id => season.id) }
      let(:expected_ticket_holders) { [ ticket_holder2, ticket_holder1 ] }

      subject { season }

      it 'is established' do
        subject.should respond_to(:ticket_holders)
      end

      it 'returns related records' do
        subject.ticket_holders.should == expected_ticket_holders
      end
    end
  end
end
