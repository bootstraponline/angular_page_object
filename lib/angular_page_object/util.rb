module AngularPageObject
  class << self
    # Defines the page module class name in underscore case as a method
    # on the test_class. The page class is transformed into a singleton.
    #
    # @param page_module [Module] the parent module for the pages
    # @param test_class [Class] the class to define the methods on
    # @return [void]
    def define_page_methods opts={}
      page_module = opts[:page_module]
      raise 'must pass page_module' unless page_module
      test_class  = opts.fetch :test_class, RSpec::Core::ExampleGroup
      page_module.constants.each do |page_class|
        # set page name before the class is fully qualified.
        # ButtonsPage => buttons_page
        # https://github.com/rails/rails/blob/daaa21bc7d20f2e4ff451637423a25ff2d5e75c7/activesupport/lib/active_support/inflector/methods.rb#L96
        page_name  = page_class.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase

        # Pages::ButtonsPage
        page_class = page_module.const_get page_class # transform symbol into fully qualified reference

        page_class.include Singleton

        # https://github.com/cheezy/page-object/blob/27c601042b3b7c1c1816b207c41cf43d7be95908/lib/page-object.rb#L59
        # todo: support the rest of the page-object init method
        page_class.class_eval do
          def initialize
            initialize_browser $driver.driver
          end
        end

        test_class.send(:define_method, page_name) do
          page_class.instance
        end
      end
      nil
    end
  end
end
