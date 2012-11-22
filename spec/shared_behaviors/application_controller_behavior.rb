shared_examples_for 'application controller subclass' do
  describe '#assign_current_season!' do
    it 'assigns current season by years descending to @current_season' do
      Season.should_receive(:order).with('years desc').and_return([1, 2])
      subject.send(:assign_current_season!)
      assigns(:current_season).should eq 1
    end
  end

  describe '#assign_current_ticket_holders!' do
    context 'when @current_season is not present' do
      before do
        subject.instance_variable_set(:@current_season, nil)
      end

      it 'assigns empty array to @current_ticket_holders' do
        subject.send(:assign_current_ticket_holders!)
        assigns(:current_ticket_holders).should eq []
      end
    end

    context 'when @current_season is present' do
      let(:season)   { Season.new                     }
      let(:b_holder) { TicketHolder.new(:name => 'B') }
      let(:c_holder) { TicketHolder.new(:name => 'C') }
      let(:j_holder) { TicketHolder.new(:name => 'J') }

      before do
        season.ticket_holders << j_holder
        season.ticket_holders << b_holder
        season.ticket_holders << c_holder
        subject.instance_variable_set(:@current_season, season)
      end

      it 'assigns @current_season.ticket_holders ordered by name to @current_ticket_holders' do
        subject.send(:assign_current_ticket_holders!)
        assigns(:current_ticket_holders).should eq [ b_holder, c_holder, j_holder ]
      end
    end
  end
end
