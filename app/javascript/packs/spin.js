/* Spin */
$(document).on("turbolinks:click", function(){
  $(".spinner-grow").show();
});

$(document).on("turbolinks:load", function(){
  $(".spinner-grow").delay(1000).hide(0);
});