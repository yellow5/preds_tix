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
end
