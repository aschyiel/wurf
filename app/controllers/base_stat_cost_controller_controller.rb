require 'base_stat_costs'
class BaseStatCostControllerController < ApplicationController
  include BaseStatCosts

  ALL_STATS = 'all_stats'
  ALL_STATS_BEFORE_SCALING = 'all_stats_before_scaling'

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
      xi = {
        name: champion.name,
        stat: stats[@stat],
        cost:  costs[@stat],
        total: costs.total,
        total_before_scaling: costs.total_before_scaling
      }
      if @stat == ALL_STATS || @stat == ALL_STATS_BEFORE_SCALING
        BaseStatCosts::COSTS.keys.each do |k|
          xi[k] = stats[k]
        end
      end
      xi
    end

    sort_by_column =  if @stat == ALL_STATS
                        :total
                      elsif @stat == ALL_STATS_BEFORE_SCALING
                        :total_before_scaling
                      else
                        :cost
                      end
    @champions = @champions.sort_by { |it| it[sort_by_column] }.reverse

    @available_stats = [ALL_STATS_BEFORE_SCALING, ALL_STATS] + BaseStatCosts::COSTS.keys
  end

  def calculate
  end
end
