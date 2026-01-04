require "selenium/webdriver"

# Capybara.register_driver :selenium_chrome_in_container do |app|
#   # Minimal Chrome options for containerized environment
#   # Too many options can cause conflicts
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: {
#       args: %w[
#         --no-sandbox
#         --disable-dev-shm-usage
#         --disable-gpu
#         --headless
#         --window-size=1920,1080
#         --disable-extensions
#         --disable-software-rasterizer
#       ]
#     }
#   )
  
#   Capybara::Selenium::Driver.new app,
#                                  browser: :remote,
#                                  url: 'http://selenium_chrome:4444/wd/hub',
#                                  desired_capabilities: capabilities,
#                                  http_client: Selenium::WebDriver::Remote::Http::Default.new(open_timeout: 60, read_timeout: 60)
# end

Capybara.register_driver :selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new app,
    browser: :remote,
    url: "http://selenium_chrome:4444/wd/hub",
    desired_capabilities: :chrome
end

Capybara.register_driver :headless_selenium_chrome_in_container do |app|
  Capybara::Selenium::Driver.new  app,
                                  browser: :remote,
                                  url: 'http://selenium_chrome:4444/wd/hub',
                                  desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                                    chromeOptions: { args: %w[headless disable-gpu] }
                                  )
                                  # ,
                                  #  http_client: Selenium::WebDriver::Remote::Http::Default.new(open_timeout: 60, read_timeout: 60)
end