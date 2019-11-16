class UpdateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :episodes, :series
    add_foreign_key :episodes, :series, on_delete: :cascade
  end
end
