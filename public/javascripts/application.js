// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  $('.modal-close-btn').click(function(){
    $(this).parent().parent().modal('hide');
  });
  
  $('.modal-save-btn').click(function(){
    $(this).parent().parent().find('form').submit();
  });
});
