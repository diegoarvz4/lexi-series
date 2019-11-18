class AddTreatmentToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :treatment, :string
  end
end
