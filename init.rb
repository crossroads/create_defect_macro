begin
  require 'macro_development_toolkit'
rescue LoadError
  require 'rubygems'
  require 'macro_development_toolkit'
end

require 'create_defect'

if defined?(RAILS_ENV) && RAILS_ENV == 'production' && defined?(MinglePlugins)
  MinglePlugins::Macros.register(CreateDefectMacro, 'create_defect')
end

