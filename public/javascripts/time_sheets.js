function updateTotal(){

}

function apply_time_inputs() {

    $(".date").datepicker({
        showOtherMonths: true
    });

    $(".choose_date").datepicker({
        showOtherMonths: true,
        onSelect: function(dateText, inst) {
            console.log(dateText);
            $("#intervals tr:not(:first)").remove();
            $.get($(this).attr('href'), {'date':dateText}, function(responce) {
                $("#intervals_block").html(responce);
            });
        }
    });
    $(".time").timepicker({
        stepMinute: 5,
        hourGrid: 2,
        minuteGrid: 10
    });
}
$(function() {
    apply_time_inputs();
});
