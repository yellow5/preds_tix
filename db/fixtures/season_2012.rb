# Seed season with 2012-13
Season.seed(:years) do |s|
  s.years = '2012-13'
end
season = Season.find_by_years('2012-13')

# Seed the season's ticket holders
%w( Cam Ferf Matt Jeff CP John ).each do |name|
  TicketHolder.seed(:season_id, :name) do |th|
    th.season_id = season.id
    th.name      = name
  end
end

# Seed the games with the half-season schedule
games = [
  { :puck_drop => '2013-01-19 19:00:00', :opponent => 'Columbus Blue Jackets' },
  { :puck_drop => '2013-01-21 17:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2013-02-07 19:00:00', :opponent => 'Los Angeles Kings' },
  { :puck_drop => '2013-02-10 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2013-02-12 19:00:00', :opponent => 'San Jose Sharks' },
  { :puck_drop => '2013-02-14 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2013-02-16 19:00:00', :opponent => 'Anaheim Ducks' },
  { :puck_drop => '2013-02-19 19:00:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2013-02-22 19:00:00', :opponent => 'Vancouver Canucks' },
  { :puck_drop => '2013-02-25 19:00:00', :opponent => 'Dallas Stars' },
  { :puck_drop => '2013-03-08 19:00:00', :opponent => 'Edmonton Oilers' },
  { :puck_drop => '2013-03-09 19:00:00', :opponent => 'Minnesota Wild' },
  { :puck_drop => '2013-03-21 19:00:00', :opponent => 'Calgary Flames' },
  { :puck_drop => '2013-03-23 19:00:00', :opponent => 'Columbus Blue Jackets' },
  { :puck_drop => '2013-03-25 19:00:00', :opponent => 'Edmonton Oilers' },
  { :puck_drop => '2013-03-28 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2013-04-02 19:00:00', :opponent => 'Colorado Avalanche' },
  { :puck_drop => '2013-04-04 19:00:00', :opponent => 'Columbus Blue Jackets' },
  { :puck_drop => '2013-04-06 14:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2013-04-09 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2013-04-12 19:00:00', :opponent => 'Dallas Stars' },
  { :puck_drop => '2013-04-14 18:30:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2013-04-15 19:00:00', :opponent => 'Vancouver Canucks' },
  { :puck_drop => '2013-04-23 19:00:00', :opponent => 'Calgary Flames' },
]
games.each do |game|
  Game.seed(:season_id, :puck_drop) do |g|
    g.season_id = season.id
    g.puck_drop = game[:puck_drop]
    g.opponent  = game[:opponent]
  end
end
