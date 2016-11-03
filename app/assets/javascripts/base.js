var ready;
ready = function() {
  displayAlerts();
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
