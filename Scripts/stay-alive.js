//Checks whether the panel is open or closed
function checkState(button, div, state) {
    $(button).click(function () {
        if ($(div).hasClass('in')) {
            $(state).val("true");
        }
        else {
            $(state).val("false");
        }
    });
}

//Maintains the state of the panel
function setDiv(div, btn, state) {
    if (state.val() == "false") {
        $(div).addClass('in');
        $(btn).removeClass('collapsed');
    }
}

//Highlights filter button on focus
$(document).ready(function () {
    $('.customAlign').focus(function () {
        $(this).parent().addClass('filterFocus');
    });

    $('.customAlign').blur(function () {
        $(this).parent().removeClass('filterFocus');
    });
});