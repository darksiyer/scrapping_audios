require 'selenium-webdriver'
require 'interactor'
require_relative 'search_item'
require_relative 'get_titles'
require_relative 'get_categories'
require_relative 'set_words'


class ScrapingOrganizer
  include Interactor::Organizer

  organize SetWords#SearchItem, GetCategories, GetTitles 
end
