class AddSeriesIdToSeriesRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :series_requests, :series, foreign_key: true
  end
end
