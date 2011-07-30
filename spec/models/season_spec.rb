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
end
