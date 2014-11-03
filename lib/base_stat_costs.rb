# For looking up base-stat costs relative to elementary LoL items.
module BaseStatCosts
  # TODO: Look up items by name, ie. longsword.
  def costs
    {
      'attackdamage' => 360.0 / 10.0
    }
  end

  def base_cost(stat)
    costs[stat]
  end
end
