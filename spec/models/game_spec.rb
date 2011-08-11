require 'spec_helper'

describe Game do
  describe '#season_id' do
    it 'is available' do
      subject.should respond_to(:season_id)
    end

    it 'can be assigned' do
      subject.season_id.should be_nil
      subject.season_id = 1
      subject.season_id.should eq(1)
    end
  end

  describe '#puck_drop' do
    it 'is available' do
      subject.should respond_to(:puck_drop)
    end

    it 'can be assigned' do
      subject.puck_drop = 1.month.from_now
      subject.puck_drop.to_s.should eq(1.month.from_now.to_s)
    end

    it 'defaults to today at 7pm' do
      subject.puck_drop.to_s(:db).should == "#{Date.today} 19:00:00"
    end
  end

  describe '#opponent' do
    it 'is available' do
      subject.should respond_to(:opponent)
    end

    it 'can be assigned' do
      subject.opponent.should be_nil
      subject.opponent = 'Vancouver Canucks'
      subject.opponent.should eq('Vancouver Canucks')
    end
  end

  describe '#preseason' do
    it 'is available' do
      subject.should respond_to(:preseason)
    end

    it 'defaults to false' do
      subject.preseason.should_not be_nil
      subject.preseason.should be_false
    end

    it 'can be assigned' do
      subject.preseason = true
      subject.preseason.should be_true
    end
  end

  describe 'associations' do
    context 'season' do
      let!(:expected_season) { Season.create! }
      let!(:game) { Game.create!(:season_id => expected_season.id) }

      subject { game }

      it 'is established' do
        subject.should respond_to(:season)
      end

      it 'returns related season' do
        subject.season.should eq(expected_season)
      end
    end

    context 'games' do
      let!(:game) { Game.create! }
      let(:expected_tickets) { Ticket.all(:conditions => { :game_id => game.id }) }

      subject { game }

      it 'is established' do
        subject.should respond_to(:tickets)
      end

      it 'returns related records' do
        subject.tickets.should eq(expected_tickets)
      end
    end
  end

  describe 'after create' do
    context 'four new tickets' do
      let(:game) { Game.new }

      it 'are created' do
        expect { game.save! }.should change { game.tickets.count }.by(4)
      end

      it 'are not created when saving existing record' do
        game.save!
        expect { game.save! }.should_not change { game.tickets.count }.by(4)
      end
    end
  end

  describe '#available_tickets' do
    let!(:game) { Game.create! }
    let!(:ticket_holder) { TicketHolder.create! }
    let(:expected_available_tickets) { Array.new }

    before do
      game.tickets.each_with_index do |ticket, index|
        if index == 0
          expected_available_tickets << ticket
        else
          ticket.update_attributes!(:ticket_holder_id => ticket_holder.id)
        end
      end
    end

    subject { game }

    it 'is responded to' do
      subject.should respond_to(:available_tickets)
    end

    it 'returns available tickets for the game' do
      subject.available_tickets.should eq(expected_available_tickets)
    end
  end
end
