class CreateCharacterImages < ActiveRecord::Migration[5.2]
  def change
    create_table :character_images do |t|
      t.references :character, foreign_key: true
      t.string :picture
      t.timestamps
    end
  end
end
