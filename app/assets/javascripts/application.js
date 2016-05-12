// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() { 
  var myVar;
  $("#myTable").tablesorter({
    sortList: [[1,1],[2,1],[3,1],[4,0]]
  }); 
  $(".clickable-row").click(function(event) {
    if(event.target.classList[0]!="btn")
      Turbolinks.visit($(this).data("href"));
  });
  
  $(".spinner").hide();

  $(document).on("page:fetch", function(){
    myVar=setTimeout(function(){$(".spinner").show()}, 500);
  });

  $(document).on("page:receive", function(){
    clearTimeout(myVar);
    $(".spinner").hide();
  });


}); 
$(document).on('click','.navbar-collapse.in',function(e) {
    if( $(e.target).is('a') && ( $(e.target).attr('class') != 'dropdown-toggle' ) ) {
        $(this).collapse('hide');
    }

});
