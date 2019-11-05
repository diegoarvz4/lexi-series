class CreateGlosaries < ActiveRecord::Migration[5.2]
  def change
    create_table :glosaries do |t|
      t.references :series, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
