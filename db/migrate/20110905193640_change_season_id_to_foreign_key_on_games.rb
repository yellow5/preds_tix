class ChangeSeasonIdToForeignKeyOnGames < ActiveRecord::Migration
  def up
    add_foreign_key :games, :seasons, :dependent => :delete
  end

  def down
    remove_foreign_key :games, :seasons
  end
end
