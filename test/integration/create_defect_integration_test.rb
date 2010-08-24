require File.dirname(__FILE__) + '/integration_test_helper.rb'

# The Mingle API supports basic authentication and must be used in order to run integration tests.
# However it is disabled in the default configuration. To enable basic authentication,
# you need set the basic_authentication_enabled configuration option to true in the
# <mingle_data_directory>/config/auth_config.yml file where <mingle_data_directory> is the path
# to the mingle data directory on your installation e.g.
# basic_authentication_enabled: true.

class CreateDefectMacroIntegrationTest < Test::Unit::TestCase

  PROJECT_RESOURCE = 'http://username:password@your.mingle.server:port/lightweight_projects/your_project_identifier.xml'
  ANOTHER_PROJECT_RESOURCE = 'http://username:password@your.mingle.server:port/lightweight_projects/another_project_identifier.xml'

  # Integration tests are not necessary, as we are mainly using javascript.

#  def test_macro_contents
#    create_defect = CreateDefectMacro.new(nil, project(PROJECT_RESOURCE), nil)
#    result = create_defect.execute
#    assert result
#  end
#
#  def test_macro_contents_with_a_project_group
#    create_defect = CreateDefectMacro.new(nil, [project(PROJECT_RESOURCE), project(ANOTHER_PROJECT_RESOURCE)], nil)
#    result = create_defect.execute
#    assert result
#  end

end

