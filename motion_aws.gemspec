# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion_aws/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Ballantyne"]
  gem.email         = ["ussballantyne@gmail.com"]
  gem.description   = %q{rubymotion aws}
  gem.summary       = %q{rubymotion aws}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion_aws"
  gem.require_paths = ["lib"]
  gem.version       = AWS::VERSION
  gem.add_dependency 'bubble-wrap'
  gem.add_dependency 'cocoapods'
  gem.add_dependency 'motion-cocoapods'
end
