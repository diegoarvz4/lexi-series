class UpdateUserFkDependencies < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :translations, column: :translator_id
    #add_reference :translations, :translator, references: :users, index: true
    #add_foreign_key :translations, :users, column: :translator_id, on_delete: :cascade
  end
end
