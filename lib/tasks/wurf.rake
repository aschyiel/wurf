namespace :wurf do
  desc "Collect data via Riot API on champions and their base stats"
  task fetch_champions: :environment do
    raise 'Existing champion-data detected; giving up!' if Champion.count > 0

    clnt = HTTPClient.new
    JSON.parse(clnt.get_content(all_champions_url))['data'].each do |it|
      sleep(DELAY)
      persist_champion(clnt, it[1])
    end
  end

  desc "Calculate the base-costs (depends on fetch_champions)."
  task calculate_base_costs: :environment do
    ChampionBaseStatCosts.recalculate_all
  end

  private

  # GOTCHA: Don't go over 10 requests per 10 seconds (throttling).
  DELAY = 1

  def api_key
    ENV['RIOT_API_KEY']
  end

  def all_champions_url
    "https://na.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=#{ api_key }"
  end

  def champion_stats_url(id)
    "https://na.api.pvp.net/api/lol/static-data/na/v1.2/champion/#{ id }?champData=stats&api_key=#{ api_key }"
  end

  # Record a champion's name, riot-id, and their base-stats.
  def persist_champion(clnt, data)
    puts "Persisting champion: #{data['name']}."
    our_champ = Champion.create(riot_id: data['id'], name: data['name'], title: data['title'])
    stats = JSON.parse(clnt.get_content(champion_stats_url(data['id'])))['stats']
    ChampionBaseStats.create(
      champion_id: our_champ.id,
      attackrange: stats['attackrange'],
      mpperlevel: stats['mpperlevel'],
      mp: stats['mp'],
      attackdamage: stats['attackdamage'],
      hp: stats['hp'],
      hpperlevel: stats['hpperlevel'],
      attackdamageperlevel: stats['attackdamageperlevel'],
      armor: stats['armor'],
      mpregenperlevel: stats['mpregenperlevel'],
      hpregen: stats['hpregen'],
      critperlevel: stats['critperlevel'],
      spellblockperlevel: stats['spellblockperlevel'],
      mpregen: stats['mpregen'],
      attackspeedperlevel: stats['attackspeedperlevel'],
      spellblock: stats['spellblock'],
      movespeed: stats['movespeed'],
      attackspeedoffset: stats['attackspeedoffset'],
      crit: stats['crit'],
      hpregenperlevel: stats['hpregenperlevel'],
      armorperlevel: stats['armorperlevel']
    )
  end
end
