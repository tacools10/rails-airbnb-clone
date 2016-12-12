//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require carousel.js
//= require underscore
//= require gmaps/google
//= require bootstrap-slider
//= require_tree
//= require magnific-popup


$('#ex1').slider({
  formatter: function(value) {
    return 'Current value: ' + value;
  }
});



// function newMarkers(newMarkers, markers) {
//   handler.removeMarkers(markers);
//   markers = handler.addMarkers(newMarkers);
// };
