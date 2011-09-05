require 'spec_helper'

describe TicketHolder do
  describe 'attributes' do
    it { should have_db_column(:season_id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'indexes' do
    it { should have_db_index(:season_id) }
  end

  describe 'associations' do
    it { should belong_to(:season) }
    it { should have_many(:tickets) }
    it { should have_many(:games).through(:tickets).order(:puck_drop) }

    context 'unique games' do
      let!(:ticket_holder) { TicketHolder.create! }
      let!(:game1) do
        Game.create!(:puck_drop => 1.weeks.from_now).tap do |game|
          2.times do
            game.tickets.create!(:ticket_holder_id => ticket_holder.id)
          end
        end
      end
      let!(:game2) do
        Game.create!(:puck_drop => 2.week.from_now).tap do |game|
          2.times do
            game.tickets.create!(:ticket_holder_id => ticket_holder.id)
          end
        end
      end
      let(:expected_games) { [ game1, game2 ] }

      subject { ticket_holder }

      it 'returns grouped related records' do
        subject.games.should eq(expected_games)
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
        14.times { ticket_holder.tickets.create! }
      end

      it 'returns false' do
        subject.max_tickets_claimed?.should be_false
      end
    end

    context 'claimed_ticket count >= 15' do
      before do
        15.times { ticket_holder.tickets.create! }
      end

      it 'returns true' do
        subject.max_tickets_claimed?.should be_true
      end
    end
  end
end
