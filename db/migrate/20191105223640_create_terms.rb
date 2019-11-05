class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.references :glosary, foreign_key: true
      t.string :src_term
      t.string :dst_term
      t.string :comments

      t.timestamps
    end
  end
end
