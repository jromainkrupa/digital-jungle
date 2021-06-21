module WorkshopsHelper
  def stringify_workshop_date(workshop)
    #"#{workshop.start_date.strftime('%d %B %Y, %Hh%M')} - #{(workshop.start_date + @workshop.duration.hours).strftime('%Hh%M')}"
    "#{I18n.l(workshop.start_date, format: '%d %B %Y, %Hh%M')} - #{I18n.l((workshop.start_date + workshop.duration.hours), format: '%Hh%M')}"
  end

  def stringify_workshop_duration(workshop)
    nb_half_day = workshop.duration / 4
    if nb_half_day == 1
      "1/2"
    else
      (nb_half_day/2).to_s
    end
  end
end
