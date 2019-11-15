class AddDubcardIdToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :characters, :dubcard, foreign_key: true
  end
end
