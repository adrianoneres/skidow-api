function displayAlerts() {
  $("#flash_notice").click(function() {
    $("#flash_notice").fadeOut("fast");
  });
  setTimeout(function() {
    $("#flash_notice").fadeOut("fast", function() {
      $(this).remove();
    });
  }, 4500);
}
