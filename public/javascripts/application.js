// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
document.observe("dom:loaded", function() {
  setTimeout(hideFlashMessages, 6000);
});

function hideFlashMessages() {
  $$('div#flash_notice, div#flash_warning, div#flash_error').each(function(e) { 
    if (e) Effect.Fade(e, { duration: 5.0 });
  });
}