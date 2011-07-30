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
    context 'ticket_holders' do
      let!(:season) { Season.create! }
      let!(:expected_ticket_holders) do
        [
          TicketHolder.create!(:season_id => season.id),
          TicketHolder.create!(:season_id => season.id)
        ]
      end

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
