class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.references :episode, foreign_key: true
      t.integer :translator_id, index: true
      t.string :status, default: 'in progress'
      t.datetime :duedate
      t.timestamps
    end
    add_foreign_key :translations, :users, column: :translator_id
  end
end
