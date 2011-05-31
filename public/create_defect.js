function createDefect(project, thisCard) {

  function param(name, value) {
    return '&'+'card[properties][][name]='+name+
           '&'+'card[properties][][value]='+value;
  }

  function createCard(type, name, body, properties) {
    var params = 'card[name]='+name+'&card[description]='+body+'&card[card_type_name]='+type;
    for (var key in properties) {
      params += param(key, properties[key]);
    }
    post('/api/v2/projects/'+project+'/cards.xml', params);
  };

  function post(url, params) {
    var http = new XMLHttpRequest();
    http.open("POST", url, true);

    //Send the proper header information along with the request
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");

    http.send(params);
  }

  return function() {
    var title = document.createdefectform.defect_title.value;
    var body = escape(document.createdefectform.defect_body.value);

    var spinner = '<img class="ajax-spinner" src="/images/spinner.gif" alt="Loading..."/>';
    $('submit-defect').replace(spinner);

    createCard('Defect', title, body, {'Deliverable': thisCard, 'Defect Status': 'New'});

    window.location.reload(true);
  };
}

