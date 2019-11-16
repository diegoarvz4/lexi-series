class UpdateGlosaryTermFk < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :terms, :glosaries
    add_foreign_key :terms, :glosaries, on_delete: :cascade
  end
end
