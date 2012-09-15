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
  { :puck_drop => '2012-09-29 19:00:00', :opponent => 'Carolina Hurricanes' },
  { :puck_drop => '2012-10-13 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2012-10-18 19:00:00', :opponent => 'Vancouver Canucks' },
  { :puck_drop => '2012-10-20 19:00:00', :opponent => 'Pittsburgh Penguins' },
  { :puck_drop => '2012-11-08 19:00:00', :opponent => 'Calgary Flames' },
  { :puck_drop => '2012-11-13 19:00:00', :opponent => 'Los Angeles Kings' },
  { :puck_drop => '2012-11-21 19:00:00', :opponent => 'Dallas Stars' },
  { :puck_drop => '2012-11-29 19:00:00', :opponent => 'New York Rangers' },
  { :puck_drop => '2012-12-01 19:00:00', :opponent => 'Minnesota Wild' },
  { :puck_drop => '2012-12-18 19:00:00', :opponent => 'Tampa Bay Lightning' },
  { :puck_drop => '2012-12-27 19:00:00', :opponent => 'Philadelphia Flyers' },
  { :puck_drop => '2013-01-08 17:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2013-01-12 19:00:00', :opponent => 'Columbus Blue Jackets' },
  { :puck_drop => '2013-01-15 19:00:00', :opponent => 'Dallas Stars' },
  { :puck_drop => '2013-02-14 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2013-02-18 17:00:00', :opponent => 'Boston Bruins' },
  { :puck_drop => '2013-02-22 19:00:00', :opponent => 'Vancouver Canucks' },
  { :puck_drop => '2013-02-28 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2013-03-05 19:00:00', :opponent => 'Ottawa Senators' },
  { :puck_drop => '2013-03-09 19:00:00', :opponent => 'Minnesota Wild' },
  { :puck_drop => '2013-03-21 19:00:00', :opponent => 'San Jose Sharks' },
  { :puck_drop => '2013-03-28 19:00:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2013-04-01 19:00:00', :opponent => 'Colorado Avalanche' },
  { :puck_drop => '2013-04-11 19:00:00', :opponent => 'Detroit Red Wings' },
]
games.each do |game|
  Game.seed(:season_id, :puck_drop) do |g|
    g.season_id = season.id
    g.puck_drop = game[:puck_drop]
    g.opponent  = game[:opponent]
  end
end
