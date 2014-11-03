# For looking up base-stat costs relative to elementary LoL items.
module BaseStatCosts
  # TODO: Look up basic-items by name, ie. longsword.
  COSTS = {
    'armor'=> 300.0 / 15.0,    # Cloth Armor
    'armorperlevel' => 1,
    'attackdamage' => 360.0 / 10.0,    # Long Sword
    'attackdamageperlevel'=> 1,
    'attackrange'=> 1,
    'attackspeedoffset'=> 450.0 / 0.15,    # Dagger
    'attackspeedperlevel'=> 1,
    'crit'=> 1,
    'critperlevel'=> 1,
    'hp'=> 400.0 / 150.0,    # Ruby Crystal
    'hpperlevel'=> 1,
    'hpregen'=> 180.0 / 5.0,    # Rejuventation Bead
    'hpregenperlevel'=>1,
    'movespeed'=> 325.0 / 25.0,    # Boots of Speed
    'mp'=> 400.0 / 200.0,    # Sapphire Crystal
    'mpperlevel'=> 1,
    'mpregen'=> 180.0 / 3.0,    # Faerie Charm
    'mpregenperlevel'=> 1,
    'spellblock'=> 400.0 / 20.0,    # Null Magic Mantle
    'spellblockperlevel'=> 1
  }

  def base_cost(stat)
    BaseStatCosts::COSTS[stat]
  end
end
