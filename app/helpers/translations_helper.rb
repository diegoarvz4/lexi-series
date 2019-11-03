module TranslationsHelper
  def workers_options
    options = {}
    @work_users.each do |work_user|
      options[work_user.username] = work_user.id
    end
    options
  end
end
