shared_examples_for 'application controller subclass' do
  describe '#assign_current_season!' do
    it 'assigns current season by years descending to @current_season' do
      Season.should_receive(:order).with('years desc').and_return([1, 2])
      subject.send(:assign_current_season!)
      assigns(:current_season).should eq 1
    end
  end

  describe '#assign_ticket_holders!' do
    it 'assigns ticket holders by name to @ticket_holders' do
      TicketHolder.should_receive(:order).with('name').and_return(:mock_results)
      subject.send(:assign_ticket_holders!)
      assigns(:ticket_holders).should eq :mock_results
    end
  end
end
