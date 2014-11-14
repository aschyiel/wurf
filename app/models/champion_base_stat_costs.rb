require 'base_stat_costs'
class ChampionBaseStatCosts < ActiveRecord::Base
  include BaseStatCosts

  belongs_to :champion

  def self.calculate(stats)
    costs = ChampionBaseStatCosts.new(champion_id: stats.champion_id)
    BaseStatCosts::COSTS.keys.each do |k|
      costs[k] = (BaseStatCosts::COSTS[k] * stats[k]).to_f
    end
    costs.total = BaseStatCosts::COSTS.keys.map { |k| costs[k] }.sum
    costs.save
  end

  def self.recalculate_all
    ActiveRecord::Base.transaction do
      ChampionBaseStatCosts.all.find_each(&:destroy)
      ChampionBaseStats.find_each do |stats|
        ChampionBaseStatCosts.calculate(stats)
      end
    end
  end
end