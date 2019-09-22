class CreateJoinTableUserSeries < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :series do |t|
       t.index [:user_id, :series_id]
       t.index [:series_id, :user_id]
    end
  end
end
