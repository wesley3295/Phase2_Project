class CreateChampions < ActiveRecord::Migration
  def change
      create_table :champions do |t|
      t.float :Attack
      t.float :Defense
      t.float :Magic
      t.float :Difficulty
      t.float :Hp
      t.float :HpUpPerLevel
      t.float :Mp
      t.float :MpUpPerLevel
      t.float :MoveSpeed
      t.float :Armor
      t.float :ArmorPerLevel
      t.float :SpellBlock
      t.float :SpellBlockPerLevel
      t.float :AttackRange
      t.float :HpRegen
      t.float :HpRegenPerLevel
      t.float :MpRegen
      t.float :MpRegenPerLevel
      t.float :AttackDamage
      t.float :AttackDamagePerLevel
      t.float :AttackSpeedOffset
      t.integer :ChampionId
      t.string :Name
      t.string :Title
    end
  end
end