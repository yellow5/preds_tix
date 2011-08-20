require 'spec_helper'

describe "games/show.html.haml" do
  let(:puck_drop) { 2.months.from_now }
  let!(:game) { Game.create!(:puck_drop => puck_drop, :opponent => 'Boston Bruins') }
  let!(:ticket_holder1) { TicketHolder.create!(:name => 'Luke') }
  let!(:ticket_holder2) { TicketHolder.create!(:name => 'Anakin') }

  before do
    assign(:game, game)
    assign(:ticket_holders, [ticket_holder1, ticket_holder2])
  end

  it 'displays puck_drop and opponent in header' do
    render
    rendered.should match("#{game.puck_drop.to_s(:pretty)} - #{game.opponent}")
  end

  context 'preaseon game' do
    before do
      game.update_attributes!(:preseason => true)
    end

    it 'identifies the game as preseason' do
      render
      rendered.should match('Preseason')
    end

    it 'does not identify the game as regular season' do
      render
      rendered.should_not match('Regular Season')
    end
  end

  context 'regular season game' do
    before do
      game.update_attributes!(:preseason => false)
    end

    it 'identifies the game as regular season' do
      render
      rendered.should match('Regular Season')
    end

    it 'does not identify the game as preseason' do
      render
      rendered.should_not match('Preseason')
    end
  end

  context 'tickets without ticket holder assigned' do
    it 'shows a form for each ticket' do
      render
      game.tickets.each do |ticket|
        assert_select 'form', :attributes => { :action => ticket_path(ticket) }
      end
    end

    it 'shows game tickets' do
      render
      assert_select 'ul>li', /Ticket 1/
      assert_select 'ul>li', /Ticket 2/
      assert_select 'ul>li', /Ticket 3/
      assert_select 'ul>li', /Ticket 4/
    end

    it 'shows ticket holder options' do
      render
      assert_select 'select>option', :text => 'Please select', :count => 4
      assert_select 'select>option', :text => ticket_holder1.name, :count => 4
      assert_select 'select>option', :text => ticket_holder2.name, :count => 4
    end
  end

  context 'tickets with ticket holder assigned' do
    before do
      game.tickets.each_with_index do |ticket, index|
        ticket_holder = index % 2 == 0 ? ticket_holder1 : ticket_holder2
        ticket.update_attributes!(:ticket_holder_id => ticket_holder.id)
      end
    end

    it 'does not show a form for each ticket' do
      render
      assert_select 'form', false, 'This page should have no form'
    end

    it 'does not show ticket holder options' do
      render
      assert_select 'select>option', false, 'This page should have no selector'
    end

    it 'shows game tickets with ticket holder name' do
      render
      assert_select 'ul>li', /Ticket 1 belongs to #{ticket_holder1.name}/
      assert_select 'ul>li', /Ticket 2 belongs to #{ticket_holder2.name}/
      assert_select 'ul>li', /Ticket 3 belongs to #{ticket_holder1.name}/
      assert_select 'ul>li', /Ticket 4 belongs to #{ticket_holder2.name}/
    end
  end
end
