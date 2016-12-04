$(document).ready(function () {

  // ---------------
  // VALIDATION USER
  // ---------------


  $('.error').hide();
  $("#edit_user_1 input").click(function(e) {

    $('.error').hide();
      var name = $("input#user_name").val();
      if (name == "") {
        $(".validation_name").remove();
        $(".user_name").append("<p class='validation validation_name'>Veuillez remplir cette case</p>");
        $("input#user_name").focus();
        $('input[type="submit"]').prop('disabled', true);
      }
      if (name != "") {
        $(".validation_name").remove();
        $('input[type="submit"]').prop('disabled', false);

        var shirt_number = $("input#user_shirt_number").val();
        if (shirt_number == "") {
          $(".validation_shirt_number").remove();
          $(".user_shirt_number").append("<p class='validation validation_shirt_number'>Veuillez remplir cette case</p>");
          $("input#user_shirt_number").focus();
          $('input[type="submit"]').prop('disabled', true);
        }
        if (shirt_number != "") {
          $(".validation_shirt_number").remove();
          $('input[type="submit"]').prop('disabled', false);

          var field_position = $("input#user_field_position").val();
          if (field_position == "") {
            $(".validation_field_position").remove();
            $(".user_field_position").append("<p class='validation validation_field_position'>Veuillez remplir cette case</p>");
            $("input#user_field_position").focus();
            $('input[type="submit"]').prop('disabled', true);
          }
          if (field_position != "") {
            $(".validation_field_position").remove();
            $('input[type="submit"]').prop('disabled', false);
          }
        }
      }
  });
});
