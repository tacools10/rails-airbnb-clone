$(document).ready(function() {
  $('#read-more-button-show-more').click(function(event) {
    event.preventDefault();
    $('#read-more-content-show-more').toggle();
  });
   $('#read-more-button-show-less').click(function(event) {
    event.preventDefault();
    $('#read-more-content-show-less').toggle();
  });

});
