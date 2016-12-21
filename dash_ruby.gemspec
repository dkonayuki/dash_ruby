Gem::Specification.new do |spec|
  spec.name          = 'Dash Ruby'
  spec.version       = '0.1.0'
  spec.licenses      = ['MIT']
  spec.summary       = 'Hack your Amazon dash button.'
  spec.description   = 'Hack your Amazon dash button.'
  spec.authors       = ['dkonayuki']
  spec.email         = 'contact@dkonayuki.com'
  spec.files         = ['lib/dash_ruby.rb']
  spec.require_paths = ['lib']
  spec.bindir        = 'bin'

  spec.executables << 'find_button'

  spec.add_dependency 'pcaprub', '~> 0.12.0'
end
