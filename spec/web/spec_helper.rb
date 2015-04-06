require 'singleton'

require 'rubygems'
require 'rspec'

# load angular_page_object from source
require_relative '../../lib/angular_page_object'

# configure
AngularPageObject.configure platform: :web, driver: Selenium::WebDriver.for(:firefox)

# page objects
require_relative 'pages/example_page'

# create methods on RSpec for the page classes
AngularPageObject.define_page_methods page_module: Pages, test_class: RSpec::Core::ExampleGroup

# close browser after tests complete
RSpec.configure do |config|
  config.after :all do
    $driver.driver.quit if $driver.driver
  end
end