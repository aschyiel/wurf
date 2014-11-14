require 'base_stat_costs'
class BaseStatCostControllerController < ApplicationController
  include BaseStatCosts

  def index
    @stat = params[:stat] || 'attackdamage'
    @champions = Champion.all.map { |it| single_stat(it, @stat) }.sort_by { |it| it[:total] }.reverse
    @available_stats = BaseStatCosts::COSTS.keys
  end

  def calculate
  end

  private

  # Returns the calculated cost for a single character-stat on a champion.
  def single_stat(champion, stat = 'attackdamage')
    stats = ChampionBaseStats.find_by(champion_id: champion.id)
    costs = ChampionBaseStatCosts.find_by(champion_id: champion.id)
    {
      name: champion.name,
      stat: stats[stat],
      cost: costs[stat],
      total: costs.total
    }
  end
end
