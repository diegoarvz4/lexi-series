class AddQualityControlToTranslation < ActiveRecord::Migration[5.2]
  def change
    add_reference :quality_controls, :translation, foreign_key: true 
  end
end
