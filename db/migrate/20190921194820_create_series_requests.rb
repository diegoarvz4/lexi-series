class CreateSeriesRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :series_requests do |t|
      t.integer :requester_id, index: true
      t.integer :receiver_id, index: true
      t.boolean :confirmed, defaul: false

      t.timestamps
    end

    add_foreign_key :series_requests, :users, column: :requester_id
    add_foreign_key :series_requests, :users, column: :receiver_id
  end
end
