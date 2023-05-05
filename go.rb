require 'selenium-webdriver'

url = 'COPY_PASTE_THE_URL_WHERE_YOU_CAN_SEE_THE_SLOTS' # it will automatically redirect you there once you log in
email = "YOUR_EAMIL"
password = "YOUR PASSWORD"


class SlotStealer
  def initialize(url:, email:, password:, timeout: 15)
    @url, @email, @password, @timeout = url, email, password, timeout
    @driver = Selenium::WebDriver.for :chrome
    @slot = nil
  end

  def run
    log_in
    refresh_slots_page while @slot.nil?
    puts "slot found!!!! Please book"
    keep_window
    # book # I never testified this part of the code, so I comment it out
  end

  private

  def log_in
    @driver.get @url
    @driver.find_element(id: "username").send_keys @email
    @driver.find_element(id: "password").send_keys @password
    button = @driver.find_element(id: "kc-login")
    @driver.action.click(button).perform
  end


  def refresh_slots_page
    wait = Selenium::WebDriver::Wait.new(timeout: @timeout)

    begin
      @driver.navigate.refresh
      puts "refreshing...."
      @slot = wait.until { @driver.find_element(class: '-available')}
      puts "looking for avaialble slots for #{@timeout} seconds"
    rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::MoveTargetOutOfBoundsError
      retry
      puts "retrying..."
    end
  end

  def keep_window
    sleep(1000) # prevent webdriver from closing the window 😅
  end

  def book
    @driver.action.click(@slot).perform
    confirm = @driver.find_elements(class: "tls-button-primary");
    driver.action.click(confirm).perform
  end
end

SlotStealer.new(url:, email:, password:).run
