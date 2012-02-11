$(document).ready(function(){
  // Submit remote forms
  $('.submittable').live('change', function() {
    $(this).parents('form:first').submit();
    $(this).effect('highlight', {}, 3000);
  });
});
