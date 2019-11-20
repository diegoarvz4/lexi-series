class AddSeriesAndCharactersReferencesToHashTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :characters, :character_tags do |t|
      t.index [:character_id, :character_tag_id], name: 'ch_and_tags_group_index'
      t.index [:character_tag_id, :character_id], name: 'chtags_and_ch_group_index'
    end
  end
end
