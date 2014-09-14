//= require jquery
//= require jquery_ujs

$(function() {
        $("[class^='radio']").click(function(event){
            event.stopPropagation();
            var list = [];
            resetRadioStyle();
            $(this).parent().addClass("answerSelect");
            });

        $("[class^='radio']").parent().click(function(){
            $(this).children().trigger('click');
            resetRadioStyle();
            $(this).addClass("answerSelect");
            });
        });

function resetRadioStyle(){
    var list = [];
    $(".radio").each(function() {
            $(this).removeClass("answerSelect");
            list.push($(this).parent().removeClass("answerSelect"));
            });
}
