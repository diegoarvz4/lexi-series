class AddLangsAndRuntimeToTranslations < ActiveRecord::Migration[5.2]
  def change
    add_column :translations, :src_lang, :string
    add_column :translations, :dst_lang, :string
    add_column :translations, :runtime, :integer
  end
end
