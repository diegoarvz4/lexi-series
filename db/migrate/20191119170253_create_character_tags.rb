class CreateCharacterTags < ActiveRecord::Migration[5.2]
  def change
    create_table :character_tags do |t|
      t.references :character, foreign_key: true
      t.references :series, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
