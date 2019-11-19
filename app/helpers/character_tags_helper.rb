module CharacterTagsHelper
  def characters_tagged_by
    tagged = []
    @characters.each do |character|
      character.character_tags.each do |tag|
        tagged << character if tag.content == @character_tag.content
      end
    end

    tagged
  end
end
