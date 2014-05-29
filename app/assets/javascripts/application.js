// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require jquery.ui.datepicker
//= require dataTables/jquery.dataTables
//= require_directory ./admin
//= require admin/dashboard-demo

$(document).ready(function(){
    $('.data-table').dataTable({
          sPaginationType: "full_numbers",
          bJQueryUI: true,
          iDisplayLength: 25,
       	  aLengthMenu: [10, 25, 50, 100, 150]
    });

    $(".datepicker").datepicker();

    /*$('.fancybox').fancybox({
        padding : 0,
        openEffect  : 'elastic',
        helpers : {
            overlay : {
                css : {
                    'border' : '2px red solid'
                }
            }
        }

    });*/

    var spans = $(".teacher_subjects").find("span.checkbox");
    spans.each(function(index){
        if(index%2 == 1)
            $(this).addClass("right");
    });

});