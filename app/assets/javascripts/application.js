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

    var spans = $(".teacher_subjects").find("span.checkbox");
    spans.each(function(index){
        if(index%2 == 1)
            $(this).addClass("right");
    });

    $(".fee_type").change(function() {
        var fee_name = $(this).parent().parent().find(".fee_name").text();
        var fee_type_id = $(this).val();
        if(this.checked) {
            $("#appen-fee").append(function(ind,obj){
                return '<div class="form-group input-group fee_type_'+fee_type_id+'"><span class="input-group-addon">'+ fee_name +' <small>(per month)</small></span>'+
                '<input type="text" class="amount form-control" placeholder="Amount" name="fee['+fee_type_id+'][amount]">'+
                '<span class="input-group-addon annual_fee"> (--)</span></div>';   
            });
        }else{
            $("#appen-fee").find(".fee_type_"+fee_type_id).remove();
        }
        calculateAnnualFee();        
    });
    calculateAnnualFee();
    totalAnnualFee();
});

function calculateAnnualFee(){
    $("#appen-fee input.amount").keyup(function(){
        $(this).parent().find(".annual_fee").text(parseInt($(this).val()) * 12 + " Annualy" );
        totalAnnualFee();
    });
}

function totalAnnualFee(){
    var sum = 0;
    $("#appen-fee .amount").each(function(i, v){
      sum = sum + parseInt($(v).val());
    });
    
    $("#total_fees").text(sum);
    $("#total_fees_annual").text(sum * 12);
}