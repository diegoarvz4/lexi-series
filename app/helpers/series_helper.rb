module SeriesHelper
  def count_episodes(series)
    series.episodes.all.count
  end
end
