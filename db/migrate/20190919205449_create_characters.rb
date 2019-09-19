class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :picture
      t.string :name
      t.string :role
      t.string :description
      t.references :series, foreign_key: true

      t.timestamps
    end
  end
end
