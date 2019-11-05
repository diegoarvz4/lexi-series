module TranslationsHelper
  def workers_options
    options = {}
    @work_users.each do |work_user|
      options[work_user.username] = work_user.id
    end
    options
  end

  def lang_options
    options = {}
    ['ENG', 'SPA', 'FRA', 'POR' ].each do |lang|
      options[lang] = lang
    end
    options
  end

end
