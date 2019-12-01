module GlosariesHelper

  def sorted_terms
    @terms.sort_by{|term| term.dst_term.downcase}
  end

end
