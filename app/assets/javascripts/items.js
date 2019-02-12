$(document).on("turbolinks:load", function () {

  $("form").submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/deals', values);
    var form = document.getElementById("new_deal");
    form.reset();
    posting.done(function(data) {
      let deal = new Deal(data)
      deal.renderLi()

    });
  });

  function showItem(json){
    $(".itemName").text(json.name)
    $(".itemDescription").text(json.description)
    $(".itemPrice").text(formatter.format(json.price))
    $(".itemCategory").text(json.category)

    let $deals = $('.itemDeals ul')
    $deals.html('')
    json.deals.forEach(function(deal){
      $deals.append("<li> <a href=/deals/" + deal.id + ">" + deal.name + "</a>" + " - " + formatter.format(deal.price) + "</li>")
    }) 
  };

  $('.js-next').on("click", function(e){
    e.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;  
    $.get("/items/" + nextId + ".json", function(json){
      $(".js-next").attr("data-id", json["id"]);
      $(".js-sort").attr("data-id", json["id"]);
      var data = json
      debugger
      showItem(data)
    })
    
    
  })

  
  $('.js-sort').on("click", function(e){
    e.preventDefault();
    var dataId = $(".js-sort").attr("data-id");  
    $.get("/items/" + dataId + ".json", function(json){

      json.deals.sort(function (a, b) {
        return a.price - b.price
      })
      showItem(json)
    })
    
    
  })



  function Deal(attributes){
  this.id = attributes.id
  this.name = attributes.name
  this.user = attributes.user
  this.price = attributes.price  
  };

  Deal.prototype.renderLi = function(){
  let html = '<li> You just posted a deal for ' + formatter.format(this.price) + '</li>'
  $(".itemDeals ul").append(html)
  }; 

  const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
  });
});