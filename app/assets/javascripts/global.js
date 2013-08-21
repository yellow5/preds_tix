$(document).ready(function(){
  // Submit remote forms
  $('.submittable').on('change', function() {
    $(this).parents('form:first').submit();
    $(this).effect('highlight', {}, 3000);
  });
});
