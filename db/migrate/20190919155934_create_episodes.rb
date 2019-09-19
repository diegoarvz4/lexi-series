class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.integer :number
      t.string :resume
      t.references :series, foreign_key: true

      t.timestamps
    end
  end
end
