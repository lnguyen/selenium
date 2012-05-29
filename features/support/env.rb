$: << File.dirname(__FILE__)+'/../../lib'

require 'watir-webdriver'
require 'page-object'
require 'pages.rb'
require 'yaml'
require 'debugger'

browser = Watir::Browser.new :chrome
settings = YAML::load(File.open("config/settings.yaml"))

Before do
  @browser = browser
  @settings = settings
end

After do
  #@browser.clear_cookies
end

at_exit do
  browser.close
end
