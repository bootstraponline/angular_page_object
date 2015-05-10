# https://github.com/cheezy/page-object/pull/286

module PageObject
  module Platforms
    module WatirWebDriver
      class PageObject

        private

        def call_for_watir_element(identifier, call)
          call
        end

        def call_for_watir_elements(identifier, call)
          call
        end
      end
    end
  end
end
