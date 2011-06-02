function createDefect(project, current_user, thisCard) {

  function param(name, value) {
    return '&'+'card[properties][][name]='+name+
           '&'+'card[properties][][value]='+value;
  }

  function createCard(type, name, body, properties) {
    var params = 'card[name]='+name+'&card[description]='+body+'&card[card_type_name]='+type;
    for (var key in properties) {
      params += param(key, properties[key]);
    }
    post('/api/v2/projects/'+project+'/cards.xml?'+params);
  };

  function post(url) {
    var request = new XMLHttpRequest();
    request.open('POST', url, false);
    request.send();
  }

  return function() {
    var title = document.createdefectform.defect_title.value;
    var body = escape(document.createdefectform.defect_body.value);
    // Fetch selected value from defect_team select list.
    var team = document.createdefectform.defect_team.options[document.createdefectform.defect_team.selectedIndex].value;
    var user_is_owner = document.createdefectform.defect_owner.checked;

    var card_params = {'Deliverable': thisCard,
                       'Defect Status': 'Open',
                       'Reported By': current_user,
                       'Team': team}

    if (user_is_owner){ card_params['Owner'] = current_user };

    var spinner = '<img class="ajax-spinner" src="/images/spinner.gif" alt="Loading..."/>';
    $('submit-defect').replace(spinner);

    createCard('Defect', title, body, card_params);

    window.location.reload(true);
  };
}

