require 'spec_helper'

describe TicketHolder do
  describe '#season_id' do
    it 'is available' do
      subject.should respond_to(:season_id)
    end

    it 'can be assigned' do
      subject.season_id.should be_nil
      subject.season_id = 1
      subject.season_id.should == 1
    end
  end

  describe '#name' do
    it 'is available' do
      subject.should respond_to(:name)
    end

    it 'can be assigned' do
      subject.name.should be_nil
      subject.name = 'Master Yoda'
      subject.name.should == 'Master Yoda'
    end
  end

  describe 'associations' do
    context 'season' do
      let!(:expected_season) { Season.create! }
      let!(:ticket_holder) { TicketHolder.create!(:season_id => expected_season.id) }

      subject { ticket_holder }

      it 'is established' do
        subject.should respond_to(:season)
      end

      it 'returns related season' do
        subject.season.should == expected_season
      end
    end

    context 'tickets' do
      let!(:ticket_holder) { TicketHolder.create! }
      let!(:expected_tickets) do
        [
          Ticket.create!(:ticket_holder_id => ticket_holder.id),
          Ticket.create!(:ticket_holder_id => ticket_holder.id)
        ]
      end

      subject { ticket_holder }

      it 'is established' do
        subject.should respond_to(:tickets)
      end

      it 'returns related records' do
        subject.tickets.should eq(expected_tickets)
      end
    end
  end

  describe '#max_tickets_claimed?' do
    let!(:ticket_holder) { TicketHolder.create! }

    subject { ticket_holder }

    it 'is responded to' do
      subject.should respond_to(:max_tickets_claimed?)
    end

    context 'claimed ticket count < 15' do
      before do
        14.times do
          ticket_holder.tickets.create!
        end
      end

      it 'returns false' do
        subject.max_tickets_claimed?.should be_false
      end
    end

    context 'claimed_ticket count >= 15' do
      before do
        15.times do
          ticket_holder.tickets.create!
        end
      end

      it 'returns true' do
        subject.max_tickets_claimed?.should be_true
      end
    end
  end
end
