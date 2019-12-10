require 'selenium-webdriver'
require 'interactor'

class GetTitles
  include Interactor

  def call
    while nxt_button_visible?(context.wait, context.driver) do
      print_titles(context.driver, context.wait)
      nxt_button(context.driver).click
    end
  end

  private

  def nxt_button(driver)
    driver.find_element(:css, 'li.andes-pagination__button.andes-pagination__button--next')
  end

  def nxt_button_visible?(wait, driver)
    wait.until { nxt_button(driver).displayed? }
  end

  def print_titles(driver, wait)
    titles = wait.until do
      driver.find_elements(:css, '.main-title')
    end

    titles.map { |title| puts title.text }
  end
end