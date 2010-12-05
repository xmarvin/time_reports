// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$ = jQuery.noConflict();

$(document).ready(function() {
  updateAuthenticationForm();
});

function updateAuthenticationForm() {
  $form = $(".authentication_form");
  
  // progressively enhance buttons
  $("li.oauth_provider").each(function(index, element) {
    var li = $(element);
    var input = $("input", li);
    input.css("display", "none");
    li.css("cursor", "pointer");
    li.css("padding", "0");
    li.css("background", "none");
    li.data("oauth", input);
    li.click(function(event) {
      event.preventDefault();
      li.data("oauth").attr("checked", "checked");
      $form.find('input[name=submit]').click();
      return false;
    });
  });
}

function carouselClickHandler(carousel) {
  $('a.control, a.control2').bind('click', function() {
      carousel.scroll(jQuery.jcarousel.intval($(this).text()));
      return false;
  });
};

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

    $('.change_state_link').live('click',
    function(){
        $(this).addClass('loading');
        $.getScript($(this).attr('href'));
        return false;
    });
});
