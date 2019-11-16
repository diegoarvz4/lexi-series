class AddCatchPhrasesToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :catch_phrases, :string
  end
end
