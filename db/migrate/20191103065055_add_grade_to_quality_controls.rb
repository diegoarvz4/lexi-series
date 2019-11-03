class AddGradeToQualityControls < ActiveRecord::Migration[5.2]
  def change
    add_column :quality_controls, :grade, :string
  end
end
