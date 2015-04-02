module UnifiedPageObject
  class << self
    # Configures UnifiedPageObject to the target platform.
    #
    # @param platform [Symbol] the platform to target
    # @return [void]
    def configure opts
      platform = opts[:platform]
      driver = opts[:driver]
      valid = [:web]
      raise "Invalid platform '#{platform}'. Valid values: #{valid}" unless valid.include? platform
      raise 'Must provide driver' if platform == :web && !driver
      case platform
        when :web
          require 'page-object'
          set_global_driver driver
      end

      nil
    end

    # sets the global driver. only used for web platform.
    # mobile will set this automatically via appium_lib
    #
    # @param driver [Driver] the driver to use. example: Selenium::WebDriver.for :firefox
    def set_global_driver driver
      return if $driver
      # $driver.driver
      $driver = Class.new do
        attr_reader :driver
        def initialize driver
          @driver = driver
        end
      end.new(driver)
      nil
    end
  end
end