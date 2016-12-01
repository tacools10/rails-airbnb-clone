$(function() {
    $(".left carousel-control").on("click", function(e) {
      e.preventDefault();
      var active_item = $(".active");
      $(".active").addClass("hidden");
      active_item.next().addClass("active")
    });
});
