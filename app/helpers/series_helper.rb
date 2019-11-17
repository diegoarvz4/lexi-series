module SeriesHelper
  def count_episodes(series)
    series.episodes.all.count
  end

  def instructions(inst)
    inst.gsub(/\s\s+/, "").split("+").reject{|n| n==""}
  end

  def sorted_episodes
    @series.episodes.sort_by{|ep| ep.number}
  end
end
