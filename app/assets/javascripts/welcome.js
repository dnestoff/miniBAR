$(document).on('turbolinks:load', function() {
  $("header").hide()
    //$(".link-to-home").hide()
    // var a = $(".link-to-home").children();
    $(".link-to-home").delay(10000).queue(function(){
      document.getElementById("home").click();
    });
    $('.pour') //miniBAR
      .delay(2000)
      .animate({
        height: '370px'
        }, 1500)
      .delay(2600)
      .slideUp(500);

    $('#liquid') // I Said Fill 'Er Up!
      .delay(3400)
      .animate({
        height: '200px'
      }, 2500);

    $('.beer-foam') // Keep that Foam Rollin' Toward the Top! Yahooo!
      .delay(3400)
      .animate({
        bottom: '210px'
        }, 2500);
  });
