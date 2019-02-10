<script type="text/javascript" charset="utf-8">
$(function () {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/deals/" + nextId + ".json", function(data) {
      
      var deal = data;
      $(".dealName").text(deal["name"]);
      $(".dealPrice").text(deal["price"]);
      $(".dealMessage").text(deal["message"]);
      
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  })
});
</script>