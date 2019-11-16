class UpdateGlosariesEpisodesForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :glosaries, :series
    add_foreign_key :glosaries, :series, on_delete: :cascade
  end
end
