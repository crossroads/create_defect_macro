function createDefect(project, thisCard) {

  function param(name, value) {
    return '&'+'card[properties][][name]='+name+
           '&'+'card[properties][][value]='+value;
  }

  function createCard(type, name, properties) {
    var params = 'card[name]='+name+'&card[card_type_name]='+type;
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
    var name = document.createdefectform.name.value;

    var spinner = '<img class="ajax-spinner" src="images/spinner.gif" alt="Loading..."/>';
    $('submit-defect').replace(spinner);

    createCard('Defect', name, {'Story': thisCard, 'Defect Status': 'New'});

    window.location.reload(true);
  };
}

