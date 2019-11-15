class CreateDubcards < ActiveRecord::Migration[5.2]
  def change
    create_table :dubcards do |t|
      t.references :episode, foreign_key: true
      t.timestamps
    end
  end
end
