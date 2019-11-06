class AddInstructionsToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :instructions, :string
  end
end
