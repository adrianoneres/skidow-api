var ready;
ready = function() {
  displayAlerts();
  showImageField();
  priceFieldChange();
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
