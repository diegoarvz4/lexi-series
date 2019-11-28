class AddFilesFieldsToTranslations < ActiveRecord::Migration[5.2]
  def change
    add_column :translations, :files_url, :string
    add_column :translations, :video_url, :string
  end
end
