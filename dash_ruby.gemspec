Gem::Specification.new do |spec|
  spec.name           = 'dash_ruby'
  spec.version        = '0.1.0'
  spec.licenses       = ['MIT']
  spec.summary        = 'Hack your Amazon Dash button.'
  spec.description    = 'Hack your Amazon Dash button.'
  spec.authors        = ['dkonayuki']
  spec.email          = 'contact@dkonayuki.com'
  spec.files          = Dir['lib/*.rb'] + Dir['bin/*']
  spec.require_paths  = ['lib']
  spec.bindir         = 'bin'
  spec.homepage       = 'https://github.com/dkonayuki/dash_ruby'

  spec.executables << 'find_button'

  spec.add_dependency 'pcaprub', '~> 0.12.0'
end
