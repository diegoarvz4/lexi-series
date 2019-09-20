class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.string :type
      t.string :description
      t.references :character, foreign_key: true
      t.integer :related_id, index: true
      t.timestamps
    end

    add_foreign_key :relationships, :characters, column: :related_id
  end
end
