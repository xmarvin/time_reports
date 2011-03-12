// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$ = jQuery.noConflict();

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

function submitWithAjax(form){
  $.post(form.action, $(form).serialize(), null, "script");
}


$(document).ready(function(){
    if (!window.console) {
        window.console = {
           log: function () {},
           group: function () {},
           error: function () {},
           warn: function () {},
           groupEnd: function () {},
           debug: function () {}
        };
    }
    $('input, textarea').placeholder();

    $('.change_state_link').live('click',
    function(){
        $(this).addClass('loading');
        $.getScript($(this).attr('href'));
        return false;
    });
});
