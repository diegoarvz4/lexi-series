module QualityControlsHelper
  def reviewer_options
    options = {}
    @reviewers.each do |reviewer|
      options[reviewer.username] = reviewer.id
    end
    options
  end
end
