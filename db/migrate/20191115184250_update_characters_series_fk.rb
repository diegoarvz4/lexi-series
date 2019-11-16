class UpdateCharactersSeriesFk < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :characters, :series
    remove_foreign_key :character_images, :characters
    remove_foreign_key :relationships, :characters
    # remove_foreign_key :relationships, :characters, column: :related_id
    remove_foreign_key :series_requests, :series
    remove_foreign_key :translations, :episodes
    remove_foreign_key :dubcards, :episodes


    add_foreign_key :characters, :series, on_delete: :cascade
    add_foreign_key :character_images, :characters, on_delete: :cascade
    add_foreign_key :relationships, :characters, on_delete: :cascade
    #add_foreign_key :relationships, :characters, column: :related_id, on_delete: :cascade
    add_foreign_key :series_requests, :series, on_delete: :cascade
    add_foreign_key :translations, :episodes, on_delete: :cascade
    add_foreign_key :dubcards, :episodes, on_delete: :cascade
    
  end
end
