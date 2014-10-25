namespace :wurf do
  desc "Collect data via Riot API on champions and their base stats"
  task fetch_champions: :environment do
    raise 'Existing champion-data detected; giving up!' if Champion.count > 0
  end

end
