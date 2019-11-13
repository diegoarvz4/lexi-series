module TranslationsHelper
  def workers_options
    options = {}
    @work_users.each do |work_user|
      options[work_user.username] = work_user.id
    end
    options
  end

  def status_options
    options = {}
    status = {
      'En progreso': 'in progress',
      'Completada': 'completed',
      'Suspendida': 'suspended',
      'Cancelada': 'canceled',
      'En revisión': 'qc'
    }
    status.each do |key, value|
      options[key] = value
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

  def month 
    _month = @translation.duedate.month
    case _month
    when 1
      "ENE"
    when 2
      "FEB"
    when 3
      "MAR"
    when 4
      "ABR"
    when 5
      "MAY"
    when 6
      "JUN"
    when 7
      "JUL"
    when 8
      "AGO"
    when 9
      "SEP"
    when 10
      "OCT"
    when 11
      "NOV"
    when 12
      "DEC"
    else
      _month
    end
  end

  def wday 
    _month = @translation.duedate.wday
    case _month
    when 1
      "lunes"
    when 2
      "martes"
    when 3
      "miércoles"
    when 4
      "jueves"
    when 5
      "viernes"
    when 6
      "sábado"
    when 0
      "domingo"
    else
      _month
    end
  end

  def tra_state
    _date = @translation.duedate
    unless Date.parse("#{_date.year}-#{_date.month}-#{_date.day}") < Date.today
      return ['A tiempo', 'onTime']
    else
      return ['Retrasado','delayed']
    end
  end

  def tra_status
    case @translation.status
    when 'in progress'
      'En progreso'
    when 'completed'
      'Completada'
    when 'suspended'
      'Suspendida'
    when 'canceled'
      'Cancelada'
    when 'qc'
      'En revisión'
    else
      'Sin estado'
    end
  end

  def completed?
    @translation.status == 'completed'
  end

  def isTranslator?
    current_user == @translation.translator || current_user.admin?
  end

end
