require 'selenium-webdriver'
require 'interactor'
require 'csv'
require_relative 'interactors/scraping_organizer'

class MlScraper
  def initialize
    array = CSV.parse(File.read("palabras.csv"), headers: true)
    english_words = array.map{|row| row[3] }

    array.by_col[1] #columna de palabras en ingles

    # Initilize the driver with our desired browser
    @driver = Selenium::WebDriver.for :chrome

    # Define search string
    
    
    @search_str = 'carros 4x4 diesel'

    # Navigate to mercadolibre
    @driver.get 'https://soundoftext.com/'

    # Define global timeout threshold
    @wait = Selenium::WebDriver::Wait.new(timeout: 40) # seconds

    

  end

  def scrape
    ScrapingOrganizer.call(
      driver: @driver,
      wait: @wait,
      search_str: @search_str
    )
    @driver.quit
  end
end

# Run program
MlScraper.new.scrape
