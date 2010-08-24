require 'delegate'
require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', 'init.rb')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'create_defect')
require File.join(File.dirname(__FILE__), 'rest_loader')

class Test::Unit::TestCase
  
  def project(name)
    @project ||= load_project_resource(name)
  end
  
  def projects(*resources)
    @projects ||= resources.map{ |resource| load_project_resource(resource) }
  end
  
  def errors
    @errors ||= []
  end
  
  def alert(message)
    errors << message
  end
  
  private
  
  def load_project_resource(resource)
    RESTfulLoaders::ProjectLoader.new(resource, nil, self).project
  end
  
end
