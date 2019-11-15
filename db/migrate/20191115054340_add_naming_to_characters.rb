class AddNamingToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :naming, :string
  end
end
