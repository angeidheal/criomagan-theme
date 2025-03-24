require 'i18n'

I18n.available_locales = [:en]

module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      site.categories.each do |category, posts|
        total_pages = (posts.length.to_f / 12).ceil
        
        (1..total_pages).each do |page_num|
          site.pages << CategoryPage.new(site, site.source, category, page_num, total_pages)
        end
      end
    end
  end

  class CategoryPage < Page
    def initialize(site, base, category, page_num, total_pages)
      @site = site
      @base = base
      
      # Transliterate the category name
      transliterated_category = I18n.transliterate(category.to_s).downcase.gsub(' ', '-')
      
      # Use configurable pagination path
      paginate_path = site.config['category_paginate_path'] || 'page'
      @dir = page_num == 1 ? File.join(site.config['category_dir'] || 'category', transliterated_category) : File.join(site.config['category_dir'] || 'category', transliterated_category, paginate_path, page_num.to_s)
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      
      self.data['category'] = category
      self.data['transliterated_category'] = transliterated_category
      self.data['pagination_info'] = {
        'curr_page' => page_num,
        'total_pages' => total_pages
      }
      
      self.data['title'] = "#{category} - Page #{page_num}"
    end
  end
end 