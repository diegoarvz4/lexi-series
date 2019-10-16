module RelationshipsHelper
  def character_options
    options = {}
    @characters.each do |character|
      options[character.name] = character.id
    end
    options
  end
end
