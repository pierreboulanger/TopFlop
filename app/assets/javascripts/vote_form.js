$(document).ready(function () {

    // TOP FORM
    $(".top_button_submit").click(function(e) {
      e.preventDefault();

      var top_comment = $("input#top_comment").val();
      if (top_comment == "") {
        $(".validation_top_comment").remove();
        $(".top_comment").append("<p class='validation validation_top_comment'>Donne un commentaire !</p>");
        $("input#top_comment").focus();
        $('.top_button_submit').prop('disabled', true);
        console.log('log');
      }
      if (top_comment != "") {
        console.log('ok !');
        $(".validation_top_comment").remove();
        $('.top_button_submit').prop('disabled', false);
        // if new top
        $("#new_top").trigger("submit");
        // if edit top
        $(".edit_top").trigger("submit");
        console.log("top done");
      }

    });

    // FLOP FORM
    $(".flop_button_submit").click(function(e) {
      e.preventDefault();

      var flop_comment = $("input#flop_comment").val();
      if (flop_comment == "") {
        $(".validation_flop_comment").remove();
        $(".flop_comment").append("<p class='validation validation_flop_comment'>Donne un commentaire !</p>");
        $("input#flop_comment").focus();
        $('.flop_button_submit').prop('disabled', true);
      }
      if (flop_comment != "") {
        $(".validation_flop_comment").remove();
        $('.flop_button_submit').prop('disabled', false);
        // if new flop
        $("#new_flop").trigger("submit");
        // if edit flop
        $(".edit_flop").trigger("submit");
        console.log("flop done");
      }
    });
});
