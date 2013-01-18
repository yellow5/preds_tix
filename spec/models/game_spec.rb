require 'spec_helper'

describe Game do
  describe 'attributes' do
    it { should have_db_column(:season_id).of_type(:integer) }
    it { should have_db_column(:puck_drop).of_type(:datetime) }
    it { should have_db_column(:opponent).of_type(:string) }
    it { should have_db_column(:preseason).of_type(:boolean).with_options(:default => false) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'indexes' do
    it { should have_db_index(:season_id) }
  end

  describe 'foreign keys' do
    it { should have_foreign_key_for(:season, :dependent => :delete) }
  end

  describe 'associations' do
    it { should belong_to(:season) }
    it { should have_many(:tickets) }
  end

  describe 'after create' do
    context 'four new tickets' do
      let(:game) { Game.new }

      it 'are created' do
        expect { game.save! }.to change { game.tickets.count }.by(4)
      end

      it 'are not created when saving existing record' do
        game.save!
        expect { game.save! }.to_not change { game.tickets.count }.by(4)
      end
    end
  end

  describe '#available_tickets' do
    let(:season) { Season.create! }
    let!(:game) { Game.create!(:season => season) }
    let!(:ticket_holder) { TicketHolder.create!(:season => season) }
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

  describe '#tickets_belonging_to' do
    let(:season) { Season.create! }
    let(:game) { Game.create!(:season => season) }
    let(:ticket_holder) { TicketHolder.create!(:season => season) }
    let(:expected_tickets) { Array.new }

    before do
      game.tickets.each_with_index do |ticket, index|
        if index % 2 == 0
          ticket.update_attributes!(:ticket_holder_id => ticket_holder.id)
          expected_tickets << ticket
        end
      end
    end

    subject { game }

    it { should respond_to(:tickets_belonging_to) }

    it 'returns tickets that belong to ticket holder' do
      received_tickets = game.tickets_belonging_to(ticket_holder)
      received_tickets.collect(&:id).join(',').should eq(expected_tickets.collect(&:id).join(','))
    end
  end
end
