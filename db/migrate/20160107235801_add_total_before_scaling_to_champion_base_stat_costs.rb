class AddTotalBeforeScalingToChampionBaseStatCosts < ActiveRecord::Migration
  def change
    add_column :champion_base_stat_costs, :total_before_scaling, :numeric, default: 0, null: false
  end
end
