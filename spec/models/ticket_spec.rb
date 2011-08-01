require 'spec_helper'

describe Ticket do
  describe '#game_id' do
    it 'is available' do
      subject.should respond_to(:game_id)
    end

    it 'can be assigned' do
      subject.game_id.should be_nil
      subject.game_id = 1
      subject.game_id.should eq(1)
    end
  end

  describe '#ticket_holder_id' do
    it 'is available' do
      subject.should respond_to(:ticket_holder_id)
    end

    it 'can be assigned' do
      subject.ticket_holder_id.should be_nil
      subject.ticket_holder_id = 1
      subject.ticket_holder_id.should eq(1)
    end
  end

  describe 'associations' do
    context 'game' do
      let!(:expected_game) { Game.create! }
      let!(:ticket) { Ticket.create!(:game_id => expected_game.id) }

      subject { ticket }

      it 'is established' do
        subject.should respond_to(:game)
      end

      it 'returns related game' do
        subject.game.should eq(expected_game)
      end
    end

    context 'holder' do
      let!(:expected_holder) { TicketHolder.create! }
      let!(:ticket) { Ticket.create!(:ticket_holder_id => expected_holder.id) }

      subject { ticket }

      it 'is established' do
        subject.should respond_to(:holder)
      end

      it 'returns related holder' do
        subject.holder.should eq(expected_holder)
      end
    end
  end

  describe 'validations' do
    context 'holder ticket count' do
      let!(:ticket_holder) { TicketHolder.create! }

      context 'valid' do
        it 'is under the max' do
          subject.ticket_holder_id = ticket_holder.id
          subject.should be_valid
        end
      end

      context 'invalid' do
        let(:expected_error_msg) { [ 'must be ticket holder who does not have the maximum tickets' ] }

        before do
          15.times { ticket_holder.tickets.create! }
          subject.ticket_holder_id = ticket_holder.id
        end

        it 'is at the max' do
          subject.should be_invalid
        end

        it 'adds error on ticket_holder_id' do
          subject.valid?
          subject.should have(1).error_on(:ticket_holder_id)
        end

        it 'adds max tickets message to errors' do
          subject.valid?
          subject.errors[:ticket_holder_id].should eq(expected_error_msg)
        end
      end
    end
  end

  describe '#available?' do
    it 'is responded to' do
      subject.should respond_to(:available?)
    end

    context 'ticket_holder_id is nil' do
      let(:ticket) { Ticket.create!(:ticket_holder_id => nil) }

      subject { ticket }

      it 'returns true' do
        subject.available?.should be_true
      end
    end

    context 'ticket_holder_id is defined' do
      let(:ticket_holder) { TicketHolder.create! }
      let(:ticket) { Ticket.create!(:ticket_holder_id => ticket_holder.id) }

      subject { ticket }

      it 'returns false' do
        subject.available?.should be_false
      end
    end
  end
end
