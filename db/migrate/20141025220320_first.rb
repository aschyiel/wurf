class First < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.integer :riot_id
      t.timestamps
    end

    create_table :champion_base_stats do |t|
      t.belongs_to :champion
      t.decimal :attackrange
      t.decimal :mpperlevel
      t.decimal :mp
      t.decimal :attackdamage
      t.decimal :hp
      t.decimal :hpperlevel
      t.decimal :attackdamageperlevel
      t.decimal :armor
      t.decimal :mpregenperlevel
      t.decimal :hpregen
      t.decimal :critperlevel
      t.decimal :spellblockperlevel
      t.decimal :mpregen
      t.decimal :attackspeedperlevel
      t.decimal :spellblock
      t.decimal :movespeed
      t.decimal :attackspeedoffset
      t.decimal :crit
      t.decimal :hpregenperlevel
      t.decimal :armorperlevel
    end
  end
end
