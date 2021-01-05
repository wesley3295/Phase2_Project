class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :user_id
      t.integer :wins, :default => 0
      t.integer :loses, :default => 0

      t.timestamps null: false
    end
  end
end
