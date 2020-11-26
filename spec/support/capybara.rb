require 'capybara/rails'
require 'capybara/rspec'
require 'selenium/webdriver'
# Disable server errors for local image get requests
Capybara.raise_server_errors = false
# For more driver options please visit:
# https://github.com/teamcapybara/capybara/blob/master/lib/capybara/registrations/drivers.rb
# By default Capybara will use Selenium+Firefox for `js:true` feature specs.
# The following lines will tell Capybara to use Chrome instead of Firefox,
Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(--window-size=1280,1024) },
    loggingPrefs: { browser: 'ALL' }
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities,
    clear_local_storage: true,
    clear_session_storage: true
  )
end
# Added browser logging to headless chrome, to read browser error logs please use:
# page.driver.browser.manage.logs.get(:browser)
Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--headless'
    opts.args << '--disable-gpu'
    opts.args << '--no-sandbox'
    opts.args << '--window-size=1280,1024'
    # Workaround https://bugs.chromium.org/p/chromedriver/issues/detail?id=2650&q=load&sort=-id&colspec=ID%20Status%20Pri%20Owner%20Summary
    opts.args << '--disable-site-isolation-trials'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end
Capybara.javascript_driver = :selenium
