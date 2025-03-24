require 'i18n'

I18n.available_locales = [:en]

module Jekyll
  module TransliterateFilter
    def transliterate(input)
      I18n.transliterate(input.to_s).downcase.gsub(' ', '-')
    end
  end
end

Liquid::Template.register_filter(Jekyll::TransliterateFilter) 