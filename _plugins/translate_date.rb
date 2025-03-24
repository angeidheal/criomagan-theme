module Jekyll
  module TranslateDate
    def translate_date(date)
      return date unless date.is_a?(String)
      
      site = @context.registers[:site]
      lang = site.config['lang']
      translations = site.data['locales'][lang]['global']['months']
      
      # Get the month name from the date string
      month_name = date.split(' ')[1]
      return date unless month_name
      
      # Find the translation key by matching the English month name
      month_key = month_name.downcase
      translated_month = translations[month_key]
      return date unless translated_month
      
      # Replace the English month with the translated month
      date.sub(month_name, translated_month)
    end
  end
end

Liquid::Template.register_filter(Jekyll::TranslateDate) 