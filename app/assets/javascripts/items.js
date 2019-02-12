$(document).on("turbolinks:load", function () {
  $("a.load_deals").on("click", function(e) {
    $.get(this.href, null, null, 'json').done(function(json){
      let $deals = $("#deals_div ol")
      $deals.text('')
      json.forEach(function(deal){
        $deals.append("<li> <a href=/deals/" + deal.id + ">" + deal.user.email + "</a>" + " has a deal for " + formatter.format(deal.price) + " email: " + deal.user.email + " for more info." + "</li>")
      });
    });
    e.preventDefault();
  });

  $("form").submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/deals', values);
    posting.done(function(data) {
      let deal = new Deal(data)
      deal.renderLi()
    });
  });

  function showItem(json){
    $(".itemName").text(json.name)
    $(".itemDescription").text(json.description)
    $("#deals_div ol").empty()
  
  };

  function Deal(attributes){
  this.id = attributes.id
  this.name = attributes.name
  this.user = attributes.user
  this.price = attributes.price  
  };

  Deal.prototype.renderLi = function(){
  let html = '<li> You just posted a deal for ' + formatter.format(this.price) + '</li>'
  $("#deals_div ol").append(html)
  }; 

  const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
  });
});