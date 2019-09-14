class AddImageUrlToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :image_url, :string
  end
end
