module EpisodesHelper
  def dubcard_characters
    @dubcard.split(',')
  end

  def character_exists?(ch)
   Character.where(naming: ch).exists?
  end
end
