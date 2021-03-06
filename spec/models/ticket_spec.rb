require 'spec_helper'

describe Ticket do
  describe 'attributes' do
    it { should have_db_column(:game_id).of_type(:integer) }
    it { should have_db_column(:ticket_holder_id).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'indexes' do
    it { should have_db_index(:game_id) }
    it { should have_db_index(:ticket_holder_id) }
  end

  describe 'foreign keys' do
    it { should have_foreign_key_for(:game, :dependent => :delete) }
    it { should have_foreign_key_for(:ticket_holder, :dependent => :nullify) }
  end

  describe 'associations' do
    it { should belong_to(:game) }
    it { should belong_to(:holder) }
  end

  describe 'validations' do
    context 'holder ticket count' do
      let!(:ticket_holder) { TicketHolder.create! }

      before { subject.holder = ticket_holder }

      context 'valid' do
        it 'is under the max' do
          ticket_holder.stub(:max_tickets_claimed?).and_return(false)
          subject.should be_valid
        end
      end

      context 'invalid' do
        let(:expected_error_msg) { [ 'must be ticket holder who does not have the maximum tickets' ] }

        before do
          ticket_holder.stub(:max_tickets_claimed?).and_return(true)
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
      let(:ticket) { Ticket.new(:ticket_holder_id => ticket_holder.id) }

      subject { ticket }

      it 'returns false' do
        subject.available?.should be_false
      end
    end
  end
end
