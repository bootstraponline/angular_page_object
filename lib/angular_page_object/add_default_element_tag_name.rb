module PageObject
  module Accessors
    upstream_element = instance_method(:element)

    define_method(:element) do |name, tag, identifier={ :index => 0 }, &block|
      # default tag to :element
      #
      # element 'button', css: 'some css'
      #
      # is the same as
      #
      # element 'button', :element, css: 'some css'
      #
      if tag.is_a?(Hash)
        identifier = tag
        tag        = :element
      end

      upstream_element.bind(self).call name, tag, identifier, &block
    end
  end # module Accessors
end # module PageObject
