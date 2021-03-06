require_relative 'lib/angular_page_object/version'

Gem::Specification.new do |spec|
  # 1.8.x is not supported
  spec.required_ruby_version = '>= 1.9.3'

  spec.name          = 'angular_page_object'
  spec.version       = AngularPageObject::VERSION
  spec.date          = AngularPageObject::DATE
  spec.license       = 'http://www.apache.org/licenses/LICENSE-2.0.txt'
  spec.description   = spec.summary = 'Angular page object'
  spec.description   += '.' # avoid identical warning
  spec.authors       = spec.email = ['code@bootstraponline.com']
  spec.homepage      = 'https://github.com/bootstraponline/angular_page_object'
  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.add_runtime_dependency 'page_object', '~> 1.1.1'
  spec.add_runtime_dependency 'selenium-webdriver', '>= 2.46.2'
  spec.add_runtime_dependency 'watir-webdriver', '>= 0.7.0'

  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'appium_thor', '~> 0.0', '>= 0.0.7'
end
