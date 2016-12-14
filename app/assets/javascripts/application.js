//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require carousel.js
//= require underscore
//= require gmaps/google
//= require bootstrap-slider
//= require magnific-popup
//= require readmore.js
//= require_tree



$('#ex1').slider({
  formatter: function(value) {
    return 'Current value: ' + value;
  }
});

