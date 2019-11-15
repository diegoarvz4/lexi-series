class AddDubcardChatactersToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :dubcard_characters, :text
  end
end
