require_relative 'lib/angular_page_object/version'

Gem::Specification.new do |s|
  # 1.8.x is not supported
  s.required_ruby_version = '>= 1.9.3'

  s.name          = 'angular_page_object'
  s.version       = AngularPageObject::VERSION
  s.date          = AngularPageObject::DATE
  s.license       = 'http://www.apache.org/licenses/LICENSE-2.0.txt'
  s.description   = s.summary = 'Angular page object'
  s.description   += '.' # avoid identical warning
  s.authors       = s.email = ['code@bootstraponline.com']
  s.homepage      = 'https://github.com/bootstraponline/angular_page_object'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'page-object', '~> 1.0.2'
  s.add_runtime_dependency 'rspec', '~> 3.0.0'
  s.add_runtime_dependency 'selenium-webdriver', '~> 2.45.0'

  s.add_development_dependency 'appium_thor', '~> 0.0', '>= 0.0.7'

  s.files = `git ls-files`.split "\n"
end
