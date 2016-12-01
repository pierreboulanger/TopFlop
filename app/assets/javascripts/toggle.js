  $(document).ready(function () {

    // VOTE
    $("#vote-top-button").click(function() {
      $("#vote-top").toggle();
    });

    $("#vote-flop-button").click(function() {
      $("#vote-flop").toggle();
    });

    // TOP
    $("#top-button").click(function() {
      $("#top").toggle();
    });

    // FLOP
    $("#flop-button").click(function() {
      $("#flop").toggle();
    });

    $(".top:first-child").prepend("<i class='fa fa-star select-icon' aria-hidden='true'></i>");

    $(".flop:first-child").prepend("<i class='fa fa-thumbs-o-down select-icon' aria-hidden='true'></i>");

    // DATEPICKER
    $(function() {
      $('input.datepicker').datepicker({format: "dd/mm/yy"});
    });

  });

