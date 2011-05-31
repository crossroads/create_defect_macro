class CreateDefectMacro
  def initialize(parameters, project, current_user)
    @project = project
    @current_user = current_user
  end

  def execute
    "#{script}\n#{styles}\n#{form}\n"
  end

  def can_be_cached?
    true
  end

  private
  def script
    <<-SCRIPT
  <script src="/plugin_assets/create_defect_macro/create_defect.js"></script>
  <script>
    create = createDefect('#{project}', #{this_card['number']});
  </script>
SCRIPT
  end
  
  def styles
    <<-STYLES
<link href="/plugin_assets/create_defect_macro/create_defect.css" media="screen" rel="stylesheet" type="text/css" />
STYLES
  end

  def form
    <<-FORM
<div id="createdefect">
  <form name="createdefectform">
    <p>New defect:</p>
    <input type="text" style="width: 350px;" name="defect_title">
    <br/>
    <textarea rows="11" style="width: 350px;" name="defect_body">h3. Steps to Reproduce



h3. Actual Result



h3. Expected Result

</textarea>
    <div id="submit-defect">
      <input type="submit" onclick="create();" value="Create">
    </div>
  </form>
</div>
FORM
  end

  def project
    @project.identifier
  end

  def this_card
    @project.execute_mql('SELECT Number WHERE Number = THIS CARD.Number').first
  end

end

