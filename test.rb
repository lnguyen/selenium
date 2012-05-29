require "watir-webdriver"
require "headless"

headless = Headless.new
headless.start

headless.video.start_capture
driver = Watir::Browser.start 'google.com'
sleep 5
puts driver.title

driver.quit

headless.video.stop_and_save("/Users/longnguyen/selenium/test.mov")
headless.destroy
