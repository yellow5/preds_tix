# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Clean out the tables to prevent duplicates
Season.delete_all
Game.delete_all
Ticket.delete_all
TicketHolder.delete_all

# Seed season with next season
season = Season.create(:years => '2011-12')

# Seed the season's ticket holders
TicketHolder.create(
  [
    { :season => season, :name => 'Cam' },
    { :season => season, :name => 'Levi' },
    { :season => season, :name => 'Ferf' },
    { :season => season, :name => 'Matt' },
    { :season => season, :name => 'Jeff' },
    { :season => season, :name => 'CP' }
  ]
)

# Seed the games with the half-season schedule
Game.create(
  [
    { :season => season, :puck_drop => '2011-10-13 19:00:00', :opponent => 'Phoenix Coyotes' },
    { :season => season, :puck_drop => '2011-10-15 19:00:00', :opponent => 'New Jersey Devils' },
    { :season => season, :puck_drop => '2011-10-27 19:00:00', :opponent => 'Tampa Bay Lightning' },
    { :season => season, :puck_drop => '2011-10-29 19:00:00', :opponent => 'Anaheim Ducks' },
    { :season => season, :puck_drop => '2011-11-12 18:00:00', :opponent => 'Montreal Canadiens' },
    { :season => season, :puck_drop => '2011-11-17 19:00:00', :opponent => 'Toronto Maple Leafs' },
    { :season => season, :puck_drop => '2011-11-19 19:00:00', :opponent => 'Columbus Blue Jackets' },
    { :season => season, :puck_drop => '2011-11-22 19:00:00', :opponent => 'Edmonton Oilers' },
    { :season => season, :puck_drop => '2011-12-03 19:00:00', :opponent => 'Buffalo Sabres' },
    { :season => season, :puck_drop => '2011-12-10 19:00:00', :opponent => 'Anaheim Ducks' },
    { :season => season, :puck_drop => '2011-12-15 19:00:00', :opponent => 'Detroit Red Wings' },
    { :season => season, :puck_drop => '2011-12-17 19:00:00', :opponent => 'St. Louis Blues' },
    { :season => season, :puck_drop => '2012-01-01 17:00:00', :opponent => 'Calgary Flames' },
    { :season => season, :puck_drop => '2012-01-07 19:00:00', :opponent => 'Caroline Hurricanes' },
    { :season => season, :puck_drop => '2012-01-21 19:00:00', :opponent => 'Chicago Blackhawks' },
    { :season => season, :puck_drop => '2012-02-04 19:00:00', :opponent => 'St. Louis Blues' },
    { :season => season, :puck_drop => '2012-02-14 19:00:00', :opponent => 'Chicago Blackhawks' },
    { :season => season, :puck_drop => '2012-02-25 19:00:00', :opponent => 'San Jose Sharks' },
    { :season => season, :puck_drop => '2012-03-08 19:00:00', :opponent => 'Colorado Avalanche' },
    { :season => season, :puck_drop => '2012-03-10 19:00:00', :opponent => 'Detroit Red Wings' },
    { :season => season, :puck_drop => '2012-03-24 18:00:00', :opponent => 'Winnipeg Jets' },
    { :season => season, :puck_drop => '2012-03-31 19:00:00', :opponent => 'Chicago Blackhawks' },
    { :season => season, :puck_drop => '2012-04-05 19:00:00', :opponent => 'Dallas Stars' },
  ]
)
