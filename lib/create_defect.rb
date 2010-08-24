class CreateDefectMacro
  def initialize(parameters, project, current_user)
    @project = project
  end

  def execute
    "#{script}\n#{form}\n"
  end

  def can_be_cached?
    true
  end

  private
  def script
    <<-SCRIPT
  <script src="/plugin_assets/create_defect/create_defect.js"></script>
  <script>
    create = createDefect('#{project}', #{this_card['number']});
  </script>
SCRIPT
  end

  def form
    <<-FORM
  <form name="createdefectform">
    New defect:
    <input type="text" name="name">
    <div id="submit-defect">
      <input type="submit" onclick="create();" value="Create">
    </div>
  </form>
  <br/>
FORM
  end

  def project
    @project.identifier
  end

  def this_card
    @project.execute_mql('SELECT Number WHERE Number = THIS CARD.Number').first
  end

end

