module PageObject
  def protractor
    @protractor ||= ::Protractor.new(driver: browser)
  end

  # Visit the website and then wait for angular to finish loading
  # This is different from goto which will not wait for angular.
  def visit
    goto # uses page_url
    wait(timeout: 60) { protractor.waitForAngular }
  end
end
