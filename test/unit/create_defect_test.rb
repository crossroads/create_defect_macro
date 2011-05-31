require File.join(File.dirname(__FILE__), 'unit_test_helper')

class CreateDefectMacroTest < Test::Unit::TestCase

  FIXTURE = 'sample'

  def test_macro_contents
    Mingle::Project.any_instance.stubs(:execute_mql).returns([{'number' => "564"}])
    create_defect = CreateDefectMacro.new(nil, project(FIXTURE), project(FIXTURE).team.first)
    result = create_defect.execute
    assert result.include?("createDefect('gh', 'groucho', 564)")
  end

end

