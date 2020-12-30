class CreateTeamChampions < ActiveRecord::Migration
  def change
    create_table :team_champions do |t|
      t.integer :champion_id
      t.integer :team_id
    end
  end
end
