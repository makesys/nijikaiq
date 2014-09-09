//= require jquery
//= require jquery_ujs

$(function() {
        $("#answer_select_index_1").click(function(event){
            alert('test');
            event.stopPropagation();
            });
        $("#answer_select_index_1").parent('td').click(function(){
            alert('test');
            $(this).children('[name^="chk_"]').trigger('click');
            });
        });

