# For looking up base-stat costs relative to elementary LoL items.
module BaseStatCosts

  ATTACKRANGE_WEIGHT = 1.0
  CRIT_WEIGHT = 400.0 / 10.0 # Based on Brawler's Glovers.

  # TODO: Look up basic-items by name, ie. longsword.
  COSTS = {
    'armor' => 300.0 / 15.0,    # Cloth Armor
    'armorperlevel' => 18.0 * 300.0 / 15.0,
    'attackdamage' => 360.0 / 10.0,    # Long Sword
    'attackdamageperlevel' => 18.0 * 360.0 / 10.0,
    'attackrange' => ATTACKRANGE_WEIGHT,
    'attackspeedoffset' => 450.0 / 0.15,    # Dagger
    'attackspeedperlevel' => 18.0 * 450.0 / 0.15,
    'crit' => CRIT_WEIGHT,
    'critperlevel' => 18.0 * CRIT_WEIGHT,
    'hp' => 400.0 / 150.0,    # Ruby Crystal
    'hpperlevel' => 18.0 * 400.0 / 150.0,
    'hpregen' => 180.0 / 5.0,    # Rejuventation Bead
    'hpregenperlevel' => 18.0 * 180.0 / 5.0,
    'movespeed' => 325.0 / 25.0,    # Boots of Speed
    'mp' => 400.0 / 200.0,    # Sapphire Crystal
    'mpperlevel' => 18.0 * 400.0 / 200.0,
    'mpregen' => 180.0 / 3.0,    # Faerie Charm
    'mpregenperlevel' => 18.0 * 180.0 / 3.0,
    'spellblock' => 400.0 / 20.0,    # Null Magic Mantle
    'spellblockperlevel' => 18.0 * 400.0 / 20.0
  }

  # For the view...
  COLUMN_HEADERS = {
    'armor' => 'ARMOR',
    'armorperlevel' => 'ARMOR/lvl',
    'attackdamage' => 'AD',
    'attackdamageperlevel' => 'AD/lvl',
    'attackrange' => 'AR',
    'attackspeedoffset' => 'AS',
    'attackspeedperlevel' => 'AS/lvl',
    'crit' => 'CRIT',
    'critperlevel' => 'CRIT/lvl',
    'hp' => 'HP',
    'hpperlevel' => 'HP/lvl',
    'hpregen' => 'HP5',
    'hpregenperlevel' => 'HP5/lvl',
    'movespeed' => 'MS',
    'mp' => 'MP',
    'mpperlevel' => 'MP/lvl',
    'mpregen' => 'MP5',
    'mpregenperlevel' => 'MP5/lvl',
    'spellblock' => 'MR',
    'spellblockperlevel' => 'MR/lvl'
  }

  def base_cost(stat)
    BaseStatCosts::COSTS[stat]
  end
end
