class AddPictureToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :picture, :string
  end
end
