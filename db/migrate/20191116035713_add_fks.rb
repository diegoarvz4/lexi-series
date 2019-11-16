class AddFks < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :quality_controls, :translations
    
    add_foreign_key :translations, :users, column: :translator_id, on_delete: :cascade
    add_foreign_key "quality_controls", "translations", on_delete: :cascade
  
  end
end
