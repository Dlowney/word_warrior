$(".toggle").on("click", function() {
  $(".toggle").parent().toggleClass('active');
});


$('li.nav-item').click( function() {
   $(this).toggleClass('open');
});

