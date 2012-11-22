shared_examples_for 'application controller subclass' do
  describe '#assign_ticket_holders!' do
    it 'assigns ticket holders by name to @ticket_holders' do
      TicketHolder.should_receive(:order).with('name').and_return(:mock_results)
      subject.send(:assign_ticket_holders!)
      assigns(:ticket_holders).should eq :mock_results
    end
  end
end
