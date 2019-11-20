class RemoveFkFromChTags < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :character_tags, column: :character_id
  end
end
