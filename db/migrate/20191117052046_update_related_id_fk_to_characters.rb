class UpdateRelatedIdFkToCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :relationships, column: :related_id
    add_foreign_key :relationships, :characters, column: :related_id, on_delete: :cascade
  end
end
