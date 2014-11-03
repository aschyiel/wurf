require 'base_stat_costs'
class BaseStatCostControllerController < ApplicationController
  include BaseStatCosts

  def index
    @stat = params[:stat] || 'attackdamage'
    @champions = Champion.all.map { |it| single_stat(it, @stat) }.sort_by { |it| it[:cost] }.reverse
    @available_stats = BaseStatCosts::COSTS.keys
  end

  def calculate
  end

  private

  # Returns the calculated cost for a single character-stat on a champion.
  def single_stat(champion, stat = 'attackdamage')
    stats = ChampionBaseStats.find_by(champion_id: champion.id)
    n = stats[stat]
    {
      name: champion.name,
      stat: n,
      cost: (base_cost(stat) * n).to_f
    }
  end
end
