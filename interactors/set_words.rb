require 'selenium-webdriver'
require 'interactor'
require 'csv'

class SetWords
  include Interactor

  array = CSV.parse(File.read("palabras.csv"), headers: true)
  @@english_words = array.map{|row| row[3] }

  def call
    #fill_form(context.driver, context.wait)
    #fill_form(context.driver, context.wait, context.search_str)
    #submit_form(context.driver, context.wait)
    proceso(context.driver, context.wait)
    sleep 2
  end

  private

  def fill_form(driver, wait, search_str)
    # Finding search input and writting our variable to it
    search_input = wait.until do
      driver.find_element(:class, 'field__textarea')
    end

    search_input.send_keys search_str
  end

  def proceso (driver,wait)
    @@english_words.each do |arr|
        search_input = wait.until do #aqui palabra para descargar
            driver.find_element(:css, 'textarea.field__textarea')
        end
        search_input.send_keys arr

        #aqui dropdown de idioma
        language_dropdown = wait.until do #aqui palabra para descargar
            driver.find_element(:name, 'voice')
        end

        option = Selenium::WebDriver::Support::Select.new(language_dropdown)
        option.select_by(:value, 'en-US')

        
        


        # Clicking the form's submit button
        submit_button = wait.until do
            driver.find_element(:css, 'input.field__submit.button')
            #driver.find_element(:css, 'button.nav-search-btn')
        end

        submit_button.click
        
        sleep(1)
        #descarga //a[contains(.,'Download')]
        download_button = wait.until do
            driver.find_element(:xpath, "//a[contains(.,'Download')]")
            #driver.find_element(:css, 'button.nav-search-btn')
        end
        download_button.click()

        driver.navigate.refresh

    end
  end


  def submit_form(driver, wait)
    # Clicking the form's submit button
    submit_button = wait.until do
      driver.find_element(:class, 'field__submit button')
      #driver.find_element(:css, 'button.nav-search-btn')
    end

    submit_button.click
  end
end
