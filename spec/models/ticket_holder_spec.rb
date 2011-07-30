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
end
