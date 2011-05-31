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
    create = createDefect('#{project}', '#{current_user}', #{this_card['number']});
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
<br>
<a onclick="$('createdefect').show()" class="link_as_button" href="javascript:void(0)">Create New Defect</a>

<div style="display:none" id="createdefect">
  <form name="createdefectform">
    <br>
    
    Title:<br>
    <input type="text" name="defect_title" style="width: 350px;">
    <br><br>
    
    Description:<br>
    <textarea name="defect_body" style="width: 350px;" rows="11"></textarea>
    <br><br>
    
    Team:<br>
    <select name="defect_team" style="width: 350px;">
      <option value="Apple" selected="true">Apple</option>
      <option value="Orange">Orange</option>
    </select>
    <br><br>
    
    <div id="submit-defect">
      <input type="submit" value="Save Defect" onclick="create();">
    </div>
  </form>
</div>
<script>
  document.createdefectform.defect_body.value = "h3. Steps to Reproduce" + "\\n\\n\\n\\n" +
                                                "h3. Actual Result"      + "\\n\\n\\n\\n" +
                                                "h3. Expected Result" + "\\n\\n\\n";
</script>
FORM
  end

  def project
    @project.identifier
  end

  def this_card
    @project.execute_mql('SELECT Number WHERE Number = THIS CARD.Number').first
  end

  def current_user
    @current_user.login
  end

end

