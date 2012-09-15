# Seed season with 2011-12
Season.seed(:years) do |s|
  s.years = '2011-12'
end
season = Season.find_by_years('2011-12')

# Seed the season's ticket holders
%w( Cam Levi Ferf Matt Jeff CP ).each do |name|
  TicketHolder.seed(:season_id, :name) do |th|
    th.season_id = season.id
    th.name      = name
  end
end

# Seed the games with the half-season schedule
games = [
  { :puck_drop => '2011-10-13 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2011-10-15 19:00:00', :opponent => 'New Jersey Devils' },
  { :puck_drop => '2011-10-27 19:00:00', :opponent => 'Tampa Bay Lightning' },
  { :puck_drop => '2011-10-29 19:00:00', :opponent => 'Anaheim Ducks' },
  { :puck_drop => '2011-11-12 18:00:00', :opponent => 'Montreal Canadiens' },
  { :puck_drop => '2011-11-17 19:00:00', :opponent => 'Toronto Maple Leafs' },
  { :puck_drop => '2011-11-19 19:00:00', :opponent => 'Columbus Blue Jackets' },
  { :puck_drop => '2011-11-22 19:00:00', :opponent => 'Edmonton Oilers' },
  { :puck_drop => '2011-12-03 19:00:00', :opponent => 'Buffalo Sabres' },
  { :puck_drop => '2011-12-10 19:00:00', :opponent => 'Anaheim Ducks' },
  { :puck_drop => '2011-12-15 19:00:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2011-12-17 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2012-01-01 17:00:00', :opponent => 'Calgary Flames' },
  { :puck_drop => '2012-01-07 19:00:00', :opponent => 'Caroline Hurricanes' },
  { :puck_drop => '2012-01-21 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2012-02-04 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2012-02-14 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2012-02-25 19:00:00', :opponent => 'San Jose Sharks' },
  { :puck_drop => '2012-03-08 19:00:00', :opponent => 'Colorado Avalanche' },
  { :puck_drop => '2012-03-10 19:00:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2012-03-24 18:00:00', :opponent => 'Winnipeg Jets' },
  { :puck_drop => '2012-03-31 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2012-04-05 19:00:00', :opponent => 'Dallas Stars' },
]
games.each do |game|
  Game.seed(:season_id, :puck_drop) do |g|
    g.season_id = season.id
    g.puck_drop = game[:puck_drop]
    g.opponent  = game[:opponent]
  end
end
