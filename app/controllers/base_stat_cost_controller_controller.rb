require 'base_stat_costs'
class BaseStatCostControllerController < ApplicationController
  include BaseStatCosts

  def index
    @stat = params[:stat] || 'attackdamage'

    champions = Champion.all
    champions_by_id = {}
    champions.each { |it| champions_by_id[it.id.to_s] = it }

    costs_by_id = {}
    all_costs = ChampionBaseStatCosts.all
    all_costs.each { |it| costs_by_id[it.champion_id.to_s] = it }

    # TODO: check version.
    @champions = ChampionBaseStats.all.map do |stats|
      champion = champions_by_id[stats.champion_id.to_s]
      costs = costs_by_id[stats.champion_id.to_s]
      {
        name: champion.name,
        stat: stats[@stat],
        cost: costs[@stat],
        total: costs.total
      }
    end
    @champions = @champions.sort_by { |it| it[:cost] }.reverse

    @available_stats = BaseStatCosts::COSTS.keys
  end

  def calculate
  end
end
