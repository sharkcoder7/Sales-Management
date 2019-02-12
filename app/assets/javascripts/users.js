$(document).on("turbolinks:load", function () {
  $("a.load_deals").on("click", function(e) {
    $.get(this.href, null, null, 'json').done(function(json){
      let $deals = $("#deals_div ol")
      $deals.text('')
      json.forEach(function(deal){
        $deals.append("<li> <a href=/deals/" + deal.id + ">" + deal.item.name + "</a>" + " for sale for " + formatter.format(deal.price) + "</li>")
      });
    });
    e.preventDefault();
  });

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