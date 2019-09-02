require 'selenium-webdriver'
require 'interactor'
require_relative 'interactors/scraping_organizer'

class MlScraper
  def initialize
    # Initilize the driver with our desired browser
    @driver = Selenium::WebDriver.for :chrome

    # Define search string
    @search_str = 'carros 4x4 diesel'

    # Navigate to mercadolibre
    @driver.get 'https://www.mercadolibre.com.co'

    # Define global timeout threshold
    @wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
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
