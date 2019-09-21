module CharactersHelper
  def relationship(character_1, character_2)
    Relationship.find_by(character_id: character_1.id,
                                        related_id: character_2.id) ||
    Relationship.find_by(character_id: character_2.id, related_id: character_1.id)
  end

  def relationship?(character_1, character_2)
    Relationship.where(character_id: character_1.id,
                                        related_id: character_2.id) ||
    Relationship.where(character_id: character_2.id, related_id: character_1.id)
  end
end