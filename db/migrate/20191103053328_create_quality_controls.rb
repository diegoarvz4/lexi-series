class CreateQualityControls < ActiveRecord::Migration[5.2]
  def change
    create_table :quality_controls do |t|
      t.string :feedback
      t.integer :reviewer_id, index: true
      t.integer :effectiveness
      t.integer :final_score
      t.integer :loops
      t.integer :max_score
      t.integer :reduced_score

      t.timestamps
    end

    add_foreign_key :quality_controls, :users, column: :reviewer_id
  end
end
