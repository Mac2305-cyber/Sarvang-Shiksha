$(document).ready(function () {
  $(".card").hover(
    function () {
      $(this)
        .addClass("shadow")
        .css("cursor", "pointer");
    },
    function () {
      $(this).removeClass("shadow");
    }
  );


  $(function () {
    $("#playlist li").on("click", function () {
      $("#videoarea").attr({
        src: $(this).attr("movieurl")
      });
    });
    $("#videoarea").attr({
      src: $("#playlist li")
        .eq(0)
        .attr("movieurl")
    });
  });
});
