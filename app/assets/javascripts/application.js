//= require jquery
//= require jquery_ujs
//= require moment
//= require bootstrap-sortable
//= require_tree .

$(function() {
  $('.datepicker').datepicker();
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
