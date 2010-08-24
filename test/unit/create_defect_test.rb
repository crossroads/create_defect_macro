require File.join(File.dirname(__FILE__), 'unit_test_helper')

class CreateDefectMacroTest < Test::Unit::TestCase

  FIXTURE = 'sample'

  def test_macro_contents
    Mingle::Project.any_instance.stubs(:execute_mql).returns([{'number' => "564"}])
    create_defect = CreateDefectMacro.new(nil, project(FIXTURE), nil)
    result = create_defect.execute
    assert result.include?("createDefect('gh', 564)")
  end

end

