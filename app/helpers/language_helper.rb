module LanguageHelper
  LANGUAGES = {
    en: "English",
    fr: "French"
  }

  def language_options
    LANGUAGES.slice(*I18n.available_locales).invert.to_a
  end
end
