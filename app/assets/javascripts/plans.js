function showImageField() {
  $('#plan_land').change(function(e){
    var val = $(this).val();
    if (val != null && val != '') {
      $('.banner-uploader_container').css('display', 'block');
      if (val == 'top') {
        $('.banner-top_info').css('display', 'block');
        $('.banner-side_info').css('display', 'none');
      } else if (val == 'side_left' || val == 'side_right') {
        $('.banner-top_info').css('display', 'none');
        $('.banner-side_info').css('display', 'block');
      }
    } else {
      $('.banner-uploader_container').css('display', 'none');
    }
	});
}

function priceFieldChange() {
  $('#plan_period').change(function(e){
    recalcPrice();
  });
  $('#plan_land').change(function(e){
    recalcPrice();
	});
}

function recalcPrice() {
  period = $("#plan_period").val();
  land = $("#plan_land").val();
  $.get('/plans/0/price?period=' + period + '&land=' + land, function(data) {})
  .done(function(data) {
    html_content = '';
    $.each(data, function(key, value){ //found clients
      html_content += 'U$ ' + data['price'].toFixed(2);
   });
   $('.price').html(html_content);
  })
}
