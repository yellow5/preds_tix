# Seed season with 2013-14
Season.seed(:years) do |s|
  s.years = '2013-14'
end
season = Season.find_by_years('2013-14')

# Seed the season's ticket holders
%w( Cam Ferf Matt Jeff CP John ).each do |name|
  TicketHolder.seed(:season_id, :name) do |th|
    th.season_id = season.id
    th.name      = name
  end
end

# Seed the games with the half-season schedule
games = [
  { :puck_drop => '2013-09-24 19:00:00', :opponent => 'Tampa Bay Lightning', :preseason => true },
  { :puck_drop => '2013-10-08 19:00:00', :opponent => 'Minnesota Wild' },
  { :puck_drop => '2013-10-10 19:00:00', :opponent => 'Toronto Maple Leafs' },
  { :puck_drop => '2013-10-24 19:00:00', :opponent => 'Winnipeg Jets' },
  { :puck_drop => '2013-11-16 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2013-11-25 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2013-11-28 19:00:00', :opponent => 'Edmonton Oilers' },
  { :puck_drop => '2013-11-30 19:00:00', :opponent => 'Philadelphia Flyers' },
  { :puck_drop => '2013-12-05 19:00:00', :opponent => 'Carolina Hurricanes' },
  { :puck_drop => '2013-12-17 19:00:00', :opponent => 'Chicago Blackhawks' },
  { :puck_drop => '2013-12-21 18:00:00', :opponent => 'Montreal Canadiens' },
  { :puck_drop => '2013-12-28 19:00:00', :opponent => 'Los Angeles Kings' },
  { :puck_drop => '2013-12-30 19:00:00', :opponent => 'Detroit Red Wings' },
  { :puck_drop => '2014-01-09 19:00:00', :opponent => 'Anaheim Ducks' },
  { :puck_drop => '2014-01-11 18:00:00', :opponent => 'Ottawa Senators' },
  { :puck_drop => '2014-01-14 19:00:00', :opponent => 'Calgary Flames' },
  { :puck_drop => '2014-01-20 19:00:00', :opponent => 'Dallas Stars' },
  { :puck_drop => '2014-03-01 14:00:00', :opponent => 'Winnipeg Jets' },
  { :puck_drop => '2014-03-04 19:00:00', :opponent => 'Pittsburgh Penguins' },
  { :puck_drop => '2014-03-15 19:00:00', :opponent => 'St. Louis Blues' },
  { :puck_drop => '2014-03-25 19:00:00', :opponent => 'Colorado Avalanche' },
  { :puck_drop => '2014-03-27 19:00:00', :opponent => 'Buffalo Sabres' },
  { :puck_drop => '2014-04-10 19:00:00', :opponent => 'Phoenix Coyotes' },
  { :puck_drop => '2014-04-12 19:00:00', :opponent => 'Chicago Blackhawks' }
]
games.each do |game|
  Game.seed(:season_id, :puck_drop) do |g|
    g.season_id = season.id
    g.puck_drop = game[:puck_drop]
    g.opponent  = game[:opponent]
    g.preseason = game[:preseason] || false
  end
end
