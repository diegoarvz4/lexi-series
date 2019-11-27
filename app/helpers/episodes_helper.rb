module EpisodesHelper
  def dubcard_characters
    @dubcard.split(',')
  end

  def character_exists?(ch)
   Character.where(naming: ch.upcase).exists?
  end

  def edit_dubcard_display
    result = ''
    characters = @episode.dubcard_characters
    return '' if characters == nil
    characters.split(',').each do |ch|
      result += "#{ch} \n"
    end      
    result
  end
end
