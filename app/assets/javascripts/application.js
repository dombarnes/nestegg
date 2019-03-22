//= require jquery
//= require jquery-ui/widgets/datepicker
//= require jquery_ujs
//= require moment
//= require bootstrap-sortable

$(function() {
  $('.datepicker').datepicker({
  dateFormat: 'dd M yy'
  });
});

$(document).ready(function() {
  var menuToggle = $('#js-centered-navigation-mobile-menu').unbind();
  $('#js-centered-navigation-menu').removeClass("show");
  
  menuToggle.on('click', function(e) {
    e.preventDefault();
    $('#js-centered-navigation-menu').slideToggle(function(){
      if($('#js-centered-navigation-menu').is(':hidden')) {
        $('#js-centered-navigation-menu').removeAttr('style');
      }
    });
  });
});
